{
  description = "The Packages I need";
  inputs = {
    flake-utils.url = "github:numtide/flake-utils?ref=c1dfcf08411b08f6b8615f7d8971a2bfa81d5e8a";
    nixpkgs.url = "github:nixos/nixpkgs?ref=24.05";
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      rec {
        packages.default = packages.dev;

        packages.dev = pkgs.symlinkJoin {
          # Package that only has dependencies
          name = "werkzeugkiste";
          paths = with pkgs; [

            neovim
            neovim-remote
            ripgrep
            universal-ctags
            sqlite
            python3
            python3Packages.pynvim
            git
            gnumake
            wget
            gnupg
            curl

          ] ++ [ packages.initial-setup ];
        };

        packages.initial-setup = pkgs.writeShellScriptBin "öffne-werkzeug-kiste.sh" ''
          mkdir -p ~/code ~/.config
          cd ~/code
          git clone https://github.com/bashconfig config
          cd config
          make install
          cd ~/code/
          git clone https://github.com/bashjump
        '';

        formatter = pkgs.nixpkgs-fmt;
      }
    );

}
