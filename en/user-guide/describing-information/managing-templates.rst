.. _creating-templates:

Creating templates
##################

Templates are metadata records that you can use when starting describing a new
resources. This section describe how to load and manage templates.

Creating and managing templates
-------------------------------

Templates are managed similarly in the catalog as metadata records,
but they have a special 'template'-tag. They can be created, updated and removed
in the ``contribute`` section.


Metadata records can be converted to templates and vice versa at any time from the
metadata editor using the ``save as template`` button.


.. figure:: img/save-as-templates.png

Templates can be assigned to limited groups, so only these groups can use
the template in their work process (See :ref:`managing-privileges`).


Loading default templates
-------------------------

The ``Metadata and Templates`` page in the Administration page allows to see
available standards.

.. figure:: img/metadata-and-templates.png


From that page, user can for each standards:

- load default samples
- load default templates

... if any provided in the schema plugin.



You have to be logged in as an administrator to access this page and function. 

.. figure:: img/templates.png

Importing templates
-------------------

Another way of loading templates, is to use the metadata import page where
XML files can be imported and selecting the type of record: ``template``.


.. figure:: img/import-template.png


Creating your own templates
---------------------------

Each standard provides defaults samples but you should consider spending
some times on building your own template in order to make editing task
as easy as possible depending on:

- the type of resources to describe (eg. template for paper maps)
- the structure of your organization (eg. defining templates per services)
- the type of usage of the metadata (eg. public use, internal use, data quality)
- the type of users
- ...


In a template, you should try to:

- set as many default values as you can (eg. define default contact)
- create elements that your encoding guideline recommend (to not spend time
  on searching elements in the advanced view)
- provide instructions

The main goal is to guide editor work without requiring too much knowledge
of the standard use.

For further customization, you could improve the schema plugin by defining
custom documentation, recommended values, ... (see :ref:`implementing-a-schema-plugin`)
or creating custom view (see :ref:`creating-custom-editor`).


