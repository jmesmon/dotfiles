# 
# This file is based on the configuration written by
# Bruno Bonfils, <asyd@debian-fr.org> 
# Written since summer 2001

# We don't source this on each shell, screws up gcc-config
# XXX: this doesn't actually fix it.
#. /etc/profile

# My functions (don't forget to modify fpath before call compinit !!)
fpath=($HOME/.zsh/functions $fpath)

# colors
eval `dircolors $HOME/.zsh/colors`

setopt AUTO_PUSHD

autoload -U zutil
autoload -U compinit
autoload -U complist

bindkey -e

bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward
bindkey '^K' kill-whole-line
bindkey "\e[H" beginning-of-line        # Home (xorg)
bindkey "\e[1~" beginning-of-line       # Home (console)
bindkey "\e[4~" end-of-line             # End (console)
bindkey "\e[F" end-of-line              # End (xorg)
bindkey "\e[2~" overwrite-mode          # Ins
bindkey "\e[3~" delete-char             # Delete
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
bindkey "\e[7~" beginning-of-line	# urxvt
bindkey "\e[8~" end-of-line		# urxvt

#bindkey '^R' history-incremental-search-backward

#export TERMINAL="urxvt"
#export TERMINAL="xterm"

# Activation
compinit

. $HOME/dotfiles/shell

# Resource files
for file in $HOME/.zsh/rc/*.rc; do
	source $file
done

# Remove empty elements
PATH=${PATH##:}
PATH=${PATH%%:}
PATH=${PATH/:://}
export PATH

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh
