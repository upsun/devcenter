#!/usr/bin/env bash

# PLATFORMSH_CLI_DOC_PATH: "dev/cli/test.md"
UPSUN_CLI_DOC_PATH: "dev/cli/test.md"

# echo "Generating Platform.sh CLI doc page"
# ./shared/scripts/gen-cli-docs.sh ${{ env.PLATFORMSH_CLI_DOC_PATH }} platform
# echo "Generating Upsun CLI doc page"
./shared/scripts/gen-cli-docs.sh $UPSUN_CLI_DOC_PATH  upsun


# cp shared/pages/commands.md $1

printf "\n<!-- vale off -->\n" >> $1
VERSION=$($2 version)
printf "\n# $VERSION\n" >> $1

printf "\n- [Installation](/administration/cli#1-install)" >> $1
printf "\n- [Open an issue](https://github.com/platformsh/cli/issues)\n" >> $1

printf "\n## All commands\n" >> $1

$2 list --format=md | tail -n +2 >> $1

printf "\n<!-- vale on -->\n" >> $1

# git add $1
