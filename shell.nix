let
  pkgs = import <nixpkgs> { };
  compiler = pkgs.haskell.packages.ghc8105Binary;
in
  compiler.developPackage {
    root = ./.;
    modifier = drv:
      pkgs.haskell.lib.addBuildTools drv (with pkgs.haskellPackages;
        [ cabal-install
          ghcid
        ]);
  }
