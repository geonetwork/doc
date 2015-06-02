.. _authentication-mode:


Authentication mode
###################

By default GeoNetwork uses the internal database for user management and authentication. However there are some other authentication mechanisms available:

Configuring LDAP
----------------

In GeoNetwork you have to setup authentication by including /geonetwork/WEB-INF/config-security/config-security-ldap.xml in /geonetwork/WEB-INF/config-security/config-security.xml. You can then configure your environment in config-security-ldap-overrides.properties.

Configuring CAS
---------------

In GeoNetwork you have to setup CAS authentication by including /geonetwork/WEB-INF/config-security/config-security-cas.xml in /geonetwork/WEB-INF/config-security/config-security.xml. You can then configure your environment in config-security-cas-overrides.properties. CAS can use either ldap or a database for user management.

Configuring Shibboleth
----------------------

GeoNetwork can operate in a SAML secured federation. Shibboleth should be installed in apache as described (here)[https://wiki.shibboleth.net/confluence/display/SHIB2/Installation]. GeoNetwork is accessed via apache. In GeoNetwork you have to setup shibboleth authentication by including /geonetwork/WEB-INF/config-security/config-security-shibboleth.xml in /geonetwork/WEB-INF/config-security/config-security.xml. You can then configure your environment in config-security-shibboleth-overrides.properties.
