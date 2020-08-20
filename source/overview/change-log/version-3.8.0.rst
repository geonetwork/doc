.. _version-380:

Version 3.8.0
#############

New features/fixes
------------------

* Search experience

  * `Saved searches <https://github.com/geonetwork/core-geonetwork/pull/3778>`_

    .. figure:: img/380-usersearches.png
       
       Saved user searches


  * `Improve PDF output <https://github.com/geonetwork/core-geonetwork/pull/3912>`_

  * `Add template to display related record as list <https://github.com/geonetwork/core-geonetwork/pull/3908>`_


     .. figure:: img/380-related.png
        
        Add template

  * `Add support for negative query on any fields <https://github.com/geonetwork/core-geonetwork/pull/3683>`_

* Standards

  * `ISO19115-3:2018 is now a default standard <https://github.com/metadata101/iso19115-3.2018>`_

  * `ISO19139 / JSON-LD formatter <https://github.com/geonetwork/core-geonetwork/pull/3714>`_

  * `ISO19139:2007 / Update schema <https://github.com/geonetwork/core-geonetwork/pull/3920>`_

  * INSPIRE Technical guidance v2 support

    * Add support for `etf-webapp validation with TG2 for datasets and sds <https://github.com/geonetwork/core-geonetwork/pull/3915>`_ and also `support validating non ISO19139 records like ISO19115-3 <https://github.com/geonetwork/core-geonetwork/pull/3766>`_

    * `Improve support for gmx:Anchor encoding <https://github.com/geonetwork/core-geonetwork/pull/3911>`_

  * `ISO19110 / Populate columns and codelist values from CSV <https://github.com/geonetwork/core-geonetwork/pull/3864>`_

* Editor

  * `Working copy support for approved records <https://github.com/geonetwork/core-geonetwork/pull/3592>`_

  * `Associated resource can now be filtered, sorted <https://github.com/geonetwork/core-geonetwork/pull/3804>`_, add `support for WFS and Atom services <https://github.com/geonetwork/core-geonetwork/pull/3817>`_.

     .. figure:: img/380-associated.png
       
        Filtering associated resources

* Harvester

  * `GeoNetwork / Add paging for better support of large catalogues <https://github.com/geonetwork/core-geonetwork/pull/3916>`_

  * `THREDDS / Modernise and simplify harvester <https://github.com/geonetwork/core-geonetwork/pull/3936>`_

  * `WFS feature / Zoom to results <https://github.com/geonetwork/core-geonetwork/pull/3701>`_, add support for CDATA, Update to Elasticsearch 7.2.


* Administration

  * New user interface settings for: humanizing date, enable user searches, enable saved selections, fluid or not container

* Security fixes and library updates


And more ... see `3.8.0 issues <https://github.com/geonetwork/core-geonetwork/issues?q=is%3Aissue+milestone%3A3.8.0+is%3Aclosed>`_ and
`pull requests <https://github.com/geonetwork/core-geonetwork/pulls?q=milestone%3A3.8.0+is%3Aclosed+is%3Apr>`_ for full details.
