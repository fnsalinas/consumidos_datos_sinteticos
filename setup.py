
from setuptools import setup, find_packages

setup(
    name='Synthetic_data_consumer',
    version='1.0',
    description='Program to consume data from the syntethic data generator.',
    author='Fabio Salinas',
    author_email='fabio.salinas1982@gmail.com',
    license='',
    packages=find_packages(
        where='src',
        include=['src', 'src.*']
    ),
    package_dir={
        '':'src'
    },
    zip_safe=False
)
