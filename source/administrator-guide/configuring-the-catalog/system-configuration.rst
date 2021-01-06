.. _system-configuration:

System configuration
####################


Most of the system configuration parameters can be changed by administrator users
using the web interface in ``Admin console`` > ``Settings``.

.. important:: Configuration of these parameters is critically important
   for the catalog in an operational context. Misunderstanding
   some settings may result in a system that does not function as
   expected. For example, downloads may fail to be correctly processed, or
   metadata harvesting from other servers may not work.

.. figure:: img/settings.png


Since the settings form is a long form, the 'save' button is repeated between
the sections and will save all settings.

Catalog description
```````````````````

- **Catalog name** The name of the node. Information that helps identify the
  catalogue to a human user. The name is displayed on the banner, in the CSW
  GetCapabilities.

- **Catalog identifier** A universally unique identifier (uuid) that
  distinguishes your catalog from any other catalog. This a unique
  identifier for your catalogue and its best to leave it as a uuid. It will
  be used by harvester using GeoNetwork protocol to identify the source catalog.

- **Organization** The organization the node belongs to. Again, this is
  information that helps identify the catalogue to a human user.

- **SVN UUID** Subversion repository attached to the node. This identifier is
  created and/or checked on startup to verify that the database match the SVN repository.
  The repository is used for metadata versioning.


Catalog
```````

- **Version** The version of the catalog (readonly, version of the database)

- **Minor version** The minor version of the catalog (readonly, version of the database)



.. _system-config-server:


Catalog Server
``````````````


- **Host** The node's name or IP number (without http://). For example,
  they are used during metadata editing to create resource links and
  when returning the server's capabilities during a CSW request.

 - If your node is publicly accessible from the Internet, you have to use the domain name.

 - If your node is hidden inside your private network and you have a firewall or web server
   that redirects incoming requests to the node, you have to enter the public address of
   the firewall or web server. A typical configuration is to have an Apache web server
   on address A that is publicly accessible and redirects the requests to a Tomcat server
   on a private address B. In this case you have to enter A in the host parameter.


- **Port** The server's port number (usually 80 or 8080). If using HTTP, set it to 80.

- **Preferred Protocol** Defined the protocol to access the catalog. The HTTP protocol
  used to access the server. Choosing http means that all communication with the catalog
  will be visible to anyone listening to the protocol. Since this includes usernames
  and passwords this is not secure. Choosing https means that all communication with the catalog
  will be encrypted and thus much harder for a listener to decode.

- **Secure Port** The secure port number.


- **Log level** Define the logging level of the application. After modification,
  log can be checked in the ``Statistics & status`` section under ``Activity``.

.. figure:: img/log-view.png


Intranet parameters
```````````````````

A common need for an organisation is to automatically discriminate between anonymous
internal users that access the node from within an organisation (Intranet) and
anonymous external users from the Internet. The catalog defines anonymous users
from inside the organisation as belonging to the group *Intranet*, while anonymous
users from outside the organisation are defined by the group *All*. To automatically
distinguish users that belong to the Intranet group you need to tell the catalog
the intranet IP address and netmask.

- **Netmask** The intranet netmask (eg. 255.255.255.0).


- **Network*** The intranet address in IP form (eg. 147.109.100.0).


Z39.50
``````

 - **Enable Z39.50 Server** Enable Z39.50 server. Restart the catalog to make this change active.

 - **Port** Change the Z39.50 listening port. Restart the catalog to make this change active.



Proxy server
````````````

The settings page offers to set the configuration of a proxy server. This configuration is used by the application to access the internet to get online resources, for example as part of a harvest process.

- **Use proxy** Enable the proxy in case the catalog is behind a proxy and need
  to use it to access remote resources.

- **Proxy Host** The proxy IP address or name

- **Port** The proxy port

- **Proxy username** The username

- **Proxy user password** The username password

- ***Ignore host list** To bypass specific hosts enter a specific IP address or
  host name such as www.mydomain.com or an address range using wildcards,
  such as 192.168.2.*. Use | to separate the different host values.


JVM proxy parameters may also be required to properly set the proxy for all remote
access.

.. _system-config-feedback:

Feedback
````````

Email may be sent by the catalog.

- you are using the User Self-registration system

- you are using the metadata status workflow (See :ref:`life-cycle`)

- a file uploaded with a metadata record is downloaded and notify privilege is selected


This section configure the mail server to use.

- **Email** This is the administrator's email address used to send feedback.

- **SMTP host** The mail server name or IP address to use for sending emails.

- **SMTP port** The SMTP port.

- **Use SSL** Enable SSL mode

- **User name** Username if connection is required on the SMTP server

- **Password** Username password if connection is required on the SMTP server


Metadata search results
```````````````````````

