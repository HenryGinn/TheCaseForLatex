#!/usr/bin/env bash

set -euo pipefail

if [ $# -ne 1 ]; then
    echo "Usage: $0 <tag>"
    exit 1
fi

tag="$1"

repo_dir=$(basename "$PWD")
tex_file="${repo_dir}.tex"

if [ ! -f "$tex_file" ]; then
    echo "Expected LaTeX file not found: $tex_file"
    exit 1
fi

git fetch --tags origin
git checkout "$tag"
git submodule update --remote LatexPreamble

lualatex -synctex=0 -interaction=nonstopmode "$tex_file"

year=$(git show -s --date=format:%Y --format=%cd HEAD)
month=$(git show -s --date=format:%m --format=%cd HEAD)
short_commit=$(git rev-parse --short HEAD)
title=$(
    sed -n 's/^\\title{\(.*\)}$/\1/p' "$tex_file"
)

url=$(git config --get remote.origin.url)
# convert SSH to HTTPS
url=${url/git@github.com:/https://github.com}
url=${url%.git}
url=$url/releases/tag/$tag

cat > "$PWD/External.bib" <<EOF
@book{$repo_dir,
    title   	= {$title},
    year    	= {$year},
    month   	= {$month},
    edition 	= {$tag},
    url     	= {$url},
    note    	= {Commit: $short_commit},
    keywords	= {Internal}
}
EOF
