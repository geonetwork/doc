.. _statistics_kibana:

Setup Kibana
############

In this section is described how to setup Kibana to be used in GeoNetwork to visualize the search/content statistics:

- Download Kibana 5.6.1 from http://www.elastic.co/downloads/past-releases/kibana-5-6-1

- Unzip the file, for example to `/opt/kibana`

- Configure Kibana to use it in GeoNetwork:

.. code-block:: shell

    $ cd opt/kibana
    $ vi config/kibana.yml
        server.basePath: "/geonetwork/dashboards"
        kibana.index: “.dashboards"

- Execute Kibana:

.. code-block:: shell

    $ cd /opt/kibana/bin
    $ ./kibana &


.. note::

    Usually you'll want to configure Kibana to run when the server is startup, this is not covered in this guide.

- Verify in a browser that Kibana is running: http://localhost:5601/app/kibana

- Load Kibana data:

.. code-block:: shell

    $ cd /tmp
    $ curl -O https://raw.githubusercontent.com/geonetwork/core-geonetwork/3.4.x/es/es-dashboards/data/index-dashboards-mapping.json
    $ elasticdump \
          --input=index-dashboards-mapping.json \
          --output=http://localhost:9200/.dashboards \
          --type=mapping
    $ curl -O https://raw.githubusercontent.com/geonetwork/core-geonetwork/3.4.x/es/es-dashboards/data/index-dashboards.json
    $ elasticdump \
        --input=index-dashboards.json \
        --output=http://localhost:9200/.dashboards
