{
  description = "Flake for testing preprocessors";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    std.url = "github:divnix/std?ref=cic-180";
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
      devShell = inputs.std.harvest inputs.self [ "example" "devshell" "default" ];
      defaultPackage = inputs.std.harvest inputs.self [ "example" "apps" "example" ];
    });
}
