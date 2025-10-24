#!/usr/bin/env python3
"""Flushes the local DNS cache on supported systems.

Usage: flushdns
"""

from __future__ import annotations

import platform
import shutil
import subprocess
import sys
from typing import Sequence


def run_with_optional_sudo(command: Sequence[str]) -> None:
    if shutil.which("sudo") is not None:
        subprocess.run(["sudo", *command], check=False)
    else:
        subprocess.run(command, check=False)


def main() -> None:
    system = platform.system()

    if system == "Darwin":
        subprocess.run(["sudo", "dscacheutil", "-flushcache"], check=False)
        subprocess.run(["sudo", "killall", "-HUP", "mDNSResponder"], check=False)
        return

    if system == "Windows":
        subprocess.run(["ipconfig", "/flushdns"], check=False)
        return

    if system == "Linux":
        resolver = shutil.which("systemd-resolve") or shutil.which("resolvectl")
        if resolver is not None:
            command = [resolver, "--flush-caches"] if resolver.endswith("systemd-resolve") else [resolver, "flush-caches"]
            run_with_optional_sudo(command)
            return

        print("flushdns: no supported cache flush method found", file=sys.stderr)
        sys.exit(1)

    print("flushdns: not supported yet", file=sys.stderr)
    sys.exit(1)


if __name__ == "__main__":
    main()
