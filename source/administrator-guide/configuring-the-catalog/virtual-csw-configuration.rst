.. _virtual-csw-configuration:


Configuring virtual CSW
#######################

Warning: This feature will be deprecated in future version (4.x). Use :ref:`portal-configuration` instead.


This feature adds the capability to create custom CSW entry points that apply extra criteria to the CSW requests, allowing to implement several useful cases like, for example:

* Define an INSPIRE CSW entry point to deliver only the INSPIRE related metadata stored in the catalog.
* Define CSW entry points to deliver only metadata related to specific theme/s: climate, boundaries, etc.


The ``filter`` parameter value should use the Lucene query parser syntax (see http://lucene.apache.org/java/2_9_1/queryparsersyntax.html) and is use in these CSW operations:

* *GetRecords*: the ``filter`` is applied with the CSW query as an extra query criteria.
* *GetRecordById*: the ``filter`` is applied with the metadata ``id`` requested as an extra query criteria.
* *GetDomain*: the ``filter`` is applied as a query criteria to retrieve the metadata properties requested.
* *GetCapabilities*: the ``filter`` is applied as a query criteria to fill the metadata keywords list in the GetCapabilities document.

The list of available Lucene index fields to use in the ``filter`` parameter can be obtained from the files ``index-fields.xsl`` in the schema folders located in ``WEB-INF/xml/schemas``.

As Harvest and Transaction operations are not affected by ``filter`` parameter, to avoid confusion is better to use this feature as readonly CSW endpoints.
