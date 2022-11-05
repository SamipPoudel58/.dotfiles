#! /bin/bash

windows() { [[ -n "$WINDIR" ]]; }

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

if windows; then
    echo "Importing..."

    # Symlink in windows sometimes doesn't work without this
    export MSYS=winsymlinks:nativestrict 

    ln -s "$SCRIPT_DIR"/.bash_profile ~/.bash_profile
    ln -s "$SCRIPT_DIR"/.bashrc ~/.bashrc
    ln -s "$SCRIPT_DIR"/.gitconfig ~/.gitconfig

    ln -s "$SCRIPT_DIR"/nvim ~/.config/nvim

    ln -s "$SCRIPT_DIR"/.hyper.js ~/AppData/Roaming/Hyper/.hyper.js

    ln -s "$SCRIPT_DIR"/windows_terminal/settings.json ~/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json

    echo "Import Complete!"
else
    echo "This script is only for Windows :("
fi


