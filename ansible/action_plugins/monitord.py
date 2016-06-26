try:
    from ansible.plugins.action.normal import ActionModule
except ImportError:
    from ansible.runner.action_plugins.normal import ActionModule
