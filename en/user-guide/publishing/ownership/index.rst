.. _ownership:

Ownership and Privileges
========================

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

Privileges can be set on a selected set of records in the search results using the "actions on selected set" menu. The following screenshot shows how to access this function:

.. figure:: privileges.png

The following rules apply:

- the groups that will appear in the Privileges page will be those that the user belongs to
- the Privileges specified will only be applied to records that the user has ownership or administration rights on - any other records will be skipped.

Transfer Ownership
------------------

When metadata ownership needs to be transferred from one user to another for all or specific metadata records, the *Transfer Ownership* option is available. 

.. figure:: transfer.png

    *How to open the Transfer Ownership page*
	
It is located in the "actions on selected set" in the search result and once selected, opens the following panel.

.. figure:: dotransfer.png

    *The Transfer Ownership panel*

#. *Select New Owner*: Select a user in this auto-complete.

.. note:: The drop down will be filled with all Editors visible to you. If you are not an Administrator, you will view only a subset of all Editors.

#. *Select group*: Select one of the groups this user is a member of. Privileges to groups All and Intranet are not transferable.



