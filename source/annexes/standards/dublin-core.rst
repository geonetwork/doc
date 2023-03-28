
.. _dublin-core:
      

Dublin core (dublin-core)
#########################


The Dublin Core Metadata Element Set is a vocabulary of fifteen properties for
    use in resource description. The name "Dublin" is due to its origin at a 1995 invitational
    workshop in Dublin, Ohio; "core" because its elements are broad and generic, usable for
    describing a wide range of resources.
  


More details:http://dublincore.org/documents/dces/


Metadata editor
***************


This standard can be encoded using 3 view(s).

* :ref:`dublin-core-view-default`
      
* :ref:`dublin-core-view-advanced`
      
* :ref:`dublin-core-view-xml`
      

.. _dublin-core-view-default:
      

View: Simple (default)
======================

This view is composed of1tab(s).

* :ref:`dublin-core-tab-default`
      



This view also allows to add the following element even if not in the current record:

* Subject and Keywords (dc:subject)


.. _dublin-core-tab-default:
      

Tab: Simple (default)
---------------------


.. figure:: img/dublin-core-tab-default.png

This tab display elements from the XML metadata record.


Section: Metadata
^^^^^^^^^^^^^^^^^


See :ref:`dublin-core-elem-simpledc-8506dd4a73872a53513368db419204a3`
      


.. _dublin-core-view-advanced:
      

View: Full (advanced)
=====================

This view is composed of1tab(s).

* :ref:`dublin-core-tab-advanced`
      



.. _dublin-core-tab-advanced:
      

Tab: Full (advanced)
--------------------


This tab display elements from the XML metadata record and also provide controls to add all elements defined in the schema (XSD).


Section: Metadata
^^^^^^^^^^^^^^^^^


See :ref:`dublin-core-elem-simpledc-8506dd4a73872a53513368db419204a3`
      


.. _dublin-core-view-xml:
      

View: XML (xml)
===============

This view is composed of1tab(s).

* :ref:`dublin-core-tab-xml`
      



.. _dublin-core-tab-xml:
      

Tab: XML (xml)
--------------


This tab display elements from the XML metadata record and also provide controls to add all elements defined in the schema (XSD).

Schema technical details
************************


:Standard identifier:
    
    dublin-core

:Version:
    
    1.0

:Schema location:
    
    

:Schema namespaces:
  
* http://geonetwork-opensource.org/schemas/schema-ident

* http://www.w3.org/2001/XMLSchema-instance

* http://www.w3.org/XML/1998/namespace


:Schema detection mode:
    
    gns:elements (root)


:Schema detection elements:
  
* simpledc

Standard elements
*****************


List of all elements available in the standard.


.. _dublin-core-elem-dc-contributor-0974cafd6cf5302fe8501874dbe3b3ac:
      

Contributor
===========




:Name:
    
    dc:contributor

:Description:
  
.. raw:: html


   An entity responsible for making contributions to the content of the resource.
       






.. _dublin-core-elem-dc-coverage-8a3ad050a5c9949ad92271f646817e10:
      

Coverage
========




:Name:
    
    dc:coverage

:Description:
  
.. raw:: html


   The extent or scope of the content of the resource. Typically, Coverage will
         include spatial location (a place name or geographic coordinates), temporal period (a period
         label, date, or date range), or jurisdiction (such as a named administrative entity).
       



.. code-block:: xml
    

    <dc:coverage xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dct="http://purl.org/dc/terms/"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
        North 45.668, South 45.635, East 4.805, West 4.768. CHARLY
      </dc:coverage>






.. _dublin-core-elem-dc-creator-f6d71ca3a0b4e9aeb0e518f195f8256e:
      

Creator
=======




:Name:
    
    dc:creator

:Description:
  
.. raw:: html


   An entity primarily responsible for making the content of the resource.
       



.. code-block:: xml
    

    <dc:creator xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dct="http://purl.org/dc/terms/"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
        Métropole de Lyon / Direction Innovation Numérique et Systèmes d'Information
        (DINSI) (Géomatique et données métropolitaines)
      </dc:creator>






