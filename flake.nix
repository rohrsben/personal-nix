{
    description = "Personally packaged nix derivations";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

        ef-gtk-theme = {
            url = "github:Fausto-Korpsvart/Everforest-GTK-Theme";
            flake = false;
        };

        ef-qt ={
            url = "github:binEpilo/materia-everforest-kvantum";
            flake = false;
        };
    };

    outputs = { self, nixpkgs, ef-gtk-theme, ef-qt }:
    let
        pkgs = import nixpkgs { system = "x86_64-linux"; };
    in {
        packages.x86_64-linux = {
            icon = import ./src/icon.nix { 
                inherit pkgs;
                source = ef-gtk-theme;
            };
            gtk = import ./src/gtk.nix {
                inherit pkgs;
                source = ef-gtk-theme;
            };
            qt = import ./src/qt.nix {
                inherit pkgs;
                source = ef-qt;
            };
        };
    };
}
