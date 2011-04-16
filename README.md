# DotFiles

## Repository for various dotfiles.

Each file is symlinked to a Git repository on my system and pushed to GitHub. There are several methods for adding dotfiles to a repository. If you are unsure of how to go about getting your dotfiles in version control, here is my process.

In a directory that sits in my home directory where I keep source files; Rails, jQuery, etc. I created a dotfiles directory and added symlinks for the files I wanted to track.

Cd into the directory and run

    ln -s ~/.vimrc vimrc
    ln -s ~/.bash_profile bash_profile

Set up the repository

    git init
    git add .
    git commit -am "Initial Commit"

Assuming you have a GitHub repository setup, push to GitHub.

