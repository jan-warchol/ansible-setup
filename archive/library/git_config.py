#!/usr/bin/python

# Copyright: (c) 2019, Jan Warchoł <jan.warchol@gmail.com>

# TODO: support global config settings (when without repo)
# Usage example:
#
# - name: set git user email
#   git_config:
#     key: user.email
#     value: me@example.com

from ansible.module_utils.basic import AnsibleModule
import subprocess

def run_module():
    # define available arguments/parameters a user can pass to the module
    module_args = dict(
        key=dict(type='str', required=True),
        value=dict(type='str', required=True),
        repo=dict(type='str', required=True)
    )
    module = AnsibleModule(
        argument_spec=module_args,
        supports_check_mode=True
    )

    result = dict()
    attr_name = module.params.get("key")
    new = module.params.get("value")
    repo_path = module.params.get("repo")
    try:
        current = subprocess.check_output(
            ["git", "config", "--get", attr_name],
            cwd=repo_path
        ).rstrip()
    except subprocess.CalledProcessError:
        current = ""

    if current == new:
        result["changed"] = False
        result["message"] = attr_name + " already equals " + current
    else:
        result["changed"] = True
        result["message"] = attr_name + " set to " + new
        if not module.check_mode:
            subprocess.call(["git", "config", attr_name, new], cwd=repo_path)

    module.exit_json(**result)


if __name__ == '__main__':
    run_module()
