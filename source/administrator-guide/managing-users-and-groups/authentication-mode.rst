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

    - ``ldap.base.dn``: this will usually look something like: "dc=[organizationnamehere],dc=org"

    - ``ldap.security.principal`` / ``ldap.security.credentials``: Define LDAP administrator user to use to bind to LDAP. If not define, an anonymous bind is made. Principal is the username and credentials property the password.

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
If the attribute is empty or not defined, a default value could be defined. The property value is composed by two parts separated by ``,`` character.
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
    ldapUserContextMapper.profileMapping[Admin]=Administrator
    ldapUserContextMapper.profileMapping[Editor]=Reviewer
    ldapUserContextMapper.profileMapping[Public]=RegisteredUser

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
    cat_privileges=CAT_NATURA2000_RegisteredUser

    -- Only a registered user for GRANULAT
    cat_privileges=CAT_GRANULAT_RegisteredUser

.. _authentication-cas:


Synchronization
```````````````

A synchronization task is taking care of removing LDAP users that may be deleted. For example:

- T0: User A signs in to the catalog. A local user A is created in the user database.

- T1: User A is deleted from the LDAP (User A cannot sign in to the catalog anymore).

- T2: The synchronization task will check that all local LDAP users exist in LDAP:

    - If the user does not own any records, it will be deleted.

    - If the user owns metadata records, a warning message will be written to the catalog logging system. The owner of the record should be changed to another user before the task can remove the current owner.

By default the task runs once every day. This can be changed in the following property:

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
If the connection fails, try to increase the logging level for LDAP in ``WEB-INF/classes/log4j.xml``:

.. code-block:: xml

    <logger name="geonetwork.ldap" additivity="false">
        <level value="DEBUG"/>
    </logger>


Or from the Configuration Settings set the ``Log level`` to ``DEV`` temporarily:

.. figure:: img/setting-log-level.png

Configuring LDAP - Hierarchy
============================

A slightly different method for LDAP configuration was introduced in mid-2020.

This extends the original configuration infrastructure (original configurations still work without any changes).

Before you start configuring, you will need to know;

#. URL to your LDAP Server
#. Username/password to login to the LDAP Server (to execute queries)
#. LDAP query to find a user (given what they type in on the login screen)
#. Details of how to convert the LDAP user's attributes to GeoNetwork user attributes
#. LDAP query to find groups a user is a member of
#. How to convert a LDAP group to a GeoNetwork Group/Profile

.. note:: There is a `video developer chat <https://www.youtube.com/watch?v=f8rvbEdnE-g>`_ that goes into details for how to configure LDAP including setting up a pre-configured LDAP server (using Apache Directory Studio) for testing/debugging/learning.

.. note::
   Should I use the Hierarchy or Original configuration?

   If you already have an existing (Original) configuration, there's no need to move to the new one.  Most of the code between the two is the same.

   If you are starting a new configuration, I would recommend the Hierarchy configuration.  It's a little simpler and supported by test cases and test infrastructure.  It also supports LDAPs where users/groups are in multiple directories.

Configuring LDAP Beans (Hierarchy)
``````````````````````````````````

GeoNetwork comes with a sample LDAP configuration that you can use in Apache Directory Studio to create the same LDAP server used in the test cases.  There is also a sample GeoNetwork configuration that connects to this LDAP server.  Please see the `README.md <https://github.com/geonetwork/core-geonetwork/blob/master/core/src/test/resources/org/fao/geonet/kernel/security/ldap/README.md>`_ or the `video developer chat <https://www.youtube.com/watch?v=f8rvbEdnE-g>`_ for instructions.

.. note:: To use this configuration, uncomment the "<import resource="config-security-ldap-recursive.xml"/>" line in `web/src/main/webapp/WEB-INF/config-security/config-security.xml`

1. Configure the `contextSource` bean with a reference to your LDAP server and a user that can execute LDAP queries.

   .. code-block:: xml

    <bean id="contextSource"   class="org.springframework.security.ldap.DefaultSpringSecurityContextSource">
        <constructor-arg value=“ldap://localhost:3333/dc=example,dc=com"/>

        <property name="userDn" value="cn=admin,ou=GIS Department,ou=Corporate Users,dc=example,dc=com"/>
        <property name="password" value="admin1"/>
    </bean>

