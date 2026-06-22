{
  codex,
  home-manager,
  llm-agents,
  nix-colors,
  nix-doom-emacs-unstraightened,
  nixpkgs,
  nur,
  pkgs,
  system,
  ...
}:

let
  ctx-overlay = import ./overlays/context.nix { inherit nix-colors; };
  inherit (pkgs) gctx;
in
nixpkgs.lib.nixosSystem {
  inherit system;

  modules = [
    ./configuration.nix

    nur.modules.nixos.default

    home-manager.nixosModules.home-manager
    {
      nixpkgs.overlays = [
        codex.overlays.default
        # codex pins nix_2_33, removed in nixpkgs 26.05; override to the successor
        (_: prev: { nix = prev.nixVersions.nix_2_34; })
        ctx-overlay
        llm-agents.overlays.default
        nur.overlays.default
      ];
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.${gctx.me.name} = import ./home.nix {
        inherit pkgs;
        codexHmModule = codex.homeModules.default;
        doomEmacsHmModule = nix-doom-emacs-unstraightened.homeModule;
      };
    }
  ];
}
