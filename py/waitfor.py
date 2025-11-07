#!/usr/bin/env python3
"""Prevents sleep while waiting for a PID to exit using platform tools.

Usage: waitfor <pid>
"""

from __future__ import annotations

import argparse
import os
import shutil
import subprocess
import time


def wait_with_tail(pid: int) -> None:
    subprocess.run(["tail", f"--pid={pid}", "-f", "/dev/null"], check=False)


def wait_windows(pid: int) -> None:
    while True:
        try:
            os.kill(pid, 0)
        except OSError:
            break
        time.sleep(1)


def main(argv: list[str] | None = None) -> None:
    parser = argparse.ArgumentParser(description="Wait for a process to exit")
    parser.add_argument("pid", type=int)
    args = parser.parse_args(argv)

    pid = args.pid
    if os.name == "nt":
        wait_windows(pid)
        return

    if shutil.which("caffeinate"):
        subprocess.run(["caffeinate", "-w", str(pid)], check=False)
        return

    if shutil.which("systemd-inhibit"):
        subprocess.run(
            [
                "systemd-inhibit",
                "--who=waitfor",
                f"--why=Awaiting PID {pid}",
                "tail",
                f"--pid={pid}",
                "-f",
                "/dev/null",
            ],
            check=False,
        )
        return

    wait_with_tail(pid)


if __name__ == "__main__":
    main()
