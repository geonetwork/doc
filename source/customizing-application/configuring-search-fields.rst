.. _configuring-search-fields:

Configuring search fields
#########################

In some cases it's relevant to modify or extend the search fields of the metadata index. For example to add a field (which is then searchable or can be used in a default view) or change the content of the field created from the metadata (indexation).


Add a search field
~~~~~~~~~~~~~~~~~~

Indexed fields are defined on a per schema basis on the schema folder (see :code:`schemas/iso19139/src/main/plugin/iso19139/index-fields/index.xsl`).

This file define for each search criteria the corresponding element in a metadata record. For example, indexing the resource identifier of an ISO19139 record:

.. code-block:: xml

     <xsl:for-each select="gmd:identifier/*/gmd:code/(gco:CharacterString|gmx:Anchor)">
        <resourceIdentifier>
          <xsl:value-of select="."/>
        </resourceIdentifier>
      </xsl:for-each>


Once the field added to the index, user could query using it as a search criteria in the different kind of search services. For example using:


.. code-block:: shell

  curl -X POST "localhost:8080/geonetwork/srv/api/search/records/_search" \
      -H 'Accept: application/json' \
      -H 'Content-Type: application/json;charset=utf-8' \
      -d '{"from":0,"size":0,"query":{"query_string":{"query":"+resourceIdentifier:1234"}}}'


To customize how the field is indexed see :code:`web/src/main/webResources/WEB-INF/data/config/index/records.json`.

To return it in the search response, use the `_source` parameter of the query. See https://www.elastic.co/guide/en/elasticsearch/reference/current/search-fields.html.


Boosting at search time
~~~~~~~~~~~~~~~~~~~~~~~

See https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl-query-string-query.html#_boosting.

By default, the search is defined as (see :code:`web-ui/src/main/resources/catalog/js/CatController.js`):


.. code-block::

          'queryBase': 'any:(${any}) resourceTitleObject.default:(${any})^2',


Scoring
~~~~~~~


By default the search engine compute score according to search criteria
and the corresponding result set and the index content.


By default, the search score is defined as (see :code:`web-ui/src/main/resources/catalog/js/CatController.js`):


.. code-block::

         'scoreConfig': {
            "boost": "5",
            "functions": [
              // Boost down member of a series
              {
                "filter": { "exists": { "field": "parentUuid" } },
                "weight": 0.3
              },
              // Boost down obsolete records
              {
                "filter": { "match": { "codelist_status": "obsolete" } },
                "weight": 0.3
              },
              // {
              //   "filter": { "match": { "codelist_resourceScope": "service" } },
              //   "weight": 0.8
              // },
              // Start boosting down records more than 3 months old
              {
                "gauss": {
                  "dateStamp": {
                    "scale":  "365d",
                    "offset": "90d",
                    "decay": 0.5
                  }
                }
              }
            ],
            "score_mode": "multiply"
          },

Language analyzer
~~~~~~~~~~~~~~~~~

By default a `standard` analyzer is used. If the catalog content is english, it may make sense to change the analyzer to `english`. To customize the analyzer see :code:`web/src/main/webResources/WEB-INF/data/config/index/records.json`

For French, see :code:`web/src/main/webResources/WEB-INF/data/config/index/records_french.json`.
