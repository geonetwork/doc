.. _tuto-introduction-setup:

Setup
#####

The first step you should do after deploying GeoNetwork is login with the administrator user and change the administrator password. The default administrator user is called *admin* and the password is *admin*. Once you have logged in, you have to enter the administration console to configure the basics.

Change your admin password here:

http://localhost:8080/geonetwork/srv/eng/admin.console#/organization/users?userOrGroup=admin

.. image:: img/password.png

Then, go to the settings page:

http://localhost:8080/geonetwork/srv/eng/admin.console#/settings

There are a few configuration values here that should be changed like the url domain for your catalog, if it is going to use https or the title for your catalog.

.. image:: img/catalogServer.png

.. image:: img/hostandname.png

The last important thing to configure is what schemas are we going to use in our catalog. By default, GeoNetwork has already installed some of the most used schemas. These schemas can be enabled on the administration console too:

http://localhost:8080/geonetwork/srv/eng/admin.console#/metadata

.. image:: img/schemas.png

Your catalog is now ready to be used. We can start adding data to it.

See more on :ref:`configuring-the-catalog`.
