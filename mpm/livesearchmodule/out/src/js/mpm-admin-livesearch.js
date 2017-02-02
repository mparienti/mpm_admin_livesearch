function mpm_exists() { console.log('ja');}

function mpm_bluid_search(id_form, container, storage_key, default_display, use_row = false, first_children=0) {

  return function () {
    var text = document.getElementById(id_form).value.trim().toLowerCase();
    var lis;
    var r = first_children;
    var li, row_text;

    if (use_row) {
      lis = container.rows;
    } else {
      lis = container.children;
    }

    try { window['localStorage'].setItem(storage_key, text); } catch(e){ console.log(e)}
    if (text == "") { // if empty - restore
      while(li=lis[r++]) {
        li.style.display = default_display;
      }
      return;
    }
    while(li=lis[r++]) {
      row_text = li.innerText.trim().toLowerCase();
      if ( mpm_common_search_text(row_text, text) ) {
        li.style.display = default_display;
      } else {
        li.style.display = "none";
      }
    }
    return;
  }
}

function mpm_common_search_text(haystack, needle) {
  var ln = needle.split(' ');
  for (i=0;i<ln.length;i++) {
    if (haystack.indexOf(ln[i]) < 0) return false;
  }
  return true;
}
function launch() {
  
}

/*
 document.getElementById('search_class').onkeyup = search_class;
 document.getElementById('reset_search_class').onclick = function () {
   document.getElementById('search_class').value = '';
   search_class();
 };
document.onreadystatechange = function () {
   if (document.readyState === "interactive") {
     var previousearch = '';
     try { previousearch = window['localStorage'].getItem(search_module_storage_key); } catch(e){}
     if (previousearch != '') {
       document.getElementById('search_class').value = previousearch;
       search_class();
     }
   }
};
*/
