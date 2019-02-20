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

To make generate backup:

.. code-block:: yaml

    postgresql_backups:
      - name: "{{ postgresql_database_name }}"
        user: "{{ postgresql_user }}"
        pass: "{{ postgresql_pass }}"
        host: "127.0.0.1"
        bucket: "{{ aws_bucket_backup }}"
        bucket_path: "{{ application_stage }}"
        user_system: "{{ user }}"

.. code-block:: yaml

    - hosts: servers
      roles:
        - role: hadenlabs.postgresql
           backup_only: yes

Support
-------

If you want to support this project, i only accept ``IOTA`` :p.

.. code-block:: bash

    Address: FTDCZELEMOQGL9MBWFZENJLFIZUBGMXLFVPRB9HTWYDYPTFKASJCEGJMSAXUWDQC9SJUDMZVIQKACQEEYPEUYLAMMD


Team
----

+---------------+
| |Luis Mayta|  |
+---------------+
| `luis mayta`_ |
+---------------+

License
-------

MIT

Changelog
---------

Please see `CHANGELOG`_ for more information what
has changed recently.

Contributing
------------

Contributions are welcome!

Review the `CONTRIBUTING`_ for details on how to:

* Submit issues
* Submit pull requests

Contact Info
------------

Feel free to contact me to discuss any issues, questions, or comments.

* `Email`_
* `Twitter`_
* `GitHub`_
* `LinkedIn`_
* `Website`_
* `PGP`_

|linkedin| |beacon| |made|

Made with :coffee: and :pizza: by `luis mayta`_ and `hadenlabs`_.

.. Links
.. _`changelog`: CHANGELOG.rst
.. _`contributors`: AUTHORS
.. _`contributing`: CONTRIBUTING.rst

.. _`hadenlabs`: https://github.com/hadenlabs
.. _`luis mayta`: https://github.com/luismayta

.. _`Github`: https://github.com/luismayta
.. _`Linkedin`: https://www.linkedin.com/in/luismayta
.. _`Email`: slovacus@gmail.com
    :target: mailto:slovacus@gmail.com
.. _`Twitter`: https://twitter.com/slovacus
.. _`Website`: http://luismayta.github.io
.. _`PGP`: https://keybase.io/luismayta/pgp_keys.asc

.. |Build Status| image:: https://travis-ci.org/hadenlabs/ansible-role-postgresql.svg
   :target: https://travis-ci.org/hadenlabs/ansible-role-postgresql
.. |GitHub issues| image:: https://img.shields.io/github/issues/hadenlabs/ansible-role-postgresql.svg
   :target: https://github.com/hadenlabs/ansible-role-postgresql/issues
.. |GitHub license| image:: https://img.shields.io/github/license/mashape/apistatus.svg?style=flat-square
   :target: LICENSE

.. Team:
.. |Luis Mayta| image:: https://github.com/luismayta.png?size=100
   :target: https://github.com/luismayta

.. Badges for images hub docker
.. |MicroBadger| image:: https://images.microbadger.com/badges/image/hadenlabs/python.svg
   :target: http://microbadger.com/images/hadenlabs/python
.. |Docker Stars| image:: https://img.shields.io/docker/stars/hadenlabs/python.svg?style=flat-square
   :target: https://hub.docker.com/r/hadenlabs/python
.. |Docker Pulls| image:: https://img.shields.io/docker/pulls/hadenlabs/python.svg?style=flat-square
   :target: https://hub.docker.com/r/hadenlabs/python

.. Footer:
.. |linkedin| image:: http://www.linkedin.com/img/webpromo/btn_liprofile_blue_80x15.png
   :target: http://pe.linkedin.com/in/luismayta
.. |beacon| image:: https://ga-beacon.appspot.com/UA-65019326-1/github.com/hadenlabs/ansible-role-postgresql/readme
   :target: https://github.com/hadenlabs/ansible-role-postgresql
.. |made| image:: https://img.shields.io/badge/Made%20with-Zsh-1f425f.svg
   :target: http://www.zsh.org

.. Dependences:

.. _Python 3.6.4: https://www.python.org/downloads/release/python-364
.. _Docker: https://www.docker.com/
.. _Docker Compose: https://docs.docker.com/compose/
