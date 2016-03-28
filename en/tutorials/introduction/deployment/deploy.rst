.. _tuto-introduction-deployment-deploy:

Deployment using a war file
###########################

To deploy **GeoNetwork** you just have to place the war file provided or generated on the last optional step on a proper java container like Tomcat.

To install Tomcat on a debian-based operative system, you can use the apt-get tool like:

$ **sudo apt-get install tomcat7**

Once you have Tomcat installed on your system, locate the webapps folder and place the geonetwork.war file there. This will deploy GeoNetwork on your system.

You can make sure GeoNetwork is deployed on the following url: http://localhost:8080/geonetwork

