#
# ~/.bashrc
#

# If not running interactively, don't do anything
#  (not sure what this is)
[[ $- != *i* ]] && return

# Should change this, these colours for ls stink
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Matlab command line only
alias matlab="matlab -softwareopengl -nodesktop"

# Path to ngrok
export PATH=$HOME/builds/pkg/ngrok/usr/bin:${PATH}

# Path to scripts
export PATH=$HOME/documents/code/scripts:${PATH}

# Bell off I think
#xset b off

#alias extempore="extempore --device=0 --sharedir=/opt/extempore"
#export PATH=/opt/extempore/:${PATH}

alias em="emacsclient -t"

alias sudo='sudo '

export _JAVA_AWT_WM_NONREPARENTING=1

alias rm='rm -i'

alias freeplane='GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc freeplane'
