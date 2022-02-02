.. _version-406:

Version 4.0.6
#############

This new release of GeoNetwork contains a *lot* of improvements and
fixes made during the past 8 months that should make it much more easy
to use and customizable. This version also benefited from most of the
fixes and improvements made for the GeoNetwork 3.10 and 12 versions
during the past months.

Highlights
==========

-  Fix for the `log4shell
   CVE <https://en.wikipedia.org/wiki/Log4Shell>`__
-  A new flexible `JSON
   harvester <https://github.com/geonetwork/core-geonetwork/pull/5942>`__
   which currently supports CKAN, ODS and ESRI
-  Restyled `topics and
   categories <https://github.com/geonetwork/core-geonetwork/pull/5837>`__
   in the homepage
-  Better UI for the `harvester
   administration <https://github.com/geonetwork/core-geonetwork/pull/5926>`__
-  The possibility to `put the search map in the facets
   column <https://github.com/geonetwork/core-geonetwork/pull/6080>`__
-  Improvements to the search experience and facets
-  Improvements to the INSPIRE Atom feed
-  Improvements to the DOI creation process
-  Improvements to the Editor UI and Admin UI

Security
========

-  Bump log4j2 from 2.17.0 to 2.17.1 (`#6110 <https://github.com/geonetwork/core-geonetwork/pull/6110>`_)
-  Update log4j2 from 2.16.0 to 2.17.0 to address CVE-2021-45105 (`#6083 <https://github.com/geonetwork/core-geonetwork/pull/6083>`_)
-  Bump log4j-core and log4j-api from 2.15.0 to 2.16.0 (`#6079 <https://github.com/geonetwork/core-geonetwork/pull/6079>`_)
-  Update log4j2 from from 2.7 to 2.15.0 (`#6075 <https://github.com/geonetwork/core-geonetwork/pull/6075>`_)

Features and improvements
=========================

-  Display the alert message within the online resource popup (`#6109 <https://github.com/geonetwork/core-geonetwork/pull/6109>`_)
-  Updated keycloak to use the correct granted authority (`#6134 <https://github.com/geonetwork/core-geonetwork/pull/6134>`_)
-  DOI - add identifier / online resource url using the DOI proxy url
   (`#6124 <https://github.com/geonetwork/core-geonetwork/pull/6124>`_)
-  CSW Harvester / add typeahead support for filter field names (`#5796 <https://github.com/geonetwork/core-geonetwork/pull/5796>`_)
-  Sort groups and users in transfer ownership (`#6093 <https://github.com/geonetwork/core-geonetwork/pull/6093>`_)
-  Metadata update and internal reports updates (`#6082 <https://github.com/geonetwork/core-geonetwork/pull/6082>`_)
-  Service record for CSW capabilities - INSPIRE improvements (`#6081 <https://github.com/geonetwork/core-geonetwork/pull/6081>`_)
-  Update UI configuration selected by default: select the current node
   if defined in the configuration, otherwise the first one (`#6094 <https://github.com/geonetwork/core-geonetwork/pull/6094>`_)
-  Don’t allow to delete a group if it owns metadata (`#6072 <https://github.com/geonetwork/core-geonetwork/pull/6072>`_)
-  Confirmation dialog to delete an UI configuration (`#6092 <https://github.com/geonetwork/core-geonetwork/pull/6092>`_)
-  Replace Travis badge by Github Actions Badge (`#6097 <https://github.com/geonetwork/core-geonetwork/pull/6097>`_)
-  Enable to display map in left column of search UI (`#6080 <https://github.com/geonetwork/core-geonetwork/pull/6080>`_)
-  Add maven caching to GraphQL analysis (`#6085 <https://github.com/geonetwork/core-geonetwork/pull/6085>`_)
-  Editor / Error message fixes (`#6029 <https://github.com/geonetwork/core-geonetwork/pull/6029>`_)
-  Add the doi-get query for ISO19115-3.2018 standard (`#6065 <https://github.com/geonetwork/core-geonetwork/pull/6065>`_)
-  Add proxy level security support for map services (`#5941 <https://github.com/geonetwork/core-geonetwork/pull/5941>`_)
-  INSPIRE Atom feed / Update retrieve dataset UUID to handle multiple
   atom feed entries for the same dataset (`#6078 <https://github.com/geonetwork/core-geonetwork/pull/6078>`_)
