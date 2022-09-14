import docker
import pytest
import sys

testinfra_hosts = ['docker://init_common_container_1']

@pytest.fixture(scope="module", autouse=True)
def container(client, image):
    container = client.containers.run(
        image.id,
        name="init_common_container_1",
        detach=True,
        tty=True,
        command="sh"
    )
    yield container
    container.remove(force=True)

# check output for more formating
def test_host_dump(host):
    print(host.system_info.type)
    print(host.system_info.release)
    print(host.system_info.codename)
    print(host.system_info.arch)
    print(host.system_info.distribution.lower())

# 
# checks specific to init
def test_nginx_package_installed(host):
    assert host.package("procps-ng").is_installed 

