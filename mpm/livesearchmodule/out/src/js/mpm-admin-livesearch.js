function mpm_bluid_search(id_form, container, storage_key, use_row = false, first_children=0) {//display

  return function () {
    var text = document.getElementById(id_form).value.trim().toLowerCase();
    var lis;
    var r = first_children;
    var li, row_text, default_display;

    if (use_row) {
      lis = container.rows;
      default_display = 'table-row';
    } else {
      lis = container.children;
      default_display = 'block';
    }

    try { window['localStorage'].setItem(storage_key, text); } catch(e){ console.log(e)}
    if (text == "") { // if empty - restore
      while(li=lis[r++]) {
        mpm_clean_highlight(li);
        li.style.display = default_display;
      }
      return;
    }
    while(li=lis[r++]) {
      row_text = li.innerText.trim().toLowerCase();
      //condition?
      mpm_clean_highlight(li);
      if ( mpm_common_search_text(row_text, text) ) {
        li.style.display = default_display;
        mpm_highlight(li, text);
      } else {
        li.style.display = "none";
      }
    }
    return;
  }
}

function mpm_clean_highlight(node) {
  var children = Array.prototype.slice.call(node.childNodes), i, cur;

  for (i = 0; i < children.length; i++) {
    cur = children[i];

    if (cur.nodeType === 1) {
      if ( cur.classList.contains('mpm_hg') &&
           cur.tagName == 'SPAN' ) {
             new_node = document.createTextNode(cur.textContent);
             cur.parentNode.replaceChild(new_node, cur);
           } else {
             mpm_clean_highlight(cur);
           }
    }
  }
  node.normalize();
}

/*
 http://stackoverflow.com/questions/8644428/how-to-highlight-text-using-javascript
*/

function mpm_highlight(node, needle) {
  var ln = needle.split(' ');
  var sub_needle;
  for (i=0;i<ln.length;i++) {
    sub_needle = ln[i];
    mpm_highlight_node(node, sub_needle);
  }
}

function mpm_highlight_text(node, needle) {
  var text = node.nodeValue, parent = node.parentNode, new_text, new_node, children, i;
  if (text.trim() == '') {
    return ;
  }
  var regex = new RegExp( '(' + needle + ')', 'gi' );
  new_text = text.replace(regex, function (match, p1){ return '<span class="mpm_hg">' + p1 + '</span>'; } );
  if (new_text != text) {
    new_node = document.createElement('span');
    new_node.innerHTML = new_text;
    children = Array.prototype.slice.call(new_node.childNodes);
    for (i = 0; i < children.length; i++) {
      parent.insertBefore(children[i], node);
    }
    parent.removeChild(node);
  }
}

function mpm_highlight_node(node, needle) {
  var children = Array.prototype.slice.call(node.childNodes), i, cur;
  if (needle.length < 3) {
    return ;
  }
  if (children.length) {
    for (i = 0; i < children.length; i++) {
      cur = children[i];
      if (cur.nodeType === 3 && needle != '') {
        mpm_highlight_text(cur, needle);
      } else if (cur.nodeType === 1) {
        mpm_highlight_node(cur, needle);
      }
    }
  }
  node.normalize();
}

function mpm_common_search_text(haystack, needle) {
  var ln = needle.split(' ');
  for (i=0;i<ln.length;i++) {
    if (haystack.indexOf(ln[i]) < 0) return false;
  }
  return true;
}
