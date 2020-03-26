function run
  set -l cmd_name $argv[1]
  set -l cmd_args $argv[2..-1]
  set -l cmd "$HOME/.dotfiles/scripts/$cmd_name"
  $cmd $cmd_args
end
