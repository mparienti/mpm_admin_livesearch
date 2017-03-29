<style>.mpm_hg {background:yellow;}</style>
<script src="[{$oViewConf->getModuleUrl('livesearchmodule','out/src/js/mpm-admin-livesearch.js')}]" type="text/javascript" ></script>
[{ assign var="oConf"     value=$oViewConf->getConfig() }]
      <div id="live_search_in_modules_list">
        [{ oxmultilang ident="MPM_LIVESEARCH_SEARCH_MODULE_LABEL" }]:
        <input type="type" id="search_module" /><input type="button" value="[{ oxmultilang ident="MPM_LIVESEARCH_SEARCH_RESET" }]" id="reset_search_module" />
        <script type="text/javascript">
         var search_module_storage_key = "[{$oConf->getShopURL()}]-[{$oConf->getShopId()}]-module";
         document.onreadystatechange = function () {
           if (document.readyState === "interactive") {
             search_module = mpm_bluid_search('search_module', document.getElementsByTagName('table')[0], search_module_storage_key, true, 2);
             document.getElementById('search_module').onkeyup = search_module;
             document.getElementById('reset_search_module').onclick = function () {
               document.getElementById('search_module').value = '';
               search_module();
             };
             var previousearch  = '';
             try { previousearch = window['localStorage'].getItem(search_module_storage_key); } catch(e){}
             if (previousearch != '') {
               document.getElementById('search_module').value = previousearch;
               search_module();
             }
           }
         };
        </script>
      </div>
[{$smarty.block.parent}]
