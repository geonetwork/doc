.. _installing-index:

Installing remote index
#######################

If users want to analyze WFS data (See :ref:`analyzing_data`), an
`Elasticsearch <https://www.elastic.co/products/elasticsearch>` instance can be installed next to the catalog.


Manual installation
-------------------

Download Elasticsearch from https://www.elastic.co/downloads/past-releases/elasticsearch-7-4-2
and unzip the file.


.. code-block:: shell
    
    wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.4.2-linux-x86_64.tar.gz
    tar xvfz elasticsearch-7.4.2-linux-x86_64.tar.gz


Manually start Elasticsearch using:

.. code-block:: shell

    elasticsearch-7.4.2/bin/elasticsearch

The elasticsearch startup will block the current terminal. From another terminal create the default index:

.. code-block:: shell

    cd elasticsearch-7.4.2
    curl -X PUT http://localhost:9200/features -H "Content-Type: application/json" -d @config/features.json
    curl -X PUT http://localhost:9200/records -H "Content-Type: application/json" -d @config/records.json
    curl -X PUT http://localhost:9200/searchlogs -H "Content-Type: application/json" -d @config/searchlogs.json


Stop Elasticsearch using

.. code-block:: shell

    elasticsearch-7.4.2/bin/elasticsearch stop



Install using Maven
-------------------

Running from the source code, use Maven to download.

.. code-block:: shell

    cd es
    mvn install -Pes-download
    mvn exec:exec -Des-start
    curl -X PUT http://localhost:9200/features -H "Content-Type: application/json" -d @config/features.json
    curl -X PUT http://localhost:9200/records -H "Content-Type: application/json" -d @config/records.json
    curl -X PUT http://localhost:9200/searchlogs -H "Content-Type: application/json" -d @config/searchlogs.json


To stop Elasticsearch when using Maven, simply stop the process as Elasticsearch is started in
foreground mode.


Check installation
------------------

Access Elasticsearch admin page from http://localhost:9200/.


Configure connection
--------------------

Update Elasticsearch URL in ```WEB-INF/config.properties```, add 'es' to the 'spring.profiles.active' in ```WEB-INF/web.xml``` to activate it and restart the application
(see :code:`web/src/main/webResources/WEB-INF/config.properties`).