-  Metadata get status service - return the status change date for all
   types of statuses (`#6074 <https://github.com/geonetwork/core-geonetwork/pull/6074>`_)
-  User custom dialog to ask for users / groups delete confirmation
   (`#6070 <https://github.com/geonetwork/core-geonetwork/pull/6070>`_)
-  Add a confirm popup when deleting a logo (`#6067 <https://github.com/geonetwork/core-geonetwork/pull/6067>`_)
-  Misc. updates to Dutch translations
-  Upgrade jsoup library (`#6057 <https://github.com/geonetwork/core-geonetwork/pull/6057>`_)
-  Update label texts for workflow dialog / actions. Fixes `#4992 <https://github.com/geonetwork/core-geonetwork/issue/4992>`_ (`#5840 <https://github.com/geonetwork/core-geonetwork/pull/5840>`_)
-  Opendata harvesting / add a resource for the landing page (`#6062 <https://github.com/geonetwork/core-geonetwork/pull/6062>`_)
-  Configuration option to restrict the usage of non-predefined map
   services in the Regions API. Related to #5166 (`#6045 <https://github.com/geonetwork/core-geonetwork/pull/6045>`_)
-  Change the forgot password message (`#6015 <https://github.com/geonetwork/core-geonetwork/pull/6015>`_)
-  Don’t display the delete button when creating a new group (`#6040 <https://github.com/geonetwork/core-geonetwork/pull/6040>`_)
-  Don’t display the reset password button when creating a new user
   (`#6041 <https://github.com/geonetwork/core-geonetwork/pull/6041>`_)
-  Use the Map projection Region API setting in Regions/geometry related
   services (`#6050 <https://github.com/geonetwork/core-geonetwork/pull/6050>`_)
-  Metadata status migration - add FK for relatedMetadataStatusId
   (`#6010 <https://github.com/geonetwork/core-geonetwork/pull/6010>`_)
-  Encode view parameter in URL (`#6030 <https://github.com/geonetwork/core-geonetwork/pull/6030>`_)
-  Uses Java 8 in the code analysis
-  Add support for UI settings migrations. Migration for
   mods.header.isMenubarAccessible (`#6044 <https://github.com/geonetwork/core-geonetwork/pull/6044>`_)
-  Enable CodeQL analysis in CI workflow
-  Add mimetype in WWW:DOWNLOAD protocol on OpenDataSoft harvesting
   (`#6043 <https://github.com/geonetwork/core-geonetwork/pull/6043>`_)
-  Metadata retired status support (`#5943 <https://github.com/geonetwork/core-geonetwork/pull/5943>`_)
-  Allow to reset the users / groups filters (`#6042 <https://github.com/geonetwork/core-geonetwork/pull/6042>`_)
-  Datacite formatter - process for creators only point of contacts with
   roles pointOfContact and custodian (`#6039 <https://github.com/geonetwork/core-geonetwork/pull/6039>`_)
-  Map viewer / support to add layers from ESRI Rest services (`#5931 <https://github.com/geonetwork/core-geonetwork/pull/5931>`_)
-  JSON Harvester / Improve ESRI and OpenDataSoft harvesting (`#6023 <https://github.com/geonetwork/core-geonetwork/pull/6023>`_)
-  option for duplicate API to copy attachments or not (`#6009 <https://github.com/geonetwork/core-geonetwork/pull/6009>`_)
-  Added MetadataPreRemove event before backup operation (`#5954 <https://github.com/geonetwork/core-geonetwork/pull/5954>`_)
-  Remove username from forgot password service url (`#5993 <https://github.com/geonetwork/core-geonetwork/pull/5993>`_)
-  Unblock missing user/group information from user profile (`#6005 <https://github.com/geonetwork/core-geonetwork/pull/6005>`_)
-  Update XslProcessApi to process the draft copies for the metadata in
   a workflow (`#5811 <https://github.com/geonetwork/core-geonetwork/pull/5811>`_)
-  Add statusIds list to MetadataWorkflowApi.getStatusByType API (`#5984 <https://github.com/geonetwork/core-geonetwork/pull/5984>`_)
-  i18n / Add custom translations to the default language packages
   (`#5919 <https://github.com/geonetwork/core-geonetwork/pull/5919>`_)
