.. _statistics_es:

Setup ElasticSearch
###################

In this section is described how to setup ElasticSearch to be used in GeoNetwork to store the search/content statistics:

- Download ElasticSearch 5.6.1 from http://www.elastic.co/downloads/past-releases/elasticsearch-5-6-1

- Unzip the file, for example to `/opt/elasticsearch`

- Execute Elastic Search:

.. code-block:: shell

    $ cd /opt/elasticsearch/bin
    $ ./elasticsearch &


.. note::

    Usually you'll want to configure ElasticSearch to run when the server is startup, this is not covered in this guide.

- Verify in a browser that ElasticSearch is running: http://localhost:9200/

- Load indexes:

.. code-block:: shell

    $ cd /tmp
    $ curl -O https://raw.githubusercontent.com/geonetwork/core-geonetwork/3.4.x/es/config/features.json
    $ curl -X PUT http://localhost:9200/features -d @features.json
    $ curl -O https://raw.githubusercontent.com/geonetwork/core-geonetwork/3.4.x/es/config/records.json
    $ curl -X PUT http://localhost:9200/records -d @records.json
    $ curl -O https://raw.githubusercontent.com/geonetwork/core-geonetwork/3.4.x/es/config/searchlogs.json
    $ curl -X PUT http://localhost:9200/searchlogs -d @searchlogs.json
