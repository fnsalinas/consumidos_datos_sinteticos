
import socket
from typing import List, Dict, Tuple, Any
import json


def get_machine_hostname() -> str:
    """Returns the hostname of the machine.
    Returns:
        str: Hostname of the machine.
    """
    return socket.gethostname()


def read_config(config_path: str = "../../data/config/config_app.json") -> Dict[str, Any]:
    """Reads the config file and returns a dictionary with the config parameters.
    Args:
        config_file (str): Path to the config file.
    Returns:
        Dict[str, Any]: Dictionary with the configuration parameters.
    """
    with open(config_path, 'r') as f:
        config = json.load(f)
    return config.get(get_machine_hostname(), {})


if __name__ == '__main__':
    # Test the functions
    config_path: str = "../../data/config/config_app.json"
    config = read_config(config_path)
    print(json.dumps(config, indent=4))
    print(get_machine_hostname())
