{
  description = "EVILRDP - More control over RDP";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      # Systems supported
      allSystems = [
        "x86_64-linux" # 64-bit Intel/AMD Linux
      ];

      # Helper to provide system-specific attributes
      forAllSystems = f: nixpkgs.lib.genAttrs allSystems (system: f {
        pkgs = import nixpkgs { inherit system; };
      });
    in
    {
      packages = forAllSystems ({ pkgs }: with pkgs;
        let
          pname = "evilrdp";
          version = "0.0.3";
          src = ./.;
        in rec {
          evilrdp = python3.pkgs.buildPythonApplication {
            inherit pname version src;

            nativeBuildInputs = [ qt6.wrapQtAppsHook ];
            buildInputs = [ qt6.qtwayland ];

            doCheck = false;

            propagatedBuildInputs = with python3.pkgs; [
              aardwolf # TODO: Update to 0.2.9
              prompt-toolkit
              pyqt6
              pillow
              pyperclip
            ];

            meta = with pkgs.lib; {
              description = "EVILRDP - More control over RDP";
              mainProgram = "evilrdp";
              homepage = "https://github.com/skelsec/evilrdp";
              license = lib.licenses.mit;
            };
          };
          default = evilrdp;
        });
    };
}
