# -*- coding: utf-8 -*-
import os

import pytest
import testinfra.utils.ansible_runner
from hamcrest import assert_that, equal_to

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ["MOLECULE_INVENTORY_FILE"]
).get_hosts("all")


def test_hosts_file(host):
    exe = host.file("/etc/hosts")
    assert_that(exe.exists, equal_to(True))
    assert_that(exe.user, equal_to("root"))
    assert_that(exe.group, equal_to("root"))


@pytest.mark.parametrize("name", [("python"), ("curl"), ("git"), ("gcc")])
def test_build_dependencies(host, name):
    pkg = host.package(name)
    assert_that(pkg.is_installed, equal_to(True))
