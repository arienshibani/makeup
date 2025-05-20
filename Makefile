# Makefile for the "makeup" Zsh plugin repository

# Customize where Oh My Zsh keeps custom plugins
ZSH_CUSTOM ?= $(HOME)/.oh-my-zsh/custom
PLUGINDIR := $(ZSH_CUSTOM)/plugins/makeup

# Default target: install the plugin
install:
	@echo "Installing 'makeup' plugin to $(PLUGINDIR)"
	@mkdir -p $(PLUGINDIR)
	# Copy necessary files
	@cp -r bin/ makeup.plugin.zsh tests/ README.md LICENSE $(PLUGINDIR)
	@echo "Installation complete. Add 'makeup' to your plugins in ~/.zshrc and reload."


# Run linting then the integration tests
test:
	@echo "Running integration tests..."
	@bash tests/test_makeup.sh

# Uninstall by removing the plugin directory
clean:
	@echo "Removing 'makeup' plugin from $(PLUGINDIR)"
	rm -rf $(PLUGINDIR)
	@echo "Plugin removed."

.PHONY: install lint test clean