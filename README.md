# Spaghetto test

A demonstration of using [Spaghetto](https://github.com/justinwoo/spaghetto) to have a project driven by [Spacchetti](https://github.com/justinwoo/spacchetti) via [Nix](https://nixos.org/nix/).

If you have Nix installed, you can run `make nix` to see this in action.

## SHA

*Update: it seems there are very few commits you can even fetch from GitHub by using SHAs, so what is below is definitely not recommended:*

Spaghetto will also let you use a commit SHA for a ref:

```hs
in  let overrides =
          { simple-json =
                upstream.simple-json
              ⫽ { version = "4b3afaffab4bd684427573842ab5740ee3c001c8" }
          }
```

```hs
{ name =
    "my-project"
, dependencies =
    [ "effect", "console", "simple-json" ]
, packages =
    ./packages.dhall
}
```

However, you may be disappointed to find out that `git fetch --depth 1 <remote> <sha>` does not work for some repositories on GitHub, seemingly many of ones older than May 2015. Therefore, it is always preferable to fork repositories and tag versions that you want to use.
