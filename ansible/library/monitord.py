#!/usr/bin/python
import json
def main():
    module = AnsibleModule(argument_spec={
        'url' :{'required':True},
        'user': {'required':True}
    }, supports_check_mode=True )
    # Put your python code here :)
    url = module.params['url']
    user = module.params['user']
    module.exit_json(msg="Hello Zak: url="+url +" user="+ user)

from ansible.module_utils.basic import *
from ansible.constants import mk_boolean
if __name__ == '__main__':
    main()
