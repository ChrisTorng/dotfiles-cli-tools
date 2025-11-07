#!/usr/bin/env python3
"""Opens a temporary file in $EDITOR for quick notes, deleting it afterward manually if desired.

Usage: scratch
"""

from __future__ import annotations

import os
import subprocess
import tempfile


def main() -> None:
    editor = os.environ.get("EDITOR", "vi")
    with tempfile.NamedTemporaryFile(delete=False) as tmp:
        path = tmp.name
    print(f"Editing {path}")
    subprocess.run([editor, path], check=False)


if __name__ == "__main__":
    main()
