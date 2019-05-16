/* based on chromium plugin code, adapted by Nibble<.gs@gmail.com> */
var hint_num_str = '';
var hint_elems = [];
var hint_open_in_new_tab = false;
var hint_enabled = false;

function hintMode(newtab){
	hint_enabled = true;
	if (newtab) {
		hint_open_in_new_tab = true;
	} else {
		hint_open_in_new_tab = false;
	}
	setHints();
	document.removeEventListener('keydown', initKeyBind, false);
	document.addEventListener('keydown', hintHandler, false);
	hint_num_str = '';
}

function hintHandler(e){
	e.preventDefault();  //Stop Default Event
	var pressedKey = get_key(e);
	if (pressedKey == 'Enter') {
		if (hint_num_str == '')
			hint_num_str = '1';
		judgeHintNum(Number(hint_num_str));
	} else if (/[0-9]/.test(pressedKey) == false) {
		removeHints();
	} else {
		hint_num_str += pressedKey;
		var hint_num = Number(hint_num_str);
		if (hint_num * 10 > hint_elems.length + 1) {
			judgeHintNum(hint_num);
		} else {
			var hint_elem = hint_elems[hint_num - 1];
			if (hint_elem != undefined && hint_elem.tagName.toLowerCase() == 'a') {
				setHighlight(hint_elem, true);
			}
		}
	}
}

function setHighlight(elem, is_active) {
	if (is_active) {
		var active_elem = document.body.querySelector('a[highlight=hint_active]');
		if (active_elem != undefined)
			active_elem.setAttribute('highlight', 'hint_elem');
		elem.setAttribute('highlight', 'hint_active');
	} else {
		elem.setAttribute('highlight', 'hint_elem');
	}

}

function setHintRules() {
	 if (document.styleSheets.length < 1) {
	    var style = document.createElement("style");
	    style.appendChild(document.createTextNode(""));
	    document.head.appendChild(style);
	}
	var ss = document.styleSheets[0];
	ss.insertRule('a[highlight=hint_elem] {border: 1px solid red;}', 0);
	ss.insertRule('a[highlight=hint_active] {border: 1px solid lime;}', 0);
}

function deleteHintRules() {
	var ss = document.styleSheets[0];
	ss.deleteRule(0);
	ss.deleteRule(0);
}

function judgeHintNum(hint_num) {
	var hint_elem = hint_elems[hint_num - 1];
	if (hint_elem != undefined) {
		execSelect(hint_elem);
	} else {
		removeHints();
	}
}

function execSelect(elem) {
	var tag_name = elem.tagName.toLowerCase();
	var type = elem.type ? elem.type.toLowerCase() : "";
	if (tag_name == 'a' && elem.href != '') {
		setHighlight(elem, true);
		// TODO: ajax, <select>
		if (hint_open_in_new_tab)
			window.open(elem.href);
		else location.href=elem.href;

	} else if (tag_name == 'input' && (type == "submit" || type == "button" || type == "reset")) {
		elem.click();
	} else if (tag_name == 'input' && (type == "radio" || type == "checkbox")) {
		// TODO: toggle checkbox
		elem.checked = !elem.checked;
	} else if (tag_name == 'input' || tag_name == 'textarea') {
		elem.focus();
		elem.setSelectionRange(elem.value.length, elem.value.length);
	}
	removeHints();
}

function setHints() {
	setHintRules();
	var win_top = window.scrollY;
	var win_bottom = win_top + window.innerHeight;
	var win_left = window.scrollX;
	var win_right = win_left + window.innerWidth;
	// TODO: <area>
	var elems = document.body.querySelectorAll('a, input:not([type=hidden]), textarea, select, button');
	var div = document.createElement('div');
	div.setAttribute('highlight', 'hints');
	document.body.appendChild(div);
	for (var i = 0; i < elems.length; i++) {
		var elem = elems[i];
		if (!isHintDisplay(elem))
			continue;
		var pos = elem.getBoundingClientRect();
		var elem_top = win_top + pos.top;
		var elem_bottom = win_top + pos.bottom;
		var elem_left = win_left + pos.left;
		var elem_right = win_left + pos.left;
		if ( elem_bottom >= win_top && elem_top <= win_bottom) {
			hint_elems.push(elem);
			setHighlight(elem, false);
			var span = document.createElement('span');
			span.style.cssText = [
				'left: ', elem_left, 'px;',
				'top: ', elem_top, 'px;',
				'position: absolute;',
				'font-size: 13px;',
				'background-color: ' + (hint_open_in_new_tab ? '#ff6600' : 'red') + ';',
				'color: white;',
				'font-weight: bold;',
				'padding: 0px 1px;',
				'z-index: 100000;'
					].join('');
			span.innerHTML = hint_elems.length;
			div.appendChild(span);
			if (elem.tagName.toLowerCase() == 'a') {
				if (hint_elems.length == 1) {
					setHighlight(elem, true);
				} else {
					setHighlight(elem, false);
				}
			}
		}
	}
}

