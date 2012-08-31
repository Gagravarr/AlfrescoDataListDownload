function main()
{
   // Work out what Site they want to query
	var site;
	if (args.site)
	{
	   site = args.site;
	}
	else
	{
	   site = page.url.templateArgs.site;
	}

   // Ask the Repo for the datalists in it
	var url = "/slingshot/datalists/lists/site/"+site+"/dataLists?page=1&pageSize=512";
   var result = remote.call(url);

   var canCreate = false;
   var datalists = [];
   
   // Grab the details, and record them
   if (result.status == 200)
   {
      response = eval('(' + result.response + ')');
      datalists = response.datalists;  
      canCreate = response.permissions.create;
   }

	model.datalists = datalists;
   model.canCreate = canCreate;
	model.site = site;
}

main();
