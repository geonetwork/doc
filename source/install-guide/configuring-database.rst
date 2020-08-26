.. _configuring-database:


Configuring the database
########################

This section describes how to configure the database connection, if required.

By default, an `H2 <http://www.h2database.com/html/main.html>`_ database is configured
and created when the application first starts. The H2 database named ``gn.h2.db``
is created:

* In the ``C:\ProgramData\GeoNetwork\`` directory when using the :ref:`Windows installer <installing-from-the-installer>`;

* In the ``jetty`` folder of the GeoNetwork application folder when using the :ref:`ZIP distribution <installing-from-zip>`;

* In the ``bin`` folder of Tomcat when deploying the :ref:`WAR <installing-from-war-file>` on Tomcat (started using ``startup.sh``).

.. note::
    You don't **need** to configure the database if you are happy with the local H2 database.
    Only change the configuration if you wish to store the data on a remote database.

To modify the database configuration, first check which type of database is used.
Depending on the node (default node name is |default.node|) check the node configuration file
|default.node.config.file|. Choose the database type to use.

Then update the |jdbc.properties| file with connection information.

The database default structure will be created by the application on startup.

To see more details about the database connection and queries, the log can be switched to DEBUG level
in :code:`web/src/main/webapp/WEB-INF/classes/log4j.xml` (or see :ref:`system-config-server` > Log level).


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
