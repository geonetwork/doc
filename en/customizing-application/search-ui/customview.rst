.. _customview:


Create your own view
####################

If you prefer not to edit shared default files, or if you want a really different UI, the best way is to create your own custom view.

Add a new view
--------------

As presented in previous section, you will need to set up several files to load a new UI view.

- create a new folder in ``web-ui/src/main/resources/catalog/views/``.
- add a ``templates/index.html`` in this folder.
- add a javascript file loading your main AngularJS module
- add less files

Customize your view
-------------------

Let's say we want to create a custom view name `geoportal`.

- You will need to create a new folder ``web-ui/src/main/resources/catalog/views/geoportal``.

- Add a new file ``web-ui/src/main/resources/catalog/views/geoportal/templates/index.html`` containing

.. code-block:: html


    <div class="geoportal">Welcome to geoportal</div>

- Add a new file ``web-ui/src/main/resources/catalog/views/geoportal/search.js`` containing

.. code-block:: js


    (function() {

      goog.provide('gn_search_geoportal');
      goog.require('gn_search');

      var module = angular.module('gn_search_geoportal', ['gn_search']);

    })();

.. note:: You must include ``gn_search`` module.

- Add a new file ``web-ui/src/main/resources/catalog/geoportal/views/geoportal/less/gn_search_geoportal.less`` containing

.. code-block:: css

    .geoportal {
        font-size: 36px;
        font-weight: bold;
    }

Launch your view
----------------

To see your new view, you can launch the `catalog.search` service with a new parameter view:
http://localhost:8080/geonetwork/srv/eng/catalog.search?view=geoportal

Or, go into admin settings page and set the ``system/ui/defaultView`` to ``geoportal``.
