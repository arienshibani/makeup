# Makeup 💄

Ever find yourself deep inside a project tree, furiously typing `cd ../../..` just to run a `make` command somewhere far away from your working directory?

## 💅 Usage

Makeup is a tiny Zsh plugin that wraps your `make` command so that when you invoke `make`, it does the following:

1. Checks for a `Makefile` in the current folder.
2. If no makefile is found, instead of failing it "climbs" parent directories until it locates one.
3. Runs the requested target (or the default) in the directory it climbed to.
4. Returns you to your original working directory.

### Example 🔎

Let's say you have a `Makefile` defined at the root of your project.

```makefile
hello:
  @echo "Hello, world!"
```

With the `makeup` plugin, you can now run the `make hello` command from any subdirectory, deep inside the project without navigating back and forth 👇

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

This plugin is still under development. To test it:

### 1. Clone the plugin

```bash
git clone https://github.com/you/makeup ~/makeup
```

### 2. Source it in your Zsh session

```bash
source ~/makeup/makeup.plugin.zsh
```
