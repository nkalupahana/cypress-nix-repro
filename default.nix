{ pkgs ? import (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/76612b17c0ce71689921ca12d9ffdc9c23ce40b2.tar.gz";
    sha256 = "03pmy2dv212mmxgcvwxinf3xy6m6zzr8ri71pda1lqggmll2na12";
  }) {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.cypress
    pkgs.nodejs_18
    pkgs.xorg.xorgserver
  ];

  shellHook = ''
    export CYPRESS_INSTALL_BINARY=0
    export CYPRESS_RUN_BINARY=${pkgs.cypress}/bin/Cypress
  '';
}
