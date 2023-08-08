#!/bin/bash

#	quit-todo.sh
#	Script to detele all the files on the huronOS website documentation
#   that contains a TODO string on it.
#   This script allows to remove unfinished work on the project before
#   deploying in production website.
#
#	Copyright (C) 2022, huronOS Project:
#		<http://huronos.org>
#
#	Licensed under the GNU GPL Version 2
#		<http://www.gnu.org/licenses/gpl-2.0.html>
#
#	Authors:
#		Enya Quetzalli <equetzal@huronos.org>

# Check if "TODO" is present outside code blocks
has_todo() {
    local file="$1"

    # Remove code blocks and inline code using sed
    local content
    content=$(sed -e '/```/,/```/d' -e 's/`[^`]*`//g' "$file")

    # Check for "TODO" outside code blocks and inline code
    if [[ $content == *TODO* ]]; then
        return 0 # Has TODO
    else
        return 1 # Does not have TODO
    fi
}

delete_todo(){
    while IFS= read -r file; do
        if has_todo "$file"; then
            echo "File $file have TODO"
            rm -rf "$file"
        fi
    done < <(find . -type f -name "*.md")
}

# Change to the website/docs directory
pushd docs || exit 0
delete_todo
popd || exit 0

pushd versioned_docs || exit 0
delete_todo
popd || exit 0

