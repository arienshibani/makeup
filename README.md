# makeup 💅

[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![CI](https://github.com/you/makeup/actions/workflows/ci.yml/badge.svg)](https://github.com/you/makeup/actions)

`makeup` is a tiny ZSH plugin that lets you run your project’s root-level `Makefile` from any subdirectory. Simply type `make` (or `make <target>`), and it will climb parent folders until it finds your `Makefile`, run the real `make` there, then return you to your original directory.

---

## Features

- 🚀 **Zero-config**: drop it in your Zsh setup, and you’re good to go.
- 🔍 **Smart lookup**: automatically finds the nearest `Makefile` in any parent directory.
- 🔄 **Automagical**: runs the real `make` for you—no aliases to remember or CD-ing around.

---

## Installation

### With [Oh My Zsh](https://ohmyz.sh/)

```bash
git clone https://github.com/you/makeup \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/makeup
# add "makeup" to your ~/.zshrc plugins=(… makeup)
```
