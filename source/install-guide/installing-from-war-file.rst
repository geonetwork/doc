.. _installing-from-war-file:

Installing from WAR file
########################

This section describes how to install |project_name| with the WAR.

At the end of the installation process you will end up with the web applications running.

Host ports requirements:

* Java web server `Apache Tomcat <http://tomcat.apache.org/>`_ or `Jetty <https://www.eclipse.org/jetty/>`_: 8080
* `ElasticSearch <https://www.elastic.co/elasticsearch/>`_: 9200
* `Kibana <https://www.elastic.co/kibana/>`_: 5601
* Database eg. 5432 for a default `PostgreSQL <https://www.postgresql.org/>`_ installation

1. Download the WAR file

   GeoNetwork releases are available in https://sourceforge.net/projects/geonetwork/files/GeoNetwork_opensource/

   You can download the WAR file ``geonetwork.war`` from your browser or use command line like

   .. code-block:: shell

      wget https://downloads.sourceforge.net/project/geonetwork/GeoNetwork_opensource/v3.10.2/geonetwork.war

2. Copy the WAR to the Java web server

   After download, copy the WAR file in the webapp folder of Tomcat or Jetty.

   .. code-block:: shell

     cp geonetwork.war /usr/share/apache-tomcat{X}/webapps/.

3. Start the Java web server

   If started, Tomcat will automatically deploy the application. If not, start the Java web server to deploy.


   .. note:: You need to ensure Tomcat is configured with enough memory for |project_name| to launch. This can be be configured via the ``setenv`` script in tomcat with the appropriate memory for the JAVA_OPTS property). ``-Xms2g -Xmx2g`` is usually fine.

4. Configure the search platform

   Open http://localhost:8080/geonetwork in your web browser. You should see the |project_name| home page indicating that the search is not yet available.

   ..  figure:: img/es-down.png

   You need to install Elasticsearch or to configure |project_name| to use an existing instance.

   Download Elasticsearch for your platform https://www.elastic.co/downloads/elasticsearch

   .. code-block:: shell

     wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.6.2-linux-x86_64.tar.gz
     tar xvfz elasticsearch-7.6.2-linux-x86_64.tar.gz
     cd elasticsearch-7.6.2-linux-x86_64/bin
     ./elasticsearch

   Open http://localhost:9200 in your web browser to check that Elasticsearch is running.

   To use an existing instance check `Configure connection` in :ref:`installing-index`.

5. Up and running?

   Open or refresh http://localhost:8080/geonetwork in your web browser. You should see the |project_name| home page:

   ..  figure:: img/es-empty.png

   You have now a default |project_name| up and running.

   To customize your catalog, you may follow the next steps to configure the database (See :ref:`configuring-database`) instead of using the default H2 database and the data directory (See :ref:`customizing-data-directory`) .

   See :ref:`loading-samples` to start loading metadata records.
