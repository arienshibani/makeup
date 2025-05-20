# makeup.plugin.zsh
# Zsh plugin to search upwards for the nearest Makefile and run make there, then return to the original directory.

function make() {
  # Save the arguments and starting directory
  local args=("$@")
  local start_dir="$PWD"
  local dir="$PWD"

  # Climb up until we find a Makefile or reach root
  while [[ ! -e "$dir/Makefile" && "$dir" != "/" ]]; do
    # Indicate climbing up
    echo "🧗 cd .."
    dir=$(dirname "$dir")
  done

  if [[ -e "$dir/Makefile" ]]; then
    # Change to directory containing Makefile and run the real make
    cd "$dir" || return
    command make "${args[@]}"
    # Capture exit status in a writable variable
    local exit_status
    exit_status=$?
    # Return to original directory
    cd "$start_dir" || return
    return $exit_status
  else
    # No Makefile found
    echo "make: No Makefile found in any parent directory." >&2
    return 1
  fi
}