[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

## 💄 makeup: Run Your Root Makefile from Anywhere

### The Problem  
Ever find yourself deep inside a project tree, furiously typing `cd ../../..` just to run `make`? You peek at your prompt, realize you forgot to switch back, and—ugh—repeat. It’s a workflow speed bump that never stops.

### The Solution  
**makeup** to the rescue! A tiny Zsh plugin that magically climbs up your directory hierarchy, finds the nearest `Makefile`, runs your `make` command there, and drops you right back where you started. No aliases, no manual `cd`, no sweat.

---

## 🚀 Why You’ll Love It

- **Zero-config**  
  Clone it, enable it, and forget it.  
- **Smart Lookup**  
  Hops upward until it spies a `Makefile`.  
- **Full Transparency**  
  It invokes the real `make`—so all your targets (and your sanity) remain intact.  

---

## 🔧 Installation

### With Oh My Zsh

```bash
git clone https://github.com/you/makeup \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/makeup
