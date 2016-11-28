      <div id="live_search_in_modules_list">
        [{ oxmultilang ident="MPM_LIVESEARCHMODULE_SEARCH_LABEL" }]:
        <input type="type" id="search_module" /><input type="button" value="[{ oxmultilang ident="MPM_LIVESEARCHMODULE_SEARCH_RESET" }]" id="reset_search_module" />
        <script type="text/javascript">
         function search_module() {
           var text = document.getElementById('search_module').value.trim().toLowerCase();
           var table_module = document.getElementsByTagName('table')[0];
           var r = 2;
           var row, row_text;
           if (text == "") { // if empty - restore
             while(row=table_module.rows[r++]) {
               row.style.display="table-row";
             }
             return;
           }
           while(row=table_module.rows[r++]) {
             row_text = row.innerText.trim().toLowerCase();
             if (row_text.indexOf(text) < 0) {
               row.style.display="none";
             } else {
               row.style.display="table-row";
             }
           }
           return;
         }
         document.getElementById('search_module').onkeyup = search_module;
         document.getElementById('reset_search_module').onclick = function () {
           document.getElementById('search_module').value = '';
           search_module();
         };
        </script>
      </div>

[{$smarty.block.parent}]
