.. _csw-configuration:

Configurer le CSW
#################

Le service CSW accessible à l'adresse http://localhost:8080/geonetwork/srv/csw est
activé par défaut. Il est possible de le désactiver dans
"Administration > Paramètres > CSW".

.. figure:: img/csw.png


Cette section permet également de personnaliser
le service de découverte :

- La publication lors de l'insertion de fiches intégrées au moyen des transactions CSW-T
- L'autorisation de création de nouveaux éléments lors de l'utilisation des 
  XPath dans les transactions CSW

Par ailleurs, il est recommandé de configurer un point de contact et
certains champs d'information (voir `Configurer pour la directive INSPIRE <./inspire-configuration.html>`_).