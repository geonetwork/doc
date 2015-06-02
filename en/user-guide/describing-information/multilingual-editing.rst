.. _multilingual-editing:


Multilingual editing
####################

Editors can create multilingual metadata for ISO19139. A default template is provided but user could add translation to an existing record.

To declare a new language in a metadata record:

- First check, the main language is defined in the metadata section

- then add one or more languages in the other language in the metadata section.



In editing mode, each multilingual elements are composed of:

- text input

- language selection list (language declared on the other language section are listed here)



By default, the selected language is the GUI language if language is defined in the metadata.

.. figure:: editor-multilingual.png


Alternatively, Google translation service could be used. Translation could be suggested to the editor using the small icon right to the language selector. The translation convert the default metadata character string in the current selected language. 


In view mode, according to GUI language : if GUI language is available in the metadata, the element is displayed in this language else the element is displayed in metadata default language.
This behaviour is also applied to dublin core output for CSW services.

