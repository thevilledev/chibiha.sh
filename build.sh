#!/bin/bash

# Generate hash from file contents
CSS_HASH=$(md5sum docs/styles.css | cut -d ' ' -f 1)
THEME_HASH=$(md5sum docs/theme.js | cut -d ' ' -f 1)
MENU_HASH=$(md5sum docs/menu.js | cut -d ' ' -f 1)

# Update all HTML files in docs and docs/benchmarks
for file in docs/*.html docs/benchmarks/*.html; do
    sed -i '' -e "s/styles\.css\(?v=[a-f0-9]*\)*/styles.css?v=$CSS_HASH/" \
             -e "s/theme\.js\(?v=[a-f0-9]*\)*/theme.js?v=$THEME_HASH/" \
             -e "s/menu\.js\(?v=[a-f0-9]*\)*/menu.js?v=$MENU_HASH/" "$file"
done