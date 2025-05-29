# DTF Tools

> [!note] Cross-Platform Note
> This README is designed to render properly on GitHub, Bitbucket, and in Obsidian vaults.
> When viewing in Obsidian, you may want to use the "Reading View" for best results.

## Overview

DTF Tools provides development and utility scripts for working with the DTF Framework.
This repository contains tools and scripts that are separate from the core framework package.

## Quick Start

```bash
# Clone the repository
git clone https://github.com/sealablab/dtf-tools.git
cd dtf-tools

# Start the development environment
./dtf-ipython.sh
```

## Available Tools

### DTF-Ipython.sh

A development environment script that:
- Sets up a Python virtual environment
- Installs the DTF Framework and dependencies
- Launches IPython with autoreload enabled

Usage:
```bash
./dtf-ipython.sh
```

### Dependency Management

> [!note] For Maintainers
> This project uses `uv` for dependency management. We provide custom scripts and configuration
> to make dependency management easier and more consistent.

#### Quick Reference

```bash
# Update dependencies and check security
./scripts/manage-deps.sh all

# Just update dependencies
./scripts/manage-deps.sh update

# Check for security issues
./scripts/manage-deps.sh security

# Show dependency tree
./scripts/manage-deps.sh tree

# Clean cache
./scripts/manage-deps.sh clean
```

#### Configuration

The `uv.toml` file configures how `uv` manages dependencies:
- Uses highest compatible versions by default
- Enables security audits
- Configures caching and network settings
- Has separate development settings

#### Common Tasks

1. **Adding a new dependency**:
   ```bash
   # 1. Add to requirements.txt
   # 2. Run update to generate lock file
   ./scripts/manage-deps.sh update
   ```

2. **Updating all dependencies**:
   ```bash
   ./scripts/manage-deps.sh update
   ```

3. **Checking for security issues**:
   ```bash
   ./scripts/manage-deps.sh security
   ```

4. **Troubleshooting**:
   - If you see strange dependency issues, try:
     ```bash
     ./scripts/manage-deps.sh clean  # Clear cache
     ./scripts/manage-deps.sh update # Reinstall everything
     ```
   - To see what's installed:
     ```bash
     ./scripts/manage-deps.sh tree
     ```

## Project Structure

```
dtf-tools/
├── dtf-ipython.sh          # Development environment script
├── scripts/                # Utility scripts
│   └── manage-deps.sh      # Dependency management script
├── requirements.txt        # Development dependencies
├── requirements.lock       # Locked dependencies (generated)
├── uv.toml                # uv configuration
└── .gitignore             # Git ignore rules
```

## Development

### Prerequisites

- Python 3.8+
- [uv](https://github.com/astral-sh/uv) (recommended) or pip
- DTF Framework (installed automatically by scripts)

### Setup

The tools are designed to work with the DTF Framework installed as a dependency.
The `dtf-ipython.sh` script will handle the setup automatically.

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## License

MIT

---

> [!tip] Obsidian Integration
> When using this in an Obsidian vault, you can:
> - Use the "Reading View" for best rendering
> - Create links to specific sections using the headers
> - Embed this README in other notes using `![[README]]` 