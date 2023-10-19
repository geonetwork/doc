.. _quick_start:

Quick start
###########


GeoNetwork is a catalog application to manage spatially referenced resources.
It provides powerful metadata editing and search functions as well as
an interactive web map viewer. It is currently used in numerous
Spatial Data Infrastructure initiatives across the world.

This Quick Start also describes:

* some of the different ways you can search for spatial data
* how to download and display data from the search results


Starting the catalog
--------------------

This topic describes how to start GeoNetwork after installation on your machine.

**Before you start:**

Ensure you have successfully installed GeoNetwork using the steps described in ``Installing the application``.

To start the catalog:

#. From your GeoNetwork folder location, open the bin folder and double-click start.bat (on windows) or startup.sh (on linux). This initiates a web service for GeoNetwork, which you can use to view the catalog.

   Tip: If you are using the command line, you can view the log messages directly in the console.

#. Open a web browser and go to the GeoNetwork homepage. If you installed it on your computer, use this link `http://localhost:8080/geonetwork`.

#. The GeoNetwork catalog page is displayed.

   .. figure:: ../../install-guide/img/home-page.png

#. Once you have started the catalog, you can sign in to view additional options, search for specific resources or drill down to view detailed information about the resource.

Signing in and load templates
-----------------------------

This topic describes how to sign in using your admin login details and load templates to view examples of resources in the GeoNetwork catalog.

#. On the GeoNetwork home page, from the top menu, click ``Sign in`` to connect as administrator. The Sign in page displays.

   .. figure:: ../../install-guide/img/signin.png

#. Enter the username and password and click Sign in. The default admin account details are: username ``admin`` with password ``admin``.
   After you sign in, the top toolbar displays an ``admin console`` and your login details.

   .. figure:: ../../install-guide/img/identified-user.png

#. Navigate to ``admin console`` and click on ``metadata and templates``:

   .. figure:: ../../install-guide/img/metadata-and-templates.png

#. On the Metadata  & templates page, select all standards from the Standards available list, and:

   a. Click ``load samples``, and
   b. Click ``load templates`` to load examples.

   .. figure:: ../../install-guide/img/templates.png

#. From the top menu, click Search to view the examples:

   .. figure:: ../../install-guide/img/once-samples-are-loaded.png

Searching information
---------------------

You can use the Search form to search information using the GeoNetwork catalog. The Search form allows you to search using:

* a full text search box providing suggestions

  .. figure:: img/full-text.png

* facets which defines groups that you can click to browse the content of the catalog

  .. figure:: img/facets.png

* spatial filtering to choose information in specific areas

  .. figure:: img/spatial-filter.png

* advanced search

  .. figure:: img/advanced.png



Discovering information
-----------------------

Search results display main information about each resources: title, abstract,
categories, status, overview and links.

.. figure:: img/a-result.png


To view detailed information about the resources, click the record. These details include:

* Download and links
* About the resource
* Technical information
* Metadata details

  .. figure:: img/a-record.png

* To get more information, switch the advanced view mode.
* To update the record, click Edit.

.. _quick_start-3D::

From the results or the record view, you can add WMS layers referenced in
a metadata record on the map. Using the map, you can:

* Visualize your data,
* Choose your background maps,
* Query objects,
* Display on a 3D globe

  .. figure:: img/map-africa-basin.png

Read more about use of the :ref:`map-viewer-as-user`
