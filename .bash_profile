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
# --------------------------------------------
	export PATH="$HOME/.bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/Applications/MAMP/Library/bin/:/Applications/MAMP/bin/php/php5.6.10/bin"

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

# Edit file in Sublime Text editor
edit () {
	if [ -f $1 ] ;
	then
		open -a 'Sublime Text' $1
	else
		echo '$1 is not a valid file or you do not have access to it'
	fi
}

# Open current directory in Finder
alias finder="open -a Finder ./"

# Go to Home directory
alias home="cd ~"

# Go to development folder
alias dev="cd ~/Development/Localhost"

# Show executable paths
alias path='echo -e ${PATH//:/\\n}'

# Open file in quick look
ql () {
	qlmanage -p "$*" >& /dev/null;
}

# Reloads bash profile file
alias reload="source ~/.bash_profile"

# Run drupal-permissions.sh bash file on Drupal installation
alias fixPermissions="sudo bash ~/.bin/drupal-permissions.sh"

# Update bash file from Git
alias updateBash="curl https://raw.githubusercontent.com/jzavrl/dot-files/master/.bash_profile > ~/.bash_profile && reload"

# Update Drupal permissions bash file from Git
alias updateDrupalPermissions="curl https://raw.githubusercontent.com/jzavrl/dot-files/master/drupal-permissions.sh > ~/.bin/drupal-permissions.sh"

# Extract most used compressed files
extract () {
	if [ -f $1 ] ;
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


# --------------------------------------------
# DEVELOPMENT
# --------------------------------------------

# Edit apache conf file
alias apacheEdit='sudo nano /etc/apache2/users/JanZavrl.conf'

# Reload apache conf dot-files
alias apacheRestart='sudo apachectl graceful'

# Edit hosts file
alias hostEdit='sudo nano /etc/hosts'

# Flush DNS
alias flushdns='dscacheutil -flushcache'

# Get my current IP address
alias myip='curl ip.appspot.com'


# --------------------------------------------
# SERVERS
# --------------------------------------------

# Add aliases for quick ssh connection
alias eos='ssh -2 -p 22 aegir@eos.iuvo.si'
alias eos.root='ssh -2 -p 22 nyx@eos.iuvo.si'
alias aura='ssh -2 -p 22 aegir@aura.iuvo.si'
alias aura.root='ssh -2 -p 22 nyx@aura.iuvo.si'
alias spiible='ssh -2 -p 22 spiible@spiible.com'
alias de.agiledrop='ssh -2 -p 22 agiledrop@de.agiledrop.com'
alias dev.agiledrop='ssh -2 -p 22 agiledrop@dev.agiledrop.com'
alias prod.agiledrop='ssh -2 -p 22 agiledrop@prod.agiledrop.com'
alias nj.agiledrop='ssh -2 -p 22 root@nj.agiledrop.com'
alias fov.staging='ssh -2 -p 22 root@193.2.122.21'
alias fov.production='ssh -2 -p 22 root@193.2.122.59'
