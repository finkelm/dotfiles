Dotfiles
-----------

Just link in `.bash_aliases` in `.bashrc`. Be sure to maintain the same directory structure.

The way I like to use it is to just have the git repo containing these files in my `$HOME` directory (ie ~). I do this with the following:

    git init
    git remote add origin https://github.com/finkelm/dotfiles.git
    git fetch
    git checkout -t origin/master

I then use `.bashrc` for my local-specific scripts/aliases.
