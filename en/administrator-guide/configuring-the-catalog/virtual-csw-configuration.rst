.. _virtual-csw-configuration:


Configuring virtual CSW
#######################

This feature of CSW server adds the capability to create custom CSW entry points that apply extra criteria to the CSW requests, allowing to implement several useful cases like, for example:

* Define an INSPIRE CSW entry point to deliver only the INSPIRE related metadata stored in the catalog.
* Define CSW entry points to deliver only metadata related to specific theme/s: climate, boundaries, etc.

The CSW service entry points are defined in the configuration file ``WEB-INF/config-csw-servers.xml`` using the following syntax::

    <service name="csw-with-my-filter-environment">
       <class name=".services.main.CswDispatcher" >
               <param name="filter" value="+inspirerelated:on +themekey:environment"/>
       </class>
    </service>

    <service name="csw-with-my-filter-climate">
       <class name=".services.main.CswDispatcher" >
               <param name="filter" value="+inspirerelated:on +themekey:climate"/>
       </class>
    </service>

The ``filter`` parameter value should use the Lucene query parser syntax (see http://lucene.apache.org/java/2_9_1/queryparsersyntax.html) and is use in these CSW operations:

* *GetRecords*: the ``filter`` is applied with the CSW query as an extra query criteria.
* *GetRecordById*: the ``filter`` is applied with the metadata ``id`` requested as an extra query criteria.
* *GetDomain*: the ``filter`` is applied as a query criteria to retrieve the metadata properties requested.
* *GetCapabilities*: the ``filter`` is applied as a query criteria to fill the metadata keywords list in the GetCapabilities document.

The list of available Lucene index fields to use in the ``filter`` parameter can be obtained from the files ``index-fields.xsl`` in the schema folders located in ``WEB-INF/xml/schemas``.

As Harvest and Transaction operations are not affected by ``filter`` parameter, to avoid confusion is better to use this feature as readonly CSW endpoints.

Configuration
`````````````

Adding a new CSW entry point to GeoNetwork opensource requires these steps (suppose the new CSW entry point is call ``csw-with-my-filter-environment``):

* Create the service definition in the configuration file ``WEB-INF/config-csw-servers.xml`` with the custom filter criteria as describe before::

    <service name="csw-with-my-filter-environment">
       <class name=".services.main.CswDispatcher" >
               <param name="filter" value="+inspirerelated:on +themekey:environment"/>
       </class>
    </service>


* Define permissions for the service in the file ``WEB-INF/user-profiles.xml`` file::

    <profile name="Guest">
       <allow service="csw-with-my-filter-environment"/>

* Restart the application. The new CSW entry point is accessible in http://localhost:8080/srv/en/csw-with-my-filter-environment

Configuration using GeoNetwork overrides
````````````````````````````````````````

In this section is described how to use GeoNetwork overrides feature to configure a new CSW entry point. This feature allows to use different configurations to handle multiple deployment platforms. See additional documentation of this feature in :ref:`adv_configuration_overriddes`.

* Add the next override to a configuration override file, for example ``WEB-INF/config-overrides-csw.xml``::

    <overrides xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
     <!-- Add custom CSW service -->
     <file name=".*/WEB-INF/config-csw-servers.xml">
       <addXML xpath="services">
         <service name="csw-with-my-filter-environment">
           <class name=".services.main.CswDispatcher">
             <param name="filter" value="+inspirerelated:on +themekey:environment"/>
           </class>
         </service>
       </addXML>
     </file>
     <file name=".*/WEB-INF/user-profiles.xml">
       <addXML xpath="profile[@name='Guest']">
         <allow service="csw-with-my-filter-environment"/>
       </addXML>
     </file>
    </overrides>

For more information about configuration overrides see :ref:`adv_configuration_overriddes`

* Restart the application. The new CSW entry point is accessible in http://localhost:8080/srv/en/csw-with-my-filter-environment