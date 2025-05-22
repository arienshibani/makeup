# makeup.plugin.zsh
# Zsh plugin to search upwards for the nearest Makefile and run make there, then return to the original directory.

# Declare associative array to track confirmed directories
typeset -gA MAKEUP_CONFIRMED_PATHS

function make() {
  # Save the arguments and starting directory
  local args=("$@")
  local start_dir="$PWD"
  local dir="$PWD"
  local confirm="${MAKEUP_CONFIRM:-false}"
  local base="${MAKEUP_BASE_DIR:-"/"}"

  # Climb up until we find a Makefile or reach the base directory
  echo "🔎 Searching..."
  while [[ ! -e "$dir/Makefile" && "$dir" != "$base" ]]; do
    dir=$(dirname "$dir")
  done

  if [[ -e "$dir/Makefile" ]]; then
    if [[ "$confirm" = true && -z "${MAKEUP_CONFIRMED_PATHS[$dir]}" ]]; then
      local last_part="${dir##*/}"
      local parent_part="${dir%/*}"
      local cyan="\033[0;36m"
      local reset="\033[0m"
      echo -e "✅ Found Makefile in: ${parent_part}/$cyan$last_part$reset"
      echo "⌨️ Press [Enter] to run make here. This Makefile will be allow-listed in the current terminal session."
      read -r response
      if [[ -n "$response" ]]; then
        echo "Aborted by user."
        return 0
      fi
      MAKEUP_CONFIRMED_PATHS[$dir]=1
    fi

    cd "$dir" || return
    command make "${args[@]}"
    local exit_status=$?
    cd "$start_dir" || return
    return $exit_status
  else
    echo "make: No Makefile found in any parent directory." >&2
    return 1
  fi
}
