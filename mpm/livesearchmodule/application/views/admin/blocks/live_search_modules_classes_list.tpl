      <div id="live_search_in_classes_modules_list">
        [{ oxmultilang ident="MPM_LIVESEARCHMODULE_SEARCH_CLASS_LABEL" }]:
        <input type="type" id="search_class" /><input type="button" value="[{ oxmultilang ident="MPM_LIVESEARCHMODULE_SEARCH_RESET" }]" id="reset_search_class" />
        <script type="text/javascript">
         function search_class() {
           var text = document.getElementById('search_class').value.trim().toLowerCase();
           var classes_list = document.getElementById('aModulesList');
           var lis = classes_list.children;
           var r = 0;
           var li, row_text;
           document.cookie = "search_class=" + text;
           if (text == "") { // if empty - restore
             while(li=lis[r++]) {
               li.style.display="block";
             }
             return;
           }
           while(li=lis[r++]) {
             row_text = li.innerText.trim().toLowerCase();
             if ( search(row_text, text) ) {
               li.style.display="block";
             } else {
               li.style.display="none";
             }
           }
           return;
         }
         function search(haystack, needle) {
           var ln = needle.split(' ');
           for (i=0;i<ln.length;i++) {
             if (haystack.indexOf(ln[i]) < 0) return false;
           }
           return true;
         }
         document.getElementById('search_class').onkeyup = search_class;
         document.getElementById('reset_search_class').onclick = function () {
           document.getElementById('search_class').value = '';
           search_class();
         };
         document.onreadystatechange = function () {
           if (document.readyState === "interactive") {
             var previousearch = document.cookie.replace(/(?:(?:^|.*;\s*)search_class\s*\=\s*([^;]*).*$)|^.*$/, "$1");
             if (previousearch != '') {
               document.getElementById('search_class').value = previousearch;
               search_class();
             }
           }
         };
        </script>
      </div>

[{$smarty.block.parent}]
