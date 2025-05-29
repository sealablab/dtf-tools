#!/usr/bin/env bash
# SPDX-License-Identifier: MIT
#
# DTF Tools - Dependency Management Script
# This script provides utilities for managing Python dependencies using uv.

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

# Ensure uv is installed
check_uv() {
    if ! command_exists uv; then
        error "uv is not installed. Please install it first: https://github.com/astral-sh/uv"
    fi
}

# Update dependencies
update_deps() {
    echo "Updating dependencies..."
    uv pip compile requirements.txt -o requirements.lock || error "Failed to compile requirements"
    uv pip sync requirements.lock || error "Failed to sync requirements"
    echo "Dependencies updated successfully!"
}

# Check for security vulnerabilities
check_security() {
    echo "Checking for security vulnerabilities..."
    uv pip audit || warning "Security vulnerabilities found. Check the report above."
}

# Clean cache
clean_cache() {
    echo "Cleaning uv cache..."
    uv cache clean || error "Failed to clean cache"
    echo "Cache cleaned successfully!"
}

# Show dependency tree
show_tree() {
    echo "Dependency tree:"
    uv pip tree || error "Failed to show dependency tree"
}

# Main script
main() {
    local script_dir
    script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    cd "$script_dir/.." || error "Failed to change to project directory"

    check_uv

    case "${1:-help}" in
        update)
            update_deps
            ;;
        security)
            check_security
            ;;
        clean)
            clean_cache
            ;;
        tree)
            show_tree
            ;;
        all)
            update_deps
            check_security
            show_tree
            ;;
        help|*)
            echo "Usage: $0 <command>"
            echo
            echo "Commands:"
            echo "  update    - Update dependencies and generate lock file"
            echo "  security  - Check for security vulnerabilities"
            echo "  clean     - Clean uv cache"
            echo "  tree      - Show dependency tree"
            echo "  all       - Run all checks and updates"
            echo "  help      - Show this help message"
            ;;
    esac
}

# Run main function
main "$@" 