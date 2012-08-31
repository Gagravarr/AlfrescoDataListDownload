<#include "/org/alfresco/components/component.head.inc"> 

<!-- Data List Export --> 
<script type="text/javascript">
if (typeof Quanticate == "undefined" || !Quanticate)
{
   var Quanticate = {};
   Quanticate.dashlet = {};  
}


(function()
{
   /**
    * YUI Library aliases
    */
   var Dom = YAHOO.util.Dom,
      Event = YAHOO.util.Event,
      Selector = YAHOO.util.Selector;

   /**
    * GetLatestDoc constructor.
    *
    * @param {String} htmlId The HTML id of the parent element
    * @return {politie.dashlet.GetLatestDoc} The new GetLatestDoc instance
    * @constructor
    */
   Quanticate.dashlet.DataListExport = function DataListExport_constructor(htmlId)
   {
      Quanticate.dashlet.DataListExport.superclass.constructor.call(this, "Quanticate.dashlet.DataListExport", htmlId);

      /**
       * Register this component
       */
      Alfresco.util.ComponentManager.register(this);

      /**
       * Load YUI Components
       */
      Alfresco.util.YUILoaderHelper.require(["button", "container", "datasource", "datatable", "paginator", "json"], this.onComponentsLoaded, this);
               
        return this;
    };

    YAHOO.extend(Quanticate.dashlet.DataListExport, Alfresco.component.Base,
    {
      /**
        * Object container for initialization options
        *
        * @property options
        * @type object
        */
       options:
       {
          componentId: "",
          siteId: "",
          title: "Data List Export Dashlet",
          filterPath: "",
          containerId: "documentLibrary",
       },

       widgets: {},

       /**
        *      Fired by YUI when parent element is available for scripting
        *
        *      @method onReady
        */
        onReady: function DataListDownload_onReady()
        {
            var me = this;

//          // Create dropdown filter widget
//          this.widgets.formats = Alfresco.util.createYUIButton(this, "formats", this.onFormatChanged,
//          {
//             type: "menu",
//             menu: "formats-menu",
//             lazyloadmenu: false
//          });
//
//          // Defaults
//          this.widgets.formats.set("label", this.msg("filter.xls"));
//          this.widgets.formats.value = "xls";
        },

        /**
         * Formats drop-down changed event handler
         *
         * @method onFormatChanged
         * @param p_sType {string} The event
         * @param p_aArgs {array} Event arguments
         */
        onFormatChanged: function DataListExport_onFormatChanged(p_sType, p_aArgs)
        {
           var menuItem = p_aArgs[1];

           if (menuItem)
           {
              this.widgets.formats.set("label", menuItem.cfg.getProperty("text"));
              this.widgets.formats.value = menuItem.value;

              // Find the links, and re-write them
              var links = Selector.query("a.dldownload-"+this.id);
              for (var link in links)
              {
                var href = link.href;
                var formatAt = href.indexOf("format=");
                link.href = href.substring(0, formatAt) + "format=" + menuItem.value;
              }
           }
        },
    });
})();
</script>

<!-- Simple Dialog --> 
<@script type="text/javascript" src="${page.url.context}/modules/simple-dialog.js"></@script> 

<!-- Resize -->
<@script type="text/javascript" src="${page.url.context}/res/yui/resize/resize.js"></@script>
