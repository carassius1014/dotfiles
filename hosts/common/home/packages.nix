{ pkgs }:

with pkgs;
[
  black
  cachix
  dig
  editorconfig-core-c
  fd
  fzf
  gnupg
  google-cloud-sdk
  graphviz
  httpie
  llm-agents.claude-code
  llm-agents.cursor-agent
  ngrok
  nix-prefetch-git
  nodejs-slim
  p7zip
  poetry
  python3Minimal
  python3Packages.grip
  ripgrep
  rlwrap
  saml2aws
  shellcheck
  shfmt
  socat
  taplo
  tree
  treefmt
  typescript-language-server
  unrar
  unzip
  whois
  yq-go
]
