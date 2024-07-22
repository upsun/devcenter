import os
import sys
import json
import glob
import shutil
import subprocess
from os.path import exists

# Vars.
command = sys.argv[1:]
commands_file = "upsun_commands.json"
docs_dir="dev/content/cli/{0}".format(command[0])

# Cleanup.
if exists(commands_file):
    print("File exists. Removing.")
    os.remove(commands_file)
else:
    print("File does not exist. Skipping removal.")

# Get command list.
list_commands = "{0} list --format=json > {1}".format(command[0], commands_file)
subprocess.run(list_commands, shell = True, executable="/bin/bash")
command_struct = {
    "_index": []
}
with open(commands_file) as json_data:
    data = json.load(json_data)
    for current_command in data["commands"]:
        current_command_split = current_command["name"].split(":")
        if len(current_command_split) == 1:
            command_struct["_index"].append(current_command["name"])
        elif current_command_split[0] in command_struct:
            # print(command_struct)
            command_struct[current_command_split[0]].append(current_command["name"])
        else:
            command_struct[current_command_split[0]] = [ current_command["name"] ]

# Create pages.
file_weight = 1
root_page_weight = 2
if not os.path.exists(docs_dir):
    os.makedirs(docs_dir)
else:
    shutil.rmtree(docs_dir) 
    os.makedirs(docs_dir)
for family in command_struct:
    index_page_title = family
    file_path = "{0}/{1}/_index.md".format(docs_dir, family)
    page_weight = file_weight
    if family == "_index":
        file_path = "{0}/{1}.md".format(docs_dir, family)
        index_page_title = "Command reference"
        page_weight = root_page_weight
        print(file_path)
    else:
        print(file_path)
        os.makedirs("{0}/{1}".format(docs_dir, family))
    
    with open(file_path, 'w') as file: 
        file_front_matter="""---
title: {0}
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
            help_command = "{0} {1} -h --format=md".format(command[0], current_command)
            # result = subprocess.run(help_command, shell = True, executable="/bin/bash")
            result = subprocess.run( [ command[0], current_command, "-h", "--format=md" ], stdout=subprocess.PIPE, stderr=subprocess.PIPE )
            contents = result.stdout.decode()
            if len(contents) > 0:
                contents = contents.split("---------------")[1]
            # print(result.stdout.decode())
                with open(current_commind_file_path, 'w') as file: 
                    file_contents="""---
title: {0}
weight: {1}
type: docs
---

{2}
""".format(current_command, "something", contents)
                    file.write(file_contents) 
                    # file_weight += 1

        # help_command = "{0} {1} -h --format=md".format(command[0], current_command)
        # result = subprocess.run(list_commands, shell = True, executable="/bin/bash")