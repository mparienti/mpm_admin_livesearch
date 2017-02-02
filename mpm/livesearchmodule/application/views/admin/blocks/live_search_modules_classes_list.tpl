<script src="[{$oViewConf->getModuleUrl('livesearchmodule','out/src/js/mpm-admin-livesearch.js')}]" type="text/javascript" ></script>

[{ assign var="oConf"     value=$oViewConf->getConfig() }]
      <div id="live_search_in_classes_modules_list">
        [{ oxmultilang ident="MPM_LIVESEARCHMODULE_SEARCH_CLASS_LABEL" }]:
        <input type="type" id="search_class" /><input type="button" value="[{ oxmultilang ident="MPM_LIVESEARCHMODULE_SEARCH_RESET" }]" id="reset_search_class" />
        <span > </span>
        <script type="text/javascript">
         var search_class_storage_key = "[{$oConf->getShopURL()}]-[{$oConf->getShopId()}]-class";
         document.onreadystatechange = function () {
           if (document.readyState === "interactive") {
             search_class = mpm_bluid_search('search_class', document.getElementById('aModulesList'), search_class_storage_key);
             document.getElementById('search_class').onkeyup = search_class;
             document.getElementById('reset_search_class').onclick = function () {
               document.getElementById('search_class').value = '';
               search_class();
             };

             var previousearch = '';
             try { previousearch = window['localStorage'].getItem(search_class_storage_key); } catch(e){}
             if (previousearch != '') {
               document.getElementById('search_class').value = previousearch;
               search_class();
             }
           }
         };
        </script>
      </div>

[{$smarty.block.parent}]
