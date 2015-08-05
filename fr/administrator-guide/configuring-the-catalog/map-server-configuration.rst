.. _map-server-configuration:

Configurer les serveurs cartographiques pour la géopublication
##############################################################


Pour publier des données à partir du catalogue dans des services OGC (WMS, WFS, WCS),
l'administrateur du catalogue doit enregistrer un ou plusieurs serveurs de cartes dans
lesquels publiés. Le serveur de cartes DOIT supporter l'API GeoServer REST afin de fonctionner
avec le catalogue. Les serveurs suivants ont été testés:

* `GeoServer <http://geoserver.org>`_
* `Mapserver <http://mapserver.org>`_ avec `Mapserver REST API <https://github.com/neogeo-technologies/mra>`_


Installer votre serveur puis l'ajouter dans ``Console d'admin`` > ``Paramètres`` >
``Serveurs cartographiques`` :


.. figure:: img/geopublication-add-mapserver.png


Les paramètres suivants sont nécessaires :

* Nom: Le libellé du serveur cartographique qui sera affiché dans l'éditeur
* Description: Une description du serveur
* REST API configuration: L'URL du serveur permettant sa configuration via l'API REST.
* Nom d'utilisateur et mot de passe à utiliser pour la connexion à l'API REST.
* Espace de travail: Préfixe et URL de l'espace de travail dans lequel publier les données.
* URL des services WMS/WFS/WCS: URL des services qui seront utilisées lors de l'ajout
  dans les fiches des références aux services.


Cf. :ref:`geopublication-usage`.