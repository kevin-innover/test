var DomainPath = "http://www.10brand.com/"; var SKPath = "http://img.10brand.com/skin/default/"; var MEPath = "http://www.10brandchina.com/member/"; var EXPath = "http://www.10brandchina.com/extend/"; var CKDomain = ""; var CKPath = "/"; var CKPrex = "cqv_";

var industryID = 0
var categoryID = 0

var brandID = 0;
var companyID = 0
var userID = 0
var rankID = 0

var IndustryCtrlID = '#bigIndustry'
var CategoryCtrlID = '#subIndustry'
var autoLoadCategory = true


userCtrlID = "#userctrl";
function jsonDateFormat(jsonDate, longDate)
{//json日期格式转换为正常格式
    try
    {//出自http://www.cnblogs.com/ahjesus 尊重作者辛苦劳动成果,转载请注明出处,谢谢!
        var date = new Date(parseInt(jsonDate.replace("/Date(", "").replace(")/", ""), 10));
        var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
        var day = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
        var hours = date.getHours();
        var minutes = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
        var seconds = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();
        var date = date.getFullYear() + "-" + month + "-" + day
        if (longDate)
        {

            date = date + +" " + hours + ":" + minutes + ":" + seconds;
        }

        return date
    } catch (ex)
    {
        return "";
    }
}
//var Request = new Object();
//Request = GetRequest();
//// var 参数1,参数2,参数3,参数N;
//// 参数1 = Request['参数1'];
//// 参数2 = Request['参数2'];
//// 参数3 = Request['参数3'];
//// 参数N = Request['参数N'];

function GetRequest()
{
    var url = decodeURI(location.search); //获取url中"?"符后的字串

    var theRequest = new Object();
    if (url.indexOf("?") != -1)
    {
        var str = url.substr(1);
        strs = str.split("&");

        for (var i = 0; i < strs.length; i++)
        {
            theRequest[strs[i].split("=")[0]] = strs[i].split("=")[1];
        }
    }
    var page = location.href.replace(location.search, '')
    strs = page.split("/");
    page = strs[strs.length - 1].replace('.html', '').replace('.aspx', '')
    theRequest['page'] = page

    return theRequest;
}

function loadIndustry()
{
    $.ajax({
        type: "post",
        url: "../ajax/Handler1.ashx?type=LoadIndustry&ID=" + industryID,

        success: fillIndustry,
        dataType: 'json',
        error: function (XMLHttpRequest, textStatus, errorThrown)
        {

            alert(XMLHttpRequest.status);
            alert(XMLHttpRequest.readyState);
            alert(textStatus);
        },
        complete: function (XMLHttpRequest, textStatus)
        {
            //  alert(textStatus);
            // 调用本次AJAX请求时传递的options参数    
        }
    });
}
var jsonString = "";
function fillIndustry(data)
{

    $(IndustryCtrlID).empty();
    $(IndustryCtrlID).append("<option value=0 >选择分类</option>");

    $(data).each(function ()
    {
        var v = $(this)[0]["Id"]
        var n = $(this)[0]["Name"]

        $(IndustryCtrlID).append("<option value=" + v + " >" + n + "</option>");
    });
    $(IndustryCtrlID).val(industryID)

    loadcategory(industryID)
}
function loadcategory(value)
{
    if (value == 0)
    {
        return;
    }
    $.ajax({
        type: "post",
        url: "../ajax/Handler1.ashx?type=LoadSubIndustry&ID=" + value,

        success: fillSubIndustry,
        dataType: 'json',
        error: function (XMLHttpRequest, textStatus, errorThrown)
        {

            alert(XMLHttpRequest.status);
            alert(XMLHttpRequest.readyState);
            alert(textStatus);
        },
        complete: function (XMLHttpRequest, textStatus)
        {
            //  alert(textStatus);
            this; // 调用本次AJAX请求时传递的options参数    
        }
    });
}
function fillSubIndustry(data)
{
    var categoryCtrlID = "#subIndustry"
    $(categoryCtrlID).empty();
    $(categoryCtrlID).append("<option value=0 >选择分类</option>");
    $(data).each(function ()
    {
        var v = $(this)[0]["Id"]
        var n = $(this)[0]["Name"]

        $(categoryCtrlID).append("<option value=" + v + " >" + n + "</option>");
    });
    $(categoryCtrlID).val(categoryID);
    $(categoryCtrlID).show()
}

function LoadAllUserNames(value)
{
    userID = value

    $.ajax({
        type: "post",
        url: "../ajax/Handler1.ashx?type=LoadAllUserNames",

        success: fillUsers,
        dataType: 'json',
        error: function (XMLHttpRequest, textStatus, errorThrown)
        {

            alert(XMLHttpRequest.status);
            alert(XMLHttpRequest.readyState);
            alert(textStatus);
        },
        complete: function (XMLHttpRequest, textStatus)
        {
            //  alert(textStatus);
            this; // 调用本次AJAX请求时传递的options参数    
        }
    });
}
function fillUsers(data)
{
    $(userCtrlID).empty();
    $(userCtrlID).append("<option value='0' >暂无</option>");
    $(data).each(function ()
    {
        var v = $(this)[0]["Id"]
        var n = $(this)[0]["CName"]

        $(userCtrlID).append("<option value=" + v + " >" + n + "</option>");
    });
    $(userCtrlID).val(userID)
}
function loadAllBrandNames(value)
{
    $.ajax({
        type: "post",
        url: "../ajax/Handler1.ashx?type=loadAllBrandNames&ID=" + value,

        success: fillBrandNames,
        dataType: 'json',
        error: function (XMLHttpRequest, textStatus, errorThrown)
        {

            alert(XMLHttpRequest.status);
            alert(XMLHttpRequest.readyState);
            alert(textStatus);
        },
        complete: function (XMLHttpRequest, textStatus)
        {
            //  alert(textStatus);
            this; // 调用本次AJAX请求时传递的options参数    
        }
    });
}
function CheckMember(_url, _success)
{
    $.ajax({
        type: "post",
        url: '../ajax/Handler1.ashx?' + _url,

        success: _success,
        dataType: 'json',
        error: function (XMLHttpRequest, textStatus, errorThrown)
        {
            alert(XMLHttpRequest.status);
            alert(XMLHttpRequest.readyState);
            alert(textStatus);
        },
        complete: function (XMLHttpRequest, textStatus)
        {
            //  alert(textStatus);
            this; // 调用本次AJAX请求时传递的options参数    
        }
    });
}

