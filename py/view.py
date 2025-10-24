#!/usr/bin/env python3
"""Opens the target file in read-only mode using the configured editor.

Usage: view <file>
"""

from __future__ import annotations

import os
import subprocess
import sys


def main(argv: list[str] | None = None) -> None:
    args = sys.argv[1:] if argv is None else argv
    if not args:
        print("usage: view <file>", file=sys.stderr)
        sys.exit(1)
    editor = os.environ.get("EDITOR", "vim")
    if editor != "nvim":
        editor = "vim"
    subprocess.run([editor, "-R", args[0]], check=False)


if __name__ == "__main__":
    main()
