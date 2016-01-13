.. _batchupdate_xsl:

Mise à jour via XSLT
####################

.. _batch-process-apply:

Lancer un processus
-------------------

Les administrateurs peuvent via l'API du catalogue mettre à jour une ou plusieurs
fiches via une transformation XSLT. Les étapes sont les suivantes :

* Se connecter en administrateur

* Rechercher les fiches à mettre à jour avec le service ``q``
  eg. recherche de tous les modèles de saisie dans un standard: http://localhost:8080/geonetwork/srv/eng/q?_schema=iso19115-3&_isTemplate=y

* Selectionner les fiches trouvées http://localhost:8080/geonetwork/srv/eng/metadata.select?selected=add-all

* Lancer le processus avec http://localhost:8080/geonetwork/srv/eng/md.processing.batch?process=my-custom-process

* Vérifier l'avancement avec http://localhost:8080/geonetwork/srv/eng/md.processing.batch.report


A la fin du processus, un rapport indique :

* Le nombre de fiches à traiter

* Le nombre de fiches traitées

* Le nombre de fiches non trouvées (dans le cas où elles auraient été supprimées depuis la sélection)

* Le nombre de fiches avec des erreurs de traitement

* Le nombre de fiches qui ne dispose pas du processus demandé (un processus peut
  être disponible en ISO19139 mais pas en Dublin Core)

* Le nombre de fiches non éditable par l'utilisateur connecté


Un processus peut également être appliqué à une seule fiche via le service ``md.processing``.
eg. http://localhost:8080/geonetwork/srv/eng/md.processing?uuid=46eac9e4-33cb-45b7-a104-7bcc8e654c98&process=keywords-mapper&search=water&replace=Water


Les paramètres sont :

* uuid ou id: L'identifiant unique de la fiche ou son identifiant interne

* process: L'identifiant du processus

* d'autres paramètres spécifiques au processus (voir ci-dessous).



.. _batch-process-add:

Ajouter un processus
--------------------

Créer le fichier XSLT
~~~~~~~~~~~~~~~~~~~~~

Un processus est défini pour un standard. Pour voir les processus disponibles pour un
standard, consulter le répertoire ``<datadirectory>/config/schemaPlugins/<schemaId>/process``.

Le répertoire ``process`` contient un ensemble de fichier XSLT. Le nom du fichier XSLT
sans son extension est utilisé pour lancer le processus. Par exemple,
en utilisant ``md.processing.batch?process=my-custom-process``, le processus DOIT être nommé
``my-custom-process.xsl``.


Traiter une fiche XML
~~~~~~~~~~~~~~~~~~~~~

Le processus est appliqué à chaque fiche de métadonnées dans la sélection. Chaque
document traité contient comme élément racine la fiche plus un élément ``geonet:info``.
Cet élément ``geonet:info`` contient des métadonnées sur la fiche. Il DOIT être supprimé
par le processus pour ne pas être sauvegardé en base.

.. code-block:: xml

        <gmd:MD_Metadata>
            ...
            <geonet:info xmlns:geonet="http://www.fao.org/geonetwork">
                <id>73481</id>
                <uuid>bb151890-2da5-4cfb-8659-7839e7138be7</uuid>
                <schema>iso19139</schema>
                <createDate>2015-12-23T17:05:36</createDate>
                <changeDate>2015-12-23T18:07:40</changeDate>
                <source>2cc603e1-981c-41a2-a183-39429c7dcc49</source>
                <ownerId>1</ownerId>
                <edit>true</edit>
                <owner>true</owner>
                <isPublishedToAll>false</isPublishedToAll>
                <view>true</view>
                <notify>true</notify>
                <download>true</download>
                <dynamic>true</dynamic>
                <featured>true</featured>
                <selected>true</selected>
            </geonet:info>
        </gmd:MD_Metadata>


Ajouter des paramètres
~~~~~~~~~~~~~~~~~~~~~~


Le processus peut récupérer un ensemble de paramètres transmis via l'URL d'appel.
Pour récupérer la valeur d'un paramètre, ``xsl:param`` est utilisé.
Par exemple, en utilisant ``md.processing.batch?process=my-custom-process&myParameter=test``.

.. code-block:: xml

    <?xml version="1.0" encoding="UTF-8"?>
    <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
                    exclude-result-prefixes="#all">

        <xsl:param name="myParameter" select="''"/>


Dans cet exemple, ``xsl:param`` sera accessible comme une variable avec ``$myParameter``.
Cette variable aura une valeur vide si elle n'est pas définie dans l'URL.
Pour vérifier le passage d'un paramètre, utiliser ``xsl:message`` pour afficher une information
dans les fichiers de log.

.. code-block:: xml

        <xsl:param name="myParameter" select="''"/>
        <xsl:message>myParameter: <xsl:value-of select="$myParameter"/></xsl:message>


Le processus peut réupérer également les 4 paramètres suivant:

* guiLang: La langue de l'interface

* baseUrl: L'URL du catalogue (eg ``http://localhost:8080/geonetwork``)

* catalogUrl: L'URL des services (eg ``http://localhost:8080/geonetwork/srv/eng``)

* nodeId: L'identifiant du noeud (par défault ``srv``)


Pour utiliser l'un de ces paramètres, utiliser ``xsl:param``:


.. code-block:: xml

        <xsl:param name="guiLang" select="''"/>


Faire une copie au minimum
~~~~~~~~~~~~~~~~~~~~~~~~~~


Un processus DOIT a minima faire :

* une copie de toute la fiche

* supprimer l'élément geonet:info


.. code-block:: xml

        <?xml version="1.0" encoding="UTF-8"?>
        <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
                        exclude-result-prefixes="exslt">

            <!-- Do a copy of every nodes and attributes recursively -->
            <xsl:template match="@*|node()">
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:template>

            <!-- Remove geonet:* elements. -->
            <xsl:template match="geonet:*" priority="2"/>
        </xsl:stylesheet>


Ensuite, le processus peut être personnalisé pour réaliser d'autres actions.


Exemples
~~~~~~~~

Voir :code:`schemas/iso19139/src/main/plugin/iso19139/process` pour des exemples.

En plus de la transformation minimale, le processus peut réaliser d'autres manipulations
en utilisant des templates spécifiques :

* Supprimer un élément. Eg. suppression de tous les rapports ayant DQ_TopologicalConsistency:

.. code-block:: xml

        <xsl:template match="gmd:report[gmd:DQ_TopologicalConsistency]"
                      priority="2"/>

Définir une priorité de 2 pour que le template soit prioritaire par rapport au
template réalisant la copie de tout.




.. _customizing-xslt-suggestion:


Ajouter un processus au suggestion
----------------------------------

Cf. :ref:`metadata_suggestion`.


.. _xslt-in-editor:


Ajouter un processus dans l'éditeur sous forme d'action
-------------------------------------------------------

Un processus peut être utilisé dans l'éditeur pour réaliser des actions spécifiques.
Par exemple, la vue INSPIRE affiche un bouton pour calculer l'identifiant de la
resource si aucun n'est défini.

.. code-block:: xml

          <action type="batch"
                  process="add-resource-id"
                  if="count(gmd:MD_Metadata/gmd:identificationInfo/*/
                                gmd:citation/gmd:CI_Citation/
                                    gmd:identifier[
                                    ends-with(
                                        gmd:MD_Identifier/gmd:code/gco:CharacterString,
                                        //gmd:MD_Metadata/gmd:fileIdentifier/gco:CharacterString
                                    )]) = 0"/>



Cf. ref:`creating-custom-editor`.



.. _customizing-xslt-conversion:

