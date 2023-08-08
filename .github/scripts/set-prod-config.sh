#!/bin/bash

#	set-prod-config.sh
#	Script to set docusaurus configs to match production desired behavior
#
#	Copyright (C) 2022, huronOS Project:
#		<http://huronos.org>
#
#	Licensed under the GNU GPL Version 2
#		<http://www.gnu.org/licenses/gpl-2.0.html>
#
#	Authors:
#		Enya Quetzalli <equetzal@huronos.org>


## Set includeCurrentVersion to false on prod, we don't want to include unfinished work here.
if [[ "$(uname)" == "Darwin" ]]; then
    # macOS (BSD sed)
    sed -i '' 's/includeCurrentVersion *: *true/includeCurrentVersion: false/g' docusaurus.config.js
else
    # Linux (GNU sed)
    sed -i.bak 's/includeCurrentVersion *: *true/includeCurrentVersion: false/g' docusaurus.config.js
fi
echo "Excluding [next] version documentation."

## Set noIndex to false, we only want search engines to index prod website.
if [[ "$(uname)" == "Darwin" ]]; then
    # macOS (BSD sed)
    sed -i '' 's/noIndex *: *true/noIndex: false/g' docusaurus.config.js
else
    # Linux (GNU sed)
    sed -i.bak 's/noIndex *: *true/noIndex: false/g' docusaurus.config.js
fi
echo "Making website indexable by search engines."