2. Configure the `ldapUserSearch` bean with the query used to find the user (given what was typed in the login page).

   NOTE: Set `searchSubtree` to `true` to do a recursive search of the LDAP.  Use `searchBase` to control which directory the search starts in ("" means start from the root).

   .. code-block:: xml

    <bean id="ldapUserSearch" class="…">
       <constructor-arg name="searchBase" value=""/>
       <constructor-arg name="searchFilter" value="(sAMAccountName={0})"/>
       <constructor-arg name="contextSource" ref="contextSource"/>

       <property name="searchSubtree" value="true"/>
    </bean>

3. Configure the `ldapUserContextMapper` bean with how to convert the LDAP user's attributes to GeoNetwork user attributes (see the original configuration documentation, above).

   NOTE: The `value` portion has two parts.  The first part is the name of LDAP attribute (can be blank).  The second part is the default value if the LDAP attribute is missing or empty (see the original configuration documentation, above).

   .. code-block:: xml

    <bean id="ldapUserContextMapper" class=“LDAPUserDetailsContextMapperWithProfileSearchEnhanced">

        <property name="mapping">
          <map>
            <entry key="name" value="cn,"/>
            <entry key="surname" value="sn,"/>
            <entry key="mail" value="mail,"/>
            <entry key="organisation" value=","/>
            <entry key="address" value=","/>
            <entry key="zip" value=","/>
            <entry key="state" value=","/>
            <entry key="city" value=","/>
            <entry key="country" value=","/>

            <entry key="profile" value=",RegisteredUser"/>
            <entry key="privilege" value=",none"/>
          </map>
        </property>

    </bean>

4. Continue configuring the `ldapUserContextMapper` bean so the LDAP can also provide group/profile roles for the user.

   NOTE: The `ldapMembershipQuery` is the LDAP directory where the membership query will be start ("" means start at the root of the LDAP).

   .. code-block:: xml

    <bean id="ldapUserContextMapper" class="LDAPUserDetailsContextMapperWithProfileSearchEnhanced">

        <property name="importPrivilegesFromLdap" value=“true"/>

        <!-- typically, don't want GN to modify the LDAP server! -->
        <property name="createNonExistingLdapGroup" value="false" />
        <property name="createNonExistingLdapUser" value="false" />
        <property name="ldapManager" ref="ldapUserDetailsService" />

        <property name="membershipSearchStartObject" value=""/>
        <property name="ldapMembershipQuery" value="(&amp;(objectClass=*)(member=cn={2})(cn=GCAT_*))"/>

    </bean>

5. Continue configuring the `ldapUserContextMapper` bean so the LDAP roles can be converted to GeoNetwork Groups/Profiles.

   NOTE: You can use multiple `ldapRoleConverters`.

   .. code-block:: xml

    <bean id="ldapUserContextMapper" class="LDAPUserDetailsContextMapperWithProfileSearchEnhanced">

       <property name="ldapRoleConverters">
         <util:list>
           <ref bean="ldapRoleConverterGroupNameParser"/>
         </util:list>
       </property>

    </bean>

There are currently two ways to convert an LDAP group to GeoNetwork Groups/Profiles.


* The `LDAPRoleConverterGroupNameParser`, which works the same as the original LDAP configuration.  It uses a regular expression to parse the LDAP group name into a GeoNetwork Group/Profile.  This will convert the LDAP role `GCAT_GENERAL_EDITOR` into the GeoNetwork group `GENERAL` with Profile `Editor.`

  .. code-block:: xml

    <bean id="ldapRoleConverterGroupNameParser"  class="LDAPRoleConverterGroupNameParser">

        <property name="ldapMembershipQueryParser" value="GCAT_(.*)_(.*)"/>
        <property name="groupIndexInPattern" value="1"/>
        <property name="profileIndexInPattern" value=“2"/>

        <property name="profileMapping">
          <map>
            <entry key="ADMIN" value="Administrator"/>
            <entry key="EDITOR" value="Editor"/>
          </map>
        </property>

    </bean>

