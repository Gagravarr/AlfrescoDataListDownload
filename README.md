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
 * OpenDocument Format (odf) **comming soon**

The Repository AMP provides the support for exporting DataLists as
Spreadsheets. It builds upon the code in Alfresco, fixing various bugs
present in the webscripts there, and extending them to add additional
features and formats.

Building
========
The current version works with Alfresco Enterprise 4.1.4 and newer,
and should work fine on Community 4.2.x. Due to a breaking change in
the DataModel API in late 2012, earlier versions of Alfresco are
no longer supported. For a version to work with those older Alfresco's,
use a version of this library from early 2013 instead.

To build, simply run "ant", and the two AMPs will be produced in
the /build/dist/ directory. Install them to Share and the Alfresco Repository
wars as normal.

Installation
============
Once you have built both the AMPs, install them to the respective WARs
using the MMT jar, and restart Tomcat. You'll do something like

   java -jar alfresco-mmt.jar install DataListDownloadRepo.amp alfresco.war
   java -jar alfresco-mmt.jar install DataListDownloadShare.amp share.war

The export is handled by a site dashlet. On the site where you would like
to export Data Lists, Customise the Dashboard and add the **DataList Export**
Dashlet to your site. No configuration is required, just pick the 
DataList you'd like to export and the format to export in!

License
=======
The code is available under the LGPL v3 License, which is the same license
that Alfresco itself is made available under.
