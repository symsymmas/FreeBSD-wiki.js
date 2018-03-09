#!/bin/bash

bold=$(tput bold)
green=$(tput setaf 2)
normal=$(tput sgr0)

echo -e "\n\n __    __ _ _    _    _     \n/ / /\\ \\ (_) | _(_)  (_)___ \n\\ \\/  \\/ / | |/ / |  | / __| \n \\  /\\  /| |   <| |_ | \\__ \\ \n  \\/  \\/ |_|_|\\_\\_(_)/ |___/ \n                   |__/\n   < INSTALL >\n"

VERSION=$(curl -L -s -S https://beta.requarks.io/api/version/stable)
echo $VERSION

echo "[1/3] Fetching latest build..."
file="wiki-js.tar.gz"
curl -L -s -S https://github.com/Requarks/wiki/releases/download/v$VERSION/wiki-js.tar.gz>$file
tar -xvzf $file

echo "[2/3] Fetching dependencies..."
file="node_modules.tar.gz"
curl -L -s -S https://github.com/Requarks/wiki/releases/download/v$VERSION/node_modules.tar.gz>$file
tar -xvzf $file

echo "[3/3] Creating config file..."
cp -n config.sample.yml config.yml

echo -e "-> ${green}Installation Complete${normal}\n"

echo -e "${bold}Thank you for installing Wiki.js!${normal}"
echo -e "Please consider donating to our open collective to help maintain this project:"
echo -e "https://opencollective.com/wikijs/donate\n"

echo -e "- Launch configuration wizard: ${bold}node wiki configure${normal}"
echo -e "- Start Wiki.js server: ${bold}node wiki start${normal}\n"
