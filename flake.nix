{
    description = "Personally packaged nix derivations";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

        colloid-icon = {
            url = "github:vinceliuice/Colloid-icon-theme";
            flake = false;
        };

        colloid-gtk = {
            url = "github:vinceliuice/Colloid-gtk-theme";
            flake = false;
        };
    };

    outputs = { self, nixpkgs, colloid-icon, colloid-gtk }:
    let
        pkgs = import nixpkgs { system = "x86_64-linux"; };
    in {
        packages.x86_64-linux = {
            colloid-icon = import ./src/colloid-icon.nix { 
                inherit pkgs;
                source = colloid-icon;
            };
            colloid-gtk = import ./src/colloid-gtk.nix {
                inherit pkgs;
                source = colloid-gtk;
            };
        };
    };
}
