import docker
import os
import pytest

@pytest.fixture(scope="session")
def client():
    return docker.from_env()

@pytest.fixture(scope="session")
def image(client):
     img, _ = client.images.build(path='./tests/testinfra/micro',buildargs={'SYS_MICRO': os.environ['SYS_MICRO']})
     return img