.. _dublin-core-elem-dc-date-23c64254f66925f9eb6e3bd19c442233:
      

Date
====




:Name:
    
    dc:date

:Description:
  
.. raw:: html


   A date of an event in the lifecycle of the resource. Typically, Date will be
         associated with the creation or availability of the resource.
       






.. _dublin-core-elem-dc-description-8918d5eea5202286bfa9ceaac948b704:
      

Description
===========




:Name:
    
    dc:description

:Description:
  
.. raw:: html


   An account of the content of the resource.



.. code-block:: xml
    

    <dc:description xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dct="http://purl.org/dc/terms/"
                    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
        La maquette 3D de la commune (2009 ou 2012) est composée de deux à six
        couches de données. A minima, toutes les maquettes se composent des deux
        couches suivantes : - Le Modèle numérique de terrain (TIN) et ses textures
        associées ; - Les bâtiments 3D texturés (BATIS). Elle est complétée par une
        ou plusieurs des couches ci-dessous : - Les surfaces en eau (WATER) et leurs
        textures associées ; - Les bâtiments « remarquables » (Mairies, Eglises
        etc…) ; - Les ponts « remarquables » ; - Les objets « remarquables »
        (Statues, Fontaines etc…). Ces données sont modélisées suivant la norme
        CityGML et fournies dans ce format. Ces maquettes sont produites avec le
        logiciel RhinoTerrain/RhinoCity.
      </dc:description>






.. _dublin-core-elem-dc-format-3842730cdb5c8559fe6f2737815429ea:
      

Format
======




:Name:
    
    dc:format

:Description:
  
.. raw:: html


   The physical or digital manifestation of the resource. Typically, Format will
         include the media-type or dimensions of the resource. Format may be used to identify the
         software, hardware, or other equipment needed to display or operate the resource.
       






.. _dublin-core-elem-dc-identifier-7d64a0a5c40868491c49bf7df7574752:
      

Resource Identifier
===================




:Name:
    
    dc:identifier

:Description:
  
.. raw:: html


   An unambiguous reference to the resource within a given context.



.. code-block:: xml
    

    <dc:identifier xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dct="http://purl.org/dc/terms/"
                   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">a806d3e1-c240-43a9-bbc3-643e8c93b10d</dc:identifier>






.. _dublin-core-elem-dc-language-74e0ef625be0b45d0e6c64d5f76e1895:
      

Language
========




:Name:
    
    dc:language

:Description:
  
.. raw:: html


   A language of the intellectual content of the resource. Recommended best practice
         is to use RFC 3066, which, in conjunction with ISO 639, defines two- and three-letter primary
         language tags with optional subtags.
       



.. code-block:: xml
    

    <dc:language xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dct="http://purl.org/dc/terms/"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">fre</dc:language>






.. _dublin-core-elem-dc-publisher-5534d3efaa13b75c3aa34c379dd91025:
      

Publisher
=========




:Name:
    
    dc:publisher

:Description:
  
.. raw:: html


   An entity responsible for making the resource available.



.. code-block:: xml
    

    <dc:publisher xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dct="http://purl.org/dc/terms/"
                  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
        Métropole de Lyon / Direction Innovation Numérique et Systèmes d'Information
        (DINSI) (Géomatique et données métropolitaines)
      </dc:publisher>






.. _dublin-core-elem-dc-relation-3772ef19f1f075e519d2d0a60ec6f05a:
      

Relation
========




:Name:
    
    dc:relation

:Description:
  
.. raw:: html


   A reference to a related resource.






.. _dublin-core-elem-dc-rights-32dce43ec1342a098287b03b6a5cb72f:
      

Rights Management
=================




:Name:
    
    dc:rights

:Description:
  
.. raw:: html


   Information about rights held in and over the resource.






.. _dublin-core-elem-dc-source-104607b158c41c5855de1ed62ae223dd:
      

Source
======




:Name:
    
    dc:source

:Description:
  
.. raw:: html


   A Reference to a resource from which the present resource is derived. The present
         resource may be derived from the Source resource in whole or in part.
       



