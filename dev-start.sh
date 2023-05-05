#!/bin/bash

#	dev-start.sh
#	Script to automate the link between the
#   huronOS-build-tools/docs directory and
#   huronOS-website/docs directory by hiding the
#   docs/ dir and configuring docusaurus to
#   not resolve the symlink
#
#	Copyright (C) 2022, huronOS Project:
#		<http://huronos.org>
#
#	Licensed under the GNU GPL Version 2
#		<http://www.gnu.org/licenses/gpl-2.0.html>
#
#	Authors:
#		Enya Quetzalli <equetzal@huronos.org>
#
#   Tested on:
#       - huronOS Queue 0.3
#       - Debian Bullsseye 11
#       - Debian Bullseye 11 over Windows WSL
#       - macOS Ventura 13

SCRIPT_LOCATION="$(dirname $(readlink -f "$0"))"
HBT_REPO="$SCRIPT_LOCATION/../huronOS-build-tools"

clean() {
    echo # To handle ctrl+c line
    echo "Cleaning dev environment"

    unlink "./docs"
    rm -f "./docs"
    mv docs.bak docs

    sed -i '/docs/d' .gitignore
    git update-index --no-assume-unchanged ".gitignore"

    pushd "docs/"
    git ls-files | tr '\n' ' ' | xargs git update-index --no-assume-unchanged
    popd

    echo "Successfully cleaned dev environment"
    exit
}

setup() {
    echo "Downloading huronOS-build-tools for documentation source"
    if ! git clone https://github.com/equetzal/huronOS-build-tools "$HBT_REPO" 2>/dev/null && [ -d "${HBT_REPO}" ]; then
        echo "huronOS-build-tools repository already present!"
    fi

    echo "Installing dependencies"
    yarn install

    echo "Hiding local docs/ directory"
    echo "docs" >>.gitignore
    echo "docs/" >>.gitignore
    echo "docs.bak/" >>.gitignore
    pushd "docs/"
    git ls-files | tr '\n' ' ' | xargs git update-index --assume-unchanged
    popd
    mv docs docs.bak
    git update-index --assume-unchanged ".gitignore"

    echo "Symlinking huronOS-build-tools/docs with huronOS-website/docs"
    ln -sf "$HBT_REPO/docs" "./docs"

    echo "Stating Docusaurus dev server"
    trap clean INT
    yarn start
}

setup
