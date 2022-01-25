########################
# - MACHINE SPECIFIC - #
########################

switch (uname)

  case Darwin

    set -g fish_user_paths /usr/local/sbin $fish_user_paths

    bass source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh

  case Linux

end

#################
# - UNIVERSAL - #
#################

# direnv
set -x EDITOR emacs
eval (direnv hook fish)

# node
set PATH ./node_modules/.bin $PATH

# doom emacs
set PATH $HOME/.emacs.d/bin $PATH

set PATH $HOME/.local/bin $PATH

set -x SHISHO_DIR $HOME/.shisho

# haskell
set -x HASKELL_FORMATTER brittany
