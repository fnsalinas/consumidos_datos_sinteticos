
from typing import List, Dict, Tuple, Any
import requests
import json
import time
import random
from datetime import datetime
from glob import glob
import pandas as pd

from common import read_config


class Reader:
    def __init__(self, noclients: int = 1):
        self.config = read_config()
        self.aws_ipv4 = self.config.get('aws_ipv4', '')
        self.url = f"http://{self.aws_ipv4}"
        self.noclients = noclients
        self.request = requests.get(f"{self.url}/get_{self.noclients}_clients")
        self.response = self.request.json()[0]

    def get_data(self):
        return self.response

    def get_data_from_file(self):
        path: str = self.config.get('path', '')
        file_name: str = self.config.get('file_name', '')
        file_extension: str = self.config.get('file_extension', '')
        file_path: str = f"{path}/{file_name}.{file_extension}"
        data = pd.read_csv(file_path)
        return data

    def get_data_from_folder(self):
        path: str = self.config.get('path', '')
        file_extension: str = self.config.get('file_extension', '')
        file_path: str = f"{path}/*.{file_extension}"
        list_of_files: List[str] = glob(file_path)
        data = pd.concat([pd.read_csv(file) for file in list_of_files])
        return data

    def get_data_from_api(self):
        noclients: int = self.config.get('noclients', 1)
        request = requests.get(f"{self.url}/get_{noclients}_clients")
        response = request.json()[0]
        return response

    def get_data_from_api_with_delay(self):
        noclients: int = self.config.get('noclients', 1)
        delay: int = self.config.get('delay', 1)
        request = requests.get(f"{self.url}/get_{noclients}_clients")
        response = request.json()[0]
        time.sleep(delay)
        return response


if __name__ == '__main__':
    # Test the functions
    reader = Reader()
    response: Dict[str, Any] = reader.get_data()
    print(json.dumps(response, indent=4))
