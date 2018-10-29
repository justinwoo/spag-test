let
  pkgs = import <nixpkgs> {};

  spaghetto = import ./spaghetto.nix {};

  easy-ps = import (pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "easy-purescript-nix";
    rev = "45050a69fc60b9e7259053a9d68d42a0e47dbf33";
    sha256 = "1ajnsiclzv4xcjd6dn6p8bwqmyjib7rjrya0m57gj1dwkzn9z3lk";
  });

in pkgs.stdenv.mkDerivation {
  name = "spag-test";
  src = ./.;

  buildInputs = [spaghetto] ++ easy-ps.buildInputs;

  shellHook = ''
    cp --no-preserve=mode,ownership,timestamp ${spaghetto.outPath}/bin/templates/* .
    mkdir -p src
    mv srcMain.purs src/Main.purs
    mkdir -p test
    mv testMain.purs test/Main.purs
  '';
}
