#!/bin/sh

echo "Is your Neovim configuration located in ~/.config/nvim? (yes/no)"
read nvim_config_location

if [ "$nvim_config_location" = "no" ]; then
    echo "Please provide the path to your Neovim configuration directory:"
    read custom_config_path

    if [ ! -d "$custom_config_path" ]; then
        echo "Invalid directory path. Exiting."
        exit 1
    fi

    NVIM_CONFIG_PATH="$custom_config_path"
else
    NVIM_CONFIG_PATH="$HOME/.config/nvim"
fi

echo "Do you want to update MeteorNvim? (yes/no)"
read answer

if [ "$answer" = "no" ]; then
    echo "Exiting without updating MeteorNvim."
    exit 0
elif [ "$answer" != "yes" ]; then
    echo "Invalid input. Please enter 'yes' or 'no'."
    exit 1
fi

# Cloning the repository
echo "Cloning MeteorNvim repository..."
git clone https://github.com/MeteorNvim/MeteorNvim.git /tmp/MeteorNvim

# Moving files to NVIM_CONFIG_PATH
echo "Moving files to $NVIM_CONFIG_PATH..."
mkdir -p "$NVIM_CONFIG_PATH"
mv /tmp/MeteorNvim/lua/core "$NVIM_CONFIG_PATH"/lua
mv /tmp/MeteorNvim/lua/plugins "$NVIM_CONFIG_PATH"/lua

# Cleanup - removing the cloned repository
echo "Cleaning up..."
rm -rf /tmp/MeteorNvim

echo "Finished updating MeteorNvim!"
exit 0