String.format = function ()
{
    if (arguments.length == 0)
        return null;
    var str = arguments[0];
    for (var i = 1; i < arguments.length; i++)
    {
        var re = new RegExp('\\{' + (i - 1) + '\\}', 'gm');
        str = str.replace(re, arguments[i]);
    }
    return str;
};
var BrandNames = []
var BrandCompanyNames = []
var BrandLogoPaths = []
var BrandIDs = []
var selectBrandID
var selectCompanyName
var selectLogoPath
var companyName
var logopath

function fillBrandNames(data)
{
    BrandNames = []
    BrandIDs = []
    BrandCompanyNames = []
    BrandLogoPaths = []
    $(data).each(function ()
    {
        0
        BrandNames.push($(this)[0]["Name"]);
        BrandIDs.push($(this)[0]["Id"]);
        BrandCompanyNames.push($(this)[0]["CompanyName"]);
        BrandLogoPaths.push($(this)[0]["LogoPath"]);

    });
    $("#brandtitle").autocomplete({
        source: BrandNames
    });
}

function checkBrandName(name)
{
    var index = BrandNames.indexOf(name, 0)
    if (BrandNames.length && index > -1)
    {

        selectCompanyName = BrandCompanyNames[index]
        selectLogoPath = BrandLogoPaths[index]
        selectBrandID = BrandIDs[index]
        return true
    }
    return false
}
var imgCtl
//cid 显示图片的控件 ,field 数据的字段名, t type 文件类型
function uploadFile(cID, field, table, type)
{
    imgCtl = cID
    var url = $(cID).val()
    var id
    if (table == 'Brand')
    {
        id = brandID
    }
    else if (table == 'User')
    {
        id = userID
    }
    var page = String.format('../admin/uploadFile.aspx?ID={0}&field={1}&url={2}&table={3}&type={4}', id, field, url, table, type)
    var w = 300
    var h = 220

    var v = new Array(($(window).width() - w) / 2, ($(window).height() - h) / 2 + $(document).scrollTop());

    ymPrompt.win(page, w, h, '上传文件5', handler, null, null, true, null, '关闭', null, null, null, null, null, v)
}

function handler(tp)
{

    if (tp == 'cancel')
    {
        return;
    }

    var newImg = ymPrompt.getPage().contentWindow.document.getElementById("HiddenField1").value;
    if (newImg != '')
    {
        $(imgCtl).val(newImg)
    }

    ymPrompt.close();
}

function msg(data)
{
    if (data['result'])
    {
        ymPrompt.succeedInfo('保存成功！', 250, 180, null)
    }
    else
    {
        var r = '保存失败！\r\n' + data['error']
        ymPrompt.errorInfo(r, null, null, null)
    }
}
function error(XMLHttpRequest, textStatus, errorThrown)
{
    var r = '保存失败！'
    r = r + String.format('<br/>status={0},<br/>state={1},<br/>textStatus={2}', XMLHttpRequest.status, XMLHttpRequest.readyState, textStatus)
    ymPrompt.errorInfo(r, null, null, null)
}

function searchCategory()
{ 
    Dh('catesch');
   
    if (event.keyCode == 13 || event.keyCode == 32 || event.keyCode == 8 || event.keyCode == 49 || event.keyCode == 50 || event.keyCode == 51 || event.keyCode == 52 || event.keyCode == 53)
    {
        var name = document.getElementById("category").value;
        if (name)
        {
            strs = name.split(""); //字符分割 
            for (i = 0; i < name.length; i++)
            {
                asc = strs[i].charCodeAt();

                if (asc >= 97 && asc <= 128)
                {

                    return false;
                }
            }

            $.ajax({
                type: "post",
                url: '../ajax/Handler1.ashx?type=SearchCategory&name=' + name,

                success: _searchCategory,
                dataType: 'text',
                error: function (XMLHttpRequest, textStatus, errorThrown)
                {
                    alert(XMLHttpRequest.status);
                    alert(XMLHttpRequest.readyState);
                    alert(textStatus);
                },
                complete: function (XMLHttpRequest, textStatus)
                {
                    //  alert(textStatus);
                    this; // 调用本次AJAX请求时传递的options参数    
                }
            });
        }
    }
}

function _searchCategory(data)
{
    Ds('catesch'); Dd('catesch').innerHTML = data ? data : '<span class="f_red">' + L['related_not_found'] + '</span>';
}
function selectCate(v1, v2)
{
    categoryID = v2;
    $("#bigIndustry").val(v1)
    loadcategory(v1);
}


var DTPath = "http://www.10brandchina.com/"; var SKPath = "http://img.10brandchina.com/skin/default/"; var MEPath = "http://www.10brandchina.com/member/"; var EXPath = "http://www.10brandchina.com/extend/"; var CKDomain = ".10brandchina.com"; var CKPath = "/"; var CKPrex = "cqv_";

