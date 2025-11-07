#!/usr/bin/env python3
"""Copies the current working directory path to the clipboard.

Usage: cpwd
"""

from __future__ import annotations

import os
import subprocess
import sys
from pathlib import Path


def main() -> None:
    path = os.getcwd()
    copy_script = Path(__file__).with_name("copy.py")
    subprocess.run(
        [sys.executable, str(copy_script)],
        input=path.encode("utf-8"),
        check=False,
    )


if __name__ == "__main__":
    main()
