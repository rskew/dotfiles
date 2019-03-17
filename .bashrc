#
# ~/.bashrc
#

# If not running interactively, don't do anything
#  (not sure what this is)
[[ $- != *i* ]] && return

# TODO change this, these colours for ls stink
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Matlab command line only
alias matlab="matlab -softwareopengl -nodesktop"

# Path to ngrok
export PATH=$HOME/builds/pkg/ngrok/usr/bin:${PATH}

# Path to scripts
export PATH=$HOME/documents/code/scripts/:${PATH}
export PATH=$HOME/documents/code/scripts/space_utils/:${PATH}

export GUROBI_HOME=$HOME/builds/gurobi/pkg/gurobi/usr
export GRB_LICENSE_FILE=$HOME/builds/gurobi/pkg/gurobi/usr/gurobi.lic

# Bell off I think
#xset b off

#alias extempore="extempore --device=0 --sharedir=/opt/extempore"
#export PATH=/opt/extempore/:${PATH}

alias em="emacsclient -t"

alias sudo='sudo '

# Fixes matlab or something
export _JAVA_AWT_WM_NONREPARENTING=1

alias rm='rm -i'

alias freeplane='GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc freeplane'

alias gst='git status'
alias gl='git log --graph --decorate --pretty=oneline --abbrev-commit'

export PYTHONPATH=/home/rowan/silverpond/powercor/network_topology_inference/das-155:${PYTHONPATH}
export PYTHONPATH=/home/rowan/silverpond/powercor/network_topology_inference/phase_identification:${PYTHONPATH}
export PYTHONPATH=/home/rowan/silverpond/powercor/network_topology_inference/phase_identification/phase_id:${PYTHONPATH}


git-find-replace (){
    git grep -l $1 | xargs sed -i 's/'$1'/'$2'/g'
}

exec zsh

export NOCONDA_PATH=$PATH
#export PATH=/opt/miniconda3/bin:${PATH}
#[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh
