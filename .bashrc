#
# ~/.bashrc
#

# If not running interactively, don't do anything
#  (not sure what this is)
[[ $- != *i* ]] && return

# Should change this, these colours for ls stink
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Not really sure what's going on here
function pdfpextr()
{
    # this function uses 3 arguments:
    #     $1 is the first page of the range to extract
    #     $2 is the last page of the range to extract
    #     $3 is the input file
    #     output file will be named "inputfile_pXX-pYY.pdf"
    gs -sDEVICE=pdfwrite -dNOPAUSE -dBATCH -dSAFER \
       -dFirstPage=${1} \
       -dLastPage=${2} \
       -sOutputFile=${3%.pdf}_p${1}-p${2}.pdf \
       ${3}
}



# Matlab command line only plz
alias matlab="matlab -softwareopengl -nodesktop"

# Path to ngrok
export PATH=$HOME/builds/pkg/ngrok/usr/bin:${PATH}

# Path to scripts
export PATH=$HOME/documents/code/scripts:${PATH}

# Bell off I think
xset b off

alias extempore="extempore --device=0 --sharedir=/opt/extempore"
export PATH=/opt/extempore/:${PATH}

alias em="emacsclient -t"

alias sudo='sudo '

export _JAVA_AWT_WM_NONREPARENTING=1
