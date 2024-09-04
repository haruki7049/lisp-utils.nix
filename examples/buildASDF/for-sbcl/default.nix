{ pkgs ? import <nixpkgs> { }
, lisp-utils ? import ../../..
}:

let
  lib = pkgs.lib;
in

lisp-utils.buildASDF {
  pname = "example";
  version = "dev";
  src = lib.cleanSource ./.;
  lisp = pkgs.sbcl;
}
