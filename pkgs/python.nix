{
  pkgs,
  python ? pkgs.python3,
  ...
}:

pkgs.lib.makeScope pkgs.newScope (
  self: with self; {
    callPythonPackage = callPackage ../call-python-package.nix { inherit python; };
    callPython313Package = callPackage ../call-python-package.nix { python = pkgs.python313; };

    python-xextract = callPythonPackage ./python-xextract { };
    linguee-api = callPython313Package ./linguee-api { };
    linguee-api-server = callPython313Package ./linguee-api/server.nix { };
  }
)
