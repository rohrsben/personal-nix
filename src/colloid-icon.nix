{ pkgs, source }:

pkgs.stdenvNoCC.mkDerivation {
    name = "colloid-icon";

    src = source;

    nativeBuildInputs = with pkgs; [ gtk3 jdupes];
    propagatedBuildInptus = with pkgs; [ hicolor-icon-theme ];

    dontDropIconThemeCache = true;
    dontPatchElf = true;
    dontRewriteSymlinks = true;

    postPatch = ''
        patchShebangs install.sh
    '';

    configurePhase = ''
        rm links/apps/scalable/io.github.vinegarhq.Vinegar.studio.svg
        rm links/apps/scalable/kerry.svg
        rm links/apps/scalable/org.kde.kfind.svg
    '';

    installPhase = ''
        runHook preInstall

        name= ./install.sh --scheme everforest --theme grey --dest $out/share/icons
        jdupes --quiet --link-soft --recurse $out/share

        runHook postInstall
    '';

    passthru.updateScript = pkgs.gitUpdater { };
}
