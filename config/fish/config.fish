#################
# - UNIVERSAL - #
#################

# direnv
set -x EDITOR emacs
eval (direnv hook fish)

# node
set PATH ./node_modules/.bin $PATH

########################
# - MACHINE SPECIFIC - #
########################

switch (uname)

  case Darwin

    set -g fish_user_paths /usr/local/sbin $fish_user_paths

    bass source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh

  case Linux

end
