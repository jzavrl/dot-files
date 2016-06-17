# ----------------------------------------------------------------------------------------
#
# Custom bash configuration file containing some neat
# shortcuts and commands for quicker workflow
#
# ----------------------------------------------------------------------------------------

# --------------------------------------------
# ENVIROMENT CONFIGURATION
# --------------------------------------------

# Adds custom folders to PATH variable
export PATH="$HOME/.bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/Applications/MAMP/bin/php/php5.6.10/bin:$PATH"
export PATH="/Applications/MAMP/Library/bin:$PATH"

# Set default editor
export EDITOR=/usr/bin/nano

# Set default blocksize for ls, df, du
export BLOCKSIZE=1k


# --------------------------------------------
# TERMINAL SHORTCUTS
# --------------------------------------------

# List directory contents after using "cd" command
cd() {
	builtin cd "$@";
	ls;
}

# Set "cd" shortcuts for backward listing
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"

# Open current directory in Finder
alias finder="open -a Finder ./"

# Go to Home directory
alias home="cd ~"

# Go to site development site folder
dev() {
	PROJECT_PATH="$HOME/Development/Localhost/"$1"/www"
	DEFAULT_PATH="$HOME/Development/Localhost"

	if [ -z "$1" ];
	then
		builtin cd "$DEFAULT_PATH";
	else
		if [ -d $PROJECT_PATH ];
		then
			builtin cd "$PROJECT_PATH";
		else
			builtin cd "$DEFAULT_PATH";
		fi
	fi
}

# Show executable paths
alias path='echo -e ${PATH//:/\\n}'

# Open file in quick look
ql() {
	qlmanage -p "$*" >& /dev/null;
}

# Reloads bash profile file
alias reload="source ~/.bash_profile"

# Run drupal-permissions.sh bash file on Drupal installation
alias fix-permissions="sudo bash ~/.bin/drupal-permissions/drupal-permissions.sh"

# Update bash file from Git
alias update-bash="curl https://raw.githubusercontent.com/jzavrl/dot-files/master/.bash_profile > ~/.bash_profile && reload"

# Extract most used compressed files
extract () {
	if [ -f $1 ];
	then
		case $1 in
			*.tar.bz2)		tar xjf $1		;;
			*.tar.gz)			tar xzf $1		;;
			*.bz2)				bunzip2 $1		;;
			*.rar)				unrar e $1		;;
			*.gz)					gunzip $1			;;
			*.tar)				tar xf $1			;;
			*.tbz2)				tar xjf $1		;;
			*.tgz)				tar xzf $1		;;
			*.zip)				unzip $1			;;
			*.Z)					uncompress $1	;;
			*.7z)					7z x $1 			;;
			*)						echo "'$1' cannot be extracted via extract()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

# Flush DNS
alias flushdns='dscacheutil -flushcache'

# Get my current IP address
alias myip='curl ip.appspot.com'


# --------------------------------------------
# SERVERS
# --------------------------------------------

# Import file with server aliases
source "$HOME/.bash_servers"
