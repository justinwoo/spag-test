{ pkgs ? import <nixpkgs> {}
, pwd ? builtins.toString ./.
}:

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
    cp --no-preserve=mode,ownership,timestamp templates/* ${pwd}
    mkdir -p ${pwd}/src
    mkdir -p ${pwd}/test
    mv ${pwd}/srcMain.purs ${pwd}/src/Main.purs
    mv ${pwd}/testMain.purs ${pwd}/test/Main.purs
  '';
}
