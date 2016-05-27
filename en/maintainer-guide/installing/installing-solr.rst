.. _installing-solr:

Installing Solr
###############


If users want to analyze WFS data (See :ref:`analyzing_data`), a
`Solr <http://lucene.apache.org/solr/>` instance can be installed next to the catalog.

Manual installation
-------------------

Download Solr from http://lucene.apache.org/solr/mirrors-solr-latest-redir.html
and unzip the file.


.. code-block:: shell

    cd solr/solr-config
    wget http://apache.crihan.fr/dist/lucene/solr/6.0.0/solr-6.0.0.tgz
    tar xvfz solr-6.0.0.tgz


Manually start and stop Solr using:

.. code-block:: shell

    solr-6.0.0/bin/solr start -c -p 8984


Then create the default collection:


.. code-block:: shell

    solr-6.0.0/bin/solr create -p 8984 -c catalog_srv -d src/main/solr-cores/catalog


Stop Solr using

.. code-block:: shell

    solr-6.0.0/bin/solr stop



Install using maven
-------------------


Running from the source code, use maven to download Solr and additional libraries.

.. code-block:: shell

    cd solr/solr-config
    mvn install -Psolr-download
    mvn install -Psolr-init
    mvn exec:exec -Dsolr-start


To stop Solr when using maven, simply stop the process as Solr is started in
foreground mode.


Check Solr installation
-----------------------

Access Solr admin page from http://localhost:8984/solr.


