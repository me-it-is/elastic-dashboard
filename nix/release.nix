let
  pkgs = import ./nixpkgs.nix {
    overlays = import ./overlays.nix;
  };

  default = pkgs.pub2nix.build.native {
    binName = "elastic-dashboard"; # The desired executable name
    src = ../.;
  };

  shell = pkgs.mkShell {
    inputsFrom = [
      default
    ];
    buildInputs = [
      pkgs.pub2nix.lock
    ];
  };
in
  {
    inherit default shell;
  }