.. code-block:: xml
    

    <dc:source xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dct="http://purl.org/dc/terms/"
               xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
        Le Modèle numérique de terrain est issu d’une saisie photogrammétrique
        réalisée à partir de la prise de vue aérienne (2009 ou 2012). Les fichiers
        des textures associées plaquées sur le MNT correspondent à
        l’orthophotographie aérienne qui possède une résolution de 10 cm pour 2012
        et 16 cm pour 2009. - Les surfaces en eau (WATER) ont été identifiées à
        partir d’une saisie photogrammétrique réalisée à partir de la même prise de
        vue aérienne. - Les bâtiments 3D proviennent de la saisie photogrammétrique
        réalisée à partir de la prise de vue aérienne. Les textures plaquées sur ces
        bâtiments proviennent des clichés issus de la prise de vue aérienne. - Les
        bâtiments « remarquables » (Mairies, Eglises etc…), les ponts « remarquables
        » et les objets « remarquables » (Statues, Fontaines etc…) ont été texturés
        à partir de photographies terrestres.
      </dc:source>






.. _dublin-core-elem-dc-subject-a88bd90b4991695f8c45fe01df3f64d6:
      

Subject and Keywords
====================




:Name:
    
    dc:subject

:Description:
  
.. raw:: html


   A topic of the content of the resource. Typically, Subject will be expressed as
         keywords, key phrases, or classification codes that describe a topic of the resource.
       



.. code-block:: xml
    

    <dc:subject xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dct="http://purl.org/dc/terms/"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">Localisation</dc:subject>






.. _dublin-core-elem-dc-title-18e3be863c870257c8b70d577038ee5f:
      

Title
=====




:Name:
    
    dc:title

:Description:
  
.. raw:: html


   A name given to the resource. Typically, Title will be a name by which the resource
         is formally known.
       



.. code-block:: xml
    

    <dc:title xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dct="http://purl.org/dc/terms/"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
        Maquette 3D texturée de la commune de Charly (la Métropole de Lyon)
      </dc:title>






.. _dublin-core-elem-dc-type-15bbc75f8dbe617d6ed609fcf1202ee1:
      

Resource Type
=============




:Name:
    
    dc:type

:Description:
  
.. raw:: html


   The nature or genre of the content of the resource. Type includes terms describing
         general categories, functions, genres, or aggregation levels for content.
       



Recommended values

==================  ===================
code                label              
==================  ===================
dataset             Dataset            
service             Service            
==================  ===================



.. code-block:: xml
    

    <dc:type xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dct="http://purl.org/dc/terms/"
             xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">nonGeographicDataset</dc:type>






.. _dublin-core-elem-dc-URI-8f2cb1e27778e1b1977e670ca7e7a282:
      

URI
===




:Name:
    
    dc:URI

:Description:
  




.. _dublin-core-elem-dct-abstract-a48c3a17636153c58749c5fc29d1bd28:
      

Abstract
========




:Name:
    
    dct:abstract

:Description:
  
.. raw:: html


   A summary of the content of the resource.






.. _dublin-core-elem-dct-accessRights-972cd1c89a0274325b1a3b99e34c95be:
      

Access Rights
=============




:Name:
    
    dct:accessRights

:Description:
  
.. raw:: html


   Information about who can access the resource or an indication of its security
         status.
       






.. _dublin-core-elem-dct-accrualMethod-6fa8ea67638a1578c231025e31dd40e9:
      

Accrual Method
==============




:Name:
    
    dct:accrualMethod

:Description:
  
.. raw:: html


   The method by which items are added to a collection.






.. _dublin-core-elem-dct-accrualPeriodicity-2a4c9a8426dd588e960559174a3df263:
      

Accrual Periodicity
===================




:Name:
    
    dct:accrualPeriodicity

:Description:
  
.. raw:: html


   The frequency with which items are added to a collection.



Recommended values

