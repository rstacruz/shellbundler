# Detects for the OS and sets the OSENV variable.
shbundler_osdetect() {
  if [ -e "/usr/bin/osascript" ]; then
    echo "mac"
  elif [ -e "/etc/lsb-release" ]; then
    echo "linux"
  fi
}

# Adds a given path to $PATH. Also works for bundles by setting $BUNDLE_ROOT.
shbundler_add_path() { # (path, bundle_home)
  if [ -d "$1" ]; then
    log "      path + $1" 33
    PATH="$1:$PATH"
  fi
} 

# Called by the profile.
shbundler_rc() { # (path)
  local bash_home=$1
  [ -z "$bash_home" ] && bash_home=$HOME/.bash

  if [ ! -d "$bash_home" ]; then
    err "The directory $bash_home does not exist."
    return 1
  fi

  shbundler_init "$bash_home"
  shbundler_load_all
}

# Initializes the RTP.
shbundler_init() { # (path)
  log "Initializing the runtime path $1..." 33
  export RUNTIME_PATH="$1"

  # Add bundles to RUNTIME_PATH
  for i in "$1/bundle/*"; do RUNTIME_PATH="$i:$RUNTIME_PATH"; done
}

# Loads all bundles.
shbundler_load_all() {
  for bundle in ${RUNTIME_PATH//:/$'\n'}; do shbundler_load $bundle; done
  log "All bundles loaded"
}

# Ensure a bundle is not loaded.
shbundler_ensure_not_loaded() { # (bundle)
  if [[ "$SHBUNDLER_LOADED" =~ ":$1:" ]]; then
    err "Bundle $1 was already loaded."
    return 1
  fi
}

# Loads all shell files in a given directory.
source_dir() { # (path, root)
  if [ -d "$1" ]; then
    for i in $1/*.sh; do
      log "    source > $i" 34
      BUNDLE_ROOT="$2" source $i
    done
  fi
}

# Loads a bundle.
shbundler_load() { # (bundle)
  # Sanity check
  shbundler_ensure_not_loaded $1 || return 1

  log "Load bundle: $1" 32
  export SHBUNDLER_LOADED="${SHBUNDLER_LOADED}$1:"

  # Add the bin to the path, and load the autoloaded files.
  shbundler_add_path "$1/bin" "$1"
  shbundler_add_path "$1/bin/$OSENV" "$1"
  source_dir "$1/autoload" "$1"
  source_dir "$1/autoload/$OSENV" "$1"
}

