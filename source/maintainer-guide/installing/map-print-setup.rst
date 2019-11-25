.. _ map-print-setup:


Configuring printing of the map
###############################

This section describes how to configure the options to print maps. Printing a map generates a 
pdf file on the server which is downloaded by the client to be send to a printer. 
During pdf creation map data is downloaded from various sources to be included in the pdf.

GeoNetwork needs to be able to access the external resource. Set up a webproxy in `system settings`
if your network requires a webproxy to be set up to access the internet.

Locate the file WEB-INF/config-print/print-config.yaml, this configuration file has a lot of options to customise the print options.
Read more about the various parameters at http://www.mapfish.org/doc/print/configuration.html 
The folder contains 2 template files, template.pdf and template-landscape.pdf which are used to generate the final pdf. 
These templates are created by exporting pdf from the included template.odf file in the folder. 


   