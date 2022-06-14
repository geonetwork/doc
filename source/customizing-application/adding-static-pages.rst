.. _adding-static-pages:

Adding static pages
###################

This feature allows to store the HTML content for static pages and show the links to these pages in specific sections of the user interface:

- The HTML content is stored in a new table of the GN's database.
- The link to pages can be showed in different points of the GN's GUI according to a list of "sections" associated to each page. In this PR is introduced the support to show the links for the top toolbar and the footer.
- Each page can be in 3 states:

    - `HIDDEN`: visible to administrator.
    - `PRIVATE`: visible to logged users.
    - `PUBLIC`: visible to everyone.

- Pages can be added to different page sections. Currently the sections implemented are `TOP` (top menu of the main page) and `FOOTER` (footer of the main page).

- Only the administrator can edit the pages and see the pages in `HIDDEN` status.
- The creation and the management of the content is done via the API.

    .. figure:: img/pages-api.png

Some restrictions:

- It is not possible to apply custom CSS to the page.
- Any external image must be loaded externally.

Examples of API usage
---------------------

Before executing the following examples, see :ref:`example-csrf-curl` for details on the usage of the CSRF token (instead of the value ``"X-XSRF-TOKEN: e934f557-17a3-47f2-8e6b-bdf1a3c90a97"`` used in the examples) and cookies in the requests.

Load a page in the top menu bar
```````````````````````````````

In this example we're going to upload a file `contactus.html` and link it in the top menu:

1. Load the content by using the method POST ``/api/pages/``, the mandatory fields are:

    - ``language`` (3 letters like 'eng', 'ita', 'fra' ...)
    - ``pageId`` (the identifier/link description of the page): this value should be encoded.
    - ``format`` (must be LINK if a link is associated to the page)
    - ``content``

        - data (a file with the page content) or
        - a link (URL to another page). The link should be encoded.

      Define both is not possible.


.. code-block:: bash

    $ rm -f /tmp/cookie; curl -c /tmp/cookie http://localhost:8080//srv/eng/info\?type\=me -X POST; cat /tmp/cookie

    # Grab the XSRF token from the previous file, in the following example: e934f557-17a3-47f2-8e6b-bdf1a3c90a97
    $ curl -X POST "http://localhost:8080/geonetwork/srv/api/pages/?language=eng&pageId=Contact%20us&format=LINK" -H "accept: */*" -H "Content-Type: multipart/form-data" -H "X-XSRF-TOKEN: e934f557-17a3-47f2-8e6b-bdf1a3c90a97" -d contactus.html --user admin:admin -b /tmp/cookie


At this point the page is created but not visible because is in status HIDDEN and is not loaded explicitly in any section of the page, except DRAFT that is not visible (in the future could be added to a page with an editor interface).

2. To associate the link to the top bar is necessary to use the method POST ``/api/pages/{language}/{pageId}/{section}`` with the ``TOP`` value for the section.

.. code-block:: bash

    $ curl -X POST "http://localhost:8080/geonetwork/srv/api/pages/eng/Contact%20us/TOP" -H "accept: */*" -H "X-XSRF-TOKEN: e934f557-17a3-47f2-8e6b-bdf1a3c90a97" --user admin:admin -b /tmp/cookie

3. By default, the link to display the page is created as PRIVATE, visible only to logged users, to make it visible to all users is necessary to use the method PUT ``/api/pages/{language}/{pageId}/{status}`` with the ``PUBLIC`` value for the status.

.. code-block:: bash

    $ curl -X PUT "http://localhost:8080/geonetwork/srv/api/pages/eng/Contact%20us/PUBLIC" -H "accept: */*" -H "X-XSRF-TOKEN: e934f557-17a3-47f2-8e6b-bdf1a3c90a97" --user admin:admin -b /tmp/cookie


Similar requests should be done for each UI language supported.

Load a link in the footer bar
`````````````````````````````

In this example we're going to add a link to an external resource http://myorganisation/contactus.html and link it in the footer:

1. Add the link by using the method POST ``/api/pages/`` with the ``link`` parameter in the request.


.. code-block:: bash

    $ rm -f /tmp/cookie; curl -c /tmp/cookie http://localhost:8080//srv/eng/info\?type\=me -X POST; cat /tmp/cookie

    # Grab the XSRF token from the previous file, in the following example: e934f557-17a3-47f2-8e6b-bdf1a3c90a97
    $ curl -X POST "http://localhost:8080/geonetwork/srv/api/pages/?language=eng&pageId=Contact%20us&format=LINK&link=http://myorganisation/contactus.html" -H "accept: */*" -H "accept: */*" -H "X-XSRF-TOKEN:  e934f557-17a3-47f2-8e6b-bdf1a3c90a97" --user admin:admin -b /tmp/cookie

2. To associate the link to the footer is necessary to use the method POST ``/api/pages/{language}/{pageId}/{section}`` with the ``FOOTER`` value for the section.

.. code-block:: bash

    $ curl -X POST "http://localhost:8080/geonetwork/srv/api/pages/eng/Contact%20us/FOOTER" -H "accept: */*" -H "X-XSRF-TOKEN: e934f557-17a3-47f2-8e6b-bdf1a3c90a97" --user admin:admin -b /tmp/cookie

3. By default, the link is created as PRIVATE, visible only to logged users, to make it visible to all users is necessary to use the method PUT ``/api/pages/{language}/{pageId}/{status}`` with the ``PUBLIC`` value for the status.

.. code-block:: bash

    $ curl -X PUT "http://localhost:8080/geonetwork/srv/api/pages/eng/Contact%20us/PUBLIC" -H "accept: */*" -H "X-XSRF-TOKEN: e934f557-17a3-47f2-8e6b-bdf1a3c90a97" --user admin:admin -b /tmp/cookie

Similar requests should be done for each UI language supported.

Remove a page from a section
````````````````````````````

To remove a page from a section DELETE ``/api/pages/{language}/{pageId}/{section}``

.. code-block:: bash

    $ curl -X DELETE "http://localhost:8080/geonetwork/srv/api/pages/eng/contactus?format=LINK" -H "accept: */*" -H "X-XSRF-TOKEN: e934f557-17a3-47f2-8e6b-bdf1a3c90a97"  --user admin:admin -b /tmp/cookie


Change the page status
``````````````````````

The status of the page can be changed with the method PUT ``/api/pages/{language}/{pageId}/{status}`` where status could assume these values:

    - `PUBLIC` - Visible to every user
    - `PUBLIC_ONLY` - Visible to not logged users
    - `PRIVATE` - Visible to logged users
    - `HIDDEN` - Hidden to anyone

Other methods in the API are to change/delete a page and to GET the list of the pages or the info of a specific one.