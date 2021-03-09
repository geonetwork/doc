.. _updating:

Updating the application
########################

Since GeoNetwork 4.0.4, passwords stored in the database for the mail server, harvesters, etc. are encrypted with
`Jasypt <http://www.jasypt.org/>`__.

By default, a random encryption password is generated when GeoNetwork is started, if it is not already defined, and it
is stored in the file :file:`/geonetwork/WEB-INF/data/config/encryptor/encryptor.properties`. If you have set the
location of the data directory outside of the application, the file will be stored in this external location.
Read more at :ref:`customizing-data-directory`.

The file with the encryption settings **must be copied** to the new installation when upgrading the application;
otherwise, it will not be possible to decrypt the existing passwords stored in the database.

.. toctree::
   :maxdepth: 2

   automatic-update.rst
   manual-update.rst
