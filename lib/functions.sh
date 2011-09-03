# Detects for the OS and sets the OSENV variable.
shbundler_osdetect() {
  if [ -e "/usr/bin/osascript" ]; then
    echo "mac"
  elif [ -e "/etc/lsb-release" ]; then
    echo "linux"
  fi
}

# Called by the profile.
shbundler_rc() { # (path)
  shbundler_init "$bash_home"
}

# Initializes the RTP.
shbundler_init() { # (SHBUNDLER_HOME)
  log "Initializing the runtime path $1..." 33

  local file="$SHBUNDLER_CACHE_PATH/init.sh"

  if [ ! -r $file ]; then
    source "$SHBUNDLER_ROOT/lib/generator.sh"
    shbundler_generate_init "$1"
  fi

  source $file
}
