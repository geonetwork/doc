.. _authentication-mode:


Authentication mode
###################

By default the catalog uses the internal database for user management and authentication.
However there are some other authentication mechanisms available:

.. _authentication-ldap:

Configuring LDAP
----------------

To enable LDAP, setup authentication by including ``WEB-INF/config-security/config-security-ldap.xml``
in ``WEB-INF/config-security/config-security.xml``, uncommenting the following line:

.. code-block:: xml

    <import resource="config-security-ldap.xml"/>

The LDAP configuration is defined in ``WEB-INF/config-security/config-security.properties``, you can then configure
your environment updating the previous file or overriding the properties in the file
``WEB-INF/config-security/config-security-overrides.properties``.

1. Define the LDAP connection:

    - ``ldap.base.provider.url``: This tells the portal where the LDAP server is located. Make sure that the computer with the catalog can hit the computer with the LDAP server. Check to make sure that the appropriate ports are opened, etc.

    - ``ldap.base.dn``: this will usually look something like: “dc=organizationnamehere,dc=org”

    - ``ldap.security.principal`` & ``ldap.security.credentials``: Define LDAP administrator user to use to bind to LDAP. If not define, an anonymous bind is made. Principal is the username and credentials property the password.

    .. code-block:: text

        # LDAP security properties
        ldap.base.provider.url=ldap://localhost:389
        ldap.base.dn=dc=fao,dc=org
        ldap.security.principal=cn=admin,dc=fao,dc=org
        ldap.security.credentials=ldap


    To verify that you have the correct settings, try to connect to the LDAP server using an LDAP browser application.

2. Define where to find users in LDAP structure for authentication:

    - ``ldap.base.search.base``: this is where the catalog will look for users for authentication.

    - ``ldap.base.dn.pattern``: this is the distinguished name for the user to bind with. {0} is replaced by the user name typed in the sign in screen.

    .. code-block:: text

        ldap.base.search.base=ou=people
        ldap.base.dn.pattern=uid={0},${ldap.base.search.base}
        #ldap.base.dn.pattern=mail={0},${ldap.base.search.base}


Authorization Settings
======================

When using LDAP, the user information and privileges for GeoNetwork could be defined from the LDAP attributes.

User information
````````````````

The user information could be retrieved from the LDAP configuring for each user attribute in the catalog database which LDAP attributes match.
If the attribute is empty or not defined, a default value could be defined. The property value is compose by two parts separated by ``,`` character.
The first part is the attribute name and the second part is the default value in case the attribute name is not define or the attribute value in LDAP is empty.

The configuration is the following:

.. code-block:: text

    # Map user information to LDAP attributes and default values
    # ldapUserContextMapper.mapping[name]=ldap_attribute,default_value
    ldapUserContextMapper.mapping[name]=cn,
    ldapUserContextMapper.mapping[surname]=givenName,
    ldapUserContextMapper.mapping[mail]=mail,data@myorganization.org
    ldapUserContextMapper.mapping[organisation]=,myorganization
    ldapUserContextMapper.mapping[kind]=,
    ldapUserContextMapper.mapping[address]=,
    ldapUserContextMapper.mapping[zip]=,
    ldapUserContextMapper.mapping[state]=,
    ldapUserContextMapper.mapping[city]=,
    ldapUserContextMapper.mapping[country]=,

Privileges configuration
````````````````````````
User groups and user profiles could be set optionally from LDAP information or not. By default user privileges are managed from the local database.
If LDAP information should be used to define user privileges, set the ``ldap.privilege.import`` property ``true``:

.. code-block:: text

    ldap.privilege.import=true

When importing privileges from LDAP, the catalog administrator could decide to create groups defined in the LDAP and not defined in local database. For this set the following property to true:

.. code-block:: text

    ldap.privilege.create.nonexisting.groups=false

In order to define which groups the user is member of and which profile is the user:

.. code-block:: text

    ldapUserContextMapper.mapping[privilege]=groups,sample
    # If not set, the default profile is RegisteredUser
    # Valid profiles are http://geonetwork-opensource.org/manuals/trunk/eng/developer/apidocs/geonetwork/org/fao/geonet/constants/Geonet.Profile.html
    ldapUserContextMapper.mapping[profile]=privileges,RegisteredUser

Attributes configuration:

    - privilege attribute contains the group this user is member of. More than one group is allowed.
    - profile attribute contains the profile of the user.

