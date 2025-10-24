#!/usr/bin/env python3
"""Plays a named sound effect from the configured effects directory using mpv.

Usage: sfx <effect-name>
"""

from __future__ import annotations

import os
import subprocess
import sys
from pathlib import Path


def main(argv: list[str] | None = None) -> None:
    args = sys.argv[1:] if argv is None else argv
    if not args:
        print("usage: sfx <effect-name>", file=sys.stderr)
        sys.exit(1)
    effect = args[0]
    config_home = Path(os.environ.get("XDG_CONFIG_HOME", Path.home() / ".config"))
    sound_path = config_home / "evanhahn-sfx" / f"{effect}.ogg"
    subprocess.Popen(["mpv", "--really-quiet", "--no-video", str(sound_path)])


if __name__ == "__main__":
    main()
