#!/usr/bin/env python3
"""Starts a simple HTTP server in the current directory on the chosen port.

Usage: serveit [port]
"""

from __future__ import annotations

import argparse
from http.server import SimpleHTTPRequestHandler
from socketserver import TCPServer


def main(argv: list[str] | None = None) -> None:
    parser = argparse.ArgumentParser(description="Serve files over HTTP")
    parser.add_argument("port", nargs="?", type=int, default=8000)
    args = parser.parse_args(argv)

    with TCPServer(("", args.port), SimpleHTTPRequestHandler) as httpd:
        print(f"Serving HTTP on port {args.port} (http://localhost:{args.port}/) ...")
        try:
            httpd.serve_forever()
        except KeyboardInterrupt:
            pass


if __name__ == "__main__":
    main()
