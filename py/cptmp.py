#!/usr/bin/env python3
"""Creates a temporary file path, prints it, and copies it to the clipboard.

Usage: cptmp
"""

from __future__ import annotations

import subprocess
import sys
import tempfile
from pathlib import Path


def main() -> None:
    with tempfile.NamedTemporaryFile(delete=False) as tmp:
        path = Path(tmp.name)

    text = str(path)
    print(text, end="")

    copy_script = Path(__file__).with_name("copy.py")
    subprocess.run(
        [sys.executable, str(copy_script)],
        input=text.encode("utf-8"),
        check=False,
    )


if __name__ == "__main__":
    main()
