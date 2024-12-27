{
  pkgs,
  config,
  ...
}: let
  link = config.lib.file.mkOutOfStoreSymlink;
  moduleHome = "${config.home.homeDirectory}/code/nix/modules/zsh";
in {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    dotDir = ".config/zsh";
    history.ignoreDups = true;
    historySubstringSearch.enable = true;
    sessionVariables = {};
    shellAliases = {};
    initExtra = ''
      # Powerlevel10k
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      test -f ~/.config/zsh/p10k.zsh && source ~/.config/zsh/p10k.zsh
      test -f ~/.config/zsh/extras.zsh && source ~/.config/zsh/extras.zsh
    '';
  };

  home.file = {
    ".config/zsh/p10k.zsh".source = link "${moduleHome}/p10k.zsh";
  };
}
