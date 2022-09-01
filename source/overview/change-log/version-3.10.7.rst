.. _version-3107:

Version 3.10.7
##############

New features/fixes
------------------

* Administration

 * `Create user form issues 2 requests to userselection api that return status code 400. <https://github.com/geonetwork/core-geonetwork/pull/5804>`_
 * `Fix parse of logo upload in groups management when the content type includes the charset encoding <https://github.com/geonetwork/core-geonetwork/pull/5460>`_
 * `Update user - verify user groups when updating a user by a UserAdmin <https://github.com/geonetwork/core-geonetwork/pull/5560>`_
 * `Users without groups assigned are listed in the users lists for any UserAdmin <https://github.com/geonetwork/core-geonetwork/pull/5798>`_

* CSW

 * `Record to CSW Capabilities - extract language iso2code with twoCharLangCode function, update in date element to use the text value <https://github.com/geonetwork/core-geonetwork/pull/5400>`_

* Editor

 * `Associated resource / Feature catalog / Missing list of values <https://github.com/geonetwork/core-geonetwork/pull/5083>`_
 * `Fix issue using custom UUIDs <https://github.com/geonetwork/core-geonetwork/pull/5440>`_
 * `Fix regression on "Compute extents from keywords" button <https://github.com/geonetwork/core-geonetwork/pull/5455>`_
 * `Fix Thumbnail generator <https://github.com/geonetwork/core-geonetwork/pull/5757>`_
 * `Fix unhandled error and its xsl regular expression and root element in Schematron title translation <https://github.com/geonetwork/core-geonetwork/pull/5220>`_
 * `Fix xpath to match only the main citation title, not other titles <https://github.com/geonetwork/core-geonetwork/pull/5391>`_
 * ISO19115-3 / `Add option for PNG images to mcc:fileType Recommended values <https://github.com/geonetwork/core-geonetwork/pull/5456>`_
 * ISO19139 / `Fix Conformity checks in INSPIRE strict rules <https://github.com/geonetwork/core-geonetwork/pull/5335>`_
 * `Option to disable OGC Capabilities layer processing in the online resource panel <https://github.com/geonetwork/core-geonetwork/pull/5763>`_
 * `Remove non required data-translate directive usage in gnMetadataGroupUpdater directive <https://github.com/geonetwork/core-geonetwork/pull/5490>`_
 * `Updated schematron name on error messages so that it does not overlap <https://github.com/geonetwork/core-geonetwork/pull/5521>`_

* Harvesters

 * CSW / `Enable preemptive for csw requests with credentials <https://github.com/geonetwork/core-geonetwork/pull/5497>`_
 * `Don't allow empty group owner in harvesters. <https://github.com/geonetwork/core-geonetwork/pull/5370>`_

* Map viewer

 * `Add a WMTS error message when the URL can't be parsed <https://github.com/geonetwork/core-geonetwork/pull/5292>`_
 * `Fix map height when there is no footer <https://github.com/geonetwork/core-geonetwork/pull/5696>`_

