{ nixpkgs, home-manager, emacs-overlay, nur, codex, ... }:

let
  system = "x86_64-linux";
  pkgs = nixpkgs.legacyPackages.${system};
  gctx = import ../context.nix { inherit pkgs; };
in nixpkgs.lib.nixosSystem {
  inherit system;
  modules = [
    ./configuration.nix

    nur.nixosModules.nur

    home-manager.nixosModules.home-manager
    {
      nixpkgs.overlays = [ emacs-overlay.overlay nur.overlay ];
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.${gctx.me.name} = import ./home.nix {
        inherit pkgs;
        codexHmModule = codex.hmModule.${system};
      };
    }
  ];
}
