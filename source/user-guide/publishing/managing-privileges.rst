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


Please review and make sure that you understand :ref:`user_profiles` in the User and Group Administration section of this manual.

.. note:: A public metadata record is a metadata record that has the view privilege for the group named "All".

The following rules apply to Viewing and Editing permissions on a metadata record:

Viewing
-------

An *administrator* can view any metadata.

A *content reviewer* can view a metadata if:

#. The metadata is public or

#. The metadata is part of a group that the user is a member of.

A *user administrator* or an *editor* can view:

#. All metadata that has the view privilege selected for one of the groups she/he is member of.

#. All metadata created by her/him.

A *registered user* can view:

#. All metadata that has the view privilege selected for one of the groups she/he is member of.

Public metadata can be viewed by any user (logged in or not).

Editing
-------

An *administrator* can edit any metadata.

A *reviewer* can edit a metadata if:

#. The metadata owner is member of one of the groups assigned to the reviewer.

#. She/he is the metadata owner.

A *User Administrator* or an *Editor* can only edit metadata she/he created.

Setting Privileges on a metadata record
---------------------------------------

A button to access the Privileges page for a metadata record will appear in the search results or when the record is being viewed for:

#. All Administrators

#. All Reviewers that are member of one of the groups assigned to the metadata owner.

#. The Owner of the metadata

Privileges for the All and Intranet groups can only be edited by Administrators and Reviewers.

Setting Privileges on a selected set of metadata records
--------------------------------------------------------

Privileges can be set on a selected set of records in the search results using the "actions on selected set" menu.

.. figure:: img/set-selection-privileges.png


The following rules apply:

- the groups are those that the user belongs to
- the privileges specified will only be applied to records that the user has ownership or administration rights on - any other records will be skipped
- the current records privileges will be reset and replaced by the one selected


