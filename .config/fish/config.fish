alias em="emacsclient -t"

set -gx PATH $HOME/scripts $PATH
set -gx PATH $HOME/bin $PATH

alias rm='rm -i'

set -gx EDITOR vim

#set -gx PATH $HOME/.psvm/current/bin $PATH

alias cat=bat

# Redirects stderr to /dev/null to avoid [this issue](https://github.com/syl20bnr/spacemacs/issues/12221)
# in spacemaces and projectile
fish_vi_key_bindings 2>/dev/null

set -gx PATH $HOME/sneaky_non_nix_builds/freeplane $PATH

alias firefox="env LIBGL_ALWAYS_SOFTWARE=true firefox"
alias meshlab="env LIBGL_ALWAYS_SOFTWARE=true meshlab"
alias anydesk="env LIBGL_ALWAYS_SOFTWARE=true anydesk"

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

if type -q conda
  source (conda info --root)/etc/fish/conf.d/conda.fish
end

set -gx PYTHONPATH $HOME/silverpond/powercor/lidar/conductor_model $PYTHONPATH
set -gx PYTHONPATH $HOME/silverpond/powercor/lidar/pole_localisation $PYTHONPATH
alias jupyterlab_lidar='ulimit -v 6000000; jupyter lab'

alias gerp=grep
alias grpe=grep

eval (direnv hook fish)

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# Except for the 'command -v conda' which Rowan added to stop errors on new shell
command -v conda && eval (eval /home/rowan/.conda/bin/conda "shell.fish" "hook" $argv)
# <<< conda initialize <<<

alias vim=vim-custom
