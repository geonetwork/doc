.. _installing-on-windows:

Installing on Windows
######################

System Requirements
===================

GeoNetwork is developed with Java 8, and can run on any platform that supports Java (Windows, Linux and Mac OSX).

GeoNetwork will not run with newer versions, or with Java 7, 1.6 or earlier releases.

In order to install GeoNetwork, you will need:

* Java Development Kit (JDK), version 8.
You can get a Java 8 JDK from your Linux distribution, [Oracle OpenJDK](http://openjdk.java.net/) or [AdoptOpenJDK](https://adoptopenjdk.net). 
[Oracle JDK](http://www.oracle.com/technetwork/java/javase/downloads) Java 8 is no longer distributed for development, only testing purposes.

* A Servlet container. 
GeoNetwork comes with an embedded container ([Eclipse Jetty](https://www.eclipse.org/jetty/)) which is fast and well suited for most applications. 
Alternatively, you can install Tomcat from the Apache Software Foundation (http://tomcat.apache.org). It provides load balancing, fault tolerance and other production features. 
We recommend installing Tomcat 8.x.

* For storage, you need a Database Management System (DBMS) like Oracle, MySQL, Postgresql etc. 
GeoNetwork comes with an embedded DBMS (H2) which is used by default during installation. 
This DBMS can be used for small or desktop installations of no more than a few thousand metadata records with one or two users. 
For heavier demand, use a professional, stand alone DBMS.

* Minimum 2GB RAM. 
GeoNetwork is not resource intensive and does not require a powerful machine. 

* Recommended 250GB hard disk space, 
This includes the space required for the application itself (about 350 MB) and the space required for data, which can require 50 GB or more.  

* Search index disk space - recommended 500MB.
You also need disk space for the search index which is located in ``GEONETWORK_DATA_DIR/index`` (by default GEONETWORK_DATA_DIR is ``INSTALL_DIR/web/geonetwork/WEB_INF/data``. 

The software is run in different ways depending on the servlet container you are using:

* *Tomcat* - GeoNetwork is available as a WAR file which you can put into the Tomcat webapps directory. Tomcat will deploy the WAR file when it is started. You can then use the Tomcat manager web application to stop/start GeoNetwork. You can also use the startup.* and shutdown.* scripts located in the Tomcat bin directory (.* means .sh or .bat depending on your OS) but if you have other web applications in the tomcat container, then they will also be affected.
* *Jetty* - If you use the provided container you can use the scripts in GeoNetwork’s bin directory. The scripts are startup.* and shutdown.* and you must be inside the bin directory to run them. You can use these scripts just after installation.

Tools
=====

The following tools are required to be installed to setup a development environment for GeoNetwork:

* **Java** - Developing with GeoNetwork requires Java Development Kit (JDK) 1.8.
* **Maven** 3.1.0+ - GeoNetwork uses [Maven](http://maven.apache.org/) to manage the build process and the dependencies. Once is installed, you should have the mvn command in your path (on Windows systems, you have to open a shell to check).
* **Git** - GeoNetwork source code is stored and versioned in [a Git repository on Github](https://github.com/geonetwork/core-geonetwork). Depending on your operating system a variety of git clients are avalaible. Check in http://git-scm.com/downloads/guis for some alternatives.  Good documentation can be found on the git website: http://git-scm.com/documentation and on the Github website https://help.github.com/.
* **Ant** - GeoNetwork uses [Ant](http://ant.apache.org/) to build the installer.  Version 1.6.5 works but any other recent version should be OK. Once installed, you should have the ant command in your path (on Windows systems, you have to open a shell to check).
* **Sphinx** - To create the GeoNetwork documentation in a nice format [Sphinx](http://sphinx.pocoo.org/) is used.
* (Optional) **Python and closure** - See [web-ui module documentation](/web-ui/) .

The quick way
=============


