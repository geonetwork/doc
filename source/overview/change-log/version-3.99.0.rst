.. _version-3990:

Version 3.99.0
##############

GeoNetwork 3.99.0 release is a beta version of GeoNetwork using Elasticsearch as search engine (instead of the previous home made search based on Lucene). This version is a beta release made available for users who would like to test it.

This version provides support of GeoNetwork main functionalities and user can search, edit records and manage the catalogue as usual. Only the searches (and all related protocols) are affected by the search engine change and the user search experience has been improved with the following:

* Autocomplete support phrase query, does not return private terms, takes current search into account

.. figure:: img/3990-es-suggest-phrase.png

* Facets / OR query support

.. figure:: img/3990-es-facet-or.png

* Facets / Negative query support

.. figure:: img/3990-es-facet-negative.png

* Facets / Nested aggregations support

.. figure:: img/3990-es-facet-nested.png

* Facets / Paging to collect more values

.. figure:: img/3990-es-facet-more.png

* Facets / Histograms

.. figure:: img/3990-es-facet-histogram.png

* Facets / Configuration from the admin > Settings > UI based on `Elasticsearch API <https://www.elastic.co/guide/en/elasticsearch/reference/current/search-aggregations.html>`_

* Record view / More like this ...

.. figure:: img/3990-es-morelikethis.png

* Search / Custom scoring function
* Search / Range field support eg. temporal coverage

.. figure:: img/3990-es-search-range.png

* Performances improved for search and indexing

* Build your own dashboards in Kibana

* Summary of indexing errors

.. figure:: img/3990-es-indexing-errors.png

Regarding search protocols, only CSW has been migrated for now (ie. OAI-PMH, RDF, Z39.50/SRU, OpenSearch, ... are not available in this version). This means that a GeoNetwork 3.x can only harvest GeoNetwork 3.99 using CSW.

More details can be found in https://github.com/geonetwork/core-geonetwork/pull/2830.

For the installation check :ref:`installing`.

For reporting any issue go to https://github.com/geonetwork/core-geonetwork/issues.

Features removed
----------------

* CSW / Virtual CSW is replaced by sub-portal
* CSW / results_with_summary custom GeoNetwork output schema is removed. To retrieve facets use the main search API.
* Deprecated Jeeves services removed (ie. services not used by Angular application like harvester config). Use the swagger API instead.




Roadmap for version 4
---------------------

Existing features not implemented
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* Multilingual metadata / Records are indexed and displayed but no logic to display depending on user interface language or search on specific language

.. figure:: img/3990-es-index-multilingual.png

  Multilingual fields are stored as a JSON object with an optional link if using Anchor.

* Indexing / Language specific analyzer (draft configuration made for French)
* Indexing / Spatial / Support for bounding polygons
* User interface / Search / Advanced search form
* User interface / Search / Active filters
* User interface / Search / Facet as tab
* Search / Other protocols (ie. OAI-PMH, RDF, Z39.50/SRU, OpenSearch)
* API / DirectoryUtils.search
* API / ReportUploads
* API / INSPIRE Atom Harvester
* Search / Statistics and search stat dashboards


New features to develop
~~~~~~~~~~~~~~~~~~~~~~~

* Search on records and WFS features
* Search / Synonyms supports
* Associated records / Use of multiple search API for better performance or Join query.
* Harvester / GN4 protocol
* Clustering
* Large catalogs / Better support of batch operations (eg. privileges, new owner, validation) and large selection

.. code-block:: json

  ":{"type":"too_many_clauses","reason":"maxClauseCount is set to 1024"}}}}]},"status":400}

* Large catalogs / Define strategy to speed up search and not use track_total_hits
* Security / Elasticsearch and Kibana configuration (for now, do not expose Elasticsearch to the internet)
* Java 11 support

.. code-block::

  future versions of Elasticsearch will require Java 11;
  your Java version from [/usr/lib/jvm/java-8-openjdk-amd64/jre]
  does not meet this requirement

