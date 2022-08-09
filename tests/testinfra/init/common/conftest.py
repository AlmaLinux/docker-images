import docker
import pytest
import os

@pytest.fixture(scope="session")
def client():
    return docker.from_env()

@pytest.fixture(scope="session")
def image(client):
     img, _ = client.images.build(path='./tests/testinfra/init/common',buildargs={'SYS_INIT': os.environ['SYS_INIT']})
     return img
