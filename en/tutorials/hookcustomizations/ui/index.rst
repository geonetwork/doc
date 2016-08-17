.. _tuto-hookcustomizations-ui:

Adding new User Interface
#########################

To completely understand this part of the tutorial, it would be good to be familiarized with the :ref:`tuto-customui` tutorial first.

In GeoNetwork you can have more than one style installed on the same deployment. You can select which style to use on the Settings manager. Also, you can use the parameter "?view=$name" to force a specific style on a page request.

Now, we are going to create our custom style on the separated maven project we created before. First we define the minimal user interface customization so we can test that our style is being generated and used.

We  need an empty file on the custom/src/main/resources/catalog/views/custom/less/gn_search_custom.less path

Then we need to define the basic Angular module that will be used on this style. Create a file on custom/src/main/resources/catalog/views/custom/module.js and add the following content:

  .. code::javascript

 (function() {
 goog.provide('gn_search_custom');
 goog.require('gn_search');
 var module = angular.module('gn_search_custom', ['gn_search']);
 })();

Next we create a new file on custom/src/main/resources/catalog/views/custom/templates/index.html and add the following content:

 ::

 <div>This is my custom GeoNetwork</div>

Finally we have to tell the wro4j library where our files will be. Edit the file web-ui/src/main/resources/WEB-INF/classes/web-ui-wro-sources.xml and add our folders:

 ::

 <require pathOnDisk="web-ui/src/main/resources" >
 <jsSource webappPath="/catalog/js/" />
 <jsSource webappPath="/catalog/views/default/" />
 <jsSource webappPath="/catalog/views/custom/" />
 <jsSource webappPath="/catalog/components/" />
 <cssSource webappPath="/catalog/views/default/" />
 <cssSource webappPath="/catalog/views/custom/" />
 <cssSource webappPath="/catalog/style/" />
 <cssSource webappPath="/catalog/lib/bootstrap-table/dist" />
 </require>

Now, if we build, deploy and enter GeoNetwork, we can use this new style called "custom": http://localhost:8080/geonetwork/srv/eng/catalog.search?view=custom

You can import the default style to have an easy start on your new style.

Edit custom/src/main/resources/catalog/views/custom/less/gn_search_custom.less and add the following line:

  .. code::javascript

  @import "gn_search_default.css";

Then make the Angular module dependant of the default Angular UI module. Edit custom/src/main/resources/catalog/views/custom/module.js and replace the contents with:

  .. code::javascript

 (function() {
 goog.provide('gn_search_custom');
 goog.require('gn_search_default');
 var module = angular.module('gn_search_custom', ['gn_search_default']);
 })();


Finally, replace the file custom/src/main/resources/catalog/views/custom/templates/index.html with the contents of the file web-ui/src/main/resources/catalog/views/default/templates/index.html

You hace now a duplicate of the default style you can improve with your own customizations.

One of the main advantages of having your code decoupled is that you can override some of the files that comes by default on the GeoNetwork user interface and this overriding will not collide with future upgrades of the code.

