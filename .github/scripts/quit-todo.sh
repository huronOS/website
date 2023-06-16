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

# Change to the website/docs directory
cd docs || exit

# Find and delete markdown files containing "TODO"
find . -type f -name "*.md" -exec grep -q "TODO" {} \; -exec rm {} \;