=======================================================================================================  ==========================================================================================================
code                                                                                                     label                                                                                                     
=======================================================================================================  ==========================================================================================================
continual                                                                                                Continual                                                                                                 
daily                                                                                                    Daily                                                                                                     
weekly                                                                                                   Weekly                                                                                                    
fortnightly                                                                                              Fortnightly                                                                                               
monthly                                                                                                  Monthly                                                                                                   
quarterly                                                                                                Quarterly                                                                                                 
biannually                                                                                               Biannually                                                                                                
annually                                                                                                 Annually                                                                                                  
asNeeded                                                                                                 As needed                                                                                                 
irregular                                                                                                Irregular                                                                                                 
notPlanned                                                                                               Not planned                                                                                               
unknown                                                                                                  Unknown                                                                                                   
=======================================================================================================  ==========================================================================================================



.. code-block:: xml
    

    <dct:accrualPeriodicity xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dct="http://purl.org/dc/terms/"
                            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">Irregular</dct:accrualPeriodicity>






.. _dublin-core-elem-dct-accrualPolicy-0ae937a1f9081db219a5dd04ed4610d4:
      

Accrual Policy
==============




:Name:
    
    dct:accrualPolicy

:Description:
  
.. raw:: html


   The policy governing the addition of items to a collection.






.. _dublin-core-elem-dct-alternative-2518e8fc9fa67f5a10348016aae8bb0f:
      

Alternative Title
=================




:Name:
    
    dct:alternative

:Description:
  
.. raw:: html


   An alternative name for the resource.






.. _dublin-core-elem-dct-audience-a610cbdc155d7cd9c87c8f22ef245521:
      

Audience
========




:Name:
    
    dct:audience

:Description:
  
.. raw:: html


   A class of entity for whom the resource is intended or useful.






.. _dublin-core-elem-dct-bibliographicCitation-0d3ba175bdb84be48dec71bdb6b318da:
      

Bibliographic Citation
======================




:Name:
    
    dct:bibliographicCitation

:Description:
  
.. raw:: html


   A bibliographic reference for the resource.






.. _dublin-core-elem-dct-conformsTo-703d80b57bd6629b2bff3f57efd52dc5:
      

Conforms To
===========




:Name:
    
    dct:conformsTo

:Description:
  
.. raw:: html


   An established standard to which the described resource conforms.






.. _dublin-core-elem-dct-created-9aebe20151c1c962d66737fcb9b87c2c:
      

Date Created
============




:Name:
    
    dct:created

:Description:
  
.. raw:: html


   Date of creation of the resource.



.. code-block:: xml
    

    <dct:created xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dct="http://purl.org/dc/terms/"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">2014-12-19</dct:created>






.. _dublin-core-elem-dct-dateAccepted-9f6f7b46bae794b317c939c75170b0f1:
      

Date Accepted
=============




:Name:
    
    dct:dateAccepted

:Description:
  
.. raw:: html


   Date of acceptance of the resource.






.. _dublin-core-elem-dct-dateCopyrighted-1a3940c001fd2db761829940957d8bf7:
      

Date Copyrighted
================




:Name:
    
    dct:dateCopyrighted

:Description:
  
.. raw:: html


   Date of copyright.






.. _dublin-core-elem-dct-dateSubmitted-0e038c3b8ac6daca57211a938eca6154:
      

Date Submitted
==============




:Name:
    
    dct:dateSubmitted

:Description:
  
.. raw:: html


   Date of submission of the resource



.. code-block:: xml
    

    <dct:dateSubmitted xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dct="http://purl.org/dc/terms/"
                       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">2015-01-23</dct:dateSubmitted>






.. _dublin-core-elem-dct-educationLevel-fa33466d34d56fb066753a6d97089631:
      

Audience Education Level
========================




:Name:
    
    dct:educationLevel

:Description:
  
.. raw:: html


   A class of entity, defined in terms of progression through an educational or
         training context, for which the described resource is intended.
       






.. _dublin-core-elem-dct-extent-8a3a9adeaaac054e64dff722ad23c776:
      

Extent
======




:Name:
    
    dct:extent

:Description:
  
.. raw:: html


   The size or duration of the resource.






.. _dublin-core-elem-dct-hasFormat-d136ed16dc44af39fdf1b98b9fb4bc33:
      

Has Format
==========




:Name:
    
    dct:hasFormat

:Description:
  
.. raw:: html


   A related resource that is substantially the same as the pre-existing described
         resource, but in another format.
       






