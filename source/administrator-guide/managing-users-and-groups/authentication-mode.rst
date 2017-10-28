.. _authentication-mode:


Authentication mode
###################

By default the catalog uses the internal database for user management and authentication.
However there are some other authentication mechanisms available:

.. _authentication-ldap:

Configuring LDAP
----------------

To enable LDAP, setup authentication by including ``WEB-INF/config-security/config-security-ldap.xml``
in ``WEB-INF/config-security/config-security.xml``. You can then configure your environment in ``config-security-ldap-overrides.properties``.


.. _authentication-cas:

Configuring CAS
---------------

To setup CAS authentication, include ``WEB-INF/config-security/config-security-cas.xml`` in
``WEB-INF/config-security/config-security.xml``. You can then configure your environment
in ``config-security-cas-overrides.properties``. CAS can use either ldap or a database for user management.


.. _authentication-shibboleth:

Configuring Shibboleth
----------------------

The catalog can operate in a SAML secured federation. Shibboleth should be installed
in apache as described `here <https://wiki.shibboleth.net/confluence/display/SHIB2/Installation>`_.
The catalog is accessed via apache. Setup shibboleth authentication by including ``WEB-INF/config-security/config-security-shibboleth.xml``
in ``WEB-INF/config-security/config-security.xml``. You can then configure your environment in ``config-security-shibboleth-overrides.properties``.
