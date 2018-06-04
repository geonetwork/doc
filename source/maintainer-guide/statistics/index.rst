.. _statistics:

Setting up search/content statistics
####################################

Since GeoNetwork 3.4 search and content statistics are stored in `ElasticSearch <https://www.elastic.co/products/elasticsearch/>`_
using `Kibana <https://www.elastic.co/products/kibana>`_ dashboards to visualize them in the GeoNetwork administration application.

This guide describes the configuration required to integrate ElasticSearch/Kibana in GeoNetwork to store and visualize the search and content statistics.

GeoNetwork supports ElasticSearch/Kibana 5.6.1 version, other versions may not work properly.

.. note::

   This guide doesn't provide a production level setup for ElasticSearch/Kibana. Please refer to the ElasticSearch/Kibana documentation to do a proper setup/configuration for a production environment.

.. toctree::
   :maxdepth: 2

   setup-elasticsearch.rst
   setup-kibana.rst
   setup-geonetwork.rst