.. _dublin-core-elem-dct-hasPart-f251f156dd8774a81f44c13c7b4a9e7d:
      

Has Part
========




:Name:
    
    dct:hasPart

:Description:
  
.. raw:: html


   A related resource that is included either physically or logically in the described
         resource.
       






.. _dublin-core-elem-dct-hasVersion-b8dc08cd4fc15cf1df605c2905b0c5e3:
      

Has Version
===========




:Name:
    
    dct:hasVersion

:Description:
  
.. raw:: html


   A related resource that is a version, edition, or adaptation of the described
         resource.
       






.. _dublin-core-elem-dct-instructionalMethod-d220d889250a4a0f7e3efe29fc0f0ada:
      

Instructional Method
====================




:Name:
    
    dct:instructionalMethod

:Description:
  
.. raw:: html


   A process, used to engender knowledge, attitudes and skills, that the resource is
         designed to support.
       






.. _dublin-core-elem-dct-isFormatOf-8378903643254b5b83ae2acdc251b6a6:
      

Is Format Of
============




:Name:
    
    dct:isFormatOf

:Description:
  
.. raw:: html


   A related resource that is substantially the same as the described resource, but in
         another format.
       






.. _dublin-core-elem-dct-isPartOf-6697c98943756abf56d4c2a50f9dc9a2:
      

Is part of
==========




:Name:
    
    dct:isPartOf

:Description:
  
.. raw:: html


   A related resource in which the described resource is physically or logically
         included.
       



.. code-block:: xml
    

    <dct:isPartOf xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dct="http://purl.org/dc/terms/"
                  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">8017c69a-5b17-404f-acdd-d9c37a0afac4</dct:isPartOf>






.. _dublin-core-elem-dct-isReferencedBy-4cf2c75a368a7773ec781eaa6f4a7c03:
      

Is Referenced By
================




:Name:
    
    dct:isReferencedBy

:Description:
  
.. raw:: html


   A related resource that references, cites, or otherwise points to the described
         resource.
       






.. _dublin-core-elem-dct-isReplacedBy-1e391e071c75e45dcf0a309285a642a0:
      

Is Replaced By
==============




:Name:
    
    dct:isReplacedBy

:Description:
  
.. raw:: html


   A related resource that supplants, displaces, or supersedes the described
         resource.
       






.. _dublin-core-elem-dct-isRequiredBy-def534523d854e3440e36701bea47cc4:
      

Is Required By
==============




:Name:
    
    dct:isRequiredBy

:Description:
  
.. raw:: html


   A related resource that requires the described resource to support its function,
         delivery, or coherence.
       






.. _dublin-core-elem-dct-issued-9f6ad8cb4b5e6225c1cb755489adb774:
      

Date Issued
===========




:Name:
    
    dct:issued

:Description:
  
.. raw:: html


   Date of formal issuance (e.g., publication) of the resource.






.. _dublin-core-elem-dct-isVersionOf-d1658a9e84f777d0a335528e82921417:
      

Is Version Of
=============




:Name:
    
    dct:isVersionOf

:Description:
  
.. raw:: html


   A related resource of which the described resource is a version, edition, or
         adaptation.
       






.. _dublin-core-elem-dct-license-865405c25292b886c12f7d056ebaabda:
      

License
=======




:Name:
    
    dct:license

:Description:
  
.. raw:: html


   A legal document giving official permission to do something with the resource.
       






.. _dublin-core-elem-dct-mediator-ab02c72730e6dbccbfb74b07e00edf10:
      

Mediator
========




:Name:
    
    dct:mediator

:Description:
  
.. raw:: html


   An entity that mediates access to the resource and for whom the resource is
         intended or useful.
       






.. _dublin-core-elem-dct-medium-95f834fde8ee306293ebebcfd7a3aba5:
      

Medium
======




:Name:
    
    dct:medium

:Description:
  
.. raw:: html


   The material or physical carrier of the resource.






.. _dublin-core-elem-dct-modified-66ecff9b0ec74fad28c5babebc1eec7d:
      

Date Modified
=============




:Name:
    
    dct:modified

:Description:
  
