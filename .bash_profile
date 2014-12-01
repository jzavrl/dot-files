# ----------------------------------------------------------------------------------------
#
# Custom bash configuration file containing some neat
# shortcuts and commands for quicker workflow
#
# -------------------------------------------- --------------------------------------------

# --------------------------------------------
# ENVIROMENT CONFIGURATION
# --------------------------------------------

# Adds custom folders to PATH variable
# --------------------------------------------
	export PATH="$HOME/bin:/usr/local/bin/:$PATH"

# Set default editor
# --------------------------------------------
	export EDITOR=/usr/bin/nano

# Set default blocksize for ls, df, du
# --------------------------------------------
	export BLOCKSIZE=1k


# --------------------------------------------
# TERMINAL SHORTCUTS
# --------------------------------------------

# List directory contents after using "cd" command
cd() { builtin cd "$@"; ls; }

# Set "cd" shortcuts for backward listing
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"

# Edit file in Sublime Text Editor
alias edit="/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl"

# Open current directory in Finder
alias finder="open -a Finder ./"

# Go to Home directory
alias home="cd ~"

# Show executable paths
alias path='echo -e ${PATH//:/\\n}'

# Open file in quick look
ql () { qlmanage -p "$*" >& /dev/null; }