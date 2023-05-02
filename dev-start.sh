#!/bin/bash

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
