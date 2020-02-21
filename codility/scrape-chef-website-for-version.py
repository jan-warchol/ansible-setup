# script for getting latest available stable version of chefdk,
# intended to be used as custom ansible module.
# Work in progress.

import requests
from bs4 import BeautifulSoup
import re

# dependencies:
# requests
# bs4
# urllib3==1.23  # as per https://github.com/urllib3/urllib3/issues/1456

page = requests.get("http://downloads.chef.io/chefdk/stable")
soup = BeautifulSoup(page.content, 'html.parser')
with open("pretty.html", "w") as file:
    file.write(soup.prettify().encode('utf-8'))

print(soup.find_all('h1'))
# version_number_re = re.compile(r'\b\d{1-}\.\d{1-}\.\d{1-}\b')
version_number_re = re.compile(r'[0-9]{1,}.[0-9]{1,}.[0-9]{1,}')
versions = [version_number_re.findall(x.get_text()) for x in soup.find_all('h1')]
print (versions)
