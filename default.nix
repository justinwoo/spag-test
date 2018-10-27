let
  pkgs = import <nixpkgs> {};

  spaghetto = import ./spaghetto.nix {};

in pkgs.stdenv.mkDerivation {
  name = "spag-test";
  src = ./.;

  buildInputs = [spaghetto];
}