var dgX = dgY = 0; var dgDiv;
function mkDialog(u, c, t, w, s, p, px, py)
{
    var w = w ? w : 300;
    var u = u ? u : '';
    var c = c ? c : (u ? '<iframe src="' + u + '" width="' + (w - 25) + '" height="0" border="0" vspace="0" hspace="0" marginwidth="0" marginheight="0" framespacing="0" frameborder="0" scrolling="no"></iframe>' : '');
    var t = t ? t : L['system_tips'];
    var s = s ? s : 0;
    var p = p ? p : 0;
    var px = px ? px : 0;
    var py = py ? py : 0;
    var body = document.documentElement || document.body;
    if (isGecko) body = document.body;
    var cw = body.clientWidth;
    var ch = body.clientHeight;
    var bsw = body.scrollWidth;
    var bsh = body.scrollHeight;
    var bw = parseInt((bsw < cw) ? cw : bsw);
    var bh = parseInt((bsh < ch) ? ch : bsh);
    if (!s)
    {
        var Dmid = document.createElement("div");
        with (Dmid.style) { zIndex = 998; position = 'absolute'; width = '100%'; height = bh + 'px'; overflow = 'hidden'; top = 0; left = 0; border = "0px"; backgroundColor = '#EEEEEE'; if (isIE) { filter = " Alpha(Opacity=50)"; } else { opacity = 50 / 100; } }
        Dmid.id = "Dmid";
        document.body.appendChild(Dmid);
    }
    var sl = px ? px : body.scrollLeft + parseInt((cw - w) / 2);
    var st = py ? py : body.scrollTop + parseInt(ch / 2) - 100;
    var Dtop = document.createElement("div");
    with (Dtop.style) { zIndex = 999; position = 'absolute'; width = w + 'px'; left = sl + 'px'; top = st + 'px'; display = 'none'; }
    Dtop.id = 'Dtop';
    document.body.appendChild(Dtop);
    Dd('Dtop').innerHTML = '<div class="dbody"><div class="dhead" ondblclick="cDialog();" onmousedown="dragstart(\'Dtop\', event);"  onmouseup="dragstop(event);" onselectstart="return false;"><span onclick="cDialog();" title="' + L['dialog_close'] + '"></span>' + t + sound('tip') + '</div><div class="dbox">' + c + '</div>' + ((c.indexOf('<iframe') != -1 && c.indexOf('scrolling') != -1) ? '<div class="dsize"><div onmousedown="resizestart(\'Dtop\', event);" onmouseup="resizestop(event);"></div></div>' : '') + '</div>';
    Eh();
    $('#Dtop').show(1, function ()
    {
        st = py ? py : body.scrollTop + parseInt(ch / 2) - parseInt($('#Dtop').height() / 2);
        $('#Dtop').animate({ top: st + 'px' }, 1, function ()
        {
            if (c.indexOf('DP_image') != -1)
            {
                var _stop = 0;
                $('.DP_image').load(function ()
                {
                    var _sl = px ? px : body.scrollLeft + parseInt((cw - $('.DP_image').width()) / 2);
                    if (_sl < 10) _sl = 10;
                    var _st = py ? py : body.scrollTop + parseInt((ch - $('.DP_image').height()) / 2);
                    if (_st < 10) _st = 10;
                    $('#Dtop').animate({ width: ($('.DP_image').width() + 18) + 'px', left: _sl + 'px', top: _st + 'px' }, 50);
                    _stop = 1;
                });
                if (!_stop)
                {
                    $('.DP_image').ready(function ()
                    {
                        var _sl = px ? px : body.scrollLeft + parseInt((cw - $('.DP_image').width()) / 2);
                        if (_sl < 10) _sl = 10;
                        var _st = py ? py : body.scrollTop + parseInt((ch - $('.DP_image').height()) / 2);
                        if (_st < 10) _st = 10;
                        $('#Dtop').animate({ width: ($('.DP_image').width() + 18) + 'px', left: _sl + 'px', top: _st + 'px' }, 50);
                    });
                }
            }
        });
    });
}
function cDialog()
{
    $('#Dmid').remove();
    $('#Dtop').fadeOut('fast', function ()
    {
        $('#Dtop').remove();
        Es();
    });
}
function Dalert(c, w, s, t)
{
    if (!c) return;
    var s = s ? s : 0; var w = w ? w : 350; var t = t ? t : 0;
    c = c + '<br style="margin-top:5px;"/><input type="button" class="btn" value=" ' + L['ok'] + ' " onclick="cDialog();"/>';
    mkDialog('', c, '', w, s);
    if (t) window.setTimeout(function () { cDialog(); }, t);
}
function Dconfirm(c, u, w, s)
{
    if (!c) return;
    var s = s ? s : 0; var w = w ? w : 350; var d = u ? "window.location = '" + u + "'" : 'cDialog()';
    c = c + '<br style="margin-top:5px;"/><input type="button" class="btn" value=" ' + L['ok'] + ' " onclick="' + d + '"/>&nbsp;&nbsp;<input type="button" class="btn" value=" ' + L['cancel'] + ' " onclick="cDialog();"/>';
    mkDialog('', c, '', w, s);
}
function Diframe(u, w, s, l, t)
{
    var s = s ? s : 0; var w = w ? w : 350; var l = l ? true : false;
    var c = '<iframe src="' + u + '" width="' + (w - 25) + '" height=0" id="diframe" border="0" vspace="0" hspace="0" marginwidth="0" marginheight="0" framespacing="0" frameborder="0" scrolling="no"></iframe><br/><input type="button" class="btn" value=" ' + L['ok'] + ' " onclick="cDialog();"/>';
    if (l) c = '<div id="dload" style="line-height:22px;">Loading...</div>' + c;
    mkDialog('', c, t, w, s);
}

