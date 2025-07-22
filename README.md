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
$ cd demo/level1/level2/level3

# ~/repos/makeup/demofolder/level1/level2/level3
$ make hello # This would otherwise fail
💄 Looking for Makefile's in parent directories...

"Hello, World!" # Found the root Makefile and executed the target.

$ pwd # Returns you back to where you executed the make command.
~/repos/makeup/demo/level1/level2/level3
```

## 🛠️ Configuration

You can customize the behavior of the `makeup` plugin by setting environment variables in your `.zshrc` file.

```sh
# ~/.zshrc

# Configuration
export MAKEUP_CONFIRM=true
export MAKEUP_BASE_DIR="$HOME"

```

* `MAKEUP_CONFIRM`

This variable controls whether you want a confirmation prompt before the script runs. If set to `true`, it will show you the directory where it will run the `make` command.

* `MAKEUP_BASE_DIR`

This variable sets the root directory where the script will stop searching for a `Makefile`. If not set, it defaults to your home directory (`$HOME`). You can set it to any directory you want the script to stop searching at.


## 🔧 Installation

### Oh-My-Zsh

```bash
git clone https://github.com/arienshibani/makeup ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/makeup
```

Add to `.zshrc`:
```bash
plugins=(... makeup)
```

### Antigen

```bash
antigen bundle arienshibani/makeup
```

### Zinit

```bash
zinit light arienshibani/makeup
```

### zplug

```bash
zplug "arienshibani/makeup"
```

### Manual Installation

```bash
# Clone repository
git clone https://github.com/arienshibani/makeup ~/.makeup

# Add to .zshrc
echo "source ~/.makeup/makeup.plugin.zsh" >> ~/.zshrc
```

After installation, restart your shell or run `source ~/.zshrc`.