-  Configure how to extract the WMS layer name from metadata online
   resources to add them to the map viewer (`#5987 <https://github.com/geonetwork/core-geonetwork/pull/5987>`_)
-  Validation / INSPIRE / Return message when quota exceeded. (`#5995 <https://github.com/geonetwork/core-geonetwork/pull/5995>`_)
-  Add index folder information in the catalog information table (admin
   - statistics and status) (`#5976 <https://github.com/geonetwork/core-geonetwork/pull/5976>`_)
-  Add logic to only run encryptor once on password during the
   migration. (`#5865 <https://github.com/geonetwork/core-geonetwork/pull/5865>`_)
-  Used nv-i18n library to add better support for iso639-2/T iso639-2/B
   support (`#5982 <https://github.com/geonetwork/core-geonetwork/pull/5982>`_)
-  Update iso19139 template for uuidref attribute to apply only for
   srv:operatesOn element (`#5924 <https://github.com/geonetwork/core-geonetwork/pull/5924>`_)
-  INSPIRE Atom feed / Process data feed download links with multiple
   download files/links per datafeed entry (`#5985 <https://github.com/geonetwork/core-geonetwork/pull/5985>`_)
-  ISO19115-3 - jsonld formatter - support online resources multilingual
   for name and description (`#5989 <https://github.com/geonetwork/core-geonetwork/pull/5989>`_)
-  ISO19139 - jsonld formatter - support online resources multilingual
   for name and description (`#5955 <https://github.com/geonetwork/core-geonetwork/pull/5955>`_)
-  Add a split button for ``Validate`` in the ‘edit’ toolbar so the
   label is always displayed (whether the submenu is there or not).
   (`#5966 <https://github.com/geonetwork/core-geonetwork/pull/5966>`_)
-  Add a new Json harvester (`#5942 <https://github.com/geonetwork/core-geonetwork/pull/5942>`_)
-  Remove secure port setting (`#5569 <https://github.com/geonetwork/core-geonetwork/pull/5569>`_)
-  Avoid loading Recaptcha API by angular-recaptcha if Recaptcha is
   disabled in the settings (`#5562 <https://github.com/geonetwork/core-geonetwork/pull/5562>`_)
-  Small UI improvements for the Harvester Settings page (`#5926 <https://github.com/geonetwork/core-geonetwork/pull/5926>`_)
-  Display topic categories tooltip in the metadata editor when tooltips
   are enabled (`#5935 <https://github.com/geonetwork/core-geonetwork/pull/5935>`_)
-  Editor / ISO / Compute extent from one keyword or add one extent from
   all keywords (`#5917 <https://github.com/geonetwork/core-geonetwork/pull/5917>`_)
-  Record view / ISO / Temporal range details support. (`#5918 <https://github.com/geonetwork/core-geonetwork/pull/5918>`_)
-  Homepage / Add a title to info block (`#5922 <https://github.com/geonetwork/core-geonetwork/pull/5922>`_)
-  Map list / Open map in the viewer, not the record view (`#5921 <https://github.com/geonetwork/core-geonetwork/pull/5921>`_)
-  Add localizedException logic so that errors can be displayed in
   multiple languages (`#5323 <https://github.com/geonetwork/core-geonetwork/pull/5323>`_)
-  Search / Facet / Remove count if undefined (`#5915 <https://github.com/geonetwork/core-geonetwork/pull/5915>`_)
-  Search / Add search options (eg. titleonly) to permalink (`#5914 <https://github.com/geonetwork/core-geonetwork/pull/5914>`_)
-  Record status / Highlight superseded record like obsolete one.
   (`#5898 <https://github.com/geonetwork/core-geonetwork/pull/5898>`_)
-  Formatter / Admin API / Migrate to Spring. (`#5905 <https://github.com/geonetwork/core-geonetwork/pull/5905>`_)
-  Update search options of the editor (harmonisation of the search
   functions between search page and editor) (`#5907 <https://github.com/geonetwork/core-geonetwork/pull/5907>`_)
