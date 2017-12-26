Ansible Role for PostgreSQL
===========================

|Build Status| |GitHub issues| |GitHub license|

A role for deploying and configuring
`PostgreSQL <http://www.postgresql.org/>`__ and extensions on unix hosts
using `Ansible <http://www.ansibleworks.com/>`__ It can additionally be
used as a playbook for quickly provisioning hosts. Vagrant machines are
provided to produce a boxed install of PostgreSQL or a VM for
integration testing.

Supports
--------

Supported PostgreSQL versions:

-  PostgreSQL 9.6
-  PostgreSQL 9.5
-  PostgreSQL 9.4
-  PostgreSQL 9.3

Supported targets: - Ubuntu 14.04 LTS "Trusty Tahr" - Ubuntu 12.04 LTS
"Precise Pangolin" - Debian (untested) - RedHat (untested)

Requirements
------------

-  Linux
-  none
-  OSX
-  `Homebrew <http://brew.sh/>`__ must be installed.

Role Variables
--------------

The default role variables in ``defaults/main.yml`` are:

.. code-block:: yaml

    # PostgreSQL
    postgresql_version: 9.4
    postgresql_listen_addresses:
      - '*'

    postgresql_databases:
      - name: 'test_data'
        port: 5432

    postgresql_users:
      - db: 'name_database'
        name: 'user'
        password: 'P@ssw0rd'
        priv: ALL
        role_attr_flags: SUPERUSER


Enabled Postgis

.. code-block:: bash

    postgresql_postgis: yes

Dependencies
------------

none

Example Playbook
----------------

See the `examples <./examples/>`__ directory.

To run this playbook with default settings, create a basic playbook like
this:

.. code-block:: yaml

    - hosts: servers
      roles:
         - postgresql

To install a specific version:

.. code-block:: yaml

    - hosts: servers
      roles:
         - { role: hadenlabs.postgresql }

Changelog
---------

Please see `CHANGELOG <CHANGELOG.rst>`__ for more information what has
changed recently.

Contributing
------------

Please see `CONTRIBUTING <CONTRIBUTING.rst>`__ for details.

Credits
-------

-  `Luis Mayta <https://github.com/luismayta>`__
-  `All Contributors <contributors>`__

.. |Build Status| image:: https://travis-ci.org/hadenlabs/ansible-role-postgresql.svg
   :target: https://travis-ci.org/hadenlabs/ansible-role-postgresql
.. |GitHub issues| image:: https://img.shields.io/hadenlabs/issues/hadenlabs/ansible-role-postgresql.svg
   :target: https://github.com/hadenlabs/ansible-role-postgresql/issues
.. |GitHub license| image:: https://img.shields.io/github/license/mashape/apistatus.svg?style=flat-square
   :target: LICENSE
