{
  cell,
  inputs,
}: {
  default = inputs.nixpkgs.mkShell {
    inputsFrom = [ cell.apps.preprocessor ];
    nativeBuildInputs = [
      inputs.std.std.cli.default
    ];
  };
}