-  Search / Active filter / Misc improvements. (`#5903 <https://github.com/geonetwork/core-geonetwork/pull/5903>`_)
-  INSPIRE / Validation from a portal endpoint. (`#5899 <https://github.com/geonetwork/core-geonetwork/pull/5899>`_)
-  Data / WFS harvester / Don’t diplay widget if WFS is down (`#5898 <https://github.com/geonetwork/core-geonetwork/pull/5898>`_)
-  Admin / Reports / Consistent CSV format with other exports. (`#5897 <https://github.com/geonetwork/core-geonetwork/pull/5897>`_)
-  Resources / Load using relative path. (`#5902 <https://github.com/geonetwork/core-geonetwork/pull/5902>`_)
-  Only extractTitles for type METADATA (`#5892 <https://github.com/geonetwork/core-geonetwork/pull/5892>`_)
-  Small UI improvements to the (advanced) search on the search page
   (`#5877 <https://github.com/geonetwork/core-geonetwork/pull/5877>`_)
-  Record view / Preserve debug mode in links (`#5894 <https://github.com/geonetwork/core-geonetwork/pull/5894>`_)
-  Dublin core / Improvements (`#5893 <https://github.com/geonetwork/core-geonetwork/pull/5893>`_)
-  Editor / ISO topic category / Return list corresponding to schema
   plugins. (`#5887 <https://github.com/geonetwork/core-geonetwork/pull/5887>`_)
-  Editor / Avoid error if records contains multiple all thesaurus block
   (`#5885 <https://github.com/geonetwork/core-geonetwork/pull/5885>`_)
-  Editor board / Validation filter translations. (`#5884 <https://github.com/geonetwork/core-geonetwork/pull/5884>`_)
-  Break words in table on the record view page (`#5879 <https://github.com/geonetwork/core-geonetwork/pull/5879>`_)
-  Plugin / SchemaLocation is removed on save in ISO19139 (not in other
   plugins). (`#5878 <https://github.com/geonetwork/core-geonetwork/pull/5878>`_)
-  Record view / More like this improvements. (`#5858 <https://github.com/geonetwork/core-geonetwork/pull/5858>`_)
-  Record view / Add conditional formatter support (`#5820 <https://github.com/geonetwork/core-geonetwork/pull/5820>`_)
-  Facet / Translation / Distinction between zip code and ZIP format
   (`#5876 <https://github.com/geonetwork/core-geonetwork/pull/5876>`_)
-  MetadataManager / Add utility to check if record is valid. (5875)
-  Setting / Integer / Get with default value. (`#5874 <https://github.com/geonetwork/core-geonetwork/pull/5874>`_)
-  Editor / Associated resource / Check null protocol or url (`#5880 <https://github.com/geonetwork/core-geonetwork/pull/5880>`_)
-  Home page / Facet / Add CSS class (`#5869 <https://github.com/geonetwork/core-geonetwork/pull/5869>`_)
-  GML / Add required id attribute to TimePeriod (`#5867 <https://github.com/geonetwork/core-geonetwork/pull/5867>`_)
-  Restyle the logo list in the Settings (`#5855 <https://github.com/geonetwork/core-geonetwork/pull/5855>`_)
-  Refactor sql to use binding (`#5868 <https://github.com/geonetwork/core-geonetwork/pull/5868>`_)
-  Facet / Add translation sort and filtering support. (`#5852 <https://github.com/geonetwork/core-geonetwork/pull/5852>`_)
-  CSW / Restore possibility to store by any index fields (`#5849 <https://github.com/geonetwork/core-geonetwork/pull/5849>`_)
-  Map / Service list / Add UI configuration filter if any (`#5854 <https://github.com/geonetwork/core-geonetwork/pull/5854>`_)
-  ISO19139 / Formatter / Support isoType in template match for plugins
   (`#5853 <https://github.com/geonetwork/core-geonetwork/pull/5853>`_)
-  Remove deleteAllByMetadataIdExceptGroupId from custom implementation
   and use the repository @query instead. (`#5828 <https://github.com/geonetwork/core-geonetwork/pull/5828>`_)
-  Small adjustments to UI settings in the Admin (`#5839 <https://github.com/geonetwork/core-geonetwork/pull/5839>`_)
-  Restyle topics on the Home page (`#5837 <https://github.com/geonetwork/core-geonetwork/pull/5837>`_)
-  Escape login redirect url (`#5829 <https://github.com/geonetwork/core-geonetwork/pull/5829>`_)
-  Add a Bootstrap layout and column to a static page (`#5843 <https://github.com/geonetwork/core-geonetwork/pull/5843>`_)
-  Aggregation / Add terms script support (`#5745 <https://github.com/geonetwork/core-geonetwork/pull/5745>`_)
-  Editor / Associated resources / Do not add wildcard on all search
   (`#5792 <https://github.com/geonetwork/core-geonetwork/pull/5792>`_)
