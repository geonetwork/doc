.. _using-multinode-mode:

Using multinode mode
####################

Overview
========

The multinodes mode add the capability to setup more than one catalog using
the same web application. By default, only one node is available.
The node named is "srv". Each nodes have their own:

* data directory (index, files)
* database


The main data directory contains one data folder per node.


This simplify catalog updates for users maintaining a set of catalogs. It
also save resources by sharing some part of the application eg. all catalogs
share the same schemas and thesaurus
(to save memory).


User can only login in one node at a time in the same browser (only one
session allowed). When identified, if user tries to switch to another
node, the catalog propose:

* to log out and continue to the requested node
* to return to previous node


.. figure:: img/node-change-warning.png


Installations running 200 nodes / servers have been setup. Such configuration
require to increase JVM memory configuration (~4Go for Xmx parameter).


Configuration
=============

Trusted hosts
-------------

In |web.xml|, add the list of hosts name or IP used to access the catalog:

.. code-block:: xml

  <init-param>
    <param-name>trustedHost</param-name>
    <param-value>localhost,www.mongeosource.fr</param-value>
  </init-param>

Please note that it's important to do this step, whether you register the new node manually or using the script.

Registering new node manually
-----------------------------

Registering a new node is a 2 steps process. First declare the new node
in |web.xml| in order to declare the URL mapping:


.. code-block:: xml

      <servlet-mapping>
        <servlet-name>spring</servlet-name>
        <url-pattern>/geosource-8/*</url-pattern>
      </servlet-mapping>


Then define the node configuration in ``WEB-INF/config-node/{{node_id}}.xml``.
The configuration defines:

* the node identifier (and if the node is the default one)
* the db connection to use

Only one default node is allowed.

For example, to configure a node named ``geosource-8`` using a ``postgres``
database use the following:

.. code-block:: xml

    <?xml version="1.0" encoding="UTF-8"?>
    <beans default-lazy-init="true"
      xmlns="http://www.springframework.org/schema/beans"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xmlns:context="http://www.springframework.org/schema/context">

        <import resource="classpath*:/config-spring-geonetwork.xml"/>
        <import resource="../config-db/database_migration.xml"/>

        <context:property-override properties-ref="geosource-8-configuration-overrides" />

        <bean id="nodeInfo" class="org.fao.geonet.NodeInfo">
            <property name="id" value="geosource-8" />
            <property name="defaultNode" value="false" />
        </bean>

        <bean id="geosource-8-configuration-overrides"
            class="org.springframework.beans.factory.config.PropertiesFactoryBean">
            <property name="properties">
                <props>
                    <prop key="jdbcDataSource.username">www-data</prop>
                    <prop key="jdbcDataSource.password">www-data</prop>
                    <prop key="jdbcDataSource.maxActive">2</prop>
                    <prop key="jdbcDataSource.maxIdle">2</prop>
                    <prop key="jdbcDataSource.initialSize">2</prop>
                    <prop key="jdbcDataSource.Url">jdbc:postgresql://localhost:5432/db_8</prop>
                </props>
            </property>
        </bean>

        <import resource="../config-db/postgres.xml"/>
    </beans>


Styling the node
----------------

A custom styling could be defined for each node. Add a .css file
in ``catalog/style`` folder.


Creating a node using utility script
------------------------------------


In ``WEB-INF/node-utils``, the ``node-mgr.sh`` script helps adding new node eg. to
add a node with id ``geosource-1044`` connecting to ``postgres`` database
``db_1044`` with a pool size of ``2`` connections, use:

.. code-block:: shell

    ./node-mgr.sh www-data www-data \
                  geosource-1044 \
                  jdbc:postgresql://localhost:5432/db_1044 \
                  postgres 2
