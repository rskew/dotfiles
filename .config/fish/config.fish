alias em="emacsclient -t"

set -gx PATH $HOME/scripts $PATH
set -gx PATH $HOME/bin $PATH

alias rm='rm -i'

set -gx EDITOR vim

alias cat=bat

# Redirects stderr to /dev/null to avoid [this issue](https://github.com/syl20bnr/spacemacs/issues/12221)
# in spacemaces and projectile
fish_vi_key_bindings 2>/dev/null

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

alias gerp=grep
alias grpe=grep

eval (direnv hook fish)

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# Except for the 'command -v conda' which Rowan added to stop errors on new shell
command -v conda && eval (eval /home/rowan/.conda/bin/conda "shell.fish" "hook" $argv)
# <<< conda initialize <<<

alias vim=vim-custom
