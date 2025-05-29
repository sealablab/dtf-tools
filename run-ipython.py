#!/usr/bin/env python3
# SPDX-License-Identifier: MIT
#
# DTF Tools - IPython Development Environment
# This script launches an IPython session with autoreload enabled
# and the DTF Framework models pre-imported.
#
# Prerequisites:
# - UV must be installed
# - Run 'uv venv' and 'uv pip install -e ".[dev]"' first

import os
import sys
import platform
from pathlib import Path

def error(msg: str) -> None:
    """Print error message and exit."""
    print(f"Error: {msg}", file=sys.stderr)
    sys.exit(1)

def activate_virtualenv() -> None:
    """Activate the virtual environment."""
    script_dir = Path(__file__).parent.absolute()
    system = platform.system()
    
    # Add virtual environment's site-packages to Python path
    if system in ("Darwin", "Linux"):
        site_packages = script_dir / ".venv" / "lib" / f"python{sys.version_info.major}.{sys.version_info.minor}" / "site-packages"
    else:
        site_packages = script_dir / ".venv" / "Lib" / "site-packages"

    if not site_packages.exists():
        error("Virtual environment not found. Please run 'uv venv' first.")

    sys.path.insert(0, str(site_packages))

def main() -> None:
    # Activate virtual environment
    activate_virtualenv()

    # Add current directory to Python path
    script_dir = Path(__file__).parent.absolute()
    os.environ["PYTHONPATH"] = f"{os.environ.get('PYTHONPATH', '')}:{script_dir}"

    # Import IPython and start the session
    try:
        from IPython import start_ipython
        from IPython.terminal.ipapp import load_default_config
    except ImportError:
        error("IPython is not installed. Please run 'uv pip install -e \".[dev]\"' first.")

    # Configure IPython
    config = load_default_config()
    config.InteractiveShellApp.exec_lines = [
        "%load_ext autoreload",
        "%autoreload 2",
        "from dtf_framework.models import TestId, TestCmd, TestParams",
        "print('DTF Framework development environment ready!')",
        "print('Available models: TestId, TestCmd, TestParams')",
        "print('Type help(TestId) for more information')"
    ]

    # Start IPython
    print("Starting IPython development environment...")
    start_ipython(argv=[], config=config)

if __name__ == "__main__":
    main() 