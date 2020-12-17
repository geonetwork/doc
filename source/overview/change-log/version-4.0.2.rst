.. _version-402:

Version 4.0.2
#############

GeoNetwork 4.0.2 release is a minor release but adds a better multilingual support which may require some changes in your installations:

Database migration
==================

With the possibility to `restore deleted record <https://github.com/geonetwork/core-geonetwork/pull/4817>`_, 
catalog maintainer has to update the database with the `following migration SQL script <https://github.com/geonetwork/core-geonetwork/blob/master/web/src/main/webapp/WEB-INF/classes/setup/sql/migrate/v3110/migrate-default.sql#L10-L27>`_.


Index migration
===============

Index migration is only required if you created custom facets configuration in the admin or created custom Kibana dashboards. 
Changes are related to name or structure changes in index fields due to the improvement made for multilingual record support.
The changes affect the following type of fields:

Codelist
--------

`codelist_` is now `cl_` and is an object composed of:


So `characterSet` was:

.. code-block:: js

  codelist_characterSet: [
  "utf8"
  ],
  codelist_characterSet_text: [
  "UTF8"
  ],
  codelist_characterSet_text_langeng: [
  "UTF8"
  ],

and is now:

.. code-block:: js

  cl_characterSet: [{
    key: "utf8",
    default: "UTF8",
    langeng: "UTF8",
    link: "http://standards.iso.org/iso/19139/resources/gmxCodelists.xml#MD_CharacterSetCode"
  }]


So if using `codelist_characterSet_text` in a facet, use `cl_characterSet.default` with this new version.

Thesaurus
---------

The `allKeywords` field is now only used for rendering (not for query) to limit the total number of field and avoid some errors on large catalogues.


Use the per thesaurus fields which were named `thesaurus_geonetwork+external/local+type+thesaurusid` and are now `th_thesaurusid`. The field is also an object composed of:

.. code-block:: js

  thesaurus_geonetworkthesaurusexternalthemeeeatopics: [
    "Land use",
    "http://www.eea.europa.eu/portal_vocabularies/themes/landuse",
    "Biodiversity - Ecosystems",
    "http://www.eea.europa.eu/portal_vocabularies/themes/biodiversity"
  ],

and is now:

.. code-block:: js

    th_eea-topics: [{
      default: "Biodiversity - Ecosystems",
      langeng: "Biodiversity - Ecosystems",
      link: "http://www.eea.europa.eu/portal_vocabularies/themes/biodiversity"
    },
    {
      default: "Policy instruments",
      langeng: "Policy instruments",
      link: "http://www.eea.europa.eu/portal_vocabularies/themes/policy"
    }


Topic category
--------------

`topic` is renamed to `cl_topic` and has the same structure as a codelist.


GeoTag
------


`geotag` is now stored in the `template field for keyword types <https://github.com/geonetwork/core-geonetwork/pull/5243>`_ ie. `keywordType-place`



For more details check :ref:`configuring-search-fields` and  :ref:`configuring-faceted-search`.


Main changes in version 4.0.2
=============================

* `Multilingual support <https://github.com/geonetwork/core-geonetwork/pull/5193>`_

* `Thesaurus / Import from Linked Data Registry <https://github.com/geonetwork/core-geonetwork/pull/5125>`_

* `WFS indexing / More robust and add QGIS Server support <https://github.com/geonetwork/core-geonetwork/pull/5190>`_

* `User searches / Add portals with filter in the list <https://github.com/geonetwork/core-geonetwork/pull/5181>`_

* `Index / improvements <https://github.com/geonetwork/core-geonetwork/pull/5175>`_


and more ... see `4.0.2 issues <https://github.com/geonetwork/core-geonetwork/issues?q=is%3Aissue+milestone%3A4.0.2+is%3Aclosed>`_ and
`pull requests <https://github.com/geonetwork/core-geonetwork/pulls?q=is%3Apr+milestone%3A4.0.2+is%3Aclosed>`_ for full details.
