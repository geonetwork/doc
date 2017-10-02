.. _customizing-security:

Customizing the security
########################

This section describe how to configure security related elements in the application.

Prevent clickjacking attacks
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

GeoNetwork has enabled by default a servlet filter to add http headers used to prevent clickjacking attacks (see https://www.owasp.org/index.php/Clickjacking_Defense_Cheat_Sheet).

The servlet filter is configured in the file ``WEB-INF/web.xml`` in the following snippet:

.. code-block:: xml

    <filter>
        <filter-name>XFrameOptionsFilter</filter-name>
        <filter-class>
            org.fao.geonet.web.XFrameOptionsFilter
        </filter-class>
        <!-- Mode: DENY, SAMEORIGIN, ALLOW-FROM. Any other value will default to DENY
            - DENY: prevents any domain from framing the content.
            - SAMEORIGIN, which only allows the current site to frame the content.
            - ALLOW-FROM uri, which permits the specified 'uri' to frame this page.
                Not all browsers support this mode.
        -->
       <init-param>
        <param-name>mode</param-name>
            <param-value>DENY</param-value>
        </init-param>
        <!-- Allowed url. Used in ALLOW-FROM mode only -->
        <!--<init-param>
            <param-name>url</param-name>
            <param-value>http://localhost:8888/</param-value>
        </init-param>-->
    </filter>

    <filter-mapping>
        <filter-name>XFrameOptionsFilter</filter-name>
        <url-pattern>/*</url-pattern>
    </filter-mapping>


The following modes supported:

- DENY: prevents any domain from framing the content.
- SAMEORIGIN, which only allows the current site to frame the content.
- ALLOW-FROM uri, which permits the specified 'uri' to frame this page. **Not all browsers support this mode.**


The filter adds the following http headers: ``X-Frame-Options`` and ``Content-Security-Policy``.

By default, the ``DENY`` mode is enabled, that prevents any domain from framing the content.