-  Admin / Tools / Add action to drop data index. (`#5812 <https://github.com/geonetwork/core-geonetwork/pull/5812>`_)
-  Add exact match and title only search options (`#5783 <https://github.com/geonetwork/core-geonetwork/pull/5783>`_)
-  Add copy resource interface, implement cmis resource copy with
   additional properties (`#5776 <https://github.com/geonetwork/core-geonetwork/pull/5776>`_)
-  Make the editor menu scrollable on small screens (`#5795 <https://github.com/geonetwork/core-geonetwork/pull/5795>`_)
-  User Profile Readonly for keycloak users (`#5769 <https://github.com/geonetwork/core-geonetwork/pull/5769>`_)
-  Add confirm to delete Category and Cancel edits to metadata (`#5813 <https://github.com/geonetwork/core-geonetwork/pull/5813>`_)
-  Editor / Online source / Check URL with a HEAD call (`#5741 <https://github.com/geonetwork/core-geonetwork/pull/5741>`_)
-  Map / Apply filter to layer search (`#5803 <https://github.com/geonetwork/core-geonetwork/pull/5803>`_)
-  iso19139 full view - codelist elements - display the codelistValue
   translation only if the element has a text also (`#5793 <https://github.com/geonetwork/core-geonetwork/pull/5793>`_)
-  Add a scrollbar to the privileges popup when group names are too long
   (`#5799 <https://github.com/geonetwork/core-geonetwork/pull/5799>`_)
-  Display the facet filter on a single row (`#5762 <https://github.com/geonetwork/core-geonetwork/pull/5762>`_)
-  History / Display close task only when it applies (`#5786 <https://github.com/geonetwork/core-geonetwork/pull/5786>`_)
-  Revise security policy with example of email list and issue tracker
   as public forums (`#5754 <https://github.com/geonetwork/core-geonetwork/pull/5754>`_)
-  Update instructions for local development (`#5627 <https://github.com/geonetwork/core-geonetwork/pull/5627>`_)
-  Search / Add all title’s translations in the default search (`#5750 <https://github.com/geonetwork/core-geonetwork/pull/5750>`_)
-  Indexing / Temporal extent / Add support for now in range upper
   bound. (`#5784 <https://github.com/geonetwork/core-geonetwork/pull/5784>`_)
-  Add new styling options to display the status of metadata records
   (`#5759 <https://github.com/geonetwork/core-geonetwork/pull/5759>`_)
-  Move release build properties to separate file (`#5348 <https://github.com/geonetwork/core-geonetwork/pull/5348>`_)
-  Add ``register`` and ``lost password`` option to accessible login
   menu (`#5571 <https://github.com/geonetwork/core-geonetwork/pull/5571>`_)
-  Styling and multiple columns for the language list in the
   ``Create Thesaurus Window`` (`#5572 <https://github.com/geonetwork/core-geonetwork/pull/5572>`_)
-  Add a new accessible menubar (clickable and keyboard accessible):
   (`#5518 <https://github.com/geonetwork/core-geonetwork/pull/5518>`_)
-  Modify spring security so that it can be set at runtime startup
   (`#5312 <https://github.com/geonetwork/core-geonetwork/pull/5312>`_)
-  Add salutation to notification message. (`#5686 <https://github.com/geonetwork/core-geonetwork/pull/5686>`_)
-  Refactor - autowire settingManager bean to make code cleaner. (`#5773 <https://github.com/geonetwork/core-geonetwork/pull/5773>`_)
-  Editor / option to disable OGC Capabilities layer processing in the
   online resource panel. (`#5763 <https://github.com/geonetwork/core-geonetwork/pull/5763>`_)

Fixes
=====

