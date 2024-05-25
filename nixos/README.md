# nixos

# In case of a new machine configuration 

1. In case of a new machine configuration: 
    1. Create a new machine folder: Example: `~/Projects/dotfiles/nixos/machines/home_laptop` 
        1. Move auto generated hardware file to this new folder: `mv /etc/nixos/hardware-configuration.nix ~/Projects/dotfiles/nixos/machines/home_laptop` 
        1. Consider: Copy the nvidia configuration to this new folder: `mv  ~/Projects/dotfiles/nixos/machines/home_laptop/nvidia-setup.nix ~/Projects/dotfiles/nixos/`  
    1. Create new configuration in `flake.nix` where you point to the new files. 

# In case of using an existing configuration
1. Install nixos. 
1. Install git
1. Checkout the whole dotfiles in: `~/Projects/dotfiles/
1. Remove default nixos config folder `rm -r /etc/nixos/`
1. Create symlink: `ln -s ~/Projects/dotfiles/nixos/ /etc/nixos` 
1. Call `sudo nixos-rebuild --flake .#desktop switch` 
    1. Where you replace `desktop` with the relevant configuration in `flake.nix` 
1. Wait for all the goodies. 
