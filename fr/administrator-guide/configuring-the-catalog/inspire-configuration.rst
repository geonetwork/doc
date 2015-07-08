.. _inspire-configuration:

Configurer pour la directive INSPIRE
####################################

Activer l'indexation des thèmes INSPIRE
---------------------------------------



Configurer le service de découverte (CSW)
-----------------------------------------


Pour améliorer la conformité du service CSW (cf. :ref:`csw-configuration`)
vis à vis d'INSPIRE, il est recommandé de définir :

- Contact - (Créer ou) Sélectionner un utilisateur du catalogue qui sera la contact
  pour obtenir des informations sur le service CSW. Cet utilisateur peut être un
  compte générique, eg. "Administrateur du catalogue", qui sera utilisé uniquement
  comme contact pour le service.

- Information sur le service - Compléter l'ensemble des champs (titre, résumé, 
  honoraires, contraintes d'accès) et ce pour l'ensemble des langues référencées
  au niveau du catalogue pour INSPIRE.


.. figure:: img/csw-inspire.png

.. warning::
  Les langues prises en charge par le catalogue dans le cadre de la directive 
  INSPIRE peuvent être définies au préalable. Pour ce faire, il faut modifier
  les paramètres des langues au niveau de la base de données du catalogue.
  
  Exemple d'une requête SQL afin de ne pas prendre en compte une langue (ici 
  l'espagnol) dans le cadre de INSPIRE:

  .. code-block:: sql

     UPDATE languages SET ISINSPIRE = 'n' WHERE id = 'es';


Si ces informations ne sont pas renseignées, le CSW ne sera probablement pas
valide lors de l'utilisation du `validateur INSPIRE <http://inspire-geoportal.ec.europa.eu/validator2/>`_.