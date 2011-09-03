# ShellBundler
#### Bash package manager

ShellBundler keeps your bash setup clean by letting you keep all your bash 
packages in `~/.bash/bundle`.

Requirements
------------

You need Bash (or regular sh), and Git.

Install it
----------

Put shellbundler in:

``` bash
$ mkdir -p ~/.bash/bundle/shellbundler
$ git clone git://github.com/rstacruz/shellbundler.git ~/.bash/bundle/shellbundler
```
    
In your bash profile, load ShellBundler:

``` bash
# Add this somewhere to the top of ~/.bash_profile
source ~/.bash/bundle/shellbundler/init.sh
```

Use it
------

 * __Autoloads__
   * Put your *.sh* files to be loaded in `~/.bash/autoload`.
   * Put your *.sh* files to be loaded on a Mac in `~/.bash/autoload/mac`.
   * Put your *.sh* files to be loaded on a Linux env in `~/.bash/autoload/linux`.

 * __Bin files__
   * Put your bin files to be added to your path in `~/.bash/bin`.
   * Put your bin files to be added to your path on a Mac in `~/.bash/bin/mac`.
   * Put your bin files to be added to your path on a Linux env in `~/.bash/bin/linux`.

 * __Bundles__ (!)
   * Put your bundles in `~/.bash/bundle/bundle_name_here`. They will all be 
   loaded. A bundle has `./bin` and `./autoload` dirs just like above.

Acknowledgements
----------------

 * [VIM][vim]: Inspired by vim's `~/.vim` and *runtimepath* config setup.
 * [Pathogen][pathogen] by Tim Pope: The original *runtimepath* manager for Vim.
 * [Vundler][vundler] by gmarik: The git-powered *runtimepath* manager.

[vim]: http://vim.org
[pathogen]: http://github.com/tpope/pathogen
[vundler]: http://github.com/gmarik/vundler

To do
-----

ShellBundler will eventually have:

 * `shbundle install` which will install packages you specify in your bash 
 profile.

 * `shbundle update` which will update your bundles to the latest version.

