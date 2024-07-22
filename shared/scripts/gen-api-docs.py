import requests
from slugify import slugify

r = requests.get('https://api.upsun.com/docs/openapispec-platformsh.json')
data = r.json()

for category in data["x-tagGroups"]:
    print(category["name"], slugify(category["name"]))
    for tag in category["tags"]:
        print("     - {0} ({1})".format(tag, slugify(tag)))

with open("test.md", 'w') as file: 
    file_contents=data["info"]["description"]
    file.write(file_contents) 