.. _csw-api:

Catalog Service for the Web (CSW)
#################################

The CSW end point exposes the metadata records in your catalog in XML format using the OGC CSW protocol (version 2.0.2). 

Two protocols are available:

 - CSW: Provides the ability to search and publish metadata for data, services and related information.
 - CSW-T: Provides an interface for creating, modifying and deleting catalog records via the CSW protocol.

Configuration
=============

See :ref:`csw-configuration` for details of how to configure the CSW end point. 

URL
====

The following URL is the standard end point for the catalog (substitute your |project_name| URL):

 - http://localhost:8080/geonetwork/srv/eng/csw?

Generally, the ``VERSION`` and ``SERVICE`` parameter are also added, along with the ``REQUEST`` parameter as detailed below:

 - http://localhost:8080/geonetwork/srv/eng/csw?SERVICE=CSW&VERSION=2.0.2&REQUEST=GetCapabilities

Requests
========

The full set of requests supported by |project_name| can be found in ``CSW test``, in the ``Settings`` section of the Admin Dashboard. 

See :ref:`csw-configuration` for more details of this function.
