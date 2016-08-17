.. _tuto-hookcustomizations-events:

Using Events
############

From GeoNetwork 3.0.x on, there are a number of events you can listen to. To enable this on your Maven project, you have to add the event dependencies. Edit the file custom/pom.xml and add the dependencies tag:


  ::

  <dependencies>
  <dependency>
  <groupId>${project.groupId}</groupId>
  <artifactId>events</artifactId>
  <version>${project.version}</version>
  </dependency>
  <dependency>
  <groupId>${project.groupId}</groupId>
  <artifactId>core</artifactId>
  <version>${project.version}</version>
  </dependency>
  </dependencies>


Then create the file custom/src/main/resources/config-spring-geonetwork.xml to tell Spring to load your custom beans adding the following content:

  .. code::

  <?xml version="1.0" encoding="UTF-8"?>
  <beans xmlns="http://www.springframework.org/schema/beans"
  xmlns:util="http://www.springframework.org/schema/util"
  xmlns:context="http://www.springframework.org/schema/context"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="
  http://www.springframework.org/schema/beans 
  http://www.springframework.org/schema/beans/spring-beans.xsd
  http://www.springframework.org/schema/util
  http://www.springframework.org/schema/util/spring-util.xsd
  http://www.springframework.org/schema/context
  http://www.springframework.org/schema/context/spring-context-3.2.xsd" >
  <bean class="org.fao.geonet.events.listeners.MyCustomListener" ></bean>
  </beans>

This file should contain a list of all the classes that listen to events inside GeoNetwork scope.

We can add a simple example listener like this one:

  .. code::java

  package org.fao.geonet.events.listeners;

  import org.fao.geonet.domain.*;

  import org.fao.geonet.events.md.MetadataRemove;

  import org.springframework.context.ApplicationListener;

  import org.springframework.stereotype.Component;

  @Component
  public class MyCustomListener implements ApplicationListener<MetadataRemove> { 
     @Override
     public void onApplicationEvent(MetadataRemove event) {
 	System.out.println("REMOVED");
     }
  }