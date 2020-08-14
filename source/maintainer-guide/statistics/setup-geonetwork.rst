.. _statistics_geonetwork:

Setup |project_name|
####################

.. note::

    |project_name| package should be build using the Maven `es` profile in order to be able to configure the search/content statistics to use ElasticSearch/Kibana:

    .. code-block:: shell

        $ cd GN_SOURCES/
        $ mvn clean install -Penv-prod,es

    If you're using a development environment, can use the following command from the Geonetwork sources folder:

    .. code-block:: shell

        $ cd GN_SOURCES/web
        $ mvn jetty:run -Penv-dev,es


To setup the search/content statistics in |project_name| do the following steps:

- Comment the following filter in `TOMCAT_DIR/webapps/geonetwork/WEB-INF/web.xml`

.. code-block:: xml

    <!--<filter-mapping>
      <filter-name>XFrameOptionsFilter</filter-name>
      <url-pattern>/*</url-pattern>
    </filter-mapping>-->


, otherwise when accessing the dashboard the following error is displayed in the js console::

   Refused to display 'http://localhost:8080/geonetwork/dashboards/app/kibana#/dashboard/5b407790-4fa1-11e7-a577-3197d1592a1d?embed=true&_g=()' in a frame because an ancestor violates the following Content Security Policy directive: "frame-ancestors 'none'".


- Startup |project_name|.

- Login as an `administrator` user and load the templates (http://localhost:8080/geonetwork/srv/eng/admin.console#/metadata).

- Create some metadata records (optionally you can load the samples).

- Enable search statistics in the Settings page (http://localhost:8080/geonetwork/srv/eng/admin.console#/settings).

.. figure:: img/search-statistics.png

- Do some searches in |project_name|.

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