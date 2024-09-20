#!/usr/bin/env bash

if [[ -n "${1}" ]]; then
  appPath="${1}"
else
  printf "We HAVE to know where we're running!\n"
fi

if [[ ! -e "${appPath}/public/search/search.json" || ! -L "${appPath}/public/search/search.json" ]]; then
    echo "symlink for search.json doesn't exist. I'll attempt to create it."
    ln -s -f "${appPath}/search-sources/search.json" "${appPath}/public/search/search.json"
fi

# now build the search stuff
bash search.sh "${appPath}"