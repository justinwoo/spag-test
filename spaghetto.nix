{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation rec {
  name = "spaghetto";

  src = pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "spaghetto";
    rev = "3b8fd2beeb4177afbc7f65e7a547c35bcb426827";
    sha256 = "1qnwnfci81hlv7m39hn0jf6znpjkfzl8s7ppr9ibabfazfk631pj";
  };

  installPhase = ''
    mkdir -p $out/bin
    cp spacchetti-* $out/bin
    cp -r templates $out/bin/templates
  '';
}
