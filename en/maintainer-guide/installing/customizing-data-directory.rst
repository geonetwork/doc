.. _customizing-data-directory:

Customizing the data directory
##############################

The data directory is the location on the file system where
the catalog stores much of its custom configuration and uploaded files.
This configuration defines such things as:

* What thesaurus is used by GeoNetwork?
* What schema is plugged in GeoNetwork?

The data directory also contains a number of support files used by the catalog
for various purposes:

* Lucene index
* spatial index
* logos
* uploaded document attached to metadata records
* thumbnails


It is a good idea to define an external data directory when going to
production in order to make future updates easier. The data directory allows
to run the WAR in readonly mode if needed.


Creating a new data directory
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The data directory needs to be created before starting the catalogue.
It must be readable and writable by the user starting the catalogue.


If the data directory is an empty folder, the catalogue will initialize
the directory default structure using ``INSTALL_DIR/web/geonetwork/WEB-INF/data``.


If the data directory is not set, the following message is displayed in the log
when the application starts:

.. code-block:: shell

    2015-12-16 07:59:17,108 WARN  [geonetwork.data.directory] -     - Data directory properties is not set. Use geonetwork.dir or geonetwork.dir properties.
    2015-12-16 07:59:17,108 WARN  [geonetwork.data.directory] -     - Data directory provided could not be used. Using default location: /data/dev/gn/3.0.x/web/src/main/webapp/WEB-INF/data


If the data directory is not accessible for the user, the log displays:

.. code-block:: shell

    2015-12-16 08:09:17,723 WARN  [geonetwork.data.directory] -     - Data directory '/tmp/gndatadir' is not writable. Set read/write privileges to user starting the catalogue (ie. francois).
    2015-12-16 08:09:17,723 WARN  [geonetwork.data.directory] -     - Data directory provided could not be used. Using default location: /data/dev/gn/3.0.x/web/src/main/webapp/WEB-INF/data



Setting the data directory
~~~~~~~~~~~~~~~~~~~~~~~~~~

The data directory variable can be set using:

 - Java environment variable
 - Servlet context parameter
 - System environment variable
 - Bean configuration (added in version 3.0.4)


For java environment variable and servlet context parameter use:

 - <webappName>.dir and if not set using geonetwork.dir


For system environment variable use:

 - <webappName>_dir and if not set using geonetwork_dir

Resolution order is:

 #. <webappname>.dir

  #. Java environment variable (ie. -D<webappname>.dir=/a/data/dir)

  #. Servlet context parameter (ie. web.xml)

  #. Config.xml appHandler parameter (ie. config.xml)

  #. System environment variable (ie. <webappname>_dir=/a/data/dir). "." is not supported in env variables

 #. geonetwork.dir

  #. Java environment variable (ie. -Dgeonetwork.dir=/a/data/dir)

  #. Servlet context parameter (ie. web.xml)

  #. Config.xml appHandler parameter (ie. config.xml)

  #. System environment variable (ie. geonetwork_dir=/a/data/dir). "." is not supported in env variables




Java System Property
~~~~~~~~~~~~~~~~~~~~

Depending on the servlet container used it is also possible to specify
the data directory location with a Java System Property.

For Tomcat, configuration is:

.. code-block:: shell

  CATALINA_OPTS="-Dgeonetwork.dir=/var/lib/geonetwork_data"


Bean configuration
~~~~~~~~~~~~~~~~~~

.. versionadded:: 3.0.4

To configure the data directory using a custom bean configuration, update the
GeonetworkDataDirectory bean in :code:`core/src/main/resources/config-spring-geonetwork.xml`:


.. code-block:: xml

    <bean id="GeonetworkDataDirectory" class="org.fao.geonet.kernel.GeonetworkDataDirectory" lazy-init="true">
      <property name="systemDataDir" ref="GNSystemDataDir"/>
      <property name="schemaPluginsDir" ref="GNSchemaPluginsDir"/>
    </bean>
    <bean id="GNSystemDataDir" class="java.nio.file.Paths" factory-method="get">
       <constructor-arg index="0" value="/path/to/gn/dir"/>
       <constructor-arg index="1"><array /></constructor-arg>
    </bean>
    <bean id="GNSchemaPluginsDir" class="java.nio.file.Paths" factory-method="get">
        <constructor-arg index="0" value="/path/to/schema/dir"/>
        <constructor-arg index="1"><array /></constructor-arg>
    </bean>



Structure of the data directory
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The data directory contains:

.. code-block:: text

 data_directory/
  |--config: Extra configuration (eg. could contain overrides)
  |   |--schemaplugin-uri-catalog.xml
  |   |--codelist: The thesauri in SKOS format
  |   |--schemaPlugins: The directory used to store new metadata standards
  |
  |--data
  |   |--metadata_data: The data related to metadata records
  |   |--resources:
  |   |     |--htmlcache
  |   |     |--images
  |   |     |   |--harvesting
  |   |     |   |--logos
  |   |     |   |--statTmp
  |   |
  |   |--metadata_subversion: The subversion repository
  |   |--backup: Folder containing removed metadata
  |
  |--index: All indexes used for search
  |   |--nonspatial: Lucene index
  |   |--spatialindex.*: ESRI Shapefile for the index (if not using spatial db)




Advanced data directory configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

All sub-directories could be configured separately using java system property.
For example, to put index directory in a custom location use:

 - <webappName>.lucene.dir and if not set using:
 - geonetwork.lucene.dir


Examples:

* Add the following java properties to start-geonetwork.sh script:


.. code-block:: shell

    java -Xms1g -Xmx1g -Xss2M -XX:MaxPermSize=128m -Dgeonetwork.dir=/app/geonetwork_data_dir -Dgeonetwork.lucene.dir=/ssd/geonetwork_lucene_dir



* Add the following system properties to start-geonetwork.sh script:

.. code-block:: shell

    export geonetwork_dir=/app/geonetwork_data_dir
    export geonetwork_lucene_dir=/ssd/geonetwork_lucene_dir


* If no changes are made to thesaurus or schema, it could be relevant to use the version
  from the webapp. In such case, set:


.. code-block:: shell

    -Dgeonetwork.dir=/data/catalogue
    -Dgeonetwork.schema.dir=/app/tomcat/webapps/geonetwork/WEB-INF/data/config/schema_plugins
    -Dgeonetwork.codeList.dir=/app/tomcat/webapps/geonetwork/WEB-INF/data/config/codelist



The list of properties that can be set are:

* geonetwork.dir
* geonetwork.lucene.dir
* geonetwork.spatial.dir
* geonetwork.config.dir
* geonetwork.codeList.dir
* geonetwork.schema.dir
* geonetwork.data.dir
* geonetwork.resources.dir
* geonetwork.svn.dir
* geonetwork.upload.dir
* geonetwork.backup.dir
* geonetwork.formatter.dir
* geonetwork.htmlcache.dir


Check the configuration
~~~~~~~~~~~~~~~~~~~~~~~

After startup, check the configuration in ``Administration`` > ``System Information`` page.


 .. figure:: img/datadirectory.png
