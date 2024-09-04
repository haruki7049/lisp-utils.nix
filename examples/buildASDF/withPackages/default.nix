{ pkgs ? import <nixpkgs> { }
, lisp-utils ? import ../../..
}:

let
  lib = pkgs.lib;
  example = lisp-utils.buildASDF {
    pname = "example";
    version = "dev";
    src = lib.cleanSource ./.;
    lisp = pkgs.sbcl;
  };
in

pkgs.sbcl.withPackages (ps: [ example ])
