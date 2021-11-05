.. _version-3108:

Version 3.10.8
##############

New features/fixes
------------------

* Administration

 * [BP] Admin / Users / `Fix the users that a UserAdmin can manage <https://github.com/geonetwork/core-geonetwork/pull/5886>`_


* Editor

 * Dublin core / Editor / `Fix autocomplete for subtemplates <https://github.com/geonetwork/core-geonetwork/pull/5965>`_
 * [BP] `Fix for indenting the 'multientry combiner' <https://github.com/geonetwork/core-geonetwork/pull/5764>`_
 * [BP] `Add a new directive for combining add online resource fields <https://github.com/geonetwork/core-geonetwork/pull/5559>`_
 * [BP] `Fix editing of directory entries templates #5936 <https://github.com/geonetwork/core-geonetwork/pull/5937>`_
 * [BP] `Display topic categories tooltip in the metadata editor when tooltips are enabled <https://github.com/geonetwork/core-geonetwork/pull/5935>`_
 * [BP] `Remove online resource - fix resource name comparison <https://github.com/geonetwork/core-geonetwork/pull/5934>`_


* Metadata

 * [BP] `Fix rdf export for iso19139 metadata with multilingual online resources name element <https://github.com/geonetwork/core-geonetwork/pull/5956>`_
 * [BP] `Update iso19139 template for uuidref attribute to apply only for srv:operatesOn element <https://github.com/geonetwork/core-geonetwork/pull/5924>`_
 * [BP] `Process data feed download links with multiple download files/links per datafeed entry <https://github.com/geonetwork/core-geonetwork/pull/5985>`_
 * [BP] `Fix dates xpath in iso19139 export to jsonld <https://github.com/geonetwork/core-geonetwork/pull/5990>`_
 * [BP] Fixes resource links if multilingual fixes feature-catalog indexing in iso19115-3
 * [BP] `Fix duplicate string in normalize-space, if record both has a title as well as identifier has a citation with title <https://github.com/geonetwork/core-geonetwork/pull/5830>`_

* User interface

 * [BP] `Configure how to extract the WMS layer name from metadata online resources to add them to the map viewer <https://github.com/geonetwork/core-geonetwork/pull/5998>`_

* Other

 * [BP] `Updated default language so that is comes from common java location. <https://github.com/geonetwork/core-geonetwork/pull/5981>`_
 * [BP] `Fix a bug when the url doesn't contain the ? sign <https://github.com/geonetwork/core-geonetwork/pull/5994>`_
 * [BP] `Formatter / Datacite / Avoid empty elements. <https://github.com/geonetwork/core-geonetwork/pull/5500>`_
 * [BP] Formatter / Datacite / Fix multiple geoLocations.
 * [BP] Datacite / XSD validation / valueUri is valueURI.

and more ... see `3.10.8 issues <https://github.com/geonetwork/core-geonetwork/issues?q=is%3Aissue+milestone%3A3.10.8+is%3Aclosed>`_ and
`pull requests <https://github.com/geonetwork/core-geonetwork/pulls?q=milestone%3A3.10.8+is%3Aclosed+is%3Apr>`_ for full details.

**Full Changelog**: `here <https://github.com/geonetwork/core-geonetwork/compare/3.10.7...3.10.8>`_
