# Generator module:
# This is the module that is responsible for creating init.sh.

# Generates the cached initializer file.
shbundler_generate_init() { # (path, file)
  local path=$1
  local file=$2

  mkdir -p "`dirname $file`"
  echo "# Autogenerated by ShellBundler" > $file

  (
    for i in $path/bundle/*; do shbundler_load $i; done
    shbundler_load $path
  ) > $file
}

# Loads all shell files in a given directory.
source_dir() { # (path, root)
  if [ -d "$1" ]; then
    for i in $1/*.sh; do
      if [ -r "$i" ]; then
        echo "log \"      source + $i\" 34"
        echo "BUNDLE_ROOT=\"$2\" source $i"
      fi
    done
  fi
}

# Loads a bundle.
shbundler_load() { # (bundle)
  echo ""
  echo "# Bundle: $1"
  echo "SHBUNDLER_LOADED=\"\${SHBUNDLER_LOADED}$1:\""
  echo "log \" ============= $1\" 32"

  # Add the bin to the path, and load the autoloaded files.
  shbundler_add_path "$1/bin" "$1"
  shbundler_add_path "$1/bin/$OSENV" "$1"
  source_dir "$1/autoload" "$1"
  source_dir "$1/autoload/$OSENV" "$1"
}

# Adds a given path to $PATH. Also works for bundles by setting $BUNDLE_ROOT.
shbundler_add_path() { # (path, bundle_home)
  if [ -d "$1" ]; then
    echo "log \"        path + $1\" 33"
    echo "PATH=\"$1:\$PATH\""
  fi
} 

