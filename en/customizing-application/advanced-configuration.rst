.. _advanced-configuration:

Advanced configuration
######################

.. _session-timeout-configuration:

User session timeout configuration
----------------------------------


Default session timeout is set to 35 minutes (See :ref:`user-session`). This timeout can be configured in
WEB-INF/web.xml by changing the value


.. code-block:: xml

    <session-config>
        <session-timeout>${sessionTimeout}</session-timeout>
    </session-config>


For developers, the timeout is defined as a build property and can be customized
in filters. See :code:`web/src/main/filters/dev.properties#L20`