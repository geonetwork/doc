.. _configuring-database:


Configuring the database
########################

Introduction
------------

GeoNetwork uses a database to persist aspects such as metadata records, privileges and configurations.
The database default structure is created by the application on initial startup. Subsequent releases of GeoNetwork 
will update the database structure automatically. For this reason the database user initially needs create privileges on the database. 
A number of database dialects are supported; :command:`PostGreSQL`, :command:`Oracle`, :command:`SQL Server`, :command:`H2`.
This section describes various options to configure the database connection.

H2 database
-----------

By default, an `H2 <http://www.h2database.com/html/main.html>`_ database is configured
and created when the application first starts. The H2 database file named ``gn.h2.db``
is created:

* when using the installer, in the ``jetty`` folder
* when deploying a WAR on Tomcat, in the ``bin`` folder of Tomcat

Configuring a database via config files
---------------------------------------

The database dialect to use is configured in :file:`/WEB-INF/config-node/srv.xml`. Comment H2 and uncomment the dialect to use. 
A jdbc driver is included for PostGreSQL and H2. Other dialects require a jdbc driver to be installed.
Download the jdbc library for the dialect and place it in ``/WEB-INF/lib`` or in the tomcat lib folder.

To update the connection details, update the |jdbc.properties| file with relevant connection information.

GeoNetwork assumes data is stored in the default schema for a user. If this is not the case, you need to activate a setting ``hibernate.default_schema`` in :file:`/WEB-INF/config-spring-geonetwork.xml`. 
There are some scripts that run directly on the database at initialisation and can't use the ``hibernate.default-schema`` parameter. For these scripts you need to set the default-schema manually. 
In PostGreSQL this is possible by appending ``?currentSchema=example`` to the database connection. 


Configuring a database via JNDI
-------------------------------

The Java Naming and Directory Interface (JNDI) is a technology which allows to configure the database in tomcat and reference the JNDI connection by name.
To activate JNDI, you need to activate the JNDI database type in :file:`/WEB-INF/config-node/srv.xml`.

Configure a JNDI connection in Tomcat by adding a new resource to :file:`TOMCAT/conf/context.xml`

.. code-block:: xml

 <Resource name="geonetwork"
      type="javax.sql.DataSource"
      driverClassName="org.postgresql.Driver"
      url="jdbc:postgresql://localhost:5432/geonetwork"
      username="xxxxx" password="xxxxxx"
      maxActive="20"
    />

Configuring a database via environment
--------------------------------------

Setting configuration properties via environment variables is common in container environments such as Docker.
2 options exist.

- Add the parameters directly to the Java environment by substituting JAVA_OPTS

.. code-block:: text

  docker run --rm --name gn -p 8080:8080 -e JAVA_OPTS=" 
    -Dgeonetwork.db.type=postgres 
    -Djdbc.database=example 
    -Djdbc.database=example
    -Djdbc.username=example
    -Djdbc.password=xxx
    -Djdbc.host=localhost
    -Djdbc.port=5432" geonetwork:latest
 
Many of the GeoNetwork configuration parameters contain a dot, which is a challenge for substitution via environment variables. 
Docker is an exception here, it provides a mechanism to allow dots in environment parameters.

- Set an exact environment variable including '.' from docker run (or compose).

.. code-block:: text

  docker run --rm --name gn -p 8080:8080
    -e geonetwork.db.type=postgres 
    -e jdbc.database=example 
    -e jdbc.database=example
    -e jdbc.username=example
    -e jdbc.password=xxx
    -e jdbc.host=localhost
    -e jdbc.port=5432 geonetwork:latest

Database logging
----------------

To have more details about database connections and queries, the log can be switched to DEBUG level
in :file:`web/src/main/webapp/WEB-INF/classes/log4j.xml` (or see :ref:`system-config-server` > Log level).


.. code-block:: xml

    <logger name="org.hibernate.SQL" additivity="false">
        <level value="DEBUG" />
        <appender-ref ref="consoleAppender" />
        <appender-ref ref="fileAppender" />
    </logger>
    <logger name="org.hibernate.type" additivity="false">
        <level value="DEBUG" />
        <appender-ref ref="consoleAppender" />
        <appender-ref ref="fileAppender" />
    </logger>
    <logger name="org.hibernate.tool.hbm2ddl" additivity="false">
        <level value="DEBUG" />
        <appender-ref ref="consoleAppender" />
        <appender-ref ref="fileAppender" />
    </logger>

Summary
-------

There are various ways to configure a database in GeoNetwork. JNDI is favourable, because when updating to a new version, or changing a database, you don't need to touch any application files.
