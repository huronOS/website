#!/bin/bash

#	remove-current-docs.sh
#	Script to switch the variable 'includeCurrentVersion' to false
#   on docusaurus configuration
#
#	Copyright (C) 2022, huronOS Project:
#		<http://huronos.org>
#
#	Licensed under the GNU GPL Version 2
#		<http://www.gnu.org/licenses/gpl-2.0.html>
#
#	Authors:
#		Enya Quetzalli <equetzal@huronos.org>

if [[ "$(uname)" == "Darwin" ]]; then
    # macOS (BSD sed)
    sed -i '' 's/includeCurrentVersion *: *true/includeCurrentVersion: false/g' docusaurus.config.js
else
    # Linux (GNU sed)
    sed -i.bak 's/includeCurrentVersion *: *true/includeCurrentVersion: false/g' docusaurus.config.js
fi