User valid profiles are:

    - Administrator
    - UserAdmin
    - Reviewer
    - Editor
    - RegisteredUser
    - Guest

If LDAP attribute containing profiles does not match the catalog profile list, a mapping could be defined:

.. code-block:: text

    # Map LDAP custom profiles to catalog profiles. Not used if ldap.privilege.pattern is defined.
    ldapUserContextMapper.profilMapping[Admin]=Administrator
    ldapUserContextMapper.profilMapping[Editeur]=Reviewer
    ldapUserContextMapper.profilMapping[Public]=RegisteredUser

For example, in the previous configuration, the attribute value ``Admin`` will be mapped to ``Administrator`` (which is a valid profile for the catalog).

An attribute could define both the profile and the group for a user. To extract this information, a custom pattern could be defined to populate user privileges according to that attribute:

1. Define one attribute for the profile and one for groups in ``WEB-INF/config-security/config-security-overrides.properties``

.. code-block:: text

    # In config-security-overrides.properties
    ldapUserContextMapper.mapping[privilege]=cat_privileges,sample


2. Define one attribute for the privilege and define a custom pattern:

.. code-block:: text

    # In config-security.properties
    ldap.privilege.pattern=CAT_(.*)_(.*)
    ldap.privilege.pattern.idx.group=1
    ldap.privilege.pattern.idx.profil=2

Enable the bean `ldapUserContextMapper` for  `LDAPUserDetailsContextMapperWithPattern`` in ``WEB-INF/config-security/config-security-ldap.xml``).

.. code-block:: xml

    <!--<bean id="ldapUserContextMapper"
        class="org.fao.geonet.kernel.security.ldap.LDAPUserDetailsContextMapper">
        <property name="mapping">
          <map/>
        </property>
        <property name="profileMapping">
          <map/>
        </property>
        <property name="ldapBaseDn" value="${ldap.base.dn}"/>
        <property name="importPrivilegesFromLdap" value="${ldap.privilege.import}"/>
        <property name="createNonExistingLdapGroup"
                  value="${ldap.privilege.create.nonexisting.groups}"/>
        <property name="createNonExistingLdapUser" value="${ldap.privilege.create.nonexisting.users}"/>
        <property name="ldapManager" ref="ldapUserDetailsService"/>
        <property name="contextSource" ref="contextSource"/>
        <property name="ldapUsernameCaseInsensitive" value="${ldap.usernameCaseInsensitive:#{true}}"/>
    </bean>-->

    <bean id="ldapUserContextMapper" class="org.fao.geonet.kernel.security.ldap.LDAPUserDetailsContextMapperWithPattern">
      <property name="mapping">
          <map/>
      </property>
      <property name="profileMapping">
          <map/>
      </property>
      <property name="importPrivilegesFromLdap" value="${ldap.privilege.import}"/>
      <property name="createNonExistingLdapGroup" value="${ldap.privilege.create.nonexisting.groups}" />
      <property name="createNonExistingLdapUser" value="${ldap.privilege.create.nonexisting.users}" />

      <property name="ldapManager" ref="ldapUserDetailsService" />

      <property name="privilegePattern" value="${ldap.privilege.pattern}" />
      <property name="groupIndexInPattern" value="${ldap.privilege.pattern.idx.group}"/>
      <property name="profilIndexInPattern" value="${ldap.privilege.pattern.idx.profil}"/>

      <property name="contextSource" ref="contextSource" />
  </bean>

3. Define custom location for extracting group and role (no support for group/role combination) (use LDAPUserDetailsContextMapperWithProfileSearch in config-security.xml).

.. code-block:: text

    ldap.privilege.search.group.attribute=cn
    ldap.privilege.search.group.object=ou=groups
    #ldap.privilege.search.group.query=(&(objectClass=*)(memberUid=uid={0},${ldap.base.search.base},${ldap.base.dn})(cn=EL_*))
    ldap.privilege.search.group.queryprop=memberuid
    ldap.privilege.search.group.query=(&(objectClass=*)(memberUid=uid={0},${ldap.base.search.base},${ldap.base.dn})(|(cn=SP_*)(cn=EL_*)))
    ldap.privilege.search.group.pattern=EL_(.*)
    ldap.privilege.search.privilege.attribute=cn
    ldap.privilege.search.privilege.object=ou=groups
    ldap.privilege.search.privilege.query=(&(objectClass=*)(memberUid=uid={0},${ldap.base.search.base},${ldap.base.dn})(cn=SV_*))
    ldap.privilege.search.privilege.pattern=SV_(.*)



The LDAP attribute can contains the following configuration to define the different type of users, for example:

.. code-block:: text

    cat_privileges=CAT_ALL_Administrator

    -- Define a reviewer for the group GRANULAT
    cat_privileges=CAT_GRANULAT_Reviewer

    -- Define a reviewer for the group GRANULAT and editor for MIMEL
    cat_privileges=CAT_GRANULAT_Reviewer
    cat_privileges=CAT_MIMEL_Editor

    -- Define a reviewer for the group GRANULAT and editor for MIMEL and RegisteredUser for NATURA2000
    cat_privileges=CAT_GRANULAT_Reviewer
    cat_privileges=CAT_MIMEL_Reviewer
    cat_privileges=CAT_NATURA2000_RegisterdUser

    -- Only a registered user for GRANULAT
    cat_privileges=CAT_GRANULAT_RegisteredUser

.. _authentication-cas:


Synchronization
```````````````

