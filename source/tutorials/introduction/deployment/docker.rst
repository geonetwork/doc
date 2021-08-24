.. _tuto-docker:

Deployment with docker
######################

Verify that the system on which you will install the software has a recent Docker engine installed. 
`Docker Desktop <https://www.docker.com/products/docker-desktop>`_ is a good option for local installation.

Open a command-line panel verify that docker engine is running:

  ::

  $ docker --version

Clone or download as a zip file the repository https://github.com/geonetwork/docker-geonetwork.
The relevant folder in that repository is the latest 4.0.x.

Navigate with command-line to that folder (e.g. `cd ~\docker-geonetwork\4.0.5`).
The folder has a file `docker-compose.yml` which defines the orchestration. 
The orchestration will download and deploy the following 

- nginx; manages routing within the orchestration
- postgis; used for database persistence
- geonetwork; the main application
- elasticsearch; the search index
- kibana; the dashboard for elasticsearch

It is important to verify if the ports used in that orchestration (80, 8080, 9200) 
are available on the local system. Alternatively you can change the port mappings in this file.

Spin up the orchestration with: 

  ::

  $ docker-compose up

After a while, the application should be available via http://localhost/geonetwork.

On console to see a list of running containers type:

  ::
  
  $ docker ps

You can verify logs of the geonetwork container with:

  :: 
  
  $ docker logs geonetwork