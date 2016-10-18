.. _linking-online-resources:

Linking website, web services, ... using URL
############################################

This section applies mainly to ISO19139 records and partially
to Dublin Core (ie. only documents can be associated in Dublin Core) standards.


.. _linking-online-resources-doc:

Linking a document
------------------

2 approaches can be used to link documents:

- by providing a URL

- by uploading a document


To add a new one, click on the + caret button then ``Add an online resource``
button or, if alreay one exists, just click on the title of the ``Online resources``.



.. figure:: img/addonlinesrc.png


To link a URL, set the following properties:

- ``Protocol`` to describe the type of document attached (``Web address (URL)`` is the default)
- ``Linkage`` to point to the target document. It can be any type of links like http://, ftp://, file:///, ...
- ``Name`` is optional and provides a label for making an hyperlink
- ``Description`` is optional and provides more details about the link



To upload a document, switch to the ``Upload`` tab and choose a document,
or drag and drop it in the pop up. In that case, the protocol is hidden
and is set to ``WWW:DOWNLOAD``.


.. figure:: img/addonlinesrcup.png


Depending on your needs, more specific links could be added and will
be associated to different actions and display in the applications.


.. _linking-wms-layer:

Linking a WMS layer
-------------------


To be able to view a record on the map viewer, it may be relevant to add a
reference to one or more WMS services publishing the dataset. An online
resource is encoded using the following in ISO19139:

.. code-block:: xml

     <gmd:onLine xmlns:gmd="http://www.isotc211.org/2005/gmd"
                 xmlns:gco="http://www.isotc211.org/2005/gco">
        <gmd:CI_OnlineResource>
           <gmd:linkage>
              <gmd:URL>https://download.data.grandlyon.com/wms/grandlyon</gmd:URL>
           </gmd:linkage>
           <gmd:protocol>
              <gco:CharacterString>OGC:WMS</gco:CharacterString>
           </gmd:protocol>
           <gmd:name>
              <gco:CharacterString>cad_cadastre.cadsubdivisionsection</gco:CharacterString>
           </gmd:name>
           <gmd:description>
              <gco:CharacterString>Subdivision de section cadastrale (Plan cadastral informatisé du Grand Lyon)(OGC:WMS)</gco:CharacterString>
           </gmd:description>
        </gmd:CI_OnlineResource>
     </gmd:onLine>




To add a WMS layer:

- choose the protocol ``OGC:WMS Web Map Service``,
- set the URL of the service,
- then the wizard will query the service to retrieve the list of layers
- choose one or more layer in the list or set it manually.



.. figure:: img/addonlinesrcwms.png


.. _linking-online-resources-georesource:


Linking a database table or a GIS file on the network
-----------------------------------------------------

To reference a GIS file or a database table, user can upload or link to a that resource
(see :ref:`linking-online-resources-doc`). The type of protocol depends on the type of
resource associated:


===================== ==============================================================================================================================================
Type of resource      Vector file uploaded (eg. zipped Shapefile)
===================== ==============================================================================================================================================
URL                   File URL created after upload on the catalog. eg. http://localhost:8080/geonetwork/srv/eng/resources.get?id=1631&fname=CCM.zip&access=private
Protocol              WWW:DOWNLOAD
Name                  File name (readonly)
===================== ==============================================================================================================================================

===================== ==============================================================================================================================================
Type of resource      Vector file on the network
===================== ==============================================================================================================================================
URL                   File path. eg. file:///shared/geodata/world/hydrology/rivers.shp
Protocol              FILE:GEO or FILE:RASTER
Name                  File description
===================== ==============================================================================================================================================

===================== ==============================================================================================================================================
Type of resource      Vector (Table PostGIS)
===================== ==============================================================================================================================================
URL                   jdbc:postgresql://localhost:5432/login:password@db
Protocol              DB:POSTGIS
Name                  Table name
===================== ==============================================================================================================================================


When having information about the database or file on the local network, it may
be relevant to hide those informations for public users
(see :ref:`restricting-information-to-metadata-sections`).


.. todo:: Add doc & link to geopublisher



