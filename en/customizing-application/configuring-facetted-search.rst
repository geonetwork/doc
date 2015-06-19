.. _configuring-facetted-search:

Configuring facetted search
###########################


Faceted search provides a way to easily filter search:

In WEB-INF/config-summary.xml, catalogue administrator can configure the faceted search displayed in the search page.

In the hits section, new facet could be added::

    <hits>
      <item name="keyword" plural="keywords" indexKey="keyword" max="15"/>


An item element defines a facet with the following parameters:

* name: the name of the facet (ie. the tag name in the XML response)
* plural: the plural for the name (ie. the parent tag of each facet values)
* indexKey: the name of the field in the index
* (optional) sortBy: the ordering for the facet. Defaults is by count.
* (optional) sortOrder: asc or desc. Defaults is descendant.
* (optional) max: the number of values to be returned for the facet. Defaults is 10.

When an item is modified or added, reload the lucene configuration and rebuild the index from the administration panel.
