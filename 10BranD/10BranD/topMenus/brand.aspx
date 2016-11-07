<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="brand.aspx.cs" Inherits="BranD10.Menus.brand" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
<div class="menu" onselectstart="return false" id="bc_menu">
<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
<td valign="bottom">
<table cellpadding="0" cellspacing="0">
<tr>
<td width="10">&nbsp;</td>
<td id="Tab0" class="tab"><a href="?moduleid=13&action=add" >添加品牌</a></td><td class="tab_nav">&nbsp;</td><td id="Tab1" class="tab"><a href="?moduleid=13" >品牌列表</a></td><td class="tab_nav">&nbsp;</td><td id="Tab2" class="tab"><a href="?moduleid=13&action=check" >审核品牌</a></td><td class="tab_nav">&nbsp;</td><td id="Tab3" class="tab"><a href="?moduleid=13&action=reject" >未通过品牌</a></td><td class="tab_nav">&nbsp;</td><td id="Tab4" class="tab"><a href="?moduleid=13&action=recycle" >回收站</a></td><td class="tab_nav">&nbsp;</td><td id="Tab5" class="tab"><a href="?moduleid=13&action=move" >移动分类</a></td><td class="tab_nav">&nbsp;</td><td id="Tab6" class="tab"><a href="?moduleid=13&action=nopay" >未支付品牌</a></td><td class="tab_nav">&nbsp;</td></tr>
</table>
</td>
<td width="110"><div><img src="../images/spacer.gif" width="40" height="24" title="刷新" onclick="window.location.reload();" style="cursor:pointer;" alt=""/><img src="../images/spacer.gif" width="20" height="24" title="后退" onclick="history.back(-1);" style="cursor:pointer;" alt=""/><img src="../images/spacer.gif" width="20" height="24" title="前进" onclick="history.go(1);" style="cursor:pointer;" alt=""/><img src="../images/spacer.gif" width="20" height="24" title="帮助" onclick="Go('http://www.destoon.com/client.php?action=help&product=b2b&mfa=brand-index-');" style="cursor:help;" alt=""/></div></td>
</tr>
</table>
</div>
   <form action="?">
<div class="tt">品牌搜索</div>
<input type="hidden" name="moduleid" value="13"/>
<input type="hidden" name="action" value=""/>
<table cellpadding="2" cellspacing="1" class="tb">
<tr>
<td  style="position:relative;">
&nbsp;<select name="fields"  ><option value="0" selected=selected>模糊</option><option value="1">标题</option><option value="2">公司名</option><option value="3">联系人</option><option value="4">联系电话</option><option value="5">联系地址</option><option value="6">电子邮件</option><option value="7">联系MSN</option><option value="8">联系QQ</option><option value="9">会员名</option><option value="10">IP</option></select>&nbsp;
<input type="text" size="30" name="kw" value="" title="关键词"/>&nbsp;
<select name="level" ><option value="0">级别</option><option value="1">1 级 推荐品牌</option><option value="2">2 级 台历下面</option><option value="3">3 级</option><option value="4">4 级</option><option value="5">5 级</option><option value="6">6 级</option><option value="7">7 级</option><option value="8">8 级</option><option value="9">9 级</option></select>&nbsp;
<select name="order"  ><option value="0" selected=selected>结果排序方式</option><option value="1">更新时间降序</option><option value="2">更新时间升序</option><option value="3">添加时间降序</option><option value="4">添加时间升序</option><option value="5">浏览次数降序</option><option value="6">浏览次数升序</option><option value="7">品牌ID降序</option><option value="8">品牌ID升序</option><option value="9">投票数降序</option><option value="10">投票数升序</option><option value="11">可信品牌排前</option><option value="12">停止投票排前</option><option value="13">最大票数排前</option><option value="14">最新报名排前</option></select>&nbsp;
<input type="text" name="psize" value="20" size="2" class="t_c" title="条/页"/>

<!-- 可输入下拉框引入star -->
&nbsp;&nbsp;&nbsp;搜索分类 &nbsp;&nbsp;
<span class="searchData" style="position:absolute;left:650px;top:3px;">
<input name="category"  placeholder="正在进行中的行业" type="text" id="category" autocomplete="off" value="进行中行业" onkeyup="onku()"  /> 
	<span id="dbrandtitle" class="f_red"></span>
	<div class="dataList" style="position: absolute;left:0;top:0;background: #fff;z-index: 99999999999;width:161px;display:none;cursor:pointer;">
		<input name="category1" type="text" id="category1" autocomplete="off"  onkeyup="onku()" />  
		<ul  id="suggest_ul" >
		</ul>
	</div>
</span>
 
