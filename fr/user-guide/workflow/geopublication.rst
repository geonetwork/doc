.. _geopublication-usage:

Publier les données dans un serveur cartographique
##################################################


Pour publier les données à partir de l'éditeur de fiche dans un serveur cartographique,
l'administrateur du catalogue doit configurer la connexion aux différents serveurs
(cf. :ref:`map-server-configuration`).

Une fois configuré, l'éditeur doit ajouter un fichier SIG ou une table dans une base de données
dans la fiche (see :ref:`linking-online-resources-georesource`).

Lorsqu'une ressource géographique est détectée et qu'un ou plusieurs serveurs cartographiques
sont configurés, l'assistant de géopublication est disponible dans l'éditeur de fiche.

.. figure:: img/geopublication-wizard.png

Sélectionner une ressource pour afficher l'assistant.
L'assistant affiche alors la liste des serveurs distants disponibles :

.. figure:: img/geopublication-wizard-serverlist.png

Sélectionner le serveur dans lequel publier la donnée. Lors de la sélection, le catalogue
vérifie sir la données est déjà publiée dans le serveur ou pas. Si elle est trouvée,
elle est ajoutée à la carte.

.. figure:: img/geopublication-wizard-open.png

Si non, un message indique qu'elle n'est pas encore disponible dans le serveur choisi.

.. figure:: img/geopublication-wizard-notavailable.png

À partir du menu, réaliser les actions suivantes :

.. figure:: img/geopublication-wizard-menu.png

* Cliquer sur ``Vérifier`` pour interroger le serveur cartographiques et savoir si la couche y est déjà.

* Cliquer sur ``Publier`` pour publier la donnée dans le serveur cartographique.

* Cliquer sur ``Dépublier`` pour dépublier la donnée dans le serveur cartographique.

* Cliquer sur ``Associer les services`` pour ajouter dans la fiche les liens vers les différents
  service OGC.



Après la publication d'une couche WMS, rappelez-vous qu'il est possible de générer
facilement un aperçu (Cf. :ref:`linking-thumbnail-from-wms`).

