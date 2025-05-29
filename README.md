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
./DTF-Ipython.sh
```

## Available Tools

### DTF-Ipython.sh

A development environment script that:
- Sets up a Python virtual environment
- Installs the DTF Framework and dependencies
- Launches IPython with autoreload enabled

Usage:
```bash
./DTF-Ipython.sh
```

## Project Structure

```
dtf-tools/
├── DTF-Ipython.sh          # Development environment script
├── requirements.txt        # Development dependencies
└── .gitignore             # Git ignore rules
```

## Development

### Prerequisites

- Python 3.8+
- [uv](https://github.com/astral-sh/uv) (recommended) or pip
- DTF Framework (installed automatically by scripts)

### Setup

The tools are designed to work with the DTF Framework installed as a dependency.
The `DTF-Ipython.sh` script will handle the setup automatically.

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## License

[Your chosen license]

---

> [!tip] Obsidian Integration
> When using this in an Obsidian vault, you can:
> - Use the "Reading View" for best rendering
> - Create links to specific sections using the headers
> - Embed this README in other notes using `![[README]]` 