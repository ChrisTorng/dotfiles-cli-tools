#!/usr/bin/env python3
"""Creates an executable bash script template at the given path and opens it in $EDITOR.

Usage: mksh <path>
"""

from __future__ import annotations

import argparse
import os
import stat
import subprocess
import sys
from pathlib import Path

TEMPLATE = """#!/usr/bin/env bash
set -e
set -u
set -o pipefail

"""


def main(argv: list[str] | None = None) -> None:
    parser = argparse.ArgumentParser(description="Create a new shell script")
    parser.add_argument("path", type=Path)
    args = parser.parse_args(argv)

    target = args.path
    if target.exists():
        print(f"{target} already exists", file=sys.stderr)
        sys.exit(1)

    target.write_text(TEMPLATE)
    target.chmod(
        stat.S_IRUSR | stat.S_IWUSR | stat.S_IXUSR | stat.S_IRGRP | stat.S_IROTH
    )

    editor = os.environ.get("EDITOR")
    if editor:
        subprocess.run([editor, str(target)], check=False)


if __name__ == "__main__":
    main()
