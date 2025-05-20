# makeup.plugin.zsh — Zsh plugin entrypoint for "makeup"

# Determine the directory this file lives in
# ${(%):-%N} is the name of the current script; :h gives its directory
local makeup_plugin_dir="${0:a:h}"

# Path to the helper script
local makeup_script="$makeup_plugin_dir/bin/makeup"

# Override the `make` command in Zsh
make() {
  # Delegate to our wrapper script, passing through all arguments
  "$makeup_script" "$@"
}
