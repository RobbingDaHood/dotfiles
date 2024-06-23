
{ config, lib, pkgs, modulesPath, ... }:

{
  # https://nixos.wiki/wiki/Nvidia

  # Enable OpenGL
  # Most of it is gotten from here: https://nixos.wiki/wiki/Accelerated_Video_Playback
  # I experienced issues in brave browser, with stuttering. 
  hardware.opengl = {
    enable = true;
    driSupport = true;
    extraPackages = with pkgs; [
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      intel-vaapi-driver # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      libvdpau-va-gl
    ];   driSupport32Bit = true;
  };
  environment.sessionVariables = { LIBVA_DRIVER_NAME = "iHD"; }; # Force intel-media-driver
  nixpkgs.config.packageOverrides = pkgs: {
    intel-vaapi-driver = pkgs.intel-vaapi-driver.override { enableHybridCodec = true; };
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {

    # Modesetting is required.
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # Enable this if you have graphical corruption issues or application crashes after waking
    # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead 
    # of just the bare essentials.
    powerManagement.enable = true;

    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of 
    # supported GPUs is at: 
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
    # Only available from driver 515.43.04+
    # Currently alpha-quality/buggy, so false is currently the recommended setting.
    open = false;

    # Enable the Nvidia settings menu,
    # accessible via `nvidia-settings`.
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    # You can use this to find the name of the GPU: brave://gpu/ That only showed the intel GPU :( 
    # Laptop has: https://www.nvidia.com/en-gb/geforce/graphics-cards/geforce-gtx-1050-ti/specifications/
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    # prime = {
    #  # Make sure to use the correct Bus ID values for your system!
    #  # https://nixos.wiki/wiki/Nvidia
    #  # sudo lshw -c display
    #  intelBusId = "PCI:0:2:0";
    #  nvidiaBusId = "PCI:01:0:0";
    #  sync.enable = true; # Means that it will automaticly use the nvidia graphic when it judges it is fine. Alternative is "Offload" mode, where I am in control. Will wait and see if Offload mode is nessesary. 
    # };

  };
  
  # https://github.com/NixOS/nixpkgs/issues/302059#issuecomment-2041033128
  boot.kernelParams = [
    "initcall_blacklist=simpledrm_platform_driver_init"
  ];
}
