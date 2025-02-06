{
  description = "Various opentelemetry-collector builder configurations";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system}; in
      {
        devShells = {
          default = pkgs.mkShell {
            packages = with pkgs; [
                git
                go-task

                go
                opentelemetry-collector-builder
            ];


            env = {
              PROJECT_NAME = "opentelemetry-collector-builders";
            };

            shellHook = ''
                echo $ Started devshell for $PROJECT_NAME
                echo
            '';
          };
        };
      }
    );
}