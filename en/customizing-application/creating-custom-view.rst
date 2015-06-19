.. _creating-custom-view:

Customized Metadata Views
#########################

GeoNetwork facilitates developers to easily change or add a metadata view. A User can change the view to his/her needs.

By default the initial view is an AngularJS view on the results returned from the search service. Therefor the view can only contain the fields from the Lucene Index. If you require more fields, you can either add fields to the index or don't use the AngularJS view.

The AngularJS view can be adjusted to your needs by adapting: 
/catalog/views/default/templates/recordView.html

Metadata views are called 'formatters'. They are located in the schema-plugin related to the metadata that you are formatting. Formatters use either XSLT or Groovy to transform the XML to the required format (html, xml, pdf, json).

It's possible to update formatters from the web interface. In the admin panel at 'metadata and templates', there is a tab 'formatters'. On this page you can upload, change and preview formatters.

    .. figure:: img/formatter.png




After having created a new formatter you will have to update your application code, so the new formatter-output can be visualised from your application. If the goal of the formatter is to introduce a new html view on metadata, then you can add a reference to it in /catalog/views/default/config.js (searchSettings.formatter.list).


