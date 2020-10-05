.. _statistics_geonetwork:

Setup GeoNetwork
################

.. note::

    GeoNetwork package should be build using the Maven `es` profile in order to be able to configure the search/content statistics to use ElasticSearch/Kibana:

    .. code-block:: shell

        $ cd GN_SOURCES/
        $ mvn clean install -Penv-prod,es

    If you're using a development environment, can use the following command from the Geonetwork sources folder:

    .. code-block:: shell

        $ cd GN_SOURCES/web
        $ mvn jetty:run -Penv-dev,es


To setup the search/content statistics in GeoNetwork, do the following steps:

- Start GeoNetwork.

- Login as an `administrator` user and load the templates (http://localhost:8080/geonetwork/srv/eng/admin.console#/metadata).

- Create some metadata records (optionally you can load the samples).

- Enable search statistics in the Settings page (http://localhost:8080/geonetwork/srv/eng/admin.console#/settings).

.. figure:: img/search-statistics.png

- Do some searches in GeoNetwork.

- Go to `Statistics and status` in http://localhost:8080/geonetwork/srv/eng/admin.console#/dashboard and select Search Statistics`.

The first time you're prompted to select the Kibana default index. Select `.dashboards`:

.. figure:: img/kibana-index-1.png

and set as default to get it working.

.. figure:: img/kibana-index-2.png

- Reload the page and check the dashboards.

.. figure:: img/search-statistics-dashboards.png


Content statistics/validation
`````````````````````````````

Content and validation status statistics are available also from to `Statistics and status` in http://localhost:8080/geonetwork/srv/eng/admin.console#/dashboard, but
require to index manually the content in ElasticSearch. This will be improved in future versions.

- To index the content and validation status in ElasticSearch, go to http://localhost:8080/geonetwork/srv/eng/admin.console#/tools and select the following option:

.. figure:: img/content-indexing.png

- Access the `Content Statistics` and `Validation` in `Statistics and status` (http://localhost:8080/geonetwork/srv/eng/admin.console#/dashboard)
