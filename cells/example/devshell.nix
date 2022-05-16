{
  cell,
  inputs,
}: {
  default = inputs.nixpkgs.mkShell {
    inputsFrom = [ cell.apps.example ];
    nativeBuildInputs = [
      inputs.std.std.cli.default
    ];
  };
}