.. raw:: html


   Data metadata was modified



.. code-block:: xml
    

    <dct:modified xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dct="http://purl.org/dc/terms/"
                  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">2016-02-03T21:33:45</dct:modified>






.. _dublin-core-elem-dct-provenance-4ec9c18f260230d4455195d6a6f28c17:
      

Provenance
==========




:Name:
    
    dct:provenance

:Description:
  
.. raw:: html


   A statement of any changes in ownership and custody of the resource since its
         creation that are significant for its authenticity, integrity and interpretation.
       






.. _dublin-core-elem-dct-references-3a44416fcd20eea0684aad2fd3228fdd:
      

Related resource
================




:Name:
    
    dct:references

:Description:
  
.. raw:: html


   A related resource that is referenced, cited, or otherwise pointed to by the
         described resource.
       






.. _dublin-core-elem-dct-replaces-c5b09017642a464af7a04db426f6d74f:
      

Replaces
========




:Name:
    
    dct:replaces

:Description:
  
.. raw:: html


   A related resource that is supplanted, displaced, or superseded by the described
         resource.
       






.. _dublin-core-elem-dct-requires-2ad52ab491717dc624f79f92303f4679:
      

Requires
========




:Name:
    
    dct:requires

:Description:
  
.. raw:: html


   A related resource that is required by the described resource to support its
         function, delivery, or coherence.
       






.. _dublin-core-elem-dct-rightsHolder-0f4304cc1135f8fc29f7a0ede8daa268:
      

Rights Holder
=============




:Name:
    
    dct:rightsHolder

:Description:
  
.. raw:: html


   A person or organization owning or managing rights over the resource.






.. _dublin-core-elem-dct-spatial-5100d679492a6f79fd3e53db624bcab2:
      

Spatial
=======




:Name:
    
    dct:spatial

:Description:
  
.. raw:: html


   Spatial characteristics of the intellectual content of the resource.



.. code-block:: xml
    

    <dct:spatial xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dct="http://purl.org/dc/terms/"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">RGF93 / CC46 (EPSG:3946)</dct:spatial>






.. _dublin-core-elem-dct-tableOfContents-c20c496386cad7aa48ad05ca41a6340b:
      

Table Of Contents
=================




:Name:
    
    dct:tableOfContents

:Description:
  
.. raw:: html


   A list of subunits of the resource.






.. _dublin-core-elem-dct-temporal-0a2abb1d37421418cafeb48bd21e6854:
      

Temporal Coverage
=================




:Name:
    
    dct:temporal

:Description:
  
.. raw:: html


   Temporal characteristics of the resource.






.. _dublin-core-elem-dct-valid-343768fccc581bc0822c69e6ca19c70c:
      

Date Valid
==========




:Name:
    
    dct:valid

:Description:
  
.. raw:: html


   Date (often a range) of validity of a resource.






.. _dublin-core-elem-simpledc-8506dd4a73872a53513368db419204a3:
      

Metadata
========




:Name:
    
    simpledc

:Description:
  

