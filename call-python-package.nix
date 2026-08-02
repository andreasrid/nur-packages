{
  pkgs,
  python ? pkgs.python3,
  callPackage,
  self ? { },
}:
let
  pythonEnv = python.pkgs;
in
pkgs.lib.callPackageWith (
  pkgs
  // python.pkgs
  // {
    python3 = python;
    python3Packages = python.pkgs;
  }
  // rec {
    python-xextract = python.pkgs.callPackage ./pkgs/python-xextract { };
    linguee-api = python.pkgs.callPackage ./pkgs/linguee-api { inherit python-xextract; };
  }
  // self
)
