#!/usr/bin/env bash

# array of sources where we want to retrieve search results from
sources=(
#"https://docs.platform.sh/json/devcenter.json"
"https://docs.upsun.com/json/devcenter.json"
"https://upsun.com/blog/feed-1.json"
)

# this is to allow for search to still work locally
if [[ -n "${1}" ]]; then
  appPath="${1}"
else
  appPath="${PLATFORM_APP_DIR}"
fi

# mount location of where we'll store all our search source files
searchFilesLocation="${appPath}/search-sources"
# file name of the file that will contain the combined sources
publicSearchFileName="search.json"
# location and file name of the dev center's search source file
devCenterSearchFile="${appPath}/public/en.search-data.json"
# prefix to add to the back-up copies of our search source files
searchTmpFilePrefix="tmp-"

# if we have an existing source file for a search source we want to rename it before attempting to retrieve a new copy.
# then if for some reason we cant get a new copy, we can fall back to this version
# $1 = name of file to rename, NOT including file location
# $2 = tmp prefix to use, defaults to $searchTmpFilePrefix
function renameSearchFile() {
    if [[ -n "${2}" ]]; then
      tmpPrefix="${2}"
    else
      tmpPrefix="${searchTmpFilePrefix}"
    fi

    #printf "You've asked me to create a tmp version of file %s\n" "${1}"

    searchFile="${searchFilesLocation}/${1}"
    if [ -f $searchFile ]; then
      # but before we rename the current, remove the old tmp file just in case it exists
      deleteTmpSearchFile "${1}" "${tmpPrefix}"
      #printf "Attempting to rename %s to %s\n" "${1}" "${tmpPrefix}${1}"
      mv $searchFile "${searchFilesLocation}/${tmpPrefix}${1}"
    #else
      #printf "%s doesn't exist at %s so there is nothing  to rename.\n" "${1}" "${searchFile}"
    fi
}

# renames the back-up copy of a source file to its original name
# only called if retrieval of a source file fails, or combining all files fails
# $1 = name of file to rename, NOT including file location
# $2 = tmp prefix to use, defaults to $searchTmpFilePrefix
function reverseTmpRename() {
  if [[ -n "${2}" ]]; then
    tmpPrefix="${2}"
  else
    tmpPrefix="${searchTmpFilePrefix}"
  fi

  sourceFileName="${searchFilesLocation/$1}"
  tmpFileName="${searchFilesLocation/${tmpPrefix}$1}"
  if [ -f "${tmpFileName}" ]; then
    mv "${tmpFileName}" "${sourceFileName}"
  fi
}

# deletes our temp backups after we've successfully retrieved fresh copies
# $1 = name of file to delete, NOT including file location or tmp prefix
# $2 = tmp prefix to use, defaults to $searchTmpFilePrefix
function deleteTmpSearchFile() {
  if [[ -n "${2}" ]]; then
    tmpPrefix="${2}"
  else
    tmpPrefix="${searchTmpFilePrefix}"
  fi
  searchTmpFile="${searchFilesLocation}/${tmpPrefix}${1}"
  if [ -f "${searchTmpFile}" ]; then
    rm "${searchTmpFile}"
  fi
}
# creates a backup of our public search file collection
function copyPublicSearch() {
    #delete the old copy if it exists
    deleteTmpSearchFile "${publicSearchFileName}"
    if [ -f  "${searchFilesLocation}/${publicSearchFileName}" ]; then
      cp "${searchFilesLocation}/${publicSearchFileName}" "${searchFilesLocation}/${searchTmpFilePrefix}${publicSearchFileName}"
    fi
}

# retrieves the name of the json file from the source location
# $1 - full URL location of a json file
function getFileName() {
   source=$1
   rootFilename=$(echo "${source}" |  cut -d'/' -f3)
   filename="${rootFilename}.json"
   echo "${filename}"
}

# retrieve fresh copies of search data from our array of sources
# $1 = URL location of a json file we want to retrieve
function getSource() {
    source=$1
    rootFilename=$(echo ${source} |  cut -d'/' -f3)
    filename="${rootFilename}.json"
    renameSearchFile "${filename}"
    wget -O "${searchFilesLocation}/${filename}" "$source"
    success=$?
    if (( 0 != success )); then
      # @todo we need a method to notify _someone_ that we weren't able to get the source
      printf "Error attempting to retrieve source from %s!!!\n" "$source"
      # reverse the temp renaming
      reverseTmpRename "${filename}"
    #else
      # we have our new copy, so let's delete the tmp
      # we're going to leave the tmp files in place until we're sure everything is ok
      #deleteTmpSearchFile "${filename}"
    fi

}

# The marketing blog's feed include html in the data. We don't want that in the search results
# so we need to modify those contents BEFORE we combine the file into the big search json file.
# but we cant make the changes in place so we'll need to write the contents into another temp file
# and then once it's successful we'll rename and overwrite the "main" file
# $1 = URL location of the marketing blog's json file
function fixMarketingBlog() {
  jqTmpPrefix="jq-"
  filename=$(getFileName "${1}")
  renameSearchFile "${filename}" "${jqTmpPrefix}"
  tmpBlogLocation="${searchFilesLocation}/${jqTmpPrefix}${filename}"
  realBlogLocation="${searchFilesLocation}/${filename}"
  jq '.items | .[] | with_entries(.value.data[] |= (. | gsub("</[^>]*>";"\n") | gsub("<[^>]*>";" ")))' "${tmpBlogLocation}" > "${realBlogLocation}"
  parseSuccess=$?
  if (( 0 != parseSuccess  )); then
    # @todo we have a fresh copy from the website, but we do NOT a new prepared copy.
    printf "There was an an issue transforming the marketing blog json file!!! Attempting to restore the cache.\n"
    reverseTmpRename "${filename}"
  else
    deleteTmpSearchFile "${filename}" "$jqTmpPrefix"
  fi

}

# Deletes all our tmp copies after we've successfully generated a new search.json source file
function deleteAllTempFiles() {
    #add our public search file to our list of sources
    #printf "Deleting all temp files...\n"
    sources+=("$publicSearchFileName")
    for searchSource in "${sources[@]}"; do
        if [[ "${searchSource}" == "https"* ]]; then
          filename=$(getFileName "${searchSource}")
        else
          filename="${searchSource}"
        fi

        #printf "Deleting the temp file %s\n" "${filename}"
        deleteTmpSearchFile "${filename}"
    done
}

function main() {
    # retrieve our external sources for search
    for searchSource in "${sources[@]}"; do
      getSource "${searchSource}"
      if [[ $searchSource == *"upsun.com/blog/"* ]]; then
          #printf "We need to do more processing on the marketing blog file!\n"
          fixMarketingBlog "${searchSource}"
      fi
    done

    #make a copy of our existing search file before we continue
    copyPublicSearch

    #now let's merge them into one:
    jq -s -c add $(ls "${searchFilesLocation}"/*.json) "${devCenterSearchFile}" > "${searchFilesLocation}/${publicSearchFileName}"
    mergeSuccess=$?

    if (( 0 != $mergeSuccess  )); then
      #rename the the temp file back so search isnt disrupted
      printf "There was an issue combining our json sources into %s! Restoring our cached copy!\n" "${publicSearchFileName}"
      reverseTmpRename "${publicSearchFileName}"
    else
      #delete the copy of the temp file we made
      printf "Successfully created the updated %s.\n" "${publicSearchFileName}"
      deleteAllTempFiles
    fi
}

main
