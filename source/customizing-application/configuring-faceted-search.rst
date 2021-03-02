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



Simple aggregation on a field:


.. code-block:: js

  "cl_hierarchyLevel.key": {
    "terms": {
      "field": "cl_hierarchyLevel.key"
    }
  }


For codelist, use .default for not multilingual catalogue with one language only UI.



.. code-block:: js

  "cl_spatialRepresentationType.default": {
     "terms": {
       "field": "cl_spatialRepresentationType.default",
       "size": 10
     }
   },


Use .key for codelist for multilingual catalogue. The codelist translation needs to be loaded in the client app. See GnSearchModule.js.



.. code-block:: js

  "cl_spatialRepresentationType.key": {
       "terms": {
         "field": "cl_spatialRepresentationType.key",
         "size": 10
       }
     },



GEMET configuration for non multilingual catalog default property contains the default language so if all records have in the same language there is no mix of languages. In the user interface, this language is displayed.


.. code-block:: js

  "th_gemet_tree.default": {
    "terms": {
      "field": "th_gemet_tree.default",
      "size": 100,
      "order" : { "_key" : "asc" },
      "include": "[^\^]+^?[^\^]+"
      // Limit to 2 levels
    }
  },


If records are not all in all the same languages, languages can be mixed together.


GEMET configuration for multilingual catalog. The key is translated on client side by loading required concepts using the thesaurus API.


.. code-block:: js

  "th_gemet_tree.key": {
    "terms": {
      "field": "th_gemet_tree.key",
      "size": 100,
      "order" : { "_key" : "asc" },
      "include": "[^\^]+^?[^\^]+"
      // Limit to 2 levels
    }
  }


With the key, french and english translations are considered equivalent.



Aggregation based on queries. One query will define one bucket in the aggregation.


.. code-block:: js

  "availableInServices": {
    "filters": {
      //"other_bucket_key": "others",
      // But does not support to click on it
      "filters": {
        "availableInViewService": {
          "query_string": {
            "query": "+linkProtocol:/OGC:WMS.*/"
          }
        },
        "availableInDownloadService": {
          "query_string": {
            "query": "+linkProtocol:/OGC:WFS.*/"
          }
        }
      }
    }
  }


Key like availableInViewService may not be available in the translations. Use the translation API to add your custom translation in the database.

To enable filtering in a facet, add an include property:


.. code-block:: js

  "tag.default": {
    "terms": {
      "field": "tag.default",
      "include": ".*",
      "size": 10
    },
    "meta": {
      "caseInsensitiveInclude": true
    }
  }

include and exclude properties can be used to filter values too. A meta caseInsensitiveInclude can be added as Elasticsearch facet filter is case sensitive by default.


Aggregations can be collapsed by default and visible to users depending on roles:


.. code-block:: js

   "dateStamp" : {
      "auto_date_histogram" : {
        "field" : "dateStamp",
        "buckets": 50
      },
      "meta": {
        "userHasRole": "isReviewerOrMore",
        "collapsed": true,
        "caseInsensitiveInclude": true
      }





(Experimental) A tree field which contains a URI
eg. http://www.ifremer.fr/thesaurus/sextant/theme#52
but with a translation which contains a hierarchy with a custom separator
/Regulation and Management/Technical and Management Zonations/Sensitive Zones


.. code-block:: js

   "th_sextant-theme_tree.key": {
     "terms": {
       "field": "th_sextant-theme_tree.key",
       "size": 100,
       "order" : { "_key" : "asc" }
     },
     "meta": {
       "translateOnLoad": true,
       "treeKeySeparator": "/"
     }
   }





The search results facets configuration is defined in the search section and contains various examples of what you can do using facets:

- Nested facets

- Facet based on filter

- Use `order` to sort facets

- Use `include` to limit values

- Use `collapsed` to collapse the item on load

- Use `'userHasRole': 'isReviewerOrMore',` to display facet depending on user roles

- Use field ending with `_tree` to hierarchy mode


.. code-block:: js

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
            'th_gemet_tree': {
              'terms': {
                'field': 'th_gemet_tree',
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


.. code-block:: js

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



.. _configuring-facet-graphics:

Interactive graphics
--------------------

Use `Vega <https://vega.github.io/vega-lite/examples/>`_ to render date histogram facet values or render term facets to display facet as simple pie. Vega is also used in Kibana so it can make dataviz converging in dashboards and in the app.

Facet widget based on vega allow selection of a range for dates and/or click on bar/pie.


.. figure:: img/vaga.png


To use Vega based facet, enable mods.search.isVegaEnabled in the user interface configuration. This trigger the load of the Vega library.



A simple date field:

.. code-block::

      "dateStamp" : {
        "auto_date_histogram" : {
          "field" : "dateStamp",
          "buckets": 50
        },


A date range field:

.. code-block::

      "resourceTemporalDateRange": {
         "gnBuildFilterForRange": {
            "field": "resourceTemporalDateRange",
            "buckets": "2021 - 1970",
            "dateFormat": "YYYY",
            "vegaDateFormat": "%Y",
            "from": "1970",
            "to": "2021",
            "mark": "area"
          },
          "meta": {
            "vega": "timeline"
          }

A term as pie or bar chart:


.. code-block::

      "cl_status.key": {
          "terms": {
            "field": "cl_status.key",
            "size": 10
          },
          "meta": {
            //"vega": "bar"
            "vega": "arc"
          }
        },
