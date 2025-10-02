{ pkgs }:

# near wholly taken from gh:juanibiapina/dotfiles/.../nvim.nix
# rev at time of writing: 044612e sep 2025
pkgs.stdenvNoCC.mkDerivation rec {
    name = "treesitter-parsers";

    inherit (pkgs.vimPlugins.nvim-treesitter.withAllGrammars) dependencies;

    buildInputs = dependencies;

    phases = [ "installPhase" ];
    installPhase = ''
        mkdir -p "$out/parser"
        for dep in ${pkgs.lib.concatStringsSep " " (map (dep: "${dep}/parser") dependencies)}; do
            ln -s "$dep"/* "$out/parser"
        done
    '';
}
