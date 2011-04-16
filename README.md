# DotFiles

## Repository for various dotfiles.

Each file is symlinked from a Git repository on my system to the right location in my home directory and pushed to GitHub. There are several methods for adding dotfiles to a repository. If you are unsure of how to go about getting your dotfiles in version control, here is my process.

I moved my files, *currently vimrc and bash_profile*, to a directory in my home directory where I keep source repositories; Rails, jQuery, etc. I then symlinked them back to their original location and pushed the repo to GitHub.


**Cd into the directory and run**

    mv ~/.vimrc .
    mv ~/.bash_profile .

**Set up the repository**

    git init
    git add .
    git commit -am "Initial Commit"

Assuming you have a GitHub repository setup, push to GitHub.

*Make sure you symlink your files back to where they should be.*

    cd ~
    ln -s ~/.vimrc .vimrc
    ln -s ~/.bash_profile .bash_profile