Configuration settings in this group determine what the limits are on user interaction with the search results.

- **Maximum Selected Records** The maximum number of search results that a user
  can select and process with the batch operations eg. Set Privileges, Categories etc.
  This parameter avoid to trigger long action which could generate out of memory error.

Catalog Service for the Web (CSW)
`````````````````````````````````

See :ref:`csw-configuration`.


Shibboleth
``````````

See :ref:`authentication-shibboleth`.

User self-registration
``````````````````````
Enable the self registration form. See :ref:`user_self_registration`.


system/userFeedback
```````````````````
.. deprecated:: 3.0.0

Link in metadata records
````````````````````````

.. deprecated:: 3.0.0
   Defined by the formatter.


Metadata rating
```````````````

If enabled, the catalog will calculate user ratings for metadata from this node
only (not distributed among other GeoNetwork nodes). This only applies to records
harvested using the GeoNetwork protocol.


Download Service
````````````````

The metadata editor supports uploading one or more files that can be stored with
the metadata record. When such a record is displayed in the search results,
a 'Download' button is provided which will allow the user to select which file
they want to download. This option group determines how that download will occur.

- **Use GeoNetwork simple file download service** Clicking on any file stored
  with the metadata record will deliver that file directly to the user via the browser.

- **Use GeoNetwork disclaimer and constraints service** Clicking on any file
  stored with the metadata record will deliver a zip archive to the user
  (via the browser) that contains the data file, the metadata record itself and
  a summary of the resource constraint metadata as an html document. In addition,
  the user will need to provide some details (name, organisation, email and
  optional comment) and view the resource constraints before they can download the zip archive.



.. _xlink_config:

Metadata XLink
``````````````

The XLink resolver replaces the content of elements with an attribute @xlink:href
(except for some elements like srv:operatesOn) with the content obtained from
the URL content of @xlink:href. The XLink resolver should be enabled if you want
to harvest metadata fragments or reuse fragments of metadata in your metadata records
(eg. when using a contact directory).

- **Enable XLink resolution**: Enables/disables the XLink resolver.

- **Enable local XLink** Local XLinks are using local://<lang>/<service> URL to
  make references to related sections instead of HTTP URL.
  Local XLinks are usually faster than HTTP XLinks.


.. seealso:: To improve performance the catalog will cache content that is not in the local catalog.
   Clear the cache of XLink from the ``Admin console`` > ``Tools`` if the fragments were updated.


.. figure:: img/xlink-cache-clear.png


Metadata update
```````````````

For each metadata schema, the catalog has an XSL transformation (``update-fixed-info.xsl``) that it can apply to a metadata
record belonging to that schema. The aim of this transformation is to allow fixed schema, site and catalog
information to be applied to a metadata record every time the metadata record is saved in the editor.
As an example, this transformation is used to build and store the URL of any files
uploaded and stored with the metadata record in the editor.


- **Automatic Fixes**: Enabled by default. It is recommended you do not use the metadata
  editor when auto-fixing is disabled.  See http://trac.osgeo.org/geonetwork/ticket/368 for more details.


.. _search_stats_config:

