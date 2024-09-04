{ pkgs ? import <nixpkgs> { }
, lisp-utils ? import ../../..
}:

let
  lisp = pkgs.sbcl;
  lib = pkgs.lib;
  example = lisp-utils.buildASDF {
    pname = "example";
    version = "dev";
    src = lib.cleanSource ./.;
    inherit lisp;
  };
in

lisp.withPackages (ps: [ example ])
