# Makeup 💄

A tiny ZSH plugin that climbs up your directory hierarchy until it finds the closest `Makefile`, runs `make` there, then drops you right back where you started.

## 💅 Why

Ever find yourself deep inside a project tree, typing `cd ../../..` just to run the root `make`? Makeup lets you run `make` from any subfolder without manual navigation.

## 🔧 Installation

### 1. Clone the plugin

```bash

git clone https://github.com/you/makeup ~/makeup
```

### 2. Add it to your `.zshrc`

```bash
source ~/makeup/makeup.plugin.zsh
```

## 🚀 Usage

Let's say you have this `makefile` in your root directory:

```makefile
hello:
  @echo "Hello, world!"
```

and your project structure looks like this:

```txt
/home/you/project
├── Makefile
├── src
│   ├── module
│   │   ├── subdir
│   │   │   └── file.txt
│   │   └── another_file.txt
│   └── another_module
│       └── file.txt
└── README.md
```

You can run `make` from anywhere in the project tree, even deep inside a subdirectory:

```bash

# Nowhere near the Makefile
$ cd src/module/subdir

# Starts seraching upwards for any Makefile
$ make hello
🧗 cd ..
🧗 cd ..
🧗 cd ..
Hello, world!

# Makeup returns you to your original directory 👍
$ pwd
/home/you/project/src/module/subdir
```