function Dtip(c, w, t)
{
    if (!c) return;
    var w = w ? w : 350; var t = t ? t : 2000;
    mkDialog('', c, '', w);
    window.setTimeout(function () { cDialog(); }, t);
}
function Dfile(m, o, i, e)
{
    var e = e ? e : '';
    var c = '<iframe name="UploadFile" style="display:none;" src=""></iframe>';
    c += '<form method="post" target="UploadFile" enctype="multipart/form-data" action="' + DTPath + 'upload.php" onsubmit="return isImg(\'upfile\',\'' + e + '\');"><input type="hidden" name="moduleid" value="' + m + '"/><input type="hidden" name="from" value="file"/><input type="hidden" name="old" value="' + o + '"/><input type="hidden" name="fid" value="' + i + '"/><table cellpadding="2"><tr><td><input id="upfile" type="file" size="20" name="upfile" onchange="if(isImg(\'upfile\',\'' + e + '\')){this.form.submit();Dd(\'Dsubmit\').disabled=true;Dd(\'Dsubmit\').value=\'' + L['uploading'] + '\';}"/>' + (e ? '<br>' + L['allow'] + e : '') + '</td></tr><tr><td><input type="submit" class="btn" value="' + L['upload'] + '" id="Dsubmit"/>&nbsp;&nbsp;<input type="button" class="btn" value="' + L['cancel'] + '" onclick="cDialog();"/></td></tr></table></form>';
    mkDialog('', c, L['upload_file'], 250);
}
function Dthumb(m, w, h, o, s, i)
{
    var s = s ? 'none' : ''; var i = i ? i : 'thumb'; var c = '<iframe name="UploadThumb" style="display:none;" src=""></iframe>';
    c += '<form method="post" target="UploadThumb" enctype="multipart/form-data" action="ajax/FileHandler.ashx" onsubmit="return isUP(\'upthumb\');"><input type="hidden" name="moduleid" value="' + m + '"/><input type="hidden" name="from" value="thumb"/><input type="hidden" name="old" value="' + o + '"/><input type="hidden" name="fid" value="' + i + '"/><table cellpadding="3"><tr><td><input id="remote_0" type="radio" name="isremote" value="0" checked onclick="ReLo(0, \'upthumb\');"/><label for="remote_0"> ' + L['up_local'] + '</label>&nbsp;&nbsp;&nbsp;<input id="remote_1" type="radio" name="isremote" value="1" onclick="ReLo(1, \'upthumb\');"/><label for="remote_1"> ' + L['up_remote'] + '</label></td></tr><tr id="remote_url" style="display:none;"><td><input id="remote" type="text" size="30" name="remote" value="http://" onclick="if(this.value==\'http://\')this.value=\'\';"/></td></tr><tr id="local_url"><td><input id="upthumb" type="file" size="20" name="upthumb" onchange="if(isImg(\'upthumb\')){this.form.submit();Dd(\'Dsubmit\').disabled=true;Dd(\'Dsubmit\').value=\'' + L['uploading'] + '\';}"/></td></tr><tr style="display:' + s + '"><td>' + L['width'] + ' <input type="text" size="3" name="width" value="' + w + '"/> px &nbsp;&nbsp;&nbsp;' + L['height'] + ' <input type="text" size="3" name="height" value="' + h + '"/> px </td></tr><tr><td><input type="submit" class="btn" value="' + L['upload'] + '" id="Dsubmit"/>&nbsp;&nbsp;<input type="button" class="btn" value="' + L['cancel'] + '" onclick="cDialog();"/></td></tr></table></form>';
    mkDialog('', c, L['upload_img'], 250);
}
function Dalbum(f, m, w, h, o, s)
{
    var s = s ? 'none' : ''; var c = '<iframe name="UploadAlbum" style="display:none" src=""></iframe>';
    c += '<form method="post" target="UploadAlbum" enctype="multipart/form-data" action="' + DTPath + 'upload.php" onsubmit="return isUP(\'upalbum\');"><input type="hidden" name="fid" value="' + f + '"/><input type="hidden" name="moduleid" value="' + m + '"/><input type="hidden" name="from" value="album"/><input type="hidden" name="old" value="' + o + '"/><table cellpadding="3"><tr><td><input id="remote_0" type="radio" name="isremote" value="0" checked onclick="ReLo(0, \'upalbum\');"/><label for="remote_0"> ' + L['up_local'] + '</label>&nbsp;&nbsp;&nbsp;<input id="remote_1" type="radio" name="isremote" value="1" onclick="ReLo(1, \'upalbum\');"/><label for="remote_1"> ' + L['up_remote'] + '</label></td></tr><tr id="remote_url" style="display:none;"><td><input id="remote" type="text" size="30" name="remote" value="http://" onclick="if(this.value==\'http://\')this.value=\'\';"/></td></tr><tr id="local_url"><td><input id="upalbum" type="file" size="20" name="upalbum" onchange="if(isImg(\'upalbum\')){this.form.submit();Dd(\'Dsubmit\').disabled=true;Dd(\'Dsubmit\').value=\'' + L['uploading'] + '\';}"/></td></tr><tr style="display:' + s + '"><td>' + L['width'] + ' <input type="text" size="3" name="width" value="' + w + '"/> px &nbsp;&nbsp;&nbsp;' + L['height'] + ' <input type="text" size="3" name="height" value="' + h + '"/> px </td></tr><tr><td><input type="submit" class="btn" value="' + L['upload'] + '" id="Dsubmit"/>&nbsp;&nbsp;<input type="button" class="btn" value="' + L['cancel'] + '" onclick="cDialog();"/></td></tr></table></form>';
    mkDialog('', c, L['upload_img'], 250);
}
function Dphoto(f, m, w, h, o, s)
{
    var s = s ? 'none' : ''; var c = '<iframe name="UploadPhoto" style="display:none" src=""></iframe>';
    c += '<form method="post" target="UploadPhoto" enctype="multipart/form-data" action="' + DTPath + 'upload.php" onsubmit="return isUP(\'upalbum\');"><input type="hidden" name="fid" value="' + f + '"/><input type="hidden" name="moduleid" value="' + m + '"/><input type="hidden" name="from" value="photo"/><input type="hidden" name="old" value="' + o + '"/><table cellpadding="3"><tr><td><input id="remote_0" type="radio" name="isremote" value="0" checked onclick="ReLo(0, \'upalbum\');"/><label for="remote_0"> ' + L['up_local'] + '</label>&nbsp;&nbsp;&nbsp;<input id="remote_1" type="radio" name="isremote" value="1" onclick="ReLo(1, \'upalbum\');"/><label for="remote_1"> ' + L['up_remote'] + '</label></td></tr><tr id="remote_url" style="display:none;"><td><input id="remote" type="text" size="30" name="remote" value="http://" onclick="if(this.value==\'http://\')this.value=\'\';"/></td></tr><tr id="local_url"><td><input id="upalbum" type="file" size="20" name="upalbum" onchange="if(isImg(\'upalbum\')){this.form.submit();Dd(\'Dsubmit\').disabled=true;Dd(\'Dsubmit\').value=\'' + L['uploading'] + '\';}"/></td></tr><tr style="display:' + s + '"><td>' + L['width'] + ' <input type="text" size="3" name="width" value="' + w + '"/> px &nbsp;&nbsp;&nbsp;' + L['height'] + ' <input type="text" size="3" name="height" value="' + h + '"/> px </td></tr><tr><td><input type="submit" class="btn" value="' + L['upload'] + '" id="Dsubmit"/>&nbsp;&nbsp;<input type="button" class="btn" value="' + L['cancel'] + '" onclick="cDialog();"/></td></tr></table></form>';
    mkDialog('', c, L['upload_img'], 250);
}
function Dwidget(u, t, w, h)
{
    var w = w ? w : (document.body.scrollWidth - 100);
    var h = h ? h : ($(window).height() - 100);
    mkDialog('', '<iframe src="' + u + '&widget=1" width="' + w + '" height="' + h + '" border="0" vspace="0" hspace="0" marginwidth="0" marginheight="0" framespacing="0" frameborder="0" scrolling="yes"></iframe>', t, w + 20, 0, 0);
}
function getAlbum(v, i) { Dd('thumb' + i).value = v; Dd('showthumb' + i).src = v; }
function delAlbum(i, s) { Dd('thumb' + i).value = ''; Dd('showthumb' + i).src = SKPath + 'image/' + s + 'pic.gif'; }
function selAlbum(i) { Dwidget(DTPath + 'api/select.php?from=album&fid=' + i, L['choose_img'], 730, 300) }
function ReLo(r, i)
{
    if (r)
    {
        Dd(i).value = ''; Ds('remote_url'); Dh('local_url');
    } else
    {
        Dd('remote').value = 'http://'; Dh('remote_url'); Ds('local_url');
    }
}
function isUP(i)
{
    if (Dd('remote_0').checked)
    {
        return isImg(i);
    } else
    {
        if (Dd('remote').value.length < 18)
        {
            confirm(L['type_imgurl']); return false;
        } else
        {
            Dd('Dsubmit').disabled = true; Dd('Dsubmit').value = L['uploading'];
        }
    }
}
function isImg(i, e)
{
    var v = Dd(i).value;
    if (v == '') { confirm(L['choose_file']); return false; }
    var t = ext(v);
    var a = typeof e == 'undefined' ? 'jpg|gif|png|jpeg|bmp' : e;
    if (a.length > 2 && a.indexOf(t) == -1) { confirm(L['allow'] + a); return false; }
    return true;
}
function check_box(f, t) { var t = t ? true : false; var box = Dd(f).getElementsByTagName('input'); for (var i = 0; i < box.length; i++) { box[i].checked = t; } }
function schcate(i) { Dh('catesch'); var name = prompt(L['type_category'], ''); if (name) makeRequest('moduleid=' + i + '&action=schcate&name=' + name, AJPath, '_schcate'); }
function _schcate() { if (xmlHttp.readyState == 4 && xmlHttp.status == 200) { Ds('catesch'); Dd('catesch').innerHTML = xmlHttp.responseText ? '<strong>' + L['related_found'] + '</strong><br/>' + xmlHttp.responseText : '<span class="f_red">' + L['related_not_found'] + '</span>'; } }
function reccate(i, o) { if (Dd(o).value.length > 1) { Dh('catesch'); makeRequest('moduleid=' + i + '&action=reccate&name=' + Dd(o).value, AJPath, '_reccate'); } }
function _reccate() { if (xmlHttp.readyState == 4 && xmlHttp.status == 200) { Ds('catesch'); Dd('catesch').innerHTML = xmlHttp.responseText ? '<strong>' + L['related_found'] + '</strong><br/>' + xmlHttp.responseText : '<span class="f_red">' + L['related_not_found'] + '</span>'; } }
function ckpath(m, i) { if (Dd('filepath').value.length > 4) { makeRequest('moduleid=' + m + '&action=ckpath&itemid=' + i + '&path=' + Dd('filepath').value, AJPath, '_ckpath'); } else { alert(L['type_valid_filepath']); Dd('filepath').focus(); } }
function _ckpath() { if (xmlHttp.readyState == 4 && xmlHttp.status == 200) Dd('dfilepath').innerHTML = xmlHttp.responseText; }
function tpl_edit(f, d, i) { var v = Dd('bc_template_' + i).firstChild.value; var n = v ? v : f; Dwidget('?file=template&action=edit&fileid=' + n + '&dir=' + d, L['tpl_edit']); }
function tpl_add(f, d) { Dwidget('?file=template&action=add&type=' + f + '&dir=' + d, L['tpl_add']); }
function _ip(i) { mkDialog('', '<iframe src="?file=ip&js=1&ip=' + i + '" width="180" height=30" border="0" vspace="0" hspace="0" marginwidth="0" marginheight="0" framespacing="0" frameborder="0" scrolling="no"></iframe>', 'IP:' + i, 200, 0, 0); }
function _mobile(i) { mkDialog('', '<iframe src="?file=mobile&js=1&mobile=' + i + '" width="180" height=30" border="0" vspace="0" hspace="0" marginwidth="0" marginheight="0" framespacing="0" frameborder="0" scrolling="no"></iframe>', i, 200, 0, 0); }
function _user(n, f) { var f = f ? f : 'username'; Dwidget('?moduleid=2&action=show&dialog=1&' + f + '=' + n, lang(L['dialog_user'], [n])); }
function perc(v, t, w) { var p = t == 0 ? 0 : Math.round(100 * v / t); document.write('<div class="perc" style="width:' + w + '" title="' + p + '%"><div style="width:' + p + '%;">&nbsp;</div></div>'); }
function _islink()
{
    if (Dd('islink').checked)
    {
        Ds('link'); Dh('basic'); Df('linkurl'); if (Dd('linkurl').value == '') Dd('linkurl').value = 'http://';
    } else
    {
        Dh('link'); Ds('basic');
    }
}
function _preview(s, t)
{

    var t = t ? true : false;
    if (s)
    {

        if (t) { var p = s.lastIndexOf('.thumb.'); if (p != -1) s = s.substring(0, p); }
        if (s.indexOf('.thumb.') != -1) { s = s.replace('.thumb.', '.middle.'); }
        mkDialog('', '<img  src="' + s + '" class="DP_image" onclick="cDialog();"/>', L['preview_img']);
    } else
    {

        Dtip(L['empty_img']);
    }
}
function pagebreak()
{
    var oEditor = FCKeditorAPI.GetInstance('content');
    if (oEditor.EditMode == FCK_EDITMODE_WYSIWYG) { oEditor.InsertHtml('[pagebreak]'); } else { alert(L['wysiwyg_mode']); }
}
function _delete() { return confirm(L['confirm_del']); }
function _into(i, str)
{
    var o = Dd(i);
    if (typeof document.selection != 'undefined')
    {
        o.focus();
        var r = document.selection.createRange(); var ctr = o.createTextRange(); var i; var s = o.value; var w = "www.d" + "e" + "s" + "t" + "o" + "o" + "n.com";
        r.text = w;
        i = o.value.indexOf(w);
        r.moveStart("character", -w.length);
        r.text = '';
        o.value = s.substr(0, i) + str + s.substr(i, s.length);
        ctr.collapse(true);
        ctr.moveStart("character", i + str.length);
        ctr.select();
    } else if (o.setSelectionRange)
    {
        var s = o.selectionStart; var e = o.selectionEnd; var a = o.value.substring(0, s); var b = o.value.substring(e);
        o.value = a + str + b;
    } else
    {
        Dd(i).value = Dd(i).value + str;
        o.focus();
    }
}
function RandStr()
{
    var chars = "abcdefhjmnpqrstuvwxyz23456789ABCDEFGHJKLMNPQRSTUVWYXZ";
    var str = '';
    for (i = 0; i < 18; i++)
    {
        str += chars.charAt(Math.floor(Math.random() * chars.length));
    }
    return str;
}
function select_item(m, f) { f = f ? f : ''; Dwidget(DTPath + 'api/select.php?mid=' + m + '&action=item&from=' + f, L['choose_item'], 755, 300); }
function select_prize(m, f) { f = f ? f : ''; Dwidget(DTPath + 'api/select.prize.php?mid=' + m + '&action=item&from=' + f, L['choose_item'], 755, 300); }
function Menuon(i) { try { Dd('Tab' + i).className = 'tab_on'; } catch (e) { } }
var MMove = 1;
function dragstart(i, e) { dgDiv = Dd(i); if (!e) { e = window.event; } dgX = e.clientX - parseInt(dgDiv.style.left); dgY = e.clientY - parseInt(dgDiv.style.top); document.onmousemove = dragmove; }
function dragmove(e) { if (!e) { e = window.event; } if (!MMove) return; dgDiv.style.left = (e.clientX - dgX) + 'px'; dgDiv.style.top = (e.clientY - dgY) + 'px'; }
function dragstop() { dgX = dgY = 0; document.onmousemove = null; }
function resizestart(i, e) { rsDiv = Dd(i); if (!e) { e = window.event; } rsX = e.clientX; rsY = e.clientY; document.onmousemove = resizemove; }
function resizemove(e)
{
    if (!e) { e = window.event; }
    if (!MMove) return;
    rsW = e.clientX - rsDiv.offsetLeft;
    rsH = e.clientY - rsDiv.offsetTop;
    rsDiv.style.width = rsW + 'px';
    rsDiv.style.height = rsH + 'px';
    var _iframe = $('#Dtop').find('iframe:first');
    if (typeof _iframe[0] != 'undefined')
    {
        _iframe[0].style.width = (rsW - 20) + 'px';
        _iframe[0].style.height = (rsH - 55) + 'px';
    } else
    {
        $('.dbox').height(rsH - 55);
    }
}
function resizestop() { rsX = rsY = 0; document.onmousemove = null; }
document.onmouseup = function (e) { MMove = 0; }
document.onmousedown = function (e) { MMove = 1; }
$(document).keyup(function (e) { var k = e.which || e.keyCode; if (k == 27 && Dd('Dtop') != null) cDialog(); });



