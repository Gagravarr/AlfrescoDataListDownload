<div class="dashlet">
	<div class="title">
		Datalist Export
	</div>
	<div class="body scrollableList">
	   <#list datalists as datalist>		
         <div>
            <div id="list">
				 <a href="${url.context}/page/site/${site}/data-lists?list=${datalist.name?html}">
				 ${(datalist.title!"")?html}
				 </a>			   
               <div class="description">${(datalist.description!"")?html}</div>
            </div>        
		</div>
		</#list>
    </div>
</div>

