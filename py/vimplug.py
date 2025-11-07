#!/usr/bin/env python3
"""Downloads vim-plug into the appropriate autoload directory if missing.

Usage: vimplug
"""

from __future__ import annotations

import os
import shutil
import subprocess
import sys
import urllib.request
from pathlib import Path

PLUG_URL = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"


def determine_editor() -> str:
    for candidate in ("nvim", "vim"):
        if shutil.which(candidate):
            return candidate
    print("vimplug: no vim or nvim found", file=sys.stderr)
    sys.exit(1)


def ensure_plug(path: Path) -> None:
    if path.exists():
        return
    path.parent.mkdir(parents=True, exist_ok=True)
    with urllib.request.urlopen(PLUG_URL) as response:
        path.write_bytes(response.read())


def main() -> None:
    editor = determine_editor()
    config_home = Path(os.environ.get("XDG_CONFIG_HOME", Path.home() / ".config"))
    plug_path = config_home / "nvim" / "autoload" / "plug.vim"
    ensure_plug(plug_path)
    subprocess.run(
        [
            editor,
            "-e",
            "+PlugInstall",
            "+PlugUpgrade",
            "+PlugUpdate",
            "+PlugClean!",
            "+qall",
        ],
        check=False,
    )


if __name__ == "__main__":
    main()