Search Statistics
`````````````````

Enables/disables search statistics capture. Search statistics are stored in the database
and can be queried using the ``Search Statistics`` page.


There is very little compute overhead involved in storing search statistics as they
are written to the database in a background thread. However database storage for a very busy site must be carefully planned.


Index optimization
``````````````````

Configuration settings in this group determine when the Lucene Index Optimizer is run.
By default, this takes place at midnight each day. With recent upgrades to Lucene,
particularly Lucene 3.6.1, the optimizer is becoming less useful, so this
configuration group will very likely be removed in future versions.


Open Archive Initiative (OAI-PMH) Provider
``````````````````````````````````````````

Options in this group control the way in which the OAI Server responds to
OAIPMH harvest requests from remote sites.

- **Datesearch**: OAI Harvesters may request records from GeoNetwork in a date range.
  GeoNetwork can use one of two date fields from the metadata to check for a match
  with this date range. The default choice is *Temporal extent*, which is the temporal extent
  from the metadata record. The other option, *Modification date*, uses the modification
  date of the metadata record in the GeoNetwork database. The modification date is
  the last time the metadata record was updated in or harvested by GeoNetwork.

- **Resumption Token Timeout**: Metadata records that match an OAI harvest search request
  are usually returned to the harvester in groups with a fixed size (eg. in groups of 10 records).
  With each group a resumption token is included so that the harvester can request
  the next group of records. The resumption token timeout is the time (in seconds)
  that GeoNetwork OAI server will wait for a resumption token to be used.
  If the timeout is exceeded GeoNetwork OAI server will drop the search results and
  refuse to recognize the resumption token. The aim of this feature is to ensure
  that resources in the GeoNetwork OAI server are released.

- **Cache size**: The maximum number of concurrent OAI harvests that the GeoNetwork OAI server can support.


Restart the catalog to take all OAI settings into account.

INSPIRE Directive configuration
```````````````````````````````
See :ref:`inspire-configuration`.

INSPIRE Atom Feed
`````````````````

Allows to define the configuration of Atom Feeds referenced by the metadata to provide services related to the `INSPIRE technical guidance for download services <http://inspire.ec.europa.eu/documents/Network_Services/Technical_Guidance_Download_Services_3.0.pdf>`_:

- Select the type of atom feed:

  - Remote: retrieve the atom feeds referenced by the metadata in the online resources.

  - Local (to implement in future versions): create the atom feed using the metadata content.

- Schedule for feed retrieval: the retrieval of the atom feeds can be scheduled to be done periodically.

- Atom protocol value: value of the protocol in the metadata online resources to identify the atom feed resources (the default value is INSPIRE Atom). GeoNetwork identifies an Atom file from other resources by looking at the protocol value of the onlineresource. Since there is no general accepted value for this protocol, GeoNetwork allows an administrator to set the value to be used as protocol identifying Atom resources::

                  <gmd:transferOptions>
                      <gmd:MD_DigitalTransferOptions>
                        <gmd:onLine>
                          <gmd:CI_OnlineResource>
                            <gmd:linkage>
                              <gmd:URL>http://geodata.nationaalgeoregister.nl/atom/index.xml</gmd:URL>
                            </gmd:linkage>
                            <gmd:protocol>
                              <gco:CharacterString>INSPIRE Atom</gco:CharacterString>
                            </gmd:protocol>
                          </gmd:CI_OnlineResource>
                        </gmd:onLine>
                      </gmd:MD_DigitalTransferOptions>
                    </gmd:transferOptions>



The following services are available:

- http://SERVER/geonetwork/opensearch/eng/UUID/OpenSearchDescription.xml
- http://SERVER/geonetwork/opensearch/eng/UUID/search?queryParams
- http://SERVER/geonetwork/opensearch/eng/search?queryParams
- http://SERVER/geonetwork/opensearch/eng/UUID/describe?queryParams
- http://SERVER/geonetwork/opensearch/eng/describe?queryParams

In above URLs {UUID} is the fileidentifier of the download service metadata.

