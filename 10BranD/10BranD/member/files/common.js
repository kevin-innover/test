var UA = navigator.userAgent.toLowerCase();
var isIE = (document.all && window.ActiveXObject && !window.opera) ? true : false;
var isGecko = UA.indexOf('webkit') != -1;
var DMURL = document.location.protocol+'//'+location.hostname+(location.port ? ':'+location.port : '')+'/';
var AJPath = (DTPath.indexOf('://') == -1 ? DTPath : (DTPath.indexOf(DMURL) == -1 ? DMURL : DTPath))+'ajax.php';
var isMobile=false;
if((UA.indexOf('phone') != -1 || UA.indexOf('mobile') != -1 || UA.indexOf('android') != -1 || UA.indexOf('ipod') != -1) && get_cookie('mobile') != 'pc' && UA.indexOf('ipad') == -1) {isMobile=true;}
if(isIE) try {document.execCommand("BackgroundImageCache", false, true);} catch(e) {}
var xmlHttp;
var Try = {
	these: function() {
		var returnValue;
		for (var i = 0; i < arguments.length; i++) {var lambda = arguments[i]; try {returnValue = lambda(); break;} catch (e) {}}
		return returnValue;
	}
}
function makeRequest(queryString, php, func, method) {
	xmlHttp = Try.these(
		function() {return new XMLHttpRequest()},
		function() {return new ActiveXObject('Msxml2.XMLHTTP')},
		function() {return new ActiveXObject('Microsoft.XMLHTTP')}
	);
	method = (typeof method == 'undefined') ? 'post' : 'get';
	if(func) xmlHttp.onreadystatechange = eval(func);
	xmlHttp.open(method, method == 'post' ? php : php+'?'+queryString, true);
	xmlHttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	xmlHttp.send(method == 'post' ? queryString : null);
}
function Dd(i) {return document.getElementById(i);}
function Ds(i) {Dd(i).style.display = '';}
function Dh(i) {Dd(i).style.display = 'none';}
function Dsh(i) {Dd(i).style.display = Dd(i).style.display == 'none' ? '' : 'none';}
function Df(i) {Dd(i).focus();}
var tID=0;
function Tab(ID) {
	var tTab = Dd('Tab'+tID); var tTabs = Dd('Tabs'+tID); var Tab = Dd('Tab'+ID); var Tabs = Dd('Tabs'+ID);
	if(ID!=tID)	{tTab.className='tab'; Tab.className='tab_on'; tTabs.style.display='none'; Tabs.style.display=''; tID = ID; try{Dd('tab').value=ID;}catch(e){}}
}
function checkall(f, t) {
	var t = t ? t : 1;
	for(var i = 0; i < f.elements.length; i++) {
		var e = f.elements[i];
		if(e.type != 'checkbox') continue;
		if(t == 1) e.checked = e.checked ? false : true;
		if(t == 2) e.checked = true;
		if(t == 3) e.checked = false;	
	}
}
function stoinp(s, i, p) {
	if(Dd(i).value) {
		var p = p ? p : ',';
		var a = Dd(i).value.split(p);
		for (var j=0; j<a.length; j++) {if(s == a[j]) return;}
		Dd(i).value += p+s;
	} else {
		Dd(i).value = s;
	}
}
function select_op(i, v) {
	var o = Dd(i);
	for(var i=0; i<o.options.length; i++) {if(o.options[i].value == v) {o.options[i].selected=true;break;}}
}
function Dmsg(str, i, s, t) {
	var t = t ? t : 5000; var s = s ? true : false;
	try{if(s){window.scrollTo(0,0);}Dd('d'+i).innerHTML = '<img src="'+SKPath+'image/check_error.gif" width="12" height="12" align="absmiddle"/> '+str+sound('tip');Dd(i).focus();}catch(e){}
	window.setTimeout(function(){Dd('d'+i).innerHTML = '';}, t);
}
function Inner(i,s) {try {Dd(i).innerHTML = s;}catch(e){}}
function InnerTBD(i,s) {try {Dd(i).innerHTML = s;} catch(e) {Dd(i).parentNode.outerHTML=Dd(i).parentNode.outerHTML.replace(Dd(i).innerHTML,s);}}
function Go(u) {window.location = u;}
function confirmURI(m,f) {if(confirm(m)) Go(f);}
function showmsg(m, t) {
	var t = t ? t : 5000; var s = m.indexOf(L['str_delete']) != -1 ? 'delete' : 'ok';
	try{Dd('msgbox').style.display = '';Dd('msgbox').innerHTML = m+sound(s);window.setTimeout('closemsg();', t);}catch(e){}
}
function closemsg() {try{Dd('msgbox').innerHTML = '';Dd('msgbox').style.display = 'none';}catch(e){}}
function sound(f) {return '<div style="float:left;"><embed src="'+DTPath+'file/flash/'+f+'.swf" quality="high" type="application/x-shockwave-flash" height="0" width="0" hidden="true"/></div>';}
function Eh(t) {
	var t = t ? t : 'select';
	if(isIE) {
		var arVersion = navigator.appVersion.split("MSIE"); var IEversion = parseFloat(arVersion[1]);		
		if(IEversion >= 7 || IEversion < 5) return;
		var ss = document.body.getElementsByTagName(t);					
		for(var i=0;i<ss.length;i++) {ss[i].style.visibility = 'hidden';}
	}
}
function Es(t) {
	var t = t ? t : 'select';
	if(isIE) {
		var arVersion = navigator.appVersion.split("MSIE"); var IEversion = parseFloat(arVersion[1]);		
		if(IEversion >= 7 || IEversion < 5) return;
		var ss = document.body.getElementsByTagName(t);					
		for(var i=0;i<ss.length;i++) {ss[i].style.visibility = 'visible';}
	}
}
function FCKLen(i) {
	var i = i ? i : 'content';
	var o = FCKeditorAPI.GetInstance(i);
	var d = o.EditorDocument;
	var l ;
	if(document.all) {
		l = d.body.innerText.length;
	} else {
		var r = d.createRange(); r.selectNodeContents(d.body); l = r.toString().length;
	}
	return l;
}
function FCKXHTML(i) {
	var i = i ? i : 'content';
	return FCKeditorAPI.GetInstance(i).GetXHTML(true);
}
function Tb(d, t, p, c) {
	for(var i=1; i<=t; i++) {
		if(d == i) {Dd(p+'_t_'+i).className = c+'_2'; Ds(p+'_c_'+i);} else {Dd(p+'_t_'+i).className = c+'_1'; Dh(p+'_c_'+i);}
	}
}
function is_captcha(v) {
	if(v == L['str_captcha']) return false;
	if(v.match(/^[a-z0-9A-Z]{1,}$/)) {
		return v.match(/^[a-z0-9A-Z]{4,}$/);
	} else {
		return v.length > 1;
	}
}
function ext(v) {return v.substring(v.lastIndexOf('.')+1, v.length).toLowerCase();}
function PushNew() {
	$('#bc_push').remove();
	s = document.createElement("script");
	s.type = "text/javascript";
	s.id = "bc_push";
	s.src = DTPath+"api/push.js.php?refresh="+Math.random()+".js";
	document.body.appendChild(s);
}
function set_cookie(n, v, d) {
	var e = ''; 
	var f = d ? d : 365;
	e = new Date((new Date()).getTime() + f * 86400000);
	e = "; expires=" + e.toGMTString();
	document.cookie = CKPrex + n + "=" + v + ((CKPath == "") ? "" : ("; path=" + CKPath)) + ((CKDomain =="") ? "" : ("; domain=" + CKDomain)) + e; 
}
function get_cookie(n) {
	var v = ''; var s = CKPrex + n + "=";
	if(document.cookie.length > 0) {
		o = document.cookie.indexOf(s);
		if(o != -1) {	
			o += s.length;
			end = document.cookie.indexOf(";", o);
			if(end == -1) end = document.cookie.length;
			v = unescape(document.cookie.substring(o, end));
		}
	}
	return v;
}
function del_cookie(n) {var e = new Date((new Date()).getTime() - 1 ); e = "; expires=" + e.toGMTString(); document.cookie = CKPrex + n + "=" + escape("") +";path=/"+ e;}
function substr_count(str, exp) {if(str == '') return 0;var s = str.split(exp);return s.length-1;}
function lang(s, a) {for(var i = 0; i < a.length; i++) {s = s.replace('{V'+i+'}', a[i]);} return s;}
document.onkeydown = function(e) {
	var k = typeof e == 'undefined' ? event.keyCode : e.keyCode;
	if(k == 37) {
		try{if(Dd('bc_previous').value && typeof document.activeElement.name == 'undefined')Go(Dd('bc_previous').value);}catch(e){}
	} else if(k == 39) {
		try{if(Dd('bc_next').value && typeof document.activeElement.name == 'undefined')Go(Dd('bc_next').value);}catch(e){}
	} else if(k == 38 || k == 40 || k == 13) {
		try{if(Dd('search_tips').style.display != 'none' || Dd('search_tips').innerHTML != ''){SCTip(k);return false;}}catch(e){}
	}
}
function showDialog(reg) {
	var w = 450;
	var u = '/member/reglogin.php?reg='+reg;
	var c = '<iframe src="'+u+'" width="'+(w-25)+'" height="455" border="0" vspace="0" hspace="0" marginwidth="0" marginheight="0" framespacing="0" frameborder="0" scrolling="no"></iframe>';
	var s = 0;
	var px = 0;
	var py = 0;
	var body = document.documentElement || document.body;
	if(isGecko) body = document.body;
	var cw = body.clientWidth;
	var ch = body.clientHeight;
	var bsw = body.scrollWidth;
	var bsh = body.scrollHeight;
	var bw = parseInt((bsw < cw) ? cw : bsw);
	var bh = parseInt((bsh < ch) ? ch : bsh);
	if(!s) {
		var LoginDialogBg = document.createElement("div");
		with(LoginDialogBg.style){zIndex = 998; position = 'absolute'; width = '100%'; height = bh+'px'; overflow = 'hidden'; top = 0; left = 0; border = "0px"; backgroundColor = '#EEEEEE';if(isIE){filter = " Alpha(Opacity=50)";}else{opacity = 50/100;}}
		LoginDialogBg.id = "LoginDialogBg";
		document.body.appendChild(LoginDialogBg);
	}
	var sl = px ? px : body.scrollLeft + parseInt((cw-w)/2);
	var st = py ? py : body.scrollTop + parseInt(ch/2) - 100;
	var LoginDialog = document.createElement("div");
	with(LoginDialog.style){zIndex = 10000; position = 'fixed'; width = w+'px'; left = '50%'; top = '100px'; marginLeft='-225px',display = 'none';}
	LoginDialog.id = 'LoginDialog';
	document.body.appendChild(LoginDialog);
	Dd('LoginDialog').innerHTML = c;
	Eh();
	$('#LoginDialog').show(1, function() {
		st = py ? py : body.scrollTop + parseInt(ch/2) - parseInt($('#LoginDialog').height()/2);
	});
}