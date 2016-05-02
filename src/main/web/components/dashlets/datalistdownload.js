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
   Alfresco.dashlet.DataListExport = function DataListExport_constructor(htmlId)
   {
      return Alfresco.dashlet.DataListExport.superclass.constructor.call(this, "Alfresco.dashlet.DataListExport", htmlId, ["button","container","animation"]);
   };

   YAHOO.extend(Alfresco.dashlet.DataListExport, Alfresco.component.Base,
   {
      /**
        * Object container for initialization options
        *
        * @property options
        * @type object
        */
       options:
       {
          siteId: "",
          title: "Data List Export Dashlet"
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

            // Create dropdown filter widget
            this.widgets.formats = Alfresco.util.createYUIButton(this, "formats", this.onFormatChanged,
            {
               type: "menu",
               menu: "formats-menu",
               lazyloadmenu: false
            });
  
            // Defaults
            this.widgets.formats.set("label", this.msg("format.xls"));
            this.widgets.formats.value = "xls";

            // Display the toolbar now that we have selected the filter
            Dom.removeClass(Selector.query(".toolbar div", this.id, true), "hidden");
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
              for (var i=0; i<links.length; i++)
              {
                 var link = links[i];
                 var href = link.href;
                 var formatAt = href.indexOf("format=");
                 var nhref = href.substring(0, formatAt) + "format=" + menuItem.value;
                 link.href = nhref;
              }
           }
        }
    });
})();
