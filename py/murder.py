#!/usr/bin/env python3
"""Interactively kills processes by PID, name, or listening port with escalating signals.

Usage: murder <pid|:port|name> [more...]
"""

from __future__ import annotations

import os
import shutil
import signal
import subprocess
import sys
import time
from dataclasses import dataclass

SIGNALS = [
    (signal.SIGTERM, 3),
    (signal.SIGINT, 3),
    (signal.SIGHUP, 4),
    (signal.SIGKILL, 0),
]


@dataclass
class ProcessInfo:
    pid: int
    command: str


def running(pid: int) -> bool:
    try:
        os.kill(pid, 0)
    except OSError:
        return False
    return True


def confirm(prompt: str) -> bool:
    try:
        response = input(prompt).strip().lower()
    except EOFError:
        return False
    return response in {"y", "yes", "yas"}


def kill_pid(pid: int) -> None:
    for sig, wait_time in SIGNALS:
        if not running(pid):
            break
        try:
            os.kill(pid, sig)
        except OSError:
            break
        time.sleep(0.5)
        if wait_time:
            time.sleep(wait_time)


def processes_by_name(name: str) -> list[ProcessInfo]:
    processes: list[ProcessInfo] = []
    if os.name == "nt":
        result = subprocess.run(
            ["tasklist", "/fo", "csv", "/nh"], capture_output=True, text=True, check=False
        )
        for line in result.stdout.splitlines():
            parts = [p.strip('"') for p in line.split(",")]
            if len(parts) < 2:
                continue
            cmd, pid_str = parts[0], parts[1]
            if name.lower() not in cmd.lower():
                continue
            try:
                pid = int(pid_str)
            except ValueError:
                continue
            if pid == os.getpid():
                continue
            processes.append(ProcessInfo(pid, cmd))
        return processes

    result = subprocess.run(
        ["ps", "-eo", "pid,command"], capture_output=True, text=True, check=False
    )
    for line in result.stdout.splitlines()[1:]:
        parts = line.strip().split(None, 1)
        if len(parts) != 2:
            continue
        pid_str, cmd = parts
        try:
            pid = int(pid_str)
        except ValueError:
            continue
        if pid == os.getpid():
            continue
        if name.lower() in cmd.lower():
            processes.append(ProcessInfo(pid, cmd))
    return processes


def processes_by_port(port: int) -> list[ProcessInfo]:
    processes: list[ProcessInfo] = []
    if shutil.which("lsof"):
        result = subprocess.run(
            ["lsof", "-i", f":{port}"], capture_output=True, text=True, check=False
        )
        for line in result.stdout.splitlines()[1:]:
            parts = line.split()
            if len(parts) < 2:
                continue
            command, pid_str = parts[0], parts[1]
            try:
                pid = int(pid_str)
            except ValueError:
                continue
            processes.append(ProcessInfo(pid, command))
    elif os.name == "nt":
        result = subprocess.run(
            ["netstat", "-ano"], capture_output=True, text=True, check=False
        )
        for line in result.stdout.splitlines():
            if "LISTEN" not in line.upper():
                continue
            parts = line.split()
            if len(parts) < 5:
                continue
            address = parts[1]
            if address.endswith(f":{port}"):
                try:
                    pid = int(parts[-1])
                except ValueError:
                    continue
                processes.append(ProcessInfo(pid, f"pid {pid}"))
    return processes


def murder_pid(pid: int) -> None:
    kill_pid(pid)


def murder_name(name: str) -> None:
    while True:
        procs = processes_by_name(name)
        if not procs:
            break
        handled = False
        for proc in procs:
            prompt = f"murder {proc.command} (pid {proc.pid})? "
            if confirm(prompt):
                kill_pid(proc.pid)
                handled = True
                break
        if not handled:
            break


def murder_port(port: int) -> None:
    while True:
        procs = processes_by_port(port)
        if not procs:
            break
        handled = False
        for proc in procs:
            prompt = f"murder process on port {port} (pid {proc.pid})? "
            if confirm(prompt):
                kill_pid(proc.pid)
                handled = True
                break
        if not handled:
            break


def handle(arg: str) -> None:
    if arg.isdigit():
        murder_pid(int(arg))
    elif arg.startswith(":") and arg[1:].isdigit():
        murder_port(int(arg[1:]))
    else:
        murder_name(arg)


def main(argv: list[str] | None = None) -> None:
    args = sys.argv[1:] if argv is None else argv
    if not args:
        print("usage:")
        print("murder 123    # kill by pid")
        print("murder ruby   # kill by process name")
        print("murder :3000  # kill by port")
        sys.exit(1)

    for arg in args:
        handle(arg)


if __name__ == "__main__":
    main()
