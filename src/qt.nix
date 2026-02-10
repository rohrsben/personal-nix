{ pkgs, source }:

pkgs.stdenvNoCC.mkDerivation {
    name = "everforest-qt";

    src = source;

    dontBuild = true;

    installPhase = ''
        mkdir -p "$out/share/Kvantum/everforest-qt";
        cp MateriaEverforestDark/* "$out/share/Kvantum/everforest-qt"
    '';
}
