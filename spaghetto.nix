{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation rec {
  name = "spaghetto";

  src = pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "spaghetto";
    rev = "0ef340f9f21837736c11c7e174ad22df3d4eae6f";
    sha256 = "1hmgm9ff664263cxa07r8yfavd234wd7d8yzpgj3zhr8xzc37rl6";
  };

  installPhase = ''
    mkdir -p $out/bin
    cp spacchetti-* $out/bin
    cp -r templates $out/bin/templates
  '';
}
