#!/usr/bin/env python3
"""Flushes the local DNS cache on supported systems (currently macOS).

Usage: flushdns
"""

from __future__ import annotations

import platform
import subprocess
import sys


def main() -> None:
    if platform.system() == "Darwin":
        subprocess.run(["sudo", "dscacheutil", "-flushcache"], check=False)
        subprocess.run(["sudo", "killall", "-HUP", "mDNSResponder"], check=False)
    else:
        print("flushdns: not supported yet", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()
