#!/usr/bin/env python3
"""Opens a calculator REPL, preferring rink, then Python, then bc.

Usage: math
"""

from __future__ import annotations

import sys

if __name__ != "__main__":
    import importlib.machinery
    import importlib.util
    import os

    script_dir = os.path.dirname(os.path.realpath(__file__))
    search_paths = []
    for entry in sys.path:
        try:
            if os.path.realpath(entry) == script_dir:
                continue
        except OSError:
            pass
        search_paths.append(entry)

    spec = importlib.machinery.PathFinder().find_spec("math", search_paths)
    if spec is None or spec.loader is None:  # pragma: no cover - sanity check
        raise ImportError("The standard library 'math' module is unavailable")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    sys.modules[__name__] = module
else:
    import shutil
    import subprocess

    CANDIDATES = [
        ("rink", ["rink"]),
        ("python3", ["python3", "-i", "-c", "from math import *; from statistics import *"]),
        ("bc", ["bc"]),
    ]

    def main() -> None:
        for executable, command in CANDIDATES:
            if shutil.which(executable):
                subprocess.run(command, check=False)
                return
        print("math: couldn't find any math program", file=sys.stderr)
        sys.exit(1)

    main()
