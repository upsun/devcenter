import os
import sys
import json
import glob
import shutil
import subprocess
from os.path import exists

reference_index_content="""---
title: Command reference
weight: 10
type: docs
excludeSearch: true
sidebar:
  separator: true
---
"""

docs_dir="dev/content/cli/ref"
commands_file = "upsun_commands.json"

#######################################################################################################################
# A. Cleanup.
# 1. Remove reference section.
if exists("dev/content/cli/ref/ref.md"):
    subprocess.run("rm -rf dev/content/cli/ref", shell = True, executable="/bin/bash")
    subprocess.run("mkdir dev/content/cli/ref && touch dev/content/cli/ref/ref.md", shell = True, executable="/bin/bash")
    # 2. Recreate index/separator file.
    with open('dev/content/cli/ref/ref.md', 'w') as file:
        file.write(reference_index_content)
# 3. Remove commands file if it exists.
if exists(commands_file):
    print("File exists. Removing.")
    os.remove(commands_file)
else:
    print("File does not exist. Skipping removal.")

#######################################################################################################################
# B. Get commands list.
list_commands = "upsun list --format=json > {0}".format(commands_file)
subprocess.run(list_commands, shell = True, executable="/bin/bash")

#######################################################################################################################
# C. Define CLI command "families" that will result in page bundles.
# command_struct = {
#     "_index": ""
# }
command_struct = {}
with open(commands_file) as json_data:
    data = json.load(json_data)
    for current_command in data["commands"]:
        current_command_split = current_command["name"].split(":")
        if len(current_command_split) == 1:
            # command_struct["_index"].append(current_command["name"])
            pass
        elif current_command_split[0] in command_struct:
            # print(command_struct)
            command_struct[current_command_split[0]].append(current_command["name"])
        else:
            command_struct[current_command_split[0]] = [ current_command["name"] ]

#######################################################################################################################
# D. Create pages.
print(command_struct)

file_weight = 11
root_page_weight = 2
for family in command_struct:
    index_page_title = family
    file_path = "{0}/{1}/_index.md".format(docs_dir, family)
    page_weight = file_weight
    if family == "_index":
        # @todo: Need to revisit
        file_path = "{0}/{1}.md".format(docs_dir, family)
        index_page_title = "Command reference"
        page_weight = root_page_weight
        print(file_path)
    else:
        print(file_path)
        os.makedirs("{0}/{1}".format(docs_dir, family))

    with open(file_path, 'w') as file: 
        file_front_matter="""---
title: "<code>{0}</code>"
weight: {1}
---
""".format(index_page_title, str(page_weight))
        file.write(file_front_matter) 
    
    file_weight += 1

    win_family_weight=0

    # Loop through commands of a category/family:
    for current_command in command_struct[family]:
        
        if family == "_index":
            # skip these for now
            pass
        else:
            current_commind_file_path = "{0}/{1}/{2}.md".format(docs_dir, family, "-".join(current_command.split(":")))

            print(current_commind_file_path)
            help_command = "{0} {1} -h --format=md".format("upsun", current_command)
            # result = subprocess.run(help_command, shell = True, executable="/bin/bash")
            result = subprocess.run( [ "upsun", current_command, "-h", "--format=md" ], stdout=subprocess.PIPE, stderr=subprocess.PIPE )
            contents = result.stdout.decode()
            if len(contents) > 0:
                print(current_command)
                # contents = contents.split("------------")[1]
            # print(result.stdout.decode())
                with open(current_commind_file_path, 'w') as file: 
                    file_contents="""---
title: "<code>{0}</code>"
type: docs
---

{{{{< callout >}}}}
  This documentation describes the Upsun CLI as of **[version 5.0.21](https://github.com/platformsh/cli/releases/tag/5.0.21)**.
  
  Check your version (`upsun -V`) and [upgrade](/cli/#upgrade-the-cli) if necessary.
{{{{< /callout >}}}}

{1}
""".format(current_command, contents)
                    file.write(file_contents) 
                    # file_weight += 1

        # help_command = "{0} {1} -h --format=md".format(command[0], current_command)
        # result = subprocess.run(list_commands, shell = True, executable="/bin/bash")