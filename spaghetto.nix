{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation rec {
  name = "spaghetto";

  src = pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "spaghetto";
    rev = "93796206c2e4edac05639611b02f7a9c52086d9f";
    sha256 = "17ma283y7d7s6v2x437hn7cawy47sca0f6dz6lx0ryjzfhs7hasz";
  };

  installPhase = ''
    mkdir -p $out/bin
    cp spacchetti-* $out/bin
    cp -r templates $out/bin/templates
  '';
}
