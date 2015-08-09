.. _configuring-database:


Configuring the database
########################

This section describe how to configure the database connection.

By default, an `H2 <http://www.h2database.com/html/main.html>`_ database is configured
and created when the application first start. The H2 database nammed ``geonetwork.h2.db``
is created:

* when using the installer, in the ``jetty`` folder

* when deploying the WAR on Tomcat and using ``startup.sh``, in the ``bin`` folder of Tomcat


To modify the database configuration, first check which type of database is used.
Depending on the node (default node name is |default.node|) check the node configuration file
|default.node.config.file|. Choose the database type to use.

Then update the |jdbc.properties| file with connection information.
