let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-24.05";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in

pkgs.mkShellNoCC {
  packages = with pkgs; [
    nodejs_22
    nodePackages.npm
    python312
    hugo
    jq
  ];
  shellHook = ''
    npm install
    npm run dev
  '';
}
