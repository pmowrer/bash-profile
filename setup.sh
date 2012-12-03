# From: https://github.com/drwahl/bash-profile

# Sets up symlinks to profile files in this repo, backing up any
# existing files.

# Currently only doing this for .profile
files="profile"
date=`date +"%Y%m%d"`

for file in $files; do
    if [ -h ~/.$file ]; then
        unlink ~/.$file
    else
        if [ -f ~/.$file ]; then
            echo "backing up ~/.$file to ~/.$file.bak$date"
            mv ~/.$file ~/.$file.bak$date
        fi
    fi
    echo "symlinking $PWD/$file to ~/.$file"
    ln -s $PWD/$file ~/.$file
done
