.. _enrichsearchview:


Enrich your custom view
#######################


Now we created our structure with basic content, we want to create a real catalog page.

For that, you can include default view content, or build your own application on top of core GeoNetwork components.

GeoNetwork components
----------------------

UI design is based on shared widgets, logic and components.
In AngularJS terms, we talk about `services` and `directives`.

All components are stored in the folder `components <https://github.com/geonetwork/core-geonetwork/tree/develop/web-ui/src/main/resources/catalog/components>`_

- Main page usefull components

Main search input

.. code-block:: html


            <input type="text"
                   class="form-control input-lg"
                   id="gn-any-field"
                   data-ng-model="searchObj.params.any"
                   data-ng-model-options="modelOptionsForm"
                   placeholder="{{'anyPlaceHolder' | translate}}"
                   data-ng-keyup="$event.keyCode == 13 && triggerSearch()"
                   data-typeahead="address for address in getAnySuggestions($viewValue)"
                   data-typeahead-loading="anyLoading" class="form-control"
                   data-typeahead-min-length="1"
                   data-typeahead-focus-first="false">

Facets panel

.. code-block:: html

        <div data-ng-show="searchResults.records.length > 0"
             data-gn-facet-dimension-list="searchResults.dimension"
             data-params="searchObj.params"
             data-facet-type="facetsSummaryType"
             data-current-facets="currentFacets">
        </div>

Alert info manager

.. code-block:: html

  <div data-gn-alert-manager=""></div>

Result list

.. code-block:: html

        <div data-ng-show="searchResults.records.length > 0"
             data-gn-results-container=""
             data-search-results="searchResults"
             data-template-url="resultTemplate"
             data-map="searchObj.searchMap"></div>

Geographic search

.. code-block:: html

    <div data-gn-map-field="searchObj.searchMap"
         data-gn-map-field-geom="searchObj.params.geometry"
         data-gn-map-field-opt="searchObj.mapfieldOption"
         class="gn-search-map">

- Main map components

    - wmsimport
    - map search input
    - draw panel
    - measure panel
    - print panel
    - layer manager
    - background layer selector
    - etc...

So you can reuse all these components in your templates to build the view you want.


Styles
------

.. important:: You should import default style and add custom CSS rules instead of creating your own from scratch.

In ``gn_search_geoportal.less``, import default less files.

- Import common search styles (if you start a new view from scratch)

.. code-block:: css

    @import "../../../style/gn_search.less";


- Import default view search styles (if you base your view on top of default one)

.. code-block:: css

    @import "../../default/less/gn_search_default.less";

Then, in your less file, you can start adding new rules


.. code-block:: none

    .gn-resultview .list-group-item {
        background-color: red;
        &:hover {
        background-color: orange;
        }
    }
