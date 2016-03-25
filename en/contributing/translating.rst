.. _translating:

Translating the application
###########################

To translate the client interface, go on `GeoNetwork on Transifex <https://www.transifex.com/geonetwork>`_. Only the reference language (ie. en) MUST be updated
on github. All other translations MUST be on Transifex.




Main files to translate are the ``Angular UI`` ones:

.. figure:: img/transifex.png

For the time being, only ``Angular UI`` files are updated in the core-geonetwork
repository. All ISO19139 files are not automatically updated. So you should
focus first on the client application translations.





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
:code:`web-ui/download-from-transifex.sh` can be used.