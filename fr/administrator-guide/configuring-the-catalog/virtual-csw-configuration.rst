.. _virtual-csw-configuration:

Configurer un point d’accès CSW virtuel
#######################################

Un CSW virtuel permet de définir un ou plusieurs service CSW avec des URL spécifiques
qui fourniront un service de recherche sur un sous-ensemble du catalogue. Cela permet
de simplifier le moissonnage d'un sous ensemble du catalogue. En effet, l'URL permet
de récupérer les fiches correspondant à certains critères. Ce mécanisme est fréquemment
utilisé pour créer un service csw-inspire fournissant les fiches entrant dans le cadre
de la directive INSPIRE ou csw-opendata pour les fiches à moissonner par les portails
opendata.

Pour ajouter un CSW virtuel, allez dans "Administration > Paramètres > CSW virtuel".


.. figure:: img/csw-virtuel.png


Cliquer sur ``ajouter`` pour ajouter un nouveau CSW virtuel et configurer les
élements suivants :

- Nom - Nom du CSW virtuel (il DOIT être préfixé par "csw-")
- Description - Description du service
- Filtres - Outil permettant de définir un ou plusieurs filtres afin de sélectionner
  un sous-ensemble de fiche. Sélectionner le critère et la valeur à filtrer. Il est
  possible de combiner plusieurs filtres.


Chaque CSW virtuel peuvent être modifiés ou supprimés. Utilisez l'interface de test
pour vérifier que les critères sont correctement configurés.


.. warning::
  N'oubliez pas d'activer le CSW pour bénéficier des points d'accès CSW (cf. :ref:`csw-configuration`)

