#################
# - UNIVERSAL - #
#################

# direnv
set -x EDITOR emacs
eval (direnv hook fish)

########################
# - MACHINE SPECIFIC - #
########################

switch (uname)

  case Darwin

    set -g fish_user_paths /usr/local/sbin $fish_user_paths

    bass source /Users/carassius1014/.nix-profile/etc/profile.d/nix.sh

  case Linux

end
