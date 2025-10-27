#!/usr/bin/env python3
"""Generates a random UUID v4 and prints it.

Usage: uuid
"""

import sys

if __name__ != "__main__":
    import importlib.util
    import sysconfig
    from pathlib import Path

    std_uuid = Path(sysconfig.get_path("stdlib")) / "uuid.py"
    spec = importlib.util.spec_from_file_location("uuid", std_uuid)
    if spec is None or spec.loader is None:  # pragma: no cover - sanity check
        raise ImportError("The standard library 'uuid' module is unavailable")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    sys.modules[__name__] = module
else:
    import uuid

    def main() -> None:
        print(str(uuid.uuid4()))

    main()
