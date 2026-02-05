{ pkgs, source }:

pkgs.stdenvNoCC.mkDerivation {
    name = "everforest-icon";

    src = source;

    dontBuild = true;
    dontFixup = true;

    installPhase = ''
        runHook preInstall

        mkdir -p "$out/share/icons"
        cp -a icons/* "$out/share/icons/"

        runHook postInstall
    '';

    passthru.updateScript = pkgs.gitUpdater { };
}
