Personal configuration files repo.

Followed structure suggested in:
https://www.atlassian.com/git/tutorials/dotfiles

Which was inspired on:
https://news.ycombinator.com/item?id=11070797

Resuming in case resources are down:

 	
StreakyCobra on Feb 10, 2016 | next [–]

I use:

    git init --bare $HOME/.myconf
    alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
    config config status.showUntrackedFiles no

where my ~/.myconf directory is a git bare repository. Then any file within the home folder can be versioned with normal commands like:

    config status
    config add .vimrc
    config commit -m "Add vimrc"
    config add .config/redshift.conf
    config commit -m "Add redshift config"
    config push

