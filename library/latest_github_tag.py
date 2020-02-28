#!/usr/bin/python
# coding: utf-8

# Copyright: (c) 2020, Jan Warchoł <jan.warchol@gmail.com>

# Usage example:
#
# - latest_github_tag:
#     repo: github.com/someone/someproject
#   register: someproject
#
# - debug: var=someproject.latest_version

from ansible.module_utils.basic import AnsibleModule
from distutils.version import StrictVersion
import requests
import re
from pprint import pprint

def build_url(repo_addr):
    GITHUB_API_URL = 'https://api.github.com/repos/'
    namespace, project = repo_addr.replace(':', '/').split('/')[-2:]
    endpoint = namespace + '/' + project.replace('.git', '') + '/tags'
    return GITHUB_API_URL + endpoint


def tags_to_versions(tag_list):
    versions = [tag.replace('v', '') for tag in tag_list]
    # StrictVersion doesn't support some special cases like "3.0.0-rc.2"
    simple_version_number = re.compile(r'^([0-9]+\.)+[0-9]+$')
    return [v for v in versions if simple_version_number.match(v)]


def run_module():
    # define available arguments/parameters a user can pass to the module
    module_args = dict(
        repo=dict(type='str', required=True)
    )
    module = AnsibleModule(
        argument_spec=module_args,
    )
    repo_url = module.params.get("repo")

    data = requests.get(build_url(repo_url))
    tags = [elem['name'] for elem in data.json()]
    versions = tags_to_versions(tags)
    versions.sort(key=StrictVersion)

    result = {
        'changed': False,
        'all_versions': versions,
        'latest_version': versions[-1],
    }

    module.exit_json(**result)


if __name__ == '__main__':
    run_module()
