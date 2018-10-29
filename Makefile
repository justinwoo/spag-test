default: build run

build:
	spacchetti-install
	spacchetti-sources
	spacchetti-build

run:
	node -e "require('./output/Main').main()"

nix:
	nix-shell --run "make"
