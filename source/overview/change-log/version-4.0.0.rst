.. _version-400:

Version 4.0.0
#############

GeoNetwork 4.0.0 release is the first version of GeoNetwork using Elasticsearch as search engine.

This version provides support of GeoNetwork main functionalities and user can search, edit records and manage the catalogue as usual. Only the searches (and all related protocols) are affected by the search engine change. The editor and admin application remains the same (eg. multilingual editing is the same, but multilingual search is not yet fully operational).


**Therefore a number of features that you may be using in GeoNetwork 3 are not available**. Read carefully the `list of missing features <https://github.com/geonetwork/core-geonetwork/issues/4727>`_ before migrating.


Some of the main goals of moving from Lucene to Elasticsearch are:

* Be able to share index across catalogs (clustering)
* Improve search experience
* Improve performances for searches and indexing
* Add dashboards with Kibana
* Simplify code base


Installing the application require to install an Elasticsearch instance (see :ref:`installing-index`).


The user search experience has been improved with a number of changes described in :ref:`version-400-alpha1` and :ref:`version-400-alpha2`. It is aligned with GeoNetwork 3.10.4 (see :ref:`version-3104`). Latest major changes since alpha2 are:

* `Search / Exact match support <https://github.com/geonetwork/core-geonetwork/pull/5072>`_

.. figure:: img/400-search-exactmatch.png

* `Record view / Use timeline to render resource events, temporal extent and vertical extent <https://github.com/geonetwork/core-geonetwork/pull/5065>`_

.. figure:: img/400-record-event.png

* `Map / Add mouse position <https://github.com/geonetwork/core-geonetwork/pull/5030>`_

* `Indexing / Improvements <https://github.com/geonetwork/core-geonetwork/pull/5064>`_

* `API / Retrieve any extents <https://github.com/geonetwork/core-geonetwork/pull/4930>`_

* `Improve ISO19110 support <https://github.com/geonetwork/core-geonetwork/pull/5059>`_

* `Restrict access to Elasticsearch API <https://github.com/geonetwork/core-geonetwork/pull/5023>`_


and more ... see `4.0.0 issues <https://github.com/geonetwork/core-geonetwork/issues?q=is%3Aissue+milestone%3A4.0.0+is%3Aclosed>`_ and
`pull requests <https://github.com/geonetwork/core-geonetwork/pulls?q=is%3Apr+milestone%3A4.0.0+is%3Aclosed>`_ for full details.
