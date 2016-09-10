.. _manual-update:

Manual update
#############

Minor Upgrade
-------------

A minor upgrade is when there have been no database changes since your last upgrade.

Follow these steps:

1. Back up current installation

   - Database (e.g., PostgreSQL)
   - Webapp ``web-ui/src/main/``

2. Deploy new installation

   - Stop Tomcat
   - Remove previous installation folder
   - Place new GeoNetwork WAR file in Tomcat's webapp folder
   - Start Tomcat to deploy web archive

3. Reinstate data

   - Stop Tomcat
   - Replace with backups

     - Database config: ``web-ui/src/main/WEB-INF/config-node/srv.xml``
     - Database properties: ``web-ui/src/main/WEB-INF/config-db/jdbc.properties``
     - Data folder: ``web-ui/src/main/WEB-INF/data``

   - Start Tomcat

.. note:: If you previously created a custom view, you will need to add the view to ``web-ui/src/main/catalog/views/your_view``. Then go into admin settings page and set the ``system/ui/defaultView`` to ``your_view``.