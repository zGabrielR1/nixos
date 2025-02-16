{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./settings.nix
    ./binds.nix
    ./rules.nix
  ];

  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };

  home = {
    packages = with pkgs; [
      seatd
      jaq
    ];
  };
}
