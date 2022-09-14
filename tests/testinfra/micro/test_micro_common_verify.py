import docker
import pytest
import sys

testinfra_hosts = ['docker://micro_common_container']

@pytest.fixture(scope="module", autouse=True)
def container(client, image):
    container = client.containers.run(
        image.id,
        name="micro_common_container",
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
def test_cat_executable(host):
    assert host.exists("cat")
#
def test_rpm_executable(host):
    assert host.exists("ls")
#
def test_microdnf_executable(host):
    assert host.exists("ln")
#
