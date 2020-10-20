.. _api-guide:

API guide
#########

The API guide describes entry points that can be used to interact with the catalog.

The GeoNetwork API allows to manage all the catalog (eg. users, groups, editing, formatter, processing). The CSW is the OGC standard to use to search, retrieve record in XML format and can also be used for transactions.

In GeoNetwork 4,

 - OpenSearch and ATOM are not yet available.

 - Q service is replaced by the OpenAPI endpoint `/srv/api/search/records/_search` which is the main catalogue search service based on `Elasticsearch API <https://www.elastic.co/guide/en/elasticsearch/reference/current/search-search.html>`_.

.. toctree::
   :maxdepth: 2

   the-geonetwork-api.rst
   q-search.rst
   csw.rst
   opensearch.rst
   rdf-dcat.rst
   oai-pmh.rst
   z39-50.rst
