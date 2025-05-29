#!/usr/bin/env bash
# SPDX-License-Identifier: MIT
#
# DTF Tools - IPython Development Environment
# This script sets up a Python development environment for the DTF Framework
# with IPython and autoreload enabled.

set -euo pipefail

# Print error messages to stderr
error() {
    echo "Error: $*" >&2
    exit 1
}

# Print warning messages to stderr
warning() {
    echo "Warning: $*" >&2
}

# Check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Detect package manager (uv or pip)
detect_package_manager() {
    if command_exists uv; then
        echo "uv"
    elif command_exists pip; then
        echo "pip"
    else
        error "Neither uv nor pip is installed. Please install one of them."
    fi
}

# Main script
main() {
    local script_dir
    script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    cd "$script_dir" || error "Failed to change to script directory"

    # Detect OS and set appropriate paths
    case "$(uname -s)" in
        Darwin|Linux)
            venv_dir=".venv"
            activate_script="$venv_dir/bin/activate"
            ;;
        MINGW*|MSYS*|CYGWIN*)
            venv_dir=".venv"
            activate_script="$venv_dir/Scripts/activate"
            ;;
        *)
            error "Unsupported operating system: $(uname -s)"
            ;;
    esac

    # Create virtual environment if it doesn't exist
    if [ ! -d "$venv_dir" ]; then
        echo "Creating virtual environment..."
        case "$(detect_package_manager)" in
            uv)
                uv venv
                ;;
            pip)
                python3 -m venv "$venv_dir" || error "Failed to create virtual environment"
                ;;
        esac
    fi

    # Activate virtual environment
    if [ ! -f "$activate_script" ]; then
        error "Virtual environment activation script not found at $activate_script"
    fi
    source "$activate_script" || error "Failed to activate virtual environment"

    # Install dependencies if needed
    if [ ! -f "$venv_dir/.installed" ]; then
        echo "Installing dependencies..."
        case "$(detect_package_manager)" in
            uv)
                uv pip install -r requirements.txt || error "Failed to install dependencies"
                ;;
            pip)
                pip install -r requirements.txt || error "Failed to install dependencies"
                ;;
        esac
        touch "$venv_dir/.installed"
    fi

    # Launch IPython with autoreload
    echo "Starting IPython development environment..."
    PYTHONPATH="${PYTHONPATH:-}:$(pwd)" ipython -i -c "
%load_ext autoreload
%autoreload 2
from dtf_framework.models import TestId, TestCmd, TestParams
print('DTF Framework development environment ready!')
print('Available models: TestId, TestCmd, TestParams')
print('Type help(TestId) for more information')
"
}

# Run main function
main "$@" 