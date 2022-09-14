import docker
import pytest
import sys

testinfra_hosts = ['docker://ubi_httpd_verify']

@pytest.fixture(scope="module", autouse=True)
def container(client, image):
    container = client.containers.run(
        image.id,
        name="ubi_httpd_verify",
        detach=True,
        tty=True,
        command="sh"
    )
    yield container
    container.remove(force=True)

#
def test_httpd_package_installed(host):
    assert host.package("httpd").is_installed    
#    
def test_httpd_check_executable(host):
    assert host.exists("httpd")
#

# need more work
#def test_httpd_service(host):
#    httpd = host.service("httpd")
#    assert httpd.is_running
#    assert httpd.is_enabled