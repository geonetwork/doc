.. _map-viewer-as-user:

Maps and dataset visualisation
==============================

The map component in GeoNetwork serves two goals:

- As part of the evaluation of relevance users can visualise a resource discovered in the catalogue in an interactive map viewer to preview the contents.

- GeoNetwork can be used as a mapping application to create maps that can be printed or shared with others. The maps itself can even be registered in the catalogue as assets.

.. Note::

    In stead of using the embedded map viewer, GeoNetwork offers functionality to use an externa map viewer (for example an existing WebGIS framework in your organisation). An administrator can configure GeoNetwork in such a way that it is connected to an external web map application. In such a configuration all map interaction is delegated to the external application.

Map viewer
----------

Map viewer can be opened from a metadata detais view by the 'add to map' button or directy from the map tab in the main menu.
A list of tools will be available in the right toolbar, hover the tools to display a tooltip of their meaning. Which tools are available can be 
configured by an administrator.  

Tools for using the Map are arranged in two groups in the right-hand side of the map. The top group looks like this:

- Add new layers to the map. You can search the catalog, add layers from web services, or kml. It is possible to add directly WMS, WFS or WMTS layers by entering the endpoint and selecting the layer from the capabilities response.

- Manage existing layers or change the background map.

- The projection switcher allows to set alternative projections.

- Filter layers on the map. The panel can be used to filter features shown on the map on various attributes. As an administrator make sure the filtering is correctly set up before adding this tool to the map.

- Manage the Map, by setting it back to default settings, loading a new map definition, downloading the current map, or saving the map configuration as a record in the catalog.

- Print the map. A pdf of the current map will be generated, to be downloaded and send to a printer.

- Synchronise layers with the small map on the Search tab.

- Measure distances on the map.

- Draw annotations on the map.

Additionally there is a geographic search tool in the top left.

The map viewer supports Featureinfo, to retrieve information by clicking on a location in the map. 

.. figure:: img/addLayers.png
    :width: 300px


Store and share maps
--------------------

A map consists of a background layer and a number of thematic overlays. A format to combine layers, projection and bounds (area of interest) has been adopted by OGC as the OWS Context standard. Besides GeoNetwork there are a number of other applications supporting this standard.

GeoNetwork uses OWSContext to store, share and load maps:

- Export a context to a local file, to restore the map later or share by email.

- The administrator can introduce a context file as default configuration for the catalog.

- Open a local context file by dragging it on to the map viewer (or open from context menu).

- Register a context as asset in the catalogue, the context itself will be added as attachement.

- Records that have an OWS context file attached will display a button to open the context file.


.. figure:: img/OWSContext.png
    :width: 400px

