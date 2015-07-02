.. _virtual-csw-configuration:

Configurer un point d’accès CSW virtuel
#######################################

Le CSW virtuel permet de définir un CSW spécifique qui fournira une réponse 
filtrée. Celle-ci n'intégre par exemple que les données caractérisées comme 
"opendata" si un filtre "opendata" a été configuré. Grâce à ce mécanisme, 
le gestionnaire du catalogue peut créer différentes entrées CSW pour son 
catalogue afin de répondre à ses besoins et/ou obligations.

La paramétrisation d'un CSW virtuel se réalise au niveau de la section 
"Administration > Paramètres > CSW virtuel". 


.. figure:: img/csw-virtuel.png


La créatin d'un nouveau CSW virtuel se fait de manière aisée en complétant 
le formulaire de configuration du  CSW vituel au moyen des élements suivants:

- Nom - Nom du CSW virtuel (il est nécessaire de le nommer avec le préfixe "csv-")
- Description - Simple description
- Filtres - Outil permettant de définir un filtre afin de limiter le point CSW au 
  seules métadonnées répondant positivement au filtre. Plusieurs éléments de 
  description des métadonnées peuvent être intégrés au niveau du filtre. Il est, 
  par ailleurs, possible de combiner plusieurs filte pour un CSW virtuel

Il est possible de modifier/supprimer un CSW virtuel en le sélectionnant dans
la liste des CSW virtuels disponibles.

.. warning::
  N'oubliez pas d'activer le CSW pour bénéficier des points d'accès CSW (voir 
  `Configurer le CSW <./csw-configuration.html>`_) 