-  Use typeNames in the WFS URL when version is >= “2.0.0” (`#6143 <https://github.com/geonetwork/core-geonetwork/pull/6143>`_)
-  URL rewrite / Make “/geonetwork?uuid=…” links work again (`#6139 <https://github.com/geonetwork/core-geonetwork/pull/6139>`_)
-  Fix the cron expression for the INSPIRE ATOM harvester (`#6131 <https://github.com/geonetwork/core-geonetwork/pull/6131>`_)
-  Fix issue with CMIS connection during startup (`#6106 <https://github.com/geonetwork/core-geonetwork/pull/6106>`_)
-  Fix removal of sort by and hits per page elements in the UI
   configuration (`#6091 <https://github.com/geonetwork/core-geonetwork/pull/6091>`_)
-  Fix to display the role translation instead of the role code in the
   iso19139 full view formatter (`#6123 <https://github.com/geonetwork/core-geonetwork/pull/6123>`_)
-  XSLT formatter / remove debug mode (`#6127 <https://github.com/geonetwork/core-geonetwork/pull/6127>`_)
-  Fix default URL for the metadata full view (`#6125 <https://github.com/geonetwork/core-geonetwork/pull/6125>`_)
-  Metadata view / correctly escape quotes in links title to avoid
   runtime error (`#6095 <https://github.com/geonetwork/core-geonetwork/pull/6095>`_)
-  Fix for the height of a Modal popup in the Editor (`#6098 <https://github.com/geonetwork/core-geonetwork/pull/6098>`_)
-  Fix check for layer already in map - case insensitive check of the
   url (`#6090 <https://github.com/geonetwork/core-geonetwork/pull/6090>`_)
-  Fix coordinate order in jsonld GeoShape element (`#6071 <https://github.com/geonetwork/core-geonetwork/pull/6071>`_)
-  Add styles and classes to fix the button bars not really fitting
   inside the headers on admin pages (`#6061 <https://github.com/geonetwork/core-geonetwork/pull/6061>`_)
-  Fix the registration of the ``surname`` and ``country`` for the
   ‘self’ registration process (`#6060 <https://github.com/geonetwork/core-geonetwork/pull/6060>`_)
-  Fix the list of elements to process in CSW ElementSet strategy
   ‘context’ (`#6017 <https://github.com/geonetwork/core-geonetwork/pull/6017>`_)
-  Fix the display of the service metadata title for CSW and portals
   (`#6026 <https://github.com/geonetwork/core-geonetwork/pull/6026>`_)
-  Fix check for layer already in map (`#6031 <https://github.com/geonetwork/core-geonetwork/pull/6031>`_)
-  Fix feedback email with multiple recipients (`#6033 <https://github.com/geonetwork/core-geonetwork/pull/6033>`_)
-  Fixed issue with missing keycloakSecurityContextRequestFilter that
   was causing keycloak not to refresh the token correctly. (`#6035 <https://github.com/geonetwork/core-geonetwork/pull/6035>`_)
-  DOI creation / Change the links to buttons so that they become
   actually disabled when clicked (`#6037 <https://github.com/geonetwork/core-geonetwork/pull/6037>`_)
-  Convert iso639_2T to iso639_2B language codes in form-builder (`#6024 <https://github.com/geonetwork/core-geonetwork/pull/6024>`_)
-  Reset search parameter after metadata status change to “approved”
   (`#5970 <https://github.com/geonetwork/core-geonetwork/pull/5970>`_)
-  Fix gn-fn-index:is-isoDate - invalid dates like 2021-04-207 match,
   causing indexing errors (`#6022 <https://github.com/geonetwork/core-geonetwork/pull/6022>`_)
-  Fix credentials autocomplete in harvesters (`#6011 <https://github.com/geonetwork/core-geonetwork/pull/6011>`_)
-  Admin / better handle harvester types translation (`#6006 <https://github.com/geonetwork/core-geonetwork/pull/6006>`_)
-  Add missing 3.12.x upgrade steps (`#5866 <https://github.com/geonetwork/core-geonetwork/pull/5866>`_)
-  Admin / Users / Fix the users that a UserAdmin can manage (`#5886 <https://github.com/geonetwork/core-geonetwork/pull/5886>`_)
-  Validation / INSPIRE / Fix when setting is ‘null’ (`#5973 <https://github.com/geonetwork/core-geonetwork/pull/5973>`_)
-  Fix a bug when the url doesn’t contain the ? sign (`#5994 <https://github.com/geonetwork/core-geonetwork/pull/5994>`_)
-  Fixes some challenges in google-structured-data-test (`#5988 <https://github.com/geonetwork/core-geonetwork/pull/5988>`_)
-  Remove duplicated dependency (`#5986 <https://github.com/geonetwork/core-geonetwork/pull/5986>`_)
-  Updated default language so that is comes from common java location.
   (`#5981 <https://github.com/geonetwork/core-geonetwork/pull/5981>`_)
