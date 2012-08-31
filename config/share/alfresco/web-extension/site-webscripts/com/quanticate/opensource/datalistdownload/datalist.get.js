function main()
{
	var site;
	if (args.site)
	{
	   site = args.site;
	}
	else
	{
	   site = page.url.templateArgs.site;
	}

	  theUrl = "/slingshot/datalists/lists/site/test/dataLists?page=1&pageSize=512",
      result = remote.call(theUrl),
      canCreate = false,
      datalists = [];
   
   if (result.status == 200)
   {
      response = eval('(' + result.response + ')');
      datalists = response.datalists;  
      canCreate = response.permissions.create;
	  model.datalists = datalists;
	  
   }
	model.site = site;
    


}

main();