In the  service feed of your download service make sure to add the GeoNetwork OpenSearch endpoint as the OpenSearchDescription for the service::

                  <link rel="search" href="http://SERVER/geonetwork/opensearch/eng/{uuid}/OpenSearchDescription.xml" 
                  type="application/opensearchdescription+xml" title="Open Search document for INSPIRE Download service"/>


The INSPIRE Atom/OpenSearch implementation can be verified with the Atom tests in Esdin Test Framework (http://elfproject.eu/documentation/geotool/etf) or INSPIRE metadata validator (http://inspire-geoportal.ec.europa.eu/validator2).





Multi-Threaded Indexing
```````````````````````

Configuration settings in this group determine how many processor threads are allocated to indexing tasks in GeoNetwork. If your machine has many processor cores, you can now determine how many to allocate to GeoNetwork indexing tasks. This can bring dramatic speed improvements on large indexing tasks (eg. changing the privileges on 20,000 records) because GeoNetwork can split the indexing task into a number of pieces and assign them to different processor cores.

*Number of processing threads* The maximum number of processing threads that can be allocated to an indexing task.

Note: this option is only available for databases that have been tested. Those databases are PostGIS and Oracle. You should also carefully consider how many connections to the database you allocate in the database configuration as each thread could tie up one database connection for the duration of a long indexing session (for example). See the advanced configuration for more details of how to configure the number of connections in the database connection pool.


Multilingual Settings
`````````````````````

Options in this group determine how GeoNetwork will search metadata in multiple languages.

*Enable auto-detecting search request language:* If this option is selected, GeoNetwork will analyse the search query and attempt to detect the language that is used before defaulting to the GUI language.

*Search results in requested language sorted on top:* If this option is selected, a sort clause will be added to each query to ensure that results in the current language are always sorted on top. This is different from increasing priority of the language in that it overrides the relevance of the result.  For example, if a german result has very high relevance but the search language is french then the french results will all come before the german result.

*Search only in requested language* The options in this section determines how documents are sorted/prioritised relative to the language in the document compared to the search language.

- *All documents in all languages (No preferences)* - The search language is ignored and will have no effect on the ordering of the results

- *Prefer documents with translations requested language* - Documents with a translation in the search language (anywhere in the document) will be prioritized over documents without any elements in the search language

- *Prefer documents whose language is the requested language* - Documents that are the same language as the search language (ie. the documents that are specified as being in the same language as the search language) are prioritized over documents that are not.

- *Translations in requested language* - The search results will only contain documents that have some translations in the search language.

- *Document language is the requested language* - The search results will contain documents whose metadata language is specified as being the in search language



Metadata Views
``````````````

Options in this section enable/disable metadata element groups in the metadata editor/viewer.

*Enable simple view*: The simple view in the metadata editor/viewer:
- removes much of the hierarchy from nested metadata records (such as ISO19115/19139)
- will not let the user add metadata elements that are not already in the metadata record
It is intended to provide a flat, simple view of the metadata record. A disadvantage of the simple view is that some of the context information supplied by the nesting in the metadata record is lost.
*Enable ISO view*: The ISO19115/19139 metadata standard defines three groups of elements:
- Minimum: those elements that are mandatory
- Core: the elements that should be present in any metadata record describing a geographic dataset
- All: all the elements
*Enable INSPIRE view*: Enables the metadata element groups defined in the EU INSPIRE directive.
*Enable XML view*: This is a raw text edit view of the XML record. You can disable this if (for example), you don't want inexperienced users to be confused by the XML presentation provided by this view.

Metadata Privileges
```````````````````

*Only set privileges to user's groups*: If enabled then only the groups that the user belongs to will be displayed in the metadata privileges page (unless the user is an Administrator). At the moment this option cannot be disabled and is likely to be deprecated in the next version of GeoNetwork.

.. _editing_harvested_records:

Harvesting
``````````

*Allow editing on harvested records*: Enables/Disables editing of harvested records in the catalogue. By default, harvested records cannot be edited.

