[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

## 💄 Makeup

Ever find yourself deep inside a project tree, furiously typing `cd ../../..` just to run the projects root `make` file? 

### 💅 The solution  
A tiny ZSH plugin that climbs up your directory hierarchy, finds the closest `Makefile` and runs your `make` command there. Afterwards it drops you right back where you started. No aliases, no manual `cd`, no sweat.

---

- **Zero-config**  
  Clone it, enable it, and forget it.  
- **Smart Lookup**  
  Hops upward until it spies a `Makefile`.  
- **Full Transparency**  
  It invokes the real `make`—so all your targets remain intact.  

---

## 🔧 Installation

### With Oh My Zsh

```bash
git clone https://github.com/you/makeup \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/makeup
