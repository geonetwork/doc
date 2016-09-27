.. _tuto-introduction-setup:

Setup
#####

Change Administrator Password
=============================

The first step you should do after deploying GeoNetwork is login with the administrator user and change the administrator password. The default administrator user is called *admin* and the password is *admin*. Once you have logged in, you have to enter the administration console to configure the basics.

Change your admin password here:

http://localhost:8080/geonetwork/srv/eng/admin.console#/organization/users?userOrGroup=admin

.. image:: img/password.png

Basic Settings
==============

Then, go to the settings page:

http://localhost:8080/geonetwork/srv/eng/admin.console#/settings

There are a few configuration values here that should be changed like the url domain for your catalog, if it is going to use https or the title for your catalog.

.. image:: img/catalogServer.png

.. image:: img/hostandname.png

Loading Schemas
===============

The last important thing to configure is what schemas are we going to use in our catalog. By default, GeoNetwork has already installed some of the most used schemas. These schemas can be enabled on the administration console too:

http://localhost:8080/geonetwork/srv/eng/admin.console#/metadata

.. image:: img/schemas.png

Your catalog is now ready to be used. We can start adding data to it.

Creating Users
==============

Although you can enable user self-registration, it is more usual to create the users manually, so you control exactly who have access to what. The catalog uses the concept of Users, Groups and User Profiles.

 * A User can be part of one or more Groups.
 * A User has a Role in a Group.
 * The Administrator Role is not related to a Group.

Users can have different roles in different groups. A role defines what tasks the user can perform.

To add a new user to the GeoNetwork system you do the following:

 * Select the Administration button in the menu. On the Administration page, select User management.
 * Click the button Add a new user;
 * Provide the information required for the new user;
 * Assign the correct profile;
 * Assign the user to a group;
 * Click on Save.

Creating Groups
===============

To create new groups you should be logged on with an account that has Administrative privileges.

 * Select the Administration button in the menu. On the Administration page,  select Group management.
 * Select Add a new group. You may want to remove the Sample group;
 * Fill out the details. The email address will be used to send feedback on data downloads when they occur for resources that are part of the Group.
 * Click on Save

Access privileges can be set per metadata record. You can define privileges on a per Group basis.

See more on :ref:`configuring-the-catalog`.
