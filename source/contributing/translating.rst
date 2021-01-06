.. _translating:

Translating the application
###########################

To translate the client interface, go on `GeoNetwork on Transifex <https://www.transifex.com/geonetwork/core-geonetwork/>`_. Only the reference language (ie. en) MUST be updated
on github. All other translations MUST be on Transifex.




Main files to translate are the ``Angular UI`` ones:

.. figure:: img/transifex.png




Once translated, the new language needs to be added to the application.


* Add the files to the client application in :code:`web-ui/src/main/resources/catalog/locales`

* Register the new lang in :code:`web-ui/src/main/resources/catalog/js/CatController.js`


.. code-block:: js

      // Add the language here
      module.constant('gnLangs', {
        langs: {
          'eng': 'en',
          'dut': 'du',
          'fre': 'fr',
          'ger': 'ge',
          'kor': 'ko',
          'spa': 'es',
          'cze': 'cz'
        },


      // Lang names to be displayed in language selector
      $scope.langLabels = {'eng': 'English', 'dut': 'Nederlands',
        'fre': 'Français', 'ger': 'Deutsch', 'kor': '한국의',
        'spa': 'Español', 'cze': 'Czech'};



To automatically retrieve & update translations files, the script
:code:`web-ui/download-from-transifex.sh` can be used. To use the script you have to join the translation team on Transifex.



Translating a standard
######################

To translate a standard, see the schema folder (:code:`schemas/iso19139/src/main/plugin/iso19139/loc`). Those files are used in the editor and formatters to translate standard elements, to provide help text, recommended values list, ...