-  INSPIRE / Validation / Add API Key. (`#5975 <https://github.com/geonetwork/core-geonetwork/pull/5975>`_)
-  Fix workflow mail notifications for metadata with a working copy
   (`#5971 <https://github.com/geonetwork/core-geonetwork/pull/5971>`_)
-  Small fix for long titles on Topic blocks (`#5960 <https://github.com/geonetwork/core-geonetwork/pull/5960>`_)
-  Editor / Avoid hiding part of the Add Resource dropdown in sidebar.
   (`#5916 <https://github.com/geonetwork/core-geonetwork/pull/5916>`_)
-  External viewer / Fix error when adding layer (`#5959 <https://github.com/geonetwork/core-geonetwork/pull/5959>`_)
-  Rollback exceptions handled in GlobalExceptionController. Fixes `#5944 <https://github.com/geonetwork/core-geonetwork/issue/5944>`_
   (`#5948 <https://github.com/geonetwork/core-geonetwork/pull/5948>`_)
-  Remove online resource - fix resource name comparison (`#5934 <https://github.com/geonetwork/core-geonetwork/pull/5934>`_)
-  Fix CSW ES mapping for sortBy and bbox (`#5927 <https://github.com/geonetwork/core-geonetwork/pull/5927>`_)
-  Handle CSW BBOX Filter correctly (`#5913 <https://github.com/geonetwork/core-geonetwork/pull/5913>`_)
-  Encryptor env variable should be uppercase as this it the general
   standard otherwise it will not find the variable on unix (`#5873 <https://github.com/geonetwork/core-geonetwork/pull/5873>`_)
-  Fix issue with localized exception where with\* functions were
   returning LocalizedException instead of the class.
   i.e. ResourceNotFoundException (`#5531 <https://github.com/geonetwork/core-geonetwork/pull/5531>`_)
-  API / Avoid browser cache issue when the same API Path serving
   various formats. (`#5901 <https://github.com/geonetwork/core-geonetwork/pull/5901>`_)
