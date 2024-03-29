import docker
import pytest
import sys

testinfra_hosts = ['docker://default_common_container-1']

@pytest.fixture(scope="module", autouse=True)
def container(client, image):
    container = client.containers.run(
        image.id,
        name="default_common_container-1",
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

def test_binutils_package_installed(host):
    assert host.package("binutils").is_installed     

def test_passwd_file(host):
    passwd = host.file("/etc/passwd")
    assert passwd.contains("root")
    assert passwd.user == "root"
    assert passwd.group == "root"
    assert passwd.mode == 0o644

def test_passwd_file(host):
    osr = host.file("/etc/os-release")
    assert osr.contains("AlmaLinux")
    assert osr.contains("almalinux.org")
