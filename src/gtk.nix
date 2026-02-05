{ pkgs, source }:

pkgs.stdenvNoCC.mkDerivation {
    name = "everforest-gtk";

    src = source;

    nativeBuildInputs = with pkgs; [ sassc jdupes ];
    buildInputs = [ pkgs.gnome-themes-extra ];
    propagatedUserEnvPkgs = [ pkgs.gtk-engine-murrine ];

    postPatch = ''
        patchShebangs themes/install.sh
    '';

    dontBuild = true;

    installPhase = ''
        runHook preInstall

        mkdir -p "$out/share/themes"

        ./themes/install.sh --dest "$out/share/themes" --name Everforest --color dark --theme red --tweaks medium

        runHook postInstall
    '';
}
