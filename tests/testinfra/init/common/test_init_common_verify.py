import docker
import pytest
import sys

testinfra_hosts = ['docker://init_common_container']

@pytest.fixture(scope="module", autouse=True)
def container(client, image):
    container = client.containers.run(
        image.id,
        name="init_common_container",
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
    assert host.exists("rpm")
#
def test_dnf_executable(host):
    assert host.exists("dnf")    
#
def test_node_executable(host):
    assert host.exists("node")
#
def test_npm_executable(host):
    assert host.exists("npm")
#
def test_python3_executable(host):
    assert host.exists("python3")

# Need Module fix AlmaLinux support
def test_podman_package_installed(host):
    assert host.package("podman").is_installed  

def test_podmandocker_package_installed(host):
    assert host.package("podman-docker").is_installed  

def test_nginx_package_installed(host):
    assert host.package("nginx").is_installed    

def test_nginx_package_installed(host):
    assert host.package("nodejs").is_installed     

def test_nginx_package_installed(host):
    assert host.package("procps-ng").is_installed 

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