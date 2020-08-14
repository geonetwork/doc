.. _tuto-introduction-deployment-deploy:

Deployment using a war file
###########################

To deploy **|project_name|** you just have to place the war file provided or generated on the last optional step on a proper Java container like Tomcat.

To install Tomcat on a debian-based operative system, you can use the apt-get tool like:

  ::

  $ sudo apt-get install tomcat7

Once you have Tomcat installed on your system, locate the webapps folder and place the geonetwork.war file there. This will deploy GeoNetwork on your system.

.. note:: You need to ensure Tomcat is configured with enough memory for |project_name| to launch. This can be be configured via the ``setenv`` script in tomcat with the appropriate memory for the JAVA_OPTS property)

Another recommended step on deployment is changing the data directory. The data directory is where |project_name| stores all the data files like thumbnails or uploaded documents attached to metadata records. You can start with an empty |project_name| directory, it will be automatically populated.

The easiest way to setup the data directory is to update the file **config-spring-geonetwork.xml** available inside the core project:

  ::

  <bean id="GeonetworkDataDirectory" class="org.fao.geonet.kernel.GeonetworkDataDirectory" lazy-init="true">
  <property name="systemDataDir" ref="GNSystemDataDir"/>
  </bean>
  <bean id="GNSystemDataDir" class="java.nio.file.Paths" factory-method="get">
  <constructor-arg index="0" value="/path/to/gn/dir"/>
  <constructor-arg index="1"><array /></constructor-arg>
  </bean>

See more on :ref:`customizing-data-directory`.

You can make sure |project_name| is deployed on the following url: http://localhost:8080/geonetwork

