# Makeup 💄

Ever find yourself deep inside a project tree, furiously typing `cd ../../..` just to run a `make` command somewhere far away from your working directory?  

## 💅 Usage
Makeup is a tiny Zsh plugin that wraps your `make` command. When you invoke `make`, it:

1. Checks for a `Makefile` in the current folder.  
2. If none is found, it "climbs" parent directories one level at a time until it locates the nearest `Makefile`.  
3. Runs the requested target (or the default) in that directory.  
4. Returns you to your original working directory.

### Example 🔎

Let's say you have a `Makefile` defined at the root of your project.

```makefile
hello:
  @echo "Hello, world!"
```

With the `makeup` plugin, you can now run the `make hello` command from any subdirectory, deep inside the project 👇

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