function isHintDisplay(elem) {
	var pos = elem.getBoundingClientRect();
	return (pos.height != 0 && pos.width != 0);
}

function removeHints() {
	if (!hint_enabled)
		return;
	hint_enabled = false;
	deleteHintRules();
	for (var i = 0; i < hint_elems.length; i++) {
		hint_elems[i].removeAttribute('highlight');
	}
	hint_elems = [];
	hint_num_str = '';
	var div = document.body.querySelector('div[highlight=hints]');
	if (div != undefined) {
		document.body.removeChild(div);
	}
	document.removeEventListener('keydown', hintHandler, false);
	document.addEventListener('keydown', initKeyBind, false);
}

function addKeyBind( key, func, eve ){
	var pressedKey = get_key(eve);
	if( pressedKey == key ){
		eve.preventDefault();  //Stop Default Event
		eval(func);
	}
}

document.addEventListener( 'keydown', initKeyBind, false );

function initKeyBind(e){
	var t = e.target;
	if( t.nodeType == 1){
		addKeyBind( 'A-f', 'hintMode()', e );
		addKeyBind( 'A-F', 'hintMode(true)', e );
		addKeyBind( 'A-c', 'removeHints()', e );
	}
}

var keyId = {
	"U+0008" : "BackSpace",
	"U+0009" : "Tab",
	"U+0018" : "Cancel",
	"U+001B" : "Esc",
	"U+0020" : "Space",
	"U+0021" : "!",
	"U+0022" : "\"",
	"U+0023" : "#",
	"U+0024" : "$",
	"U+0026" : "&",
	"U+0027" : "'",
	"U+0028" : "(",
	"U+0029" : ")",
	"U+002A" : "*",
	"U+002B" : "+",
	"U+002C" : ",",
	"U+002D" : "-",
	"U+002E" : ".",
	"U+002F" : "/",
	"U+0030" : "0",
	"U+0031" : "1",
	"U+0032" : "2",
	"U+0033" : "3",
	"U+0034" : "4",
	"U+0035" : "5",
	"U+0036" : "6",
	"U+0037" : "7",
	"U+0038" : "8",
	"U+0039" : "9",
	"U+003A" : ":",
	"U+003B" : ";",
	"U+003C" : "<",
	"U+003D" : "=",
	"U+003E" : ">",
	"U+003F" : "?",
	"U+0040" : "@",
	"U+0041" : "a",
	"U+0042" : "b",
	"U+0043" : "c",
	"U+0044" : "d",
	"U+0045" : "e",
	"U+0046" : "f",
	"U+0047" : "g",
	"U+0048" : "h",
	"U+0049" : "i",
	"U+004A" : "j",
	"U+004B" : "k",
	"U+004C" : "l",
	"U+004D" : "m",
	"U+004E" : "n",
	"U+004F" : "o",
	"U+0050" : "p",
	"U+0051" : "q",
	"U+0052" : "r",
	"U+0053" : "s",
	"U+0054" : "t",
	"U+0055" : "u",
	"U+0056" : "v",
	"U+0057" : "w",
	"U+0058" : "x",
	"U+0059" : "y",
	"U+005A" : "z",
	//"U+005B" : "[",
	//"U+005C" : "\\",
	//"U+005D" : "]",
	"U+00DB" : "[",
	"U+00DC" : "\\",
	"U+00DD" : "]",
	"U+005E" : "^",
	"U+005F" : "_",
	"U+0060" : "`",
	"U+007B" : "{",
	"U+007C" : "|",
	"U+007D" : "}",
	"U+007F" : "Delete",
	"U+00A1" : "¡",
	"U+0300" : "CombGrave",
	"U+0300" : "CombAcute",
	"U+0302" : "CombCircum",
	"U+0303" : "CombTilde",
	"U+0304" : "CombMacron",
	"U+0306" : "CombBreve",
	"U+0307" : "CombDot",
	"U+0308" : "CombDiaer",
	"U+030A" : "CombRing",
	"U+030B" : "CombDblAcute",
	"U+030C" : "CombCaron",
	"U+0327" : "CombCedilla",
	"U+0328" : "CombOgonek",
	"U+0345" : "CombYpogeg",
	"U+20AC" : "€",
	"U+3099" : "CombVoice",
	"U+309A" : "CombSVoice",
}