* There is also a more direct way using `LDAPRoleConverterGroupNameConverter`.  This directly converts the LDAP group name into a list of GeoNetwork Groups/Profiles.

  .. code-block:: xml

    <bean id=“ldapRoleConverterGroupNameParser" class="LDAPRoleConverterGroupNameConverter">

        <property name="convertMap">
          <map>

            <entry>
                <key>
                    <value>HGIS_GeoNetwork_Admin</value>
                </key>
                <list>

                    <bean class="org.fao.geonet.kernel.security.ldap.LDAPRole">
                      <constructor-arg name="groupName" type="java.lang.String" value="myGroup"/>
                      <constructor-arg name="profileName" type="java.lang.String" value="Administrator"/>
                    </bean>

                </list>
            </entry>
            <entry>
              <key>
                    <value>HGIS_GeoNetwork_Editor</value>
              </key>
              <list>

                <bean class="org.fao.geonet.kernel.security.ldap.LDAPRole">
                  <constructor-arg name="groupName" type="java.lang.String" value=“myGroup"/>
                  <constructor-arg name="profileName" type="java.lang.String" value="Editor"/>
                </bean>

              </list>
            </entry>
          </map>
        </property>
    </bean>

Configuring CAS
---------------

To enable CAS, set up authentication by including ``WEB-INF/config-security/config-security-cas.xml``
in ``WEB-INF/config-security/config-security.xml``, uncommenting the following lines:

.. code-block:: xml

    <import resource="config-security-cas.xml"/>
    <import resource="config-security-cas-ldap.xml"/>

CAS can use either LDAP or a database for user management. To use a database uncomment the following lines instead:

.. code-block:: xml

    <import resource="config-security-cas.xml"/>
    <import resource="config-security-cas-database.xml"/>


The CAS configuration is defined in ``WEB-INF/config-security/config-security.properties``.
You can configure your environment by updating the previous file or by defining property overrides in the file
``WEB-INF/config-security/config-security-overrides.properties``:

.. code-block:: text

    cas.baseURL=https://localhost:8443/cas
    cas.ticket.validator.url=${cas.baseURL}
    cas.login.url=${cas.baseURL}/login
    cas.logout.url=${cas.baseURL}/logout?url=${geonetwork.https.url}/


.. _authentication-ecas:

Configuring EU Login
--------------------

EU Login is the central login mechanism of the European Commission. You can enable login
against that central service in case your intended users have ar can acquire a EU Login.

To enable EU Login, set up authentication by including ``WEB-INF/config-security/config-security-ecas.xml``
in ``WEB-INF/config-security/config-security.xml``, uncommenting the following line:

.. code-block:: xml

    <import resource="config-security-ecas.xml"/>

EU-login requires an ecas-plugin provided by the European Union. The ecas plugin is available via
`CITnet <https://citnet.tech.ec.europa.eu/CITnet/nexus>`_ for various java containers, such as Tomcat and JBoss.

For tomcat, add two files to the tomcat lib folder: ecas-tomcat-x.y.z.jar and log4j-x.y.z.jar. Inside the lib folder 
copy two folders from `eulogin-tomcat-x.y.z-config.zip`: `org/apache/catalina/authenticator` and `org/apache/catalina/startup`. 
The mbeans folder contains a file `mbeans-descriptors.xml`. The startup folder contains a file `Authenticators.properties`. Verify 
that the JDK trusts the `ECAS certificates <https://webgate.ec.europa.eu/CITnet/confluence/display/IAM/Downloads-Certificates>`_ 
else import them on the keystore of the JVM.

The EU Login configuration is defined in ``WEB-INF/config-security/config-security.properties``.
You can configure your environment by updating the previous file or by defining property overrides in the file
``WEB-INF/config-security/config-security-overrides.properties``:

.. code-block:: text

    cas.baseURL=https://webgate.ec.europa.eu/cas

Restart the service and check the authentication menchanism.

.. _authentication-shibboleth:

Configuring Shibboleth
----------------------

The catalog can operate in a SAML secured federation. Shibboleth should be installed
in Apache as described `here <https://wiki.shibboleth.net/confluence/display/SHIB2/Installation>`_.
The catalog is accessed via Apache. Setup Shibboleth authentication by including ``WEB-INF/config-security/config-security-shibboleth.xml``
in ``WEB-INF/config-security/config-security.xml``. You can then configure your environment in ``config-security-shibboleth-overrides.properties``.