.. code-block:: xml
    

    <simpledc xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dct="http://purl.org/dc/terms/"
              xsi:noNamespaceSchemaLocation="http://localhost/geonetwork/xml/schemas/dublin-core/schema.xsd">
       <dc:title>
        Maquette 3D texturée de la commune de Charly (la Métropole de Lyon)
      </dc:title>
       <dc:creator>
        Métropole de Lyon / Direction Innovation Numérique et Systèmes d'Information
        (DINSI) (Géomatique et données métropolitaines)
      </dc:creator>
       <dc:subject>Localisation</dc:subject>
       <dc:description>
        La maquette 3D de la commune (2009 ou 2012) est composée de deux à six
        couches de données. A minima, toutes les maquettes se composent des deux
        couches suivantes : - Le Modèle numérique de terrain (TIN) et ses textures
        associées ; - Les bâtiments 3D texturés (BATIS). Elle est complétée par une
        ou plusieurs des couches ci-dessous : - Les surfaces en eau (WATER) et leurs
        textures associées ; - Les bâtiments « remarquables » (Mairies, Eglises
        etc…) ; - Les ponts « remarquables » ; - Les objets « remarquables »
        (Statues, Fontaines etc…). Ces données sont modélisées suivant la norme
        CityGML et fournies dans ce format. Ces maquettes sont produites avec le
        logiciel RhinoTerrain/RhinoCity.
      </dc:description>
       <dc:publisher>
        Métropole de Lyon / Direction Innovation Numérique et Systèmes d'Information
        (DINSI) (Géomatique et données métropolitaines)
      </dc:publisher>
       <dc:type>nonGeographicDataset</dc:type>
       <dc:format>application/zip</dc:format>
       <dc:format>CityGML (taille : 260.0 Mo)</dc:format>
       <dc:format>application/zip</dc:format>
       <dc:format>executable (taille : 829.2 Mo)</dc:format>
       <dc:format>application/zip</dc:format>
       <dc:format>CityGML (taille : 113.5 Mo)</dc:format>
       <dc:format>application/zip</dc:format>
       <dc:format>executable (taille : 339.2 Mo)</dc:format>
       <dc:format>application/pdf</dc:format>
       <dc:format>pdf (taille : 315 Ko)</dc:format>
       <dc:source>
        Le Modèle numérique de terrain est issu d’une saisie photogrammétrique
        réalisée à partir de la prise de vue aérienne (2009 ou 2012). Les fichiers
        des textures associées plaquées sur le MNT correspondent à
        l’orthophotographie aérienne qui possède une résolution de 10 cm pour 2012
        et 16 cm pour 2009. - Les surfaces en eau (WATER) ont été identifiées à
        partir d’une saisie photogrammétrique réalisée à partir de la même prise de
        vue aérienne. - Les bâtiments 3D proviennent de la saisie photogrammétrique
        réalisée à partir de la prise de vue aérienne. Les textures plaquées sur ces
        bâtiments proviennent des clichés issus de la prise de vue aérienne. - Les
        bâtiments « remarquables » (Mairies, Eglises etc…), les ponts « remarquables
        » et les objets « remarquables » (Statues, Fontaines etc…) ont été texturés
        à partir de photographies terrestres.
      </dc:source>
       <dc:language>fre</dc:language>
       <dc:relation>
        https://download.data.grandlyon.com/files/grandlyon/localisation/bati3d/CHARLY_2012.zip
      </dc:relation>
       <dc:relation>
        https://download.data.grandlyon.com/files/grandlyon/localisation/bati3d/_EXE_CHARLY_2012.zip
      </dc:relation>
       <dc:relation>
        https://download.data.grandlyon.com/files/grandlyon/localisation/bati3d/CHARLY_2009.zip
      </dc:relation>
       <dc:relation>
        https://download.data.grandlyon.com/files/grandlyon/localisation/bati3d/_EXE_CHARLY_2009.zip
      </dc:relation>
       <dc:relation>
        https://download.data.grandlyon.com/files/grandlyon/localisation/bati3d/Maquettes_3D_CityGML.pdf
      </dc:relation>
       <dc:relation>
        https://download.data.grandlyon.com/files/grandlyon/LicenceOuverte.pdf
      </dc:relation>
       <dc:coverage>
        North 45.668, South 45.635, East 4.805, West 4.768. CHARLY
      </dc:coverage>
       <dc:rights>Licence Ouverte</dc:rights>
       <dc:rights>Pas de restriction d'accès public selon INSPIRE</dc:rights>
       <dct:created>2014-12-19</dct:created>
       <dct:dateSubmitted>2015-01-23</dct:dateSubmitted>
       <dct:isPartOf>8017c69a-5b17-404f-acdd-d9c37a0afac4</dct:isPartOf>
       <dct:spatial>RGF93 / CC46 (EPSG:3946)</dct:spatial>
       <dct:accrualPeriodicity>Irregular</dct:accrualPeriodicity>
       <dct:modified>2016-02-03T21:33:45</dct:modified>
       <dc:identifier>a806d3e1-c240-43a9-bbc3-643e8c93b10d</dc:identifier>
    </simpledc>






Standard codelists
******************


List of all codelists available in the standard.

No codelist defined.