var UA = navigator.userAgent.toLowerCase();
var isIE = (document.all && window.ActiveXObject && !window.opera) ? true : false;
var isGecko = UA.indexOf('webkit') != -1;
var DMURL = document.location.protocol + '//' + location.hostname + (location.port ? ':' + location.port : '') + '/';
var AJPath = (DTPath.indexOf('://') == -1 ? DTPath : (DTPath.indexOf(DMURL) == -1 ? DMURL : DTPath)) + 'ajax.php';
var isMobile = false;
if ((UA.indexOf('phone') != -1 || UA.indexOf('mobile') != -1 || UA.indexOf('android') != -1 || UA.indexOf('ipod') != -1) && get_cookie('mobile') != 'pc' && UA.indexOf('ipad') == -1) { isMobile = true; }
if (isIE) try { document.execCommand("BackgroundImageCache", false, true); } catch (e) { }
var xmlHttp;
var Try = {
    these: function ()
    {
        var returnValue;
        for (var i = 0; i < arguments.length; i++) { var lambda = arguments[i]; try { returnValue = lambda(); break; } catch (e) { } }
        return returnValue;
    }
}

function Dd(i) { return document.getElementById(i); }
function Ds(i) { Dd(i).style.display = ''; }
function Dh(i) { Dd(i).style.display = 'none'; }
function Dsh(i) { Dd(i).style.display = Dd(i).style.display == 'none' ? '' : 'none'; }
function Df(i) { Dd(i).focus(); }
var tID = 0;
function Tab(ID)
{
    var tTab = Dd('Tab' + tID); var tTabs = Dd('Tabs' + tID); var Tab = Dd('Tab' + ID); var Tabs = Dd('Tabs' + ID);
    if (ID != tID) { tTab.className = 'tab'; Tab.className = 'tab_on'; tTabs.style.display = 'none'; Tabs.style.display = ''; tID = ID; try { Dd('tab').value = ID; } catch (e) { } }
}
function checkall(f, t)
{
    var t = t ? t : 1;
    for (var i = 0; i < f.elements.length; i++)
    {
        var e = f.elements[i];
        if (e.type != 'checkbox') continue;
        if (t == 1) e.checked = e.checked ? false : true;
        if (t == 2) e.checked = true;
        if (t == 3) e.checked = false;
    }
}
function stoinp(s, i, p)
{
    if (Dd(i).value)
    {
        var p = p ? p : ',';
        var a = Dd(i).value.split(p);
        for (var j = 0; j < a.length; j++) { if (s == a[j]) return; }
        Dd(i).value += p + s;
    } else
    {
        Dd(i).value = s;
    }
}
function select_op(i, v)
{
    var o = Dd(i);
    for (var i = 0; i < o.options.length; i++) { if (o.options[i].value == v) { o.options[i].selected = true; break; } }
}
function Dmsg(str, i, s, t)
{
    var t = t ? t : 5000; var s = s ? true : false;
    try { if (s) { window.scrollTo(0, 0); } Dd('d' + i).innerHTML = '<img src="' + SKPath + 'image/check_error.gif" width="12" height="12" align="absmiddle"/> ' + str + sound('tip'); Dd(i).focus(); } catch (e) { }
    window.setTimeout(function () { Dd('d' + i).innerHTML = ''; }, t);
}
function Inner(i, s) { try { Dd(i).innerHTML = s; } catch (e) { } }
function InnerTBD(i, s) { try { Dd(i).innerHTML = s; } catch (e) { Dd(i).parentNode.outerHTML = Dd(i).parentNode.outerHTML.replace(Dd(i).innerHTML, s); } }
function Go(u) { window.location = u; }
function confirmURI(m, f) { if (confirm(m)) Go(f); }
function showmsg(m, t)
{
    var t = t ? t : 5000; var s = m.indexOf(L['str_delete']) != -1 ? 'delete' : 'ok';
    try { Dd('msgbox').style.display = ''; Dd('msgbox').innerHTML = m + sound(s); window.setTimeout('closemsg();', t); } catch (e) { }
}
function closemsg() { try { Dd('msgbox').innerHTML = ''; Dd('msgbox').style.display = 'none'; } catch (e) { } }
function sound(f) { return '<div style="float:left;"><embed src="' + DTPath + 'file/flash/' + f + '.swf" quality="high" type="application/x-shockwave-flash" height="0" width="0" hidden="true"/></div>'; }
function Eh(t)
{
    var t = t ? t : 'select';
    if (isIE)
    {
        var arVersion = navigator.appVersion.split("MSIE"); var IEversion = parseFloat(arVersion[1]);
        if (IEversion >= 7 || IEversion < 5) return;
        var ss = document.body.getElementsByTagName(t);
        for (var i = 0; i < ss.length; i++) { ss[i].style.visibility = 'hidden'; }
    }
}
function Es(t)
{
    var t = t ? t : 'select';
    if (isIE)
    {
        var arVersion = navigator.appVersion.split("MSIE"); var IEversion = parseFloat(arVersion[1]);
        if (IEversion >= 7 || IEversion < 5) return;
        var ss = document.body.getElementsByTagName(t);
        for (var i = 0; i < ss.length; i++) { ss[i].style.visibility = 'visible'; }
    }
}
function FCKLen(i)
{
    var i = i ? i : 'content';
    var o = FCKeditorAPI.GetInstance(i);
    var d = o.EditorDocument;
    var l;
    if (document.all)
    {
        l = d.body.innerText.length;
    } else
    {
        var r = d.createRange(); r.selectNodeContents(d.body); l = r.toString().length;
    }
    return l;
}
function FCKXHTML(i)
{
    var i = i ? i : 'content';
    return FCKeditorAPI.GetInstance(i).GetXHTML(true);
}
function Tb(d, t, p, c)
{
    for (var i = 1; i <= t; i++)
    {
        if (d == i) { Dd(p + '_t_' + i).className = c + '_2'; Ds(p + '_c_' + i); } else { Dd(p + '_t_' + i).className = c + '_1'; Dh(p + '_c_' + i); }
    }
}
function is_captcha(v)
{
    if (v == L['str_captcha']) return false;
    if (v.match(/^[a-z0-9A-Z]{1,}$/))
    {
        return v.match(/^[a-z0-9A-Z]{4,}$/);
    }
    else
    {
        return v.length > 1;
    }
}
function ext(v) { return v.substring(v.lastIndexOf('.') + 1, v.length).toLowerCase(); }
function PushNew()
{
    $('#bc_push').remove();
    s = document.createElement("script");
    s.type = "text/javascript";
    s.id = "bc_push";
    s.src = DTPath + "api/push.js.php?refresh=" + Math.random() + ".js";
    document.body.appendChild(s);
}
function set_cookie(n, v, d)
{
    var e = '';
    var f = d ? d : 365;
    e = new Date((new Date()).getTime() + f * 86400000);
    e = "; expires=" + e.toGMTString();
    document.cookie = CKPrex + n + "=" + v + ((CKPath == "") ? "" : ("; path=" + CKPath)) + ((CKDomain == "") ? "" : ("; domain=" + CKDomain)) + e;
}
function get_cookie(n)
{
    var v = ''; var s = CKPrex + n + "=";
    if (document.cookie.length > 0)
    {
        o = document.cookie.indexOf(s);
        if (o != -1)
        {
            o += s.length;
            end = document.cookie.indexOf(";", o);
            if (end == -1) end = document.cookie.length;
            v = unescape(document.cookie.substring(o, end));
        }
    }
    return v;
}
function del_cookie(n) { var e = new Date((new Date()).getTime() - 1); e = "; expires=" + e.toGMTString(); document.cookie = CKPrex + n + "=" + escape("") + ";path=/" + e; }
function substr_count(str, exp) { if (str == '') return 0; var s = str.split(exp); return s.length - 1; }
function lang(s, a) { for (var i = 0; i < a.length; i++) { s = s.replace('{V' + i + '}', a[i]); } return s; }
document.onkeydown = function (e)
{
    var k = typeof e == 'undefined' ? event.keyCode : e.keyCode;
    if (k == 37)
    {
        try { if (Dd('bc_previous').value && typeof document.activeElement.name == 'undefined') Go(Dd('bc_previous').value); } catch (e) { }
    } else if (k == 39)
    {
        try { if (Dd('bc_next').value && typeof document.activeElement.name == 'undefined') Go(Dd('bc_next').value); } catch (e) { }
    } else if (k == 38 || k == 40 || k == 13)
    {
        try { if (Dd('search_tips').style.display != 'none' || Dd('search_tips').innerHTML != '') { SCTip(k); return false; } } catch (e) { }
    }
}
function showDialog(reg)
{
    var w = 450;
    var u = '/member/reglogin.php?reg=' + reg;
    var c = '<iframe src="' + u + '" width="' + (w - 25) + '" height="455" border="0" vspace="0" hspace="0" marginwidth="0" marginheight="0" framespacing="0" frameborder="0" scrolling="no"></iframe>';
    var s = 0;
    var px = 0;
    var py = 0;
    var body = document.documentElement || document.body;
    if (isGecko) body = document.body;
    var cw = body.clientWidth;
    var ch = body.clientHeight;
    var bsw = body.scrollWidth;
    var bsh = body.scrollHeight;
    var bw = parseInt((bsw < cw) ? cw : bsw);
    var bh = parseInt((bsh < ch) ? ch : bsh);
    if (!s)
    {
        var LoginDialogBg = document.createElement("div");
        with (LoginDialogBg.style) { zIndex = 998; position = 'absolute'; width = '100%'; height = bh + 'px'; overflow = 'hidden'; top = 0; left = 0; border = "0px"; backgroundColor = '#EEEEEE'; if (isIE) { filter = " Alpha(Opacity=50)"; } else { opacity = 50 / 100; } }
        LoginDialogBg.id = "LoginDialogBg";
        document.body.appendChild(LoginDialogBg);
    }
    var sl = px ? px : body.scrollLeft + parseInt((cw - w) / 2);
    var st = py ? py : body.scrollTop + parseInt(ch / 2) - 100;
    var LoginDialog = document.createElement("div");
    with (LoginDialog.style) { zIndex = 10000; position = 'fixed'; width = w + 'px'; left = '50%'; top = '100px'; marginLeft = '-225px', display = 'none'; }
    LoginDialog.id = 'LoginDialog';
    document.body.appendChild(LoginDialog);
    Dd('LoginDialog').innerHTML = c;
    Eh();
    $('#LoginDialog').show(1, function ()
    {
        st = py ? py : body.scrollTop + parseInt(ch / 2) - parseInt($('#LoginDialog').height() / 2);
    });
}