A synchronization task is taking care of removing LDAP user which may be deleted. For example:

- T0: a user A sign in the catalog. A local user A is created in the user database

- T1: A is deleted from the LDAP (A could not sign in in the catalog anymore)

- T2: the synchronization task will check that all local LDAP users exist in LDAP:

    - if user is not owner of any records, it will be deleted

    - if user is owner of metadata records, warning message is avaialable on the catalog logging system. record’s owner should be changed to another user before the task could remove the user.

By default the task is runned once every day. Configuration could be changed in the following property:

.. code-block:: text

    # Run LDAP sync every day at 23:30
    ldap.sync.cron=0 30 23 * * ?


The following properties allow advanced configuration of the synchronisation process:

.. code-block:: text

    ldap.sync.user.search.base=${ldap.base.search.base}
    ldap.sync.user.search.filter=(&(objectClass=*)(mail=*@*)(givenName=*))
    ldap.sync.user.search.attribute=uid
    ldap.sync.group.search.base=ou=groups
    ldap.sync.group.search.filter=(&(objectClass=posixGroup)(cn=EL_*))
    ldap.sync.group.search.attribute=cn
    ldap.sync.group.search.pattern=EL_(.*)


Debugging
`````````
If connection fails, try to increase logging for LDAP in ``WEB-INF/classes/log4j.xml``:

.. code-block:: xml

    <logger name="geonetwork.ldap" additivity="false">
        <level value="DEBUG"/>
    </logger>


Or from the Configuration Settings set the ``Log level`` to ``DEV`` temporary:

.. figure:: img/setting-log-level.png



Configuring CAS
---------------

To enable CAS, setup authentication by including ``WEB-INF/config-security/config-security-cas.xml``
in ``WEB-INF/config-security/config-security.xml``, uncommenting the following lines:

.. code-block:: xml

    <import resource="config-security-cas.xml"/>
    <import resource="config-security-cas-ldap.xml"/>

CAS can use either ldap or a database for user management, to use a database uncomment the following lines instead:

.. code-block:: xml

    <import resource="config-security-cas.xml"/>
    <import resource="config-security-cas-database.xml"/>


The CAS configuration is defined in ``WEB-INF/config-security/config-security.properties``, you can then configure
your environment updating the previous file or overriding the properties in the file
``WEB-INF/config-security/config-security-overrides.properties``.

.. code-block:: text

    cas.baseURL=https://localhost:8443/cas
    cas.ticket.validator.url=${cas.baseURL}
    cas.login.url=${cas.baseURL}/login
    cas.logout.url=${cas.baseURL}/logout?url=${geonetwork.https.url}/



.. _authentication-shibboleth:

Configuring Shibboleth
----------------------

The catalog can operate in a SAML secured federation. Shibboleth should be installed
in apache as described `here <https://wiki.shibboleth.net/confluence/display/SHIB2/Installation>`_.
The catalog is accessed via apache. Setup shibboleth authentication by including ``WEB-INF/config-security/config-security-shibboleth.xml``
in ``WEB-INF/config-security/config-security.xml``. You can then configure your environment in ``config-security-shibboleth-overrides.properties``.