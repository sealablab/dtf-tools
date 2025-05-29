# DTF Tools

> **Note**: This is a companion repository to the [DTF Framework](https://github.com/sealablab/dtf-framework) library.
> The framework provides the core data models and utilities, while this repository contains development tools.

## Related Repositories

- [DTF Framework](https://github.com/sealablab/dtf-framework) - Core data models and utilities
- [DTF Development Environment](https://github.com/sealablab/dtf-dev) - Development environment setup

## Overview

DTF Tools provides development and utility scripts for working with the DTF Framework.
This repository contains tools and scripts that are separate from the core framework package.

## Quick Start

```bash
# Clone the repository
git clone https://github.com/sealablab/dtf-tools.git
cd dtf-tools

# Set up the development environment
uv venv
uv pip install -e ".[dev]"

# Start the development environment
python run-ipython.py
```

## Available Tools

### Development Environment

The development environment provides:
- IPython with autoreload enabled
- Pre-imported DTF Framework models
- Proper Python path configuration

Usage:
```bash
python run-ipython.py
```

### Dependency Management

> **Note**: For Maintainers
> This project uses `uv` for dependency management. Dependencies are managed through `pyproject.toml`.

#### Quick Reference

```bash
# Create/update virtual environment
uv venv

# Install package with development dependencies
uv pip install -e ".[dev]"

# Update dependencies
uv pip sync pyproject.toml

# Show dependency tree
uv pip list --tree
```

## Project Structure

```
dtf-tools/
├── dtf_tools/           # Python package
│   └── __init__.py     # Package initialization
├── run-ipython.py      # Development environment launcher
├── pyproject.toml      # Package configuration and dependencies
└── .gitignore         # Git ignore rules
```

## Development

### Prerequisites

- Python 3.8+
- [uv](https://github.com/astral-sh/uv) package manager
- DTF Framework (installed automatically as a dependency)

### Setup

1. Ensure you have UV installed:
   ```bash
   curl -LsSf https://astral.sh/uv/install.sh | sh
   ```

2. Create and activate the virtual environment:
   ```bash
   uv venv
   source .venv/bin/activate  # or .venv/Scripts/activate on Windows
   ```

3. Install the package with development dependencies:
   ```bash
   uv pip install -e ".[dev]"
   ```

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