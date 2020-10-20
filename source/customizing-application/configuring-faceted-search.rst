.. _configuring-faceted-search:

Configuring faceted search
###########################


Facets also known as aggregation in Elasticsearch are used to provide simple search entries. |project_name| is using facet in different places:

- Home page categories


.. figure:: img/agg-home.png


- Search results

.. figure:: img/agg-search.png


All facet configurations are stored in the user interface configuration (see :ref:`user-interface-configuration`). The configuration are defined using JSON following Elasticsearch API (See https://www.elastic.co/guide/en/elasticsearch/reference/current/search-aggregations-bucket.html).


By default, the facet configurations are defined as (see :code:`web-ui/src/main/resources/catalog/js/CatController.js`). The home page display on the left side `inspireThemeUri` and `topic_text` and on the right side, the last facet defined `codelist_hierarchyLevel_text`.


.. code-block::

      'home': {
          ...
          'facetConfig': {
            'inspireThemeUri': {
              'terms': {
                'field': 'inspireThemeUri',
                'size': 34
                // "order" : { "_key" : "asc" }
              }
            },
            'topic_text': {
              'terms': {
                'field': 'topic_text',
                'size': 20
              }
            },
            'codelist_hierarchyLevel_text': {
              'terms': {
                'field': 'codelist_hierarchyLevel_text',
                'size': 10
              }
            }
          },


The search results facets configuration is defined in the search section and contains various examples of what you can do using facets:

- Nested facets

- Facet based on filter

- Use `order` to sort facets

- Use `include` to limit values

- Use `collapsed` to collapse the item on load

- Use `'userHasRole': 'isReviewerOrMore',` to display facet depending on user roles

- Use field ending with `_tree` to hierarchy mode


.. code-block::

         'facetConfig': {
            'codelist_hierarchyLevel_text': {
              'terms': {
                'field': 'codelist_hierarchyLevel_text'
              },
              'aggs': {
                'format': {
                  'terms': {
                    'field': 'format'
                  }
                }
              }
            },
            'codelist_spatialRepresentationType': {
              'terms': {
                'field': 'codelist_spatialRepresentationType',
                'size': 10
              }
            },
            'availableInServices': {
              'filters': {
                //"other_bucket_key": "others",
                // But does not support to click on it
                'filters': {
                  'availableInViewService': {
                    'query_string': {
                      'query': '+linkProtocol:/OGC:WMS.*/'
                    }
                  },
                  'availableInDownloadService': {
                    'query_string': {
                      'query': '+linkProtocol:/OGC:WFS.*/'
                    }
                  }
                }
              }
            },
            'thesaurus_geonetworkthesaurusexternalthemegemet_tree': {
              'terms': {
                'field': 'thesaurus_geonetworkthesaurusexternalthemegemet_tree',
                'size': 100,
                "order" : { "_key" : "asc" },
                "include": "[^\^]+^?[^\^]+"
                // Limit to 2 levels
              }
            },

Currently supported aggregations are:

- `terms <https://www.elastic.co/guide/en/elasticsearch/reference/current/search-aggregations-bucket-terms-aggregation.html>`_

- `filters <https://www.elastic.co/guide/en/elasticsearch/reference/current/search-aggregations-bucket-filters-aggregation.html>`_

- `histogram <https://www.elastic.co/guide/en/elasticsearch/reference/current/search-aggregations-bucket-histogram-aggregation.html>`_


.. code-block::

            "resolutionScaleDenominator": {
              "histogram": {
                "field": "resolutionScaleDenominator",
                "interval": 10000,
                "keyed" : true,
                "min_doc_count": 1
              }
            },
            "creationYearForResource": {
              "histogram": {
                "field": "creationYearForResource",
                "interval": 5,
                "keyed" : true,
                "min_doc_count": 1
              }
            },
