.. _managing-privileges:

Managing privileges
###################


To manage privileges to your metadata record and any attached data you will need to identify User Groups and the privileges you want to assign to users in these groups. eg. View the metadata, download the data attached to the record, etc.

For instance, you can specify that the metadata and related services are visible to all (Internet users) or just to internal users only (Intranet). Privileges are assigned on a per group basis. Depending on the user profile (Guest, Registered User, Editor, Admin etc.) access to these functions may differ on a per user basis.

To assign privileges, follow these steps:

- Find your metadata record by using the search option. Whether you have multiple or single results from the search, on top of the individual record or next to the record you will always see a row of buttons including a Privileges button.


- Click on the Privileges button. A drop down menu will appear from which you can assign certain privileges to specific groups using checkboxes. Simply click on the small box next to the privilege to place or remove a checkmark. Set All and Clear All buttons allow you to place and remove the checkmarks all at once.

Below is a brief description for each privilege to help you identify which ones you should assign to which group(s).

**Publish**: Users in the specified group/s are able to view the metadata eg. if it matches search criteria entered by such a user.

**Download**: Users in the specified group/s are able to download the data.

**Interactive Map**: Users in the specified group/s are able to get an interactive map. The interactive map has to be created separately using a Web Map Server such as GeoServer, which is distributed with GeoNetwork.

**Featured**: When randomly selected by GeoNetwork, the metadata record can appear in the `Featured` section of the GeoNetwork home page.

**Notify**: Users in the specified group receive notification if data attached to the metadata record is downloaded.