import docker
import pytest
import os

@pytest.fixture(scope="session")
def client():
    return docker.from_env()

@pytest.fixture(scope="session")
def image(client):
     img, _ = client.images.build(path='./tests/testinfra/default/common',buildargs={'SYS_DEFAULT': os.environ['SYS_DEFAULT']})
     return img
