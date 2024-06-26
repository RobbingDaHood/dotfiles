# Copy pasted from here: https://nixos-and-flakes.thiscute.world/nixos-with-flakes/start-using-home-manager

{ config, pkgs, ... }:

{
  home.username = "robbingdahood";
  home.homeDirectory = "/home/robbingdahood";

  home.sessionVariables = {
    BROWSER = "brave";
    TERMINAL = "alacritty";
    VISUAL = "vim";
    EDITOR = "vim";
  };

  home.file.".vim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Projects/dotfiles/vimconfig/";

  programs.git = {
    enable = true;
    userName = "RobbingDaHood";
    userEmail = "16130319+RobbingDaHood@users.noreply.github.com"; 
    extraConfig = {
      core.editor = "vim";
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };

  programs.chromium = {
    enable = true;
    package = pkgs.brave;
    extensions = [
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # ublock origin
      { id = "ghmbeldphafepmbegfdlkpapadhbakde"; } # protonpass
      { id = "dbepggeogbaibhgnhhndojpepiihcmeb"; } # vimium
    ];
    commandLineArgs = [
      "--disable-features=WebRtcAllowInputVolumeAdjustment"
    ];
  };

  programs.alacritty = {
    enable = true;
  };
  home.file.".alacritty.toml".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Projects/dotfiles/alacritty/alacritty.toml";
  home.file."/.config/alacritty/themes".source = builtins.fetchGit {
    url = "https://github.com/alacritty/alacritty-theme";
    rev = "bd009e1f85d2ff35a9ff9b24808d2927e18a47e6";
  };

  programs.tmux = {
    enable = true;
    # I could not use the home manager symlink trick to enable tmux config, so had to do it this way. 
    extraConfig = ''
      source-file ${config.home.homeDirectory}/Projects/dotfiles/tmux/tmux.conf
    '';
  };

  programs.ranger = {
    enable = true;
  };

  # TODO: Add ranger and use it as file explorere everywhere: Also browser downloads etc. Then get rid of the default file explorer. 

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
