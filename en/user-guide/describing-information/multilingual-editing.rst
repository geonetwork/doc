.. _multilingual-editing:


Multilingual editing
####################

Some standards support multilingual metadata (eg. ISO19139, ISO19115-1). A default
template is provided for ISO19139 but user could easily add translation to an existing record.


To declare a new language in a metadata record:

- First check, the main language is defined in the metadata section

- then add one or more languages in the other language in the metadata section.


Once done, the editor form provides one field per languages declared. 2 types of
layout is available:

- One field per language displayed one below the others (eg. default mode for title)
  in order to quickly have a look to all translations available

- One field per language with the list of language to switch from one language to another.

.. figure:: img/multilingual-editing.png

User can switch from one mode to another using the ``all`` link.

When loading the editor, the selected language is the user interface language
used if the language is defined in the current record.


When viewing the record, if a translation exist in the user interface language,
this translation is used, if not, the main metadata language is used.

Note: This behaviour also applied to multilinhgual ISO19139 records requested
in dublin core from the CSW services.

