.. _installing-index:

Installing remote index
#######################

If users want to analyze WFS data (See :ref:`analyzing_data`), an
`Elasticsearch <https://www.elastic.co/products/elasticsearch>` instance can be installed next to the catalog.


Manual installation
-------------------

Download Elasticsearch from https://www.elastic.co/downloads/elasticsearch
and unzip the file.


.. code-block:: shell

    cd es/es-config
    wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.6.0.tar.gz
    tar xvfz elasticsearch-5.6.0.tar.gz


Manually start and stop Elasticsearch using:

.. code-block:: shell

    elasticsearch-5.6.0/bin/elasticsearch


Then create the default index:


.. code-block:: shell

    cd es/es-config
    curl -X PUT http://localhost:9200/features -d @config/features.json
    curl -X PUT http://localhost:9200/records -d @config/records.json
    curl -X PUT http://localhost:9200/searchlogs -d @config/searchlogs.json


Stop Elasticsearch using

.. code-block:: shell

    elasticsearch-5.6.0/bin/elasticsearch stop



Install using maven
-------------------

Running from the source code, use maven to download.

.. code-block:: shell

    cd es
    mvn install -Pes-download
    mvn exec:exec -Des-start
    curl -X PUT http://localhost:9200/features -d @config/features.json
    curl -X PUT http://localhost:9200/records -d @config/records.json
    curl -X PUT http://localhost:9200/searchlogs -d @config/searchlogs.json


To stop Elasticsearch when using maven, simply stop the process as Elasticsearch is started in
foreground mode.


Check installation
------------------

Access Elasticsearch admin page from http://localhost:9200/.


Configure connection
--------------------

Update Elasticsearch URL in ```WEB-INF/config.properties``` and restart the application
(see :code:`web/src/main/webResources/WEB-INF/config.properties`).
