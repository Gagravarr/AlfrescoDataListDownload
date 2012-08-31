<#assign id = args.htmlid>
<#assign jsid = args.htmlid?js_string>

<script type="text/javascript">//<![CDATA[
(function()
{
   new Alfresco.widget.DashletResizer("${id}", "${instance.object.id}");
   new Alfresco.widget.DashletTitleBarActions("${args.htmlid}").setOptions(
   {
      actions:
      [
         {
            cssClass: "help",
            bubbleOnClick:
            {
               message: "${msg("dashlet.help")?js_string}"
            },
            tooltip: "${msg("dashlet.help.tooltip")?js_string}"
         }
      ]
   });
})();
//]]></script>

<div class="dashlet">
	<div class="title">${msg("header")}</div>

   <#if datalists?has_content>
     <div class="toolbar flat-button">
     </div>
   </#if>

	<div class="body scrollableList" <#if args.height??>style="height: ${args.height}px;"</#if>>
      <#if datalists?has_content>
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
      <#else>
         <div style="margin: 0.4em">
           <p>There are no Data Lists defined in your site, so nothing can
            be exported.</p>
           <p>Please visit the <a href="${url.context}/page/site/${site}/data-lists">Data Lists</a>
            section of your site to add new Data Lists.</p>
         </div>
      </#if>
    </div>
</div>
