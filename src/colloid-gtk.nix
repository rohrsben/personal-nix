{ pkgs, source }:

pkgs.stdenvNoCC.mkDerivation {
    name = "colloid-gtk";

    src = source;

    nativeBuildInputs = with pkgs; [ sassc jdupes ];
    buildInputs = [ pkgs.gnome-themes-extra ];
    propagatedUserEnvPkgs = [ pkgs.gtk-engine-murrine ];

    postPatch = ''
        patchShebangs install.sh
    '';

    installPhase = ''
        runHook preInstall

        name= HOME="$TMPDIR" ./install.sh --size standard --theme red --color light --tweaks everforest rimless normal --dest "$out/share/themes"

        jdupes --quiet --link-soft --recurse "$out/share"

        runHook postInstall
    '';
}
