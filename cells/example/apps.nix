{
  cell,
  inputs,
}: let
  inherit (inputs) self std nixpkgs;

  build = with nixpkgs;
    pkgs.stdenv.mkDerivation {
      name = "exampleApp";
      src = ./.;
      installPhase = ''
        mkdir -p $out
        echo "hello world" | tee example.txt
        mv example.txt $out
      '';
    };
in {
  example = build;
}