<input type="submit" value="搜 索" class="btn" style="margin-left: 170px;"/>&nbsp;
<input type="button" value="重 置" class="btn" onclick="window.location='?moduleid=13&file=index&action=';"/>
</td>
</tr>
<tr>
<td >
&nbsp;<select name="datetype">
<option value="edittime" selected>更新日期</option>
<option value="addtime" >发布日期</option>
<option value="totime" >到期日期</option>
</select>&nbsp;
<script type="text/javascript" src="../js/calendar.js"></script><input type="text" name="fromdate" id="fromdate" value="" size="10" onfocus="ca_show('fromdate', this, '');" readonly ondblclick="this.value='';"/> <img src="../images/calendar.gif" align="absmiddle" onclick="ca_show('fromdate', this, '');" style="cursor:pointer;"/> 至 <input type="text" name="todate" id="todate" value="" size="10" onfocus="ca_show('todate', this, '');" readonly ondblclick="this.value='';"/> <img src="../images/calendar.gif" align="absmiddle" onclick="ca_show('todate', this, '');" style="cursor:pointer;"/>&nbsp;
<span id="catechange">
<input name="catid" id="catid_1" type="hidden" value="0"/><span id="load_category_1"><select onchange="load_category(this.value, 1,0);" ><option value="0">所属行业</option><option value="39421">家居建材/装饰五金</option><option value="39424">家电/厨卫</option><option value="39425">能源/化工/农用产品</option><option value="39426">床具/服装</option><option value="39427">保健/医疗器械/药品</option><option value="39428">交通/运输</option><option value="39429">网络/游戏/软件</option><option value="39431">现代服务业</option><option value="39432">食品/饮品/酒类</option><option value="39434">日用百货</option><option value="39683">乐器/娱乐</option><option value="39692">美发用品</option><option value="39698">户外</option><option value="39748">机电仪器仪表</option><option value="39870">电子制造</option><option value="39951">园林艺术</option></select> </span><script type="text/javascript">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           var category_moduleid = new Array; category_moduleid[1] = "13"; var category_title = new Array; category_title[1] = '所属行业'; var category_extend = new Array; category_extend[1] = ''; var category_catid = new Array; category_catid[1] = '0'; var category_deep = new Array; category_deep[1] = '0';</script><script type="text/javascript" src="http://img.10brandchina.com/file/script/category.js"></script>&nbsp;
</span>
<!--所属行业搜索star1-->
<span id="catechange1" style="position:relative;">
	&nbsp;&nbsp;搜索所属行业 <input name="classification" type="text" id="classification" autocomplete="off" value="" /> 
	<span id="brandtitle" class="f_red"></span>
	<ul id="suggest_ulli"  style="position:absolute;left:33.8%;top:120%;background: #fff;width:161px;display:block;cursor:pointer; ">
	</ul>
</span>		
<script>
    $('#classification').keyup(function () {
        if ($('#classification').val() != '') {
            var vad_strings = $("#classification").val();
            $.ajax({
                type: 'post',
                url: "/ajax.php",
                data: { vad_strings: vad_strings, action: "category", moduleid: 13, status: 123 },
                cache: false,
                dataType: 'json',
                success: function (data) {
                    var content = "";
                    for (var i = 0; i < data.length; i++) {
                        var keywords = data[i].catname;
                        var catid = data[i].catid;
                        var status = data[i].status;

                        if (status == 0) {
                            status = "结束";
                        } else if (status == 1) {
                            status = "投票";
                        } else if (status == 2) {
                            status = "揭榜";
                        } else if (status == 3) {
                            status = "未开始";
                        }
                        content = content + "<a style='cursor:pointer;line-height:30px;height:30px;width:161px;'><li style='margin-left:5px;'   onclick='changevalue(\"" + keywords + "\"," + catid + ");'>" + keywords + "<font color='blue';>(" + status + ")</font>" + "</li></a>";
                    }

                    if (data.length >= 9) {
                        $("#suggest_ulli").css("overflow", "auto");

                        $("#suggest_ulli").css("height", "300px");
                    } else {
                        $("#suggest_ulli").css("width", "161px");
                        $("#suggest_ulli").css("height", "auto");
                    }

                    $("#suggest_ulli").show();
                    $("#suggest_ulli").html(content);
                    $('#brandtitle').html('');
                    $('#classification').html('');

                }
            });
        }
    });

    function changevalue(keywords, catid) {
        $("#classification").val(keywords);
        $('#catechange').html('');
        $('#suggest_ulli').html('');
        $("#suggest_ulli").css("width", "161px");
        $("#suggest_ulli").css("height", "auto");
        $('#brandtitle').html('<input type="hidden" name="catid" value=' + catid + '>');
    }

</script>	
<!--所属行业搜索end1-->
ID：<input type="text" size="4" name="itemid" value=""/>&nbsp;
<input type="checkbox" name="captcha" value="1"/>防刷&nbsp;
<input type="checkbox" name="baomavote" value="1"/>宝妈兼职&nbsp;
<input type="checkbox" name="frompc" value="1"/>限制PC版网站投票&nbsp;
<input type="checkbox" name="isshuapiao" value="1"/>涉嫌刷票&nbsp;

<input type="checkbox" name="mtoupiaolimit" value="1"/>手机限制&nbsp;
<input type="checkbox" name="apptoupiaolimit" value="1"/>App限制&nbsp;
<input type="checkbox" name="isauto" value="1"/>自动限制&nbsp;
</td>
</tr>
</table>
</form>
</body>
</html>
