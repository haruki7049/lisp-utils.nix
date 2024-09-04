# lisp-utils.nix

```nix
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    lisp-utils.url = "github:haruki7049/lisp-utils";
  };

  outputs = { nixpkgs, lisp-utils, ... }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
    };

    # { for-sbcl = example-dev-sbcl; for-clisp = example-dev-clisp; }
    example = lisp-utils.eachLisp [ pkgs.clisp pkgs.sbcl ] (lisp: lisp-utils.buildASDF {
      pname = "example";
      version = "dev";
      src = ./.;

      inherit lisp;
    });
  in
  {
    packages."x86_64-linux" = {
      inherit (example) for-sbcl;
    };

    checks = {
      inherit (example) for-sbcl for-clisp;
    };
  };
}
```

```nix
# This nix expression returns a drv named "example-0.1.0-sbcl"
{ pkgs, lisp-utils }:

liso-utils.buildASDF {
  pname = "example";
  version = "0.1.0";
  src = ./.;

  lisp = pkgs.sbcl;
}
```