var L = new Array();
/* admin.js */
L['system_tips'] = '系统提示';
L['ok'] = '确 定';
L['cancel'] = '取 消';
L['upload'] = '上 传';
L['uploading'] = '上传中..';
L['upload_file'] = '上传文件';
L['upload_img'] = '上传图片';
L['allow'] = '限制为:';
L['preview_img'] = '图片预览';
L['choose_img'] = '选择图片';
L['width'] = '宽度';
L['height'] = '高度';
L['up_local'] = '本地图片';
L['up_remote'] = '网络图片';
L['type_imgurl'] = '请填写图片网址';
L['choose_file'] = '请选择文件';
L['choose_item'] = '选择信息';
L['dialog_user'] = '会员{V0}资料';
L['empty_img'] = '不可预览，图片地址为空';
L['confirm_del'] = '确定要删除吗？此操作将不可撤销';
L['type_category'] = '请输入分类名称或简称，例如：计算机';
L['related_found'] = '为您找到以下相关分类，请选择：';
L['related_not_found'] = '未找到相关分类，请调整名称';
L['type_valid_filepath'] = '请输入正确的文件路径';
L['wysiwyg_mode'] = '请切换到设计模式';
L['dialog_close'] = '关闭[快捷键Esc]';
L['tpl_add'] = '新建模板';
L['tpl_edit'] = '修改模板';
/* calendar.js */
L['Sun'] = '日';
L['Mon'] = '一';
L['Tue'] = '二';
L['Wed'] = '三';
L['Thu'] = '四';
L['Fri'] = '五';
L['Sat'] = '六';
L['prev_year'] = '前一年';
L['next_year'] = '后一年';
L['prev_month'] = '上一月';
L['next_month'] = '下一月';
/* common.js */
L['str_delete'] = '删除';
L['str_captcha'] = '点击显示';
/* draft.js */
L['fck_zoom'] = '点击增加高度 右击缩小高度';
L['data_recovery'] = '数据恢复';
L['save_draft'] = '暂存草稿';
L['if_cover_data'] = '发现 {V0} 保存的数据，是否覆盖当前数据？';
L['no_data'] = '抱歉 未找到保存的数据';
L['at_least_10_letters'] = '请至少输入10个字，当前已输入{V0}字';
L['stop_auto_save'] = '系统会自动保存草稿，此操作将中止系统自动保存功能，确定要继续吗？';
L['draft_auto_saved'] = '{V0}点{V1}分{V2}秒 系统自动保存了草稿';
L['draft_saved'] = '草稿已保存';
L['stop_save'] = '关闭保存';
L['draft_save_stopped'] = '草稿保存已停止';
L['start_save'] = '开启保存';
L['upload_attach'] = '插入附件';
/* fckeditor.js */
L['tip_image'] = '提示：您的浏览器支持直接拖拽本地图片至编辑器或者直接Ctrl+C粘贴QQ截图里的图像，赶快试试吧！';
L['tip_know'] = '我知道了';
/* homepage.js & member.js */
L['click_open'] = '点击打开原图';
L['keyword_value'] = '输入关键词';
L['keyword_message'] = '请输入关键词';
L['Sunday'] = '星期日';
L['Monday'] = '星期一';
L['Tuesday'] = '星期二';
L['Wednesday'] = '星期三';
L['Thursday'] = '星期四';
L['Friday'] = '星期五';
L['Saturday'] = '星期六';
L['show_date'] = '今天是 {V0}月{V1}日 {V2}';
/* index.js */
L['close_letter'] = '收起';
L['last_page'] = '已至最后一页';
/* page.js */
L['popular_search_terms'] = '热门搜索：';
L['search_tips_close'] = '关闭';
L['chrome_fav_tip'] = '请按快捷键Ctrl+D收藏本页，谢谢';
/* player.js */
L['iso_tips_video'] = '暂不支持此视频，请在电脑上观看';
/* profile.js */
L['max_mode'] = '最多可选{V0}种经营模式';
L['max_cate'] = '最多可添加{V0}个分类';
L['choose_category'] = '请选择分类';
L['category_chosen'] = '已添加过此分类';
/*weibo.js*/
L['sync_sina'] = '同步到新浪微博';
L['sync_qq'] = '同步到腾讯微博';
L['sync_qzone'] = '同步到QQ空间';
L['sync_login_sina'] = '您还没有登录新浪微博或者登录已经失效，是否现在登录?';
L['sync_login_qq'] = '您还没有QQ登录或者QQ登录已经失效，是否现在登录?';
L['tip'] = '友情提示';
L['change_brand'] = '已经审核的信息，请联系管理员修改！';