{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation rec {
  name = "spaghetto";

  src = pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "spaghetto";
    rev = "0816ff41924a74dc134d22b5027be70dec2aeecb";
    sha256 = "03zgdxhdbmvdpv0fpd2z3i9rp8qbxgp3p49x5hq3dlal8kc2z49v";
  };

  installPhase = ''
    mkdir -p $out/bin
    cp spacchetti-* $out/bin
    cp -r templates $out/bin/templates
  '';
}
