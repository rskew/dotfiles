alias em="emacsclient -t"

set -gx PATH $HOME/scripts $PATH

alias rm='rm -i'

set -gx EDITOR vim

#set -gx PATH $HOME/.psvm/current/bin $PATH

alias cat=bat

fish_vi_key_bindings

set -gx PATH $HOME/sneaky_non_nix_builds/freeplane $PATH

alias CloudCompare="env LIBGL_ALWAYS_SOFTWARE=true CloudCompare"
alias firefox="env LIBGL_ALWAYS_SOFTWARE=true firefox"
alias meshlab="env LIBGL_ALWAYS_SOFTWARE=true meshlab"

function background --description "Run a fish command in the background using a subshell, thanks to pirate https://github.com/fish-shell/fish-shell/issues/238#issuecomment-302897122"
    fish -c "fish -c '""$argv""' &"
end

alias sl='sl -l'

function fish_user_key_bindings
    for mode in insert default visual
        bind -M $mode \cf forward-char
    end
    for mode in insert default visual
        bind -M $mode \cu up-or-search
    end
end
