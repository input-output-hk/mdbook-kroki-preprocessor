{
  cell,
  inputs,
}: let
  inherit (inputs) self std nixpkgs;

  buildPreprocessor = with nixpkgs; rustPlatform.buildRustPackage {
    pname = "mdbook-kroki-preprocessor";
    version = "0.1.0";
    nativeBuildInputs = [ pkg-config ];
    buildInputs = [ openssl ];

    cargoLock = {
      lockFile = ./Cargo.lock;
    };

    src = std.incl self [
      (self + /Cargo.lock)
      (self + /src)
    ];
  };
in {
  preprocessor = buildPreprocessor;
}
