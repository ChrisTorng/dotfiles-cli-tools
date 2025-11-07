#!/usr/bin/env python3
"""Provides simple Wi-Fi status, toggling, and join helpers (primarily for macOS).

Usage: wifi <status|list|join|off|on|toggle|help> [args...]
"""

from __future__ import annotations

import argparse
import platform
import subprocess
import sys
import time

OSX_AIRPORT = "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"
RFKILL = ["sudo", "/usr/sbin/rfkill"]


def is_macos() -> bool:
    return platform.system() == "Darwin"


def is_wifi_enabled() -> bool:
    if is_macos():
        result = subprocess.run([OSX_AIRPORT, "-I"], capture_output=True, text=True, check=False)
        return "AirPort: Off" not in result.stdout
    print("wifi: status is not supported on this platform", file=sys.stderr)
    sys.exit(1)


def ensure_wifi_enabled() -> None:
    if not is_wifi_enabled():
        print("wifi is disabled; cannot perform this operation", file=sys.stderr)
        sys.exit(1)


def wifi_list() -> None:
    if is_macos():
        subprocess.run([OSX_AIRPORT, "-s"], check=False)
    else:
        print("wifi: listing networks is not supported on this platform", file=sys.stderr)
        sys.exit(1)


def wifi_join(ssid: str, password: str) -> None:
    if is_macos():
        subprocess.run(["networksetup", "-setairportnetwork", "en0", ssid, password], check=False)
    else:
        print("wifi: joining networks is not supported on this platform", file=sys.stderr)
        sys.exit(1)


def wifi_off() -> None:
    if is_macos():
        subprocess.run(["networksetup", "-setairportpower", "en0", "off"], check=False)
    elif platform.system() == "Linux":
        subprocess.run(RFKILL + ["block", "wifi"], check=False)
    else:
        print("wifi: unsupported platform", file=sys.stderr)
        sys.exit(1)


def wifi_on() -> None:
    if is_macos():
        subprocess.run(["networksetup", "-setairportpower", "en0", "on"], check=False)
    elif platform.system() == "Linux":
        subprocess.run(RFKILL + ["unblock", "wifi"], check=False)
    else:
        print("wifi: unsupported platform", file=sys.stderr)
        sys.exit(1)


def wifi_toggle() -> None:
    if is_macos():
        wifi_off()
        time.sleep(1)
        wifi_on()
    elif platform.system() == "Linux":
        subprocess.run(["sudo", "systemctl", "restart", "wpa_supplicant"], check=False)
    else:
        print("wifi: unsupported platform", file=sys.stderr)
        sys.exit(1)


def main(argv: list[str] | None = None) -> None:
    parser = argparse.ArgumentParser(description="Wi-Fi helper")
    parser.add_argument("command", nargs="?", default="help")
    parser.add_argument("args", nargs="*")
    args = parser.parse_args(argv)

    command = args.command
    extra = args.args

    if command in {"help", ""}:
        print("wifi status                       print wifi status")
        print("wifi list                         list networks")
        print("wifi join [ssid] [password]      join a network")
        print("wifi off                          turn off wifi")
        print("wifi on                           turn on wifi")
        print("wifi toggle                       turn off wifi, then on")
        print("wifi help                         show this message")
        return
    if command == "status":
        if is_wifi_enabled():
            print("wifi is enabled")
            print("status details unavailable on this platform")
        else:
            print("wifi is disabled")
        return
    if command == "list":
        ensure_wifi_enabled()
        wifi_list()
        return
    if command == "join":
        ensure_wifi_enabled()
        if len(extra) < 2:
            print("wifi join requires ssid and password", file=sys.stderr)
            sys.exit(1)
        wifi_join(extra[0], extra[1])
        return
    if command == "off":
        wifi_off()
        return
    if command == "on":
        wifi_on()
        return
    if command == "toggle":
        wifi_toggle()
        return

    print("wifi: unknown command", file=sys.stderr)
    sys.exit(1)


if __name__ == "__main__":
    main()