function get_key(evt){
	var key = keyId[evt.keyIdentifier] || evt.keyIdentifier,
		alt = evt.altKey ? 'A-' : '',
		meta = (evt.metaKey || evt.altKey) ? 'M-' : '',
		shift = evt.shiftKey ? 'S-' : '';
	if (evt.shiftKey){
		if (/^[a-z]$/.test(key))
			return alt+key.toUpperCase();
		if (/^[0-9]$/.test(key)) {
			switch(key) {
				// TODO
				case "4":
					key = "$";
				break;
			};
			return key;
		}
		if (/^(Enter|Space|BackSpace|Tab|Esc|Home|End|Left|Right|Up|Down|PageUp|PageDown|F(\d\d?))$/.test(key))
			return alt+shift+key;
	}
	return alt+key;
}

// easy links for surf
// christian hahn <ch radamanthys de>, sep 2010

/**
run=function() {
	// config , any css
	var modkey      = 18;  //ctrl=17, alt=18
	var cancelkey   = 67;  // c
	var newwinkey   = 84;  // t
	var openkey     = 70;  // f
	var label_style = {"color":"black","fontSize":"10px","backgroundColor":"#27FF27","fontWeight":"normal","margin":"0px","padding":"0px","position":"absolute","zIndex":99};
	var hl_style    = {"backgroundColor":"#E3FF38","fontSize":"15px"};
	var nr_base     = 5;   // >=10 : normal integer,

	// globals
	var ankers     = document.getElementsByTagName("a");
	var labels     = new Object();
	var ui_visible = false;
	var input      = "";

	// functions
	hl=function(t) {
		for(var id in labels) {
			if (t && id.match("^"+t)==t)
				for(var s in hl_style)
					labels[id].rep.style[s]=hl_style[s];
			else
				for(var s in label_style)
					labels[id].rep.style[s]=label_style[s];
		}
	}
	open_link=function(id, new_win) {
		try {
			var a = labels[input].a;
			if(a && !new_win) window.location.href=a.href;
			if(a && new_win)  window.open(a.href,a.href);
		} catch (e) {}
	}
	set_ui=function(s) {
		var pos = "static";
		ui_visible = true;
		if(s == "hidden") {
			ui_visible = false;
			pos = "absolute";
			input="";
		}
		for(var id in labels) {
			labels[id].rep.style.visibility=s;
			labels[id].rep.style.position=pos;
		}
	}
	base=function(n, b) {
		if(b>=10) return n.toString();
		var res = new Array();
		while(n) {
			res.push( (n%b +1).toString() )
			n=parseInt(n/b);
		}
		return res.reverse().join("");
	}

	// main
	// create labels
	for (var i=0; i<ankers.length; i++) {
		var a = ankers[i];
		if (!a.href) continue;
		var b = base(i+1,nr_base);
		var d = document.createElement("span");
		d.style.visibility="hidden";
		d.innerHTML=b;
		for(var s in label_style)
			d.style[s]=label_style[s];
		labels[b]={"a":a, "rep":d};
		a.parentNode.insertBefore(d, a.nextSibling);
	}

	// set key handler
	window.onkeydown=function(e) {
		if (e.keyCode == modkey) {
			set_ui("visible");
		}
	}
	window.onkeyup=function(e) {
		if (e.keyCode == modkey ) {
			open_link(input);
			set_ui("hidden");
			hl(input);
		} else if (ui_visible) {
			if(e.keyCode == newwinkey) {
				open_link(input, true);
				set_ui("hidden");
			} else if(e.keyCode == cancelkey)
				input="";
			else if(e.keyCode == openkey) {
				open_link(input);
				set_ui("hidden");
			} else
				input += String.fromCharCode(e.keyCode);
			hl(input);
		}
	}
}

testcomplete = function() {
	if(document.readyState=="complete") {
		run(); return;
	}
	window.setTimeout("testcomplete()",200);
}
testcomplete();
**/
/* See COPYING file for copyright, license and warranty details. */

