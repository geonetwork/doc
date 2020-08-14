.. _tuto-introduction-harvesting:

Harvesting
##########

The quickest way to add relevant data to your catalog is by harvesting. This means, copying data from other catalos in your own catalog. There are many protocols that can be used for harvesting.

|project_name|
==============

|project_name| can harvest from other |project_name| catalogs. For this tutorial, we are going to use this catalog: http://ide.siia.gov.ar/geonetwork

To add a new harvester, we have to enter the administration console: http://localhost:8080/geonetwork/srv/eng/admin.console#/harvest

.. image:: img/harvest1.png

We select the **|project_name|** option on the *Harvest from* dropdown. This will open a harvester editor at the right. We enter a *Node name* and the *Catalog URL* and we can already save it.

All harvesters can be run manually at will with the *Harvest* button. This means, it will run just once every time an authorized user runs it.

But the most interesting feature of harvesters is the scheduler. You can define a frequency of running. 

.. image:: img/harvester2.png

CSW
===

|project_name| can also harvest from CSW catalogs. The process is quite similar, but instead of choosing the |project_name| type of harvester, we chose the **OGC CSW 2.0.2** harvester type.

For this tutorial, we are going to use the following catalog: http://nationaalgeoregister.nl/geonetwork/srv/eng/csw

While the harvester is running, there will be an animated circle. Once the harvester has finished, the number of records harvested will be shown.

.. image:: img/harvester1.png

See more on :ref:`harvesting`.

