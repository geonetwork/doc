.. _installing-from-war-file:

Installing using a WAR file
###########################

If you are running the Java servlet container `Apache Tomcat <http://tomcat.apache.org/>`__, the easiest way to deploy GeoNetwork is to use a Web Application Resource (WAR):

1. Download the desired ``geonetwork.war`` file from `SourceForge <https://sourceforge.net/projects/geonetwork/files/GeoNetwork_opensource/>`__.

2. Copy the WAR file into the ``webapp`` folder of Tomcat.

3. If started, Tomcat will automatically deploy the application. If not, start Tomcat to deploy.

.. note:: You need to ensure Tomcat is configured with enough memory for GeoNetwork to launch. This can be configured via the ``setenv`` script in Tomcat with the appropriate memory for the JAVA_OPTS property.