(function() {
	document.addEventListener('keydown', keybind, false);
})();

function keybind(e) {
	if(e.ctrlKey && String.fromCharCode(e.keyCode) == "E")
		simplyread();
}
/* See COPYING file for copyright, license and warranty details. */

if(window.content && window.content.document && window.content.document.simplyread_original === undefined) window.content.document.simplyread_original = false;

function simplyread(nostyle, nolinks)
{
	/* count the number of <p> tags that are direct children of parenttag */
	function count_p(parenttag)
	{
		var n = 0;
		var c = parenttag.childNodes;
		for (var i = 0; i < c.length; i++) {
			if (c[i].tagName == "p" || c[i].tagName == "P")
				n++;
		}
		return n;
	}

	var doc;
	doc = (document.body === undefined)
	      ? window.content.document : document;

	/* if simplyread_original is set, then the simplyread version is currently active,
	 * so switch to the simplyread_original html */
	if (doc.simplyread_original) {
		doc.body.innerHTML = doc.simplyread_original;
		for (var i = 0; i < doc.styleSheets.length; i++)
			doc.styleSheets[i].disabled = false;
		doc.simplyread_original = false
		return 0;
	}

	doc.simplyread_original = doc.body.innerHTML;
	doc.body.innerHTML = doc.body.innerHTML.replace(/<br[^>]*>\s*<br[^>]*>/g, "<p>");

	var biggest_num = 0;
	var biggest_tag;

	/* search for tag with most direct children <p> tags */
	var t = doc.getElementsByTagName("*");
	for (var i = 0; i < t.length; i++) {
		var p_num = count_p(t[i]);
		if (p_num > biggest_num) {
			biggest_num = p_num;
			biggest_tag = t[i];
		}
	}

	if (biggest_num == 0) return 1;

	/* save and sanitise content of chosen tag */
	var fresh = doc.createElement("div");
	fresh.innerHTML = biggest_tag.innerHTML;
	fresh.innerHTML = fresh.innerHTML.replace(/<\/?font[^>]*>/g, "");
	fresh.innerHTML = fresh.innerHTML.replace(/style="[^"]*"/g, "");
	if(nolinks)
		fresh.innerHTML = fresh.innerHTML.replace(/<\/?a[^>]*>/g, "");
	fresh.innerHTML = fresh.innerHTML.replace(/<\/?span[^>]*>/g, "");
	fresh.innerHTML = fresh.innerHTML.replace(/<style[^>]*>/g, "<style media=\"aural\">"); /* ensures contents of style tag are ignored */

	for (var i = 0; i < doc.styleSheets.length; i++)
		doc.styleSheets[i].disabled = true;

	srstyle =
		"p,ol,li,code,blockquote,pre,figure{padding: 5px;} h1,h2,h3,h4{font-weight:normal}" +
		"p+p{text-indent:2em;} body{background:#fff; color: #333; font-familiy: Helvetica, Arial, sans-serif; padding: 1em;font-size:20px;}" +
		"img{display:block; max-width: 32em; padding:1em; margin: auto}" +
        "a{color: #0095dd;}" +
		"h1{font-size: 1.6em; line-height: 1.25em; width: 100%; margin: 30px 0; padding: 0;}" +
		"div#sr{width:34em; padding:8em; padding-top:2em;" +
		"  background-color:white; margin:auto; line-height:1.6em;" +
		"  text-align:justify; hyphens:auto;}";
		/* text-rendering:optimizeLegibility; - someday this will work,
		 *   but at present it just ruins justify, so is disabled */

	doc.body.innerHTML =
		"<style type=\"text/css\">" + (nostyle ? "" : srstyle) + "</style>" +
		"<div id=\"sr\">" + "<h1>"+doc.title+"</h1><hr/>" + fresh.innerHTML + "</div>";

	return 0;
}