-  ISO19139 / CRS indexing fails on multilingual records (`#5900 <https://github.com/geonetwork/core-geonetwork/pull/5900>`_)
-  HTML / Page tab title empty (`#5895 <https://github.com/geonetwork/core-geonetwork/pull/5895>`_)
-  Record view / Refactor getFormatterForRecord / Fix default url
-  Record view / Fix display of topic category. (`#5891 <https://github.com/geonetwork/core-geonetwork/pull/5891>`_)
-  Search results / PDF / Missing title in TOC (`#5888 <https://github.com/geonetwork/core-geonetwork/pull/5888>`_)
-  Fit view to exact extent (fixes issue #5791) (`#5847 <https://github.com/geonetwork/core-geonetwork/pull/5847>`_)
-  Fix ops for public metadata inserted with CSW-T (`#5202 <https://github.com/geonetwork/core-geonetwork/pull/5202>`_)
-  Record view / Fix display of CRS label. (`#5883 <https://github.com/geonetwork/core-geonetwork/pull/5883>`_)
-  Record view / Group not set in prod mode (`#5851 <https://github.com/geonetwork/core-geonetwork/pull/5851>`_)
-  Fix empty metadata list with -1 count in user profile. Fixes `#5871 <https://github.com/geonetwork/core-geonetwork/issue/5871>`_.
   (`#5872 <https://github.com/geonetwork/core-geonetwork/pull/5872>`_)
-  Encryption / Application fails to start if encryption error on
   harvester passwords (`#5859 <https://github.com/geonetwork/core-geonetwork/pull/5859>`_)
-  Admin / Status / Fix facet more (`#5848 <https://github.com/geonetwork/core-geonetwork/pull/5848>`_)
-  Record view / Advanced / Fix search by keyword links (`#5832 <https://github.com/geonetwork/core-geonetwork/pull/5832>`_)
-  Indexing / documentStandard is not an array. (`#5834 <https://github.com/geonetwork/core-geonetwork/pull/5834>`_)
-  Indexing / Do not add twice indexingDate field (`#5823 <https://github.com/geonetwork/core-geonetwork/pull/5823>`_)
-  User $translateProvider.useSanitizeValueStrategy(‘escapeParameters’)
   for encoding sanitizing (`#5461 <https://github.com/geonetwork/core-geonetwork/pull/5461>`_)
-  Fix for validation result gets lost when approving record and copy
   validation results when creating a draft. Fixes `#5209 <https://github.com/geonetwork/core-geonetwork/issue/5209>`_ (`#5418 <https://github.com/geonetwork/core-geonetwork/pull/5418>`_)
-  Overview / Removal / Do not delete attachment from other records
   (`#5821 <https://github.com/geonetwork/core-geonetwork/pull/5821>`_)
-  INSPIRE Atom feed xslt fix for resource constraints with multiple
   gmd:otherConstraints elements (`#5815 <https://github.com/geonetwork/core-geonetwork/pull/5815>`_)
-  Index / Avoid error on multiple results in DQ conformance. (`#5814 <https://github.com/geonetwork/core-geonetwork/pull/5814>`_)
-  Correct the OpenAPI document so that it does not generate errors that
   were identified in #5431 (`#5809 <https://github.com/geonetwork/core-geonetwork/pull/5809>`_)
-  Fix Thumbnail generator (`#5757 <https://github.com/geonetwork/core-geonetwork/pull/5757>`_)
-  OpenAPI / Restore missing method. (`#5752 <https://github.com/geonetwork/core-geonetwork/pull/5752>`_)
-  Locale loader: fix to load translation files using the format
   ``relativepath|type``, like ``../../catalog/views/myview/locales/|core``
   (`#5710 <https://github.com/geonetwork/core-geonetwork/pull/5710>`_)
-  Search results - metadata with a working copy display a label
   ‘Working copy’ if the metadata has a draft copy, even for public
   users. Fixes `#5580 <https://github.com/geonetwork/core-geonetwork/issue/5580>`_ (`#5805 <https://github.com/geonetwork/core-geonetwork/pull/5805>`_)
-  Create user form issues 2 requests to userselection api that return
   status code 400. Fixes `#4545 <https://github.com/geonetwork/core-geonetwork/issue/4545>`_ (`#5804 <https://github.com/geonetwork/core-geonetwork/pull/5804>`_)
-  Users without groups assigned are listed in the users lists for any
   UserAdmin (`#5798 <https://github.com/geonetwork/core-geonetwork/pull/5798>`_)
-  Selection / PDF / Fix errors due to index schema changes (`#5787 <https://github.com/geonetwork/core-geonetwork/pull/5787>`_)
-  Fix editor overview manager. Fixes `#5806 <https://github.com/geonetwork/core-geonetwork/issue/5806>`_ (`#5807 <https://github.com/geonetwork/core-geonetwork/pull/5807>`_)
-  Self-register option doesn’t work. Fixes `#5778 <https://github.com/geonetwork/core-geonetwork/issue/5778>`_ (`#5779 <https://github.com/geonetwork/core-geonetwork/pull/5779>`_)
-  Updated the index fieldname to match the es index names. (`#5772 <https://github.com/geonetwork/core-geonetwork/pull/5772>`_)
-  Fix bug in signin link - regression cause by #5518 which used older
   variable. (`#5782 <https://github.com/geonetwork/core-geonetwork/pull/5782>`_)
-  Fixed CMIS resource bug where the wrong key function was called
   causing an invalid key to be generated. (`#5775 <https://github.com/geonetwork/core-geonetwork/pull/5775>`_)
-  3.12.x cmis jcloud updates cherry pick (`#5767 <https://github.com/geonetwork/core-geonetwork/pull/5767>`_)

A huge thanks to all contributors and maintainers alike!

See `4.0.6 issues <https://github.com/geonetwork/core-geonetwork/issues?q=is%3Aissue+milestone%3A4.0.6+is%3Aclosed>`_ and
`pull requests <https://github.com/geonetwork/core-geonetwork/pulls?q=is%3Apr+milestone%3A4.0.6+is%3Aclosed>`_ for full details.

