.. _linking-parent:

Grouping datasets in a series (ie. parent/child relation)
#########################################################


In some situations, a dataset is part of a temporal or spatial collections of
records which could share the same specification for example
(eg. Land cover for different years). To group this set of records
a general description of the collection may be done in a parent metadata
which is then attached to each datasets of the serie.

- Corine Land Cover
 - Corine Land Cover 2002
 - Corine Land Cover 2012
 - ...

Parent/child relations can be set on ISO19139 and Dublin Core records.

.. todo:: Add encoding details


When creating such relationship, users will be able to navigate between the
records in the search and record view.

.. todo:: Add screenshot


Click on ``Link to parent`` to access the panel providing a simple
search to select the target parent metadata


.. figure:: img/parent.png


