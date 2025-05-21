# Makeup 💄

Ever find yourself deep inside a project tree, furiously typing `cd ../../..` just to run the root `make` commands?  Makeup is A tiny ZSH plugin that climbs up your directory hierarchy until it finds the closest `Makefile`, runs the targeted command if it exists, then drops you right back where you started.

## 💅 Usage

Let's say you have a `makefile` in your root directory, with a `hello` command defined within it:

```makefile
hello:
  @echo "Hello, world!"
```

With the `makeup` plugin, you can now run that `make hello` command from any subdirectory, deep inside the project 👇

```bash
# ~/repos/makeup
$  ll
   29B  Makefile
   128B demofolder

# ~/repos/makeup 
$ cd demo/level1/level2/level3

# ~/repos/makeup/demofolder/level1/level2/level3 
$ make hello

🧗 cd ..
🧗 cd ..
🧗 cd ..
🧗 cd ..

"Hello, World!"

# ~/repos/makeup/demofolder/level1/level2/level3 
$
```

## 🔧 Installation

This plugin is still under development. You can clone it, and source it manually if you want to test it.

### 1. Clone the plugin

```bash
git clone https://github.com/you/makeup ~/makeup
```

### 2. Add it to your `.zshrc`

```bash
source ~/makeup/makeup.plugin.zsh
```
