{ pkgs, ... }:

{
  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
    extraPackages = [ pkgs.mesa.drivers ];
    extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];
  };
}
