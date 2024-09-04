{
  buildASDF = { pname, version, src, lisp }:
    lisp.buildASDFSystem {
      inherit pname src version;
    };
}
