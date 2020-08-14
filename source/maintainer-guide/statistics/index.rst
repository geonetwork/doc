.. _statistics:

Setting up search/content statistics
####################################

Since |project_name| 3.4 search and content statistics are stored in `ElasticSearch <https://www.elastic.co/products/elasticsearch/>`_
using `Kibana <https://www.elastic.co/products/kibana>`_ dashboards to visualize them in the |project_name| administration application.

This guide describes the configuration required to integrate ElasticSearch/Kibana in |project_name| to store and visualize the search and content statistics.

|project_name| 3.8.x supports ElasticSearch/Kibana 7.2, other versions may not work properly.

.. note::  This guide doesn't provide a production level setup for ElasticSearch/Kibana. Please refer to the ElasticSearch/Kibana documentation to do a proper setup/configuration for a production environment.

.. toctree::
   :maxdepth: 2

   setup-elasticsearch.rst
   setup-kibana.rst
   setup-geonetwork.rst
