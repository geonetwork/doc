.. _writing-documentation:


Writing documentation
#####################

This section provides some guidelines for writing consistent documentation
for |project_name|.



.. seealso::

  The quickest and easiest way to contribute to the documentation is to sign up
  for a `GitHub account <https://github.com/>`_ and edit the documentation pages by clicking the 
  "Edit on GitHub" link at the top of the page. (See :repo:`doc`).


Building the docs
=================

The following tools are required to build the documentation from source:

*  **Java JDK 1.8**
*  **Maven 3.1.0+**: Once installed `Maven <https://maven.apache.org>`_ should be available in your command shell as ``mvn``.
*  **Sphinx**: See `Sphinx <https://www.sphinx-doc.org/en/master/usage/installation.html>`_  for details. Once installed confirm it's available by running ``sphinx-build --version``.
*  **sphinx-bootstrap-theme**: Install using ``pip install sphinx-bootstrap-theme``.
   
Then build the documentation using the following commands:

.. code-block:: shell

    git clone https://github.com/geonetwork/doc
    cd doc
    mvn clean install

Once the documentation has built without errors, access the html files from ``doc\target\en\index.html``.


Editing the reStructuredText files
==================================

To update the documentation, use a text editor to edit ``.rst`` files. Save
your changes, build the documentation and open the HTML files to preview
the changes. When your changes are ready to be submitted to the project, follow
the steps in :ref:`making-a-pull-request`.



Sphinx
======

This section gives some useful tips about using Sphinx.


Don’t introduce any new warnings
--------------------------------

When building the docs, Sphinx prints out warnings about broken links,
syntax errors and so on. Don't introduce new ones.


It’s best to delete the build directory and completely rebuild the docs,
to check for any warnings:

.. code-block:: shell

    mvn clean install


Links
-----

Images
~~~~~~

Place images in an ``img`` folder in the directory where the rst file is
located. Use images with:

.. code-block:: rst

     .. figure:: img/thumbprint.png

Code block
~~~~~~~~~~

Use the following directive to highlight code block:


.. code-block:: rst


      .. code-block:: xml


Reference to a section within a file
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

When creating a new page, add a reference on top of the file:

.. code-block:: rst

    .. _writing-documentation:

This reference could then be used to link to that page or section:

.. code-block:: rst

    :ref:`writing_documentation`


Link to GitHub resources
~~~~~~~~~~~~~~~~~~~~~~~~

The conf.py contains a set of `external links definition
<http://sphinx-doc.org/latest/ext/extlinks.html>`_.

.. code-block:: rst

   * :issue:`123` to link to an issue
   * :pr:`123` to link to a pull request
   * :code:`web/pom.xml` to link to a file in the source code
   * :repo:`schema_plugins` to link to a repository
   * :wiki:`Meeting2015Bern` to link to a wiki page


Example, link to the Bern User Meeting (See :wiki:`Meeting2015Bern`).


Substitutions
-------------

`Substitutions <http://sphinx-doc.org/rest.html#substitutions>`_ are useful
to define a value that's needed in many places (eg. the location
of a file, etc.).

The values are defined in ``rst_epilog`` in conf.py:

.. code-block:: rst

    .. |jdbc.properties| replace:: WEB-INF/config-db/jdbc.properties


Use them when appropriate:

.. code-block:: rst

    Configure the database in |jdbc.properties| ...


    After installation look to |install.homepage|_ on your web browser.



versionadded, versionchanged and deprecated
-------------------------------------------

Use Sphinx's ``versionadded`` and ``versionchanged`` directives to mark new or
changed features. For example:


.. code-block:: rst


    Creating overview from WMS
    ==========================

    .. versionadded:: 3.0

    In the *add overview panel*, select the *add from WMS* link to create
    an image from the WMS referenced in the metadata record to illustrate
    the dataset in a specific area.

    ...

When using the ``versionchanged`` directive, a sentence explaining what
changed is usually relevant:

.. code-block:: rst


    Configuring LDAP
    ================

    .. versionchanged:: 2.10.0
       Previous versions was setting LDAP parameters from the administration
       panel.

    ...


Use ``deprecated`` directive when a feature is no longer available.


seealso
-------

Many sections include a list of references to module documentation or external
documents. These lists are created using the ``seealso`` directive
typically placed in a section just before any subsections.

