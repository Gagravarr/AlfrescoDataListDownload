AlfrescoDataListDownload
========================

Download as Spreadsheet support for Alfresco DataLists

This comes as two AMPs:
 * DataListDownloadShare.amp - Share Module
 * DataListDownloadRepo.amp - Repository (Alfresco) Module

The Share AMP provides a Dashlet which allows you to browse the DataLists
defined in your site, then trigger an export of the selected DataList
as one of:
 * Excel (xls)
 * Excel (xlsx)
 * CSV (csv)
 * OpenDocument Format (odf)

The Repository AMP provides the support for exporting DataLists as
Spreadsheets. It builds upon the code in Alfresco, fixing various bugs
present in the webscripts there, and extending them to add additional
features and formats.


Building
========
This has been tested against Alfresco Enterprise 4.0.2, and Alfresco 
Enterprise 4.1.0. It ought to work fine on Community 4.x too

To build, simply run "ant", and the two AMPs will be produced in
the /build/dist/ directory. Install them to Share and the Alfresco Repository
wars as normal.

License
=======
The code is available under the LGPL v3 License, which is the same license
that Alfresco itself is made available under.