* Metadata

 * `Fix for too small privileges popup <https://github.com/geonetwork/core-geonetwork/pull/5591>`_
 * `Fix logo in record view <https://github.com/geonetwork/core-geonetwork/pull/5337>`_
 * Formatter / `Avoid request check not modified as unsupported on chrome and edge <https://github.com/geonetwork/core-geonetwork/pull/5406/files>`_
 * Formatter / `Fixes some challenges in google-structured-data-test <https://github.com/geonetwork/core-geonetwork/pull/5508>`_
 * Formatter / `Full view doesn't work in a draft version of a metadata record <https://github.com/geonetwork/core-geonetwork/pull/5433>`_
 * Formatter / `iso19139 full view - codelist elements - display the codelistValue translation only if the element has a text also <https://github.com/geonetwork/core-geonetwork/pull/5793>`_
 * Import / `Generic error message in 'Upload a file from URL' <https://github.com/geonetwork/core-geonetwork/pull/5553>`_
 * `Index temporal extent period, fix multiple temporal extent display in the metadata detail page <https://github.com/geonetwork/core-geonetwork/pull/5485>`_
 * INSPIRE / `Update the filter for INSPIRE Atom dataset feed to support the remote operatesOn indexing format  <https://github.com/geonetwork/core-geonetwork/pull/5816>`_
 * INSPIRE / `Retrieve INSPIRE Atom feed language from self link element instead of the feed language attribute that is optional <https://github.com/geonetwork/core-geonetwork/pull/5435>`_
 * INSPIRE / `INSPIRE geometry fields lead to 0 results in opensearch <https://github.com/geonetwork/core-geonetwork/pull/5434>`_
 * INSPIRE / `Atom fixes:  filter metadata with schemas based on iso19139 and atom feed parse <https://github.com/geonetwork/core-geonetwork/pull/5472>`_
 * INSPIRE / `Local INSPIRE Atom feed xslt fix for resource constraints with multiple gmd:otherConstraints elements <https://github.com/geonetwork/core-geonetwork/pull/5815>`_
 * `Remove schema-org annotations from list pages <https://github.com/geonetwork/core-geonetwork/pull/5412>`_
 * `Update getMdObjByUuid to use the draft information in the metadata when the workflow is enabled <https://github.com/geonetwork/core-geonetwork/pull/5344>`_
 * `Update message if metadata is not found <https://github.com/geonetwork/core-geonetwork/pull/5384>`_
 * `Update Thesaurus keywords to ISO19115-3.2018 <https://github.com/geonetwork/core-geonetwork/pull/5458>`_
 * `Use the configured CSW Service metadata to fill the meta headers for description / keywords for the html content <https://github.com/geonetwork/core-geonetwork/pull/5447>`_
 * Workflow / `Bulk publish cancels working copy <https://github.com/geonetwork/core-geonetwork/pull/5420>`_
 * Workflow / `Fix draft metadata manager update method to check if should be applied to the draft metadata or the published metadata <https://github.com/geonetwork/core-geonetwork/pull/5470>`_
 * Workflow / `Fix for validation result gets lost when approving record and copy validation results when creating a draft. <https://github.com/geonetwork/core-geonetwork/pull/5418>`_
 * Workflow / `Search results - metadata with a working copy display a label 'Working copy' if the metadata has a draft copy, even for public users. <https://github.com/geonetwork/core-geonetwork/pull/5805>`_

* Other

 * `Fixes embedded Cross-Site Scripting issues <https://github.com/geonetwork/core-geonetwork/pull/5551>`_
 * `Kibana / Only allow access to authenticated users in the catalog <https://github.com/geonetwork/core-geonetwork/pull/5005>`_
 * `Log transaction manager notification failures <https://github.com/geonetwork/core-geonetwork/pull/5408>`_
 * `Manage url redirects with URL.openConnection <https://github.com/geonetwork/core-geonetwork/pull/5512>`_
 * `Protect AccessManager code using user session <https://github.com/geonetwork/core-geonetwork/pull/5365>`_
 * `Reset password service fixes/improvements <https://github.com/geonetwork/core-geonetwork/pull/5371>`_
 * `Stream attachments to the browser without reading them first <https://github.com/geonetwork/core-geonetwork/pull/5462>`_
 * Update doc url to point to 3.10.x documentation
 * `Update ZipUtil.java to use tempFile configuration to avoid memory issue <https://github.com/geonetwork/core-geonetwork/pull/5526>`_
 * `Use maven major, minor, patch, build, qualifier definition for version <https://github.com/geonetwork/core-geonetwork/pull/5451>`_
 * `Use $translateProvider.useSanitizeValueStrategy('escapeParameters') for encoding sanitizing <https://github.com/geonetwork/core-geonetwork/pull/5461>`_

* User interface

 * `Add confirm to delete Category and Cancel edits to metadata <https://github.com/geonetwork/core-geonetwork/pull/5813>`_
 * One styling for all scrollbars and increase the width/height
 * `Use button to recover the password <https://github.com/geonetwork/core-geonetwork/pull/5478>`_
