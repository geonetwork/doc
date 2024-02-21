.. _associating_resources_filestore:

Uploading attachments
#####################

.. versionadded:: 3.2

If documents are not available, editors can upload attachments to a
metadata record. The attachment is added to the filestore. The filestore
can contain any kind of files.


.. figure:: img/filestore.png

To upload a file, click the button and choose a file or drag&drop a file
on the button. Files are stored in a folder in the data directory
(see :ref:`customizing-data-directory`). There is one folder per metadata containing:

* ``public`` folder with files accessible to all users

* ``private`` folder with files accessible to identified user with download privilege
  (see :ref:`managing-privileges`)


From the filestore:

* click the file name to set the URL for the current document to attach

* click the eye icon to view the document

* click the locker to change the document visibility

* click the cross to remove the file.


A file uploaded in this way will be exported in the metadata export file (MEF).
Therefore, its URL will not be automatically added to the metadata. The URL is added
when attaching the document to a specific element in the metadata (eg. overview,
quality report, legend).



Filestore configuration
~~~~~~~~~~~~~~~~~~~~~~~

By default, the maximum file size is set to 100Mb. For building purposes this limit is set in
:code:`/services/src/main/resources/config-spring-geonetwork.xml` with the
parameter ``maxUploadSize``.

For deployment or in a running web application the value for ``maxUploadSize`` can be adjusted in ``WEB-INF/config.xml`` accordingly:

.. code-block:: xml

   <general>
       <!-- Size must be in megabyte (integer), 100MB by default -->
       <maxUploadSize>5000</maxUploadSize>
       <uploadDir>./data/tmp</uploadDir>
       <debug>false</debug>
   </general>
