.. _advanced-configuration:

Advanced configuration
######################

.. _session-timeout-configuration:

User session timeout configuration
----------------------------------


Default session timeout is set to 35 minutes (See :ref:`user-session`).
This timeout can be configured in ``WEB-INF/web.xml`` by changing the value
of the session-timeout (time is in minute):


.. code-block:: xml

    <session-config>
        <session-timeout>35</session-timeout>
    </session-config>


For developers, the timeout is defined as a build property and can be customized
in filters. See :code:`web/src/main/filters/dev.properties#L20`


.. _enabling-drafts:

Enabling Drafts
---------------

This feature is disabled on GeoNetwork by default. It can be enabled in ``WEB-INF/config-spring-geonetwork.xml`` by uncommenting the following lines:

.. code-block:: xml

    <bean class="org.fao.geonet.kernel.metadata.draft.DraftMetadataIndexer"
        lazy-init="false"
       primary="true"/>
    <bean class="org.fao.geonet.kernel.metadata.draft.DraftMetadataManager"
        lazy-init="false"
       primary="true"/>
    <bean class="org.fao.geonet.kernel.metadata.draft.DraftMetadataUtils"
        lazy-init="false"
       primary="true"/>
    <bean class="org.fao.geonet.kernel.metadata.draft.DraftMetadataSchemaUtils"
       lazy-init="false"
       primary="true"/>
    <bean class="org.fao.geonet.kernel.metadata.draft.DraftMetadataCategory"
       lazy-init="false"
       primary="true"/>
    <bean class="org.fao.geonet.kernel.metadata.draft.DraftPublish"
       lazy-init="false"
       primary="true"/>
    <bean class="org.fao.geonet.kernel.metadata.draft.DraftUnpublish"
       lazy-init="false"
       primary="true"/>

When a published metadata is edited, a new copy is saved on both the database and the index marked with the `draft` flag. This way a user with the right privileges can view, search and edit published metadata without modifying what the rest of the users see about this metadata. This is specially useful for long editings (that last more than one session) or edits that need some kind of review from several users before getting published.

Once the draft copy is published, the original published metadata gets replaced with the draft copy and the draft is removed from the system.
