.. _version-400:

Version 4.0.0
#############

GeoNetwork 4.0.0 release is the first version of GeoNetwork using Elasticsearch as search engine!

By moving from Lucene to Elasticsearch GeoNetwork 4.0.0 offers:

* shared index across catalogs (clustering)
* Improved search experience
* Improved performance for searching and indexing
* Opportunity to add dashboards with Kibana
* Simplify the geonetwork codebase

The Elasticsearch engine supports GeoNetwork core functionality: user can search, edit records and manage the catalogue as usual. Only the searches (and all related protocols) are affected by the change to Elasicsearch. The editor and admin application remains the same.

There remains opportunities to help:

* **A number of features that you enjoy in GeoNetwork 3 may not yet be available**.
* Multilingual editing is the same, but multilingual search is not yet fully operational.
* Read carefully the `list of missing features <https://github.com/geonetwork/core-geonetwork/issues/4727>`_ before migrating.

Before you start:

* Installing the application require to install an Elasticsearch instance (see :ref:`installing-index`).

Release highlights:

* The GeoNetwork `4.0.0` release is aligned with GeoNetwork 3.10.4 (see :ref:`version-3104`).

* The user search experience has been greatly improved.
  
  For more infromation see the description in :ref:`version-400-alpha1` and :ref:`version-400-alpha2`.

* `Search / Exact match support <https://github.com/geonetwork/core-geonetwork/pull/5072>`_

  .. figure:: img/400-search-exactmatch.png

* `Record view / Use timeline to render resource events, temporal extent and vertical extent <https://github.com/geonetwork/core-geonetwork/pull/5065>`_

  .. figure:: img/400-record-event.png

* `Map / Add mouse position <https://github.com/geonetwork/core-geonetwork/pull/5030>`_

* `Indexing / Improvements <https://github.com/geonetwork/core-geonetwork/pull/5064>`_

* `API / Retrieve any extents <https://github.com/geonetwork/core-geonetwork/pull/4930>`_

* `Improve ISO19110 support <https://github.com/geonetwork/core-geonetwork/pull/5059>`_

* `Restrict access to Elasticsearch API <https://github.com/geonetwork/core-geonetwork/pull/5023>`_

See `4.0.0 issues <https://github.com/geonetwork/core-geonetwork/issues?q=is%3Aissue+milestone%3A4.0.0+is%3Aclosed>`_ and
`pull requests <https://github.com/geonetwork/core-geonetwork/pulls?q=is%3Apr+milestone%3A4.0.0+is%3Aclosed>`_ for full details.
