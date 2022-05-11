{
  description = "Flake for mdbook-kroki-preprocessor";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    std.url = "github:divnix/std";
  };

  outputs = inputs:
    (inputs.std.growOn {
      inherit inputs;
      cellsFrom = ./cells;
      organelles = [
        (inputs.std.devshells "devshell")
        (inputs.std.installables "apps")
      ];
    }
    {
      devShell = inputs.std.harvest inputs.self [ "preprocessor" "devshell" "default" ];
      defaultPackage = inputs.std.harvest inputs.self [ "preprocessor" "apps" "preprocessor" ];
    });
}
