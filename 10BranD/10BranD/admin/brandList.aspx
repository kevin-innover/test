<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="brandList.aspx.cs" Inherits="BranD10.Pages.brandList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../skin/style.css" type="text/css" />
    <script src="../js/jquery.js">    </script>
    <script type="text/javascript" src="../js/public.js">    </script>
    <script type="text/javascript" src="../js/entity.js">    </script>
    <script type="text/javascript" src="../js/prompt/ymPrompt.js">    </script>
    <link rel="stylesheet" id='skin' type="text/css" href="../js/prompt/skin/qq/ymPrompt.css" /> 
    
   
    <script  type="text/javascript">

        
 
    </script>
</head>
<body>
    <div class="menu" onselectstart="return false" id="bc_menu">
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td valign="bottom">
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="10">
                                &nbsp;
                            </td>
                            <td id="Tab0" class="tab">
                                <a href="editBrand.html?action=add">添加品牌</a>
                            </td>
                            <td class="tab_nav">
                                &nbsp;
                            </td>
                            <td id="Tab1" class="tab">
                                <a href="?action=list">品牌列表</a>
                            </td>
                            <td class="tab_nav">
                                &nbsp;
                            </td>
                            <td id="Tab2" class="tab">
                                <a href="?action=check">审核品牌</a>
                            </td>
                            <td class="tab_nav">
                                &nbsp;
                            </td>
                            <td id="Tab3" class="tab">
                                <a href="?action=reject">未通过品牌</a>
                            </td>
                            <td class="tab_nav">
                                &nbsp;
                            </td>
                            <td id="Tab4" class="tab">
                                <a href="?action=recycle">回收站</a>
                            </td>
                            <td class="tab_nav">
                                &nbsp;
                            </td>
                            <td id="Tab5" class="tab">
                                <a href="?moduleid=13&action=move">移动分类X</a>
                            </td>
                            <td class="tab_nav">
                                &nbsp;
                            </td>
                            <td id="Tab6" class="tab">
                                <a href="?moduleid=13&action=nopay">未支付品牌X</a>
                            </td>
                            <td class="tab_nav">
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
                <td width="110">
                    <div>
                        <img src="../images/spacer.gif" width="40" height="24" title="刷新" onclick="window.location.reload();"
                            style="cursor: pointer;" alt="" /><img src="../images/spacer.gif" width="20" height="24"
                                title="后退" onclick="history.back(-1);" style="cursor: pointer;" alt="" /><img src="../images/spacer.gif"
                                    width="20" height="24" title="前进" onclick="history.go(1);" style="cursor: pointer;"
                                    alt="" /><img src="../images/spacer.gif" width="20" height="24" title="帮助" onclick="Go('http://www.destoon.com/client.php?action=help&product=b2b&mfa=brand-index-edit');"
                                        style="cursor: help;" alt="" /></div>
                </td>
            </tr>
        </table>
    </div>
    <form action="?">
    <div class="tt">
        品牌搜索</div>
    <input type="hidden" name="moduleid" value="13" />
    <input type="hidden" name="action" value="" />
    <table cellpadding="2" cellspacing="1" class="tb">
        <tr>
            <td style="position: relative;">
                &nbsp;<select name="fields"><option value="0" selected="selected">模糊</option>
                    <option value="1">标题</option>
                    <option value="2">公司名</option>
                    <option value="3">联系人</option>
                    <option value="4">联系电话</option>
                    <option value="5">联系地址</option>
                    <option value="6">电子邮件</option>
                    <option value="7">联系MSN</option>
                    <option value="8">联系QQ</option>
                    <option value="9">会员名</option>
                    <option value="10">IP</option>
                </select>&nbsp;
                <input type="text" size="30" name="kw" value="" title="关键词" />&nbsp;
                <select name="level">
                    <option value="0">级别</option>
                    <option value="1">1 级 推荐品牌</option>
                    <option value="2">2 级 台历下面</option>
                    <option value="3">3 级</option>
                    <option value="4">4 级</option>
                    <option value="5">5 级</option>
                    <option value="6">6 级</option>
                    <option value="7">7 级</option>
                    <option value="8">8 级</option>
                    <option value="9">9 级</option>
                </select>&nbsp;
                <select name="order">
                    <option value="0" selected="selected">结果排序方式</option>
                    <option value="1">更新时间降序</option>
                      <option value="2">投票数降序</option>
                    <%--<option value="2">更新时间升序</option>--%>
                  <%--  <option value="3">添加时间降序</option>
                    <option value="4">添加时间升序</option>
                    <option value="5">浏览次数降序</option>
                    <option value="6">浏览次数升序</option>
                    <option value="7">品牌ID降序</option>
                    <option value="8">品牌ID升序</option>
                  
                    <option value="10">投票数升序</option>
                    <option value="11">可信品牌排前</option>
                    <option value="12">停止投票排前</option>
                    <option value="13">最大票数排前</option>
                    <option value="14">最新报名排前</option>--%>
                </select>&nbsp;
                <input type="text" name="psize" value="20" size="2" class="t_c" title="条/页" />
                <!-- 可输入下拉框引入star -->
                &nbsp;&nbsp;&nbsp;搜索分类 &nbsp;&nbsp; <span class="searchData" style="position: absolute;
                    left: 650px; top: 3px;">
                    <input name="category" placeholder="正在进行中的行业" type="text" id="category" autocomplete="off"
                        value="进行中行业" onkeyup="onku()" />
                    <span id="dbrandtitle" class="f_red"></span>
                    <div class="dataList" style="position: absolute; left: 0; top: 0; background: #fff;
                        z-index: 99999999999; width: 161px; display: none; cursor: pointer;">
                        <input name="category1" type="text" id="category1" autocomplete="off" onkeyup="onku()" />
                        <ul id="suggest_ul">
                        </ul>
                    </div>
                </span>
                <script>
                    arr = new Array();
                    array = new Array();
                    arr[0] = '进行中行业'; array[0] = '0'; arr[1] = '全部'; array[1] = '1'; arr[2] = '压缩机'; array[2] = '2'; arr[3] = '泳池设备'; array[3] = '3'; arr[4] = '门禁系统'; array[4] = '4'; arr[5] = '机箱'; array[5] = '5'; arr[6] = '陶瓷'; array[6] = '6'; arr[7] = '水族箱'; array[7] = '7'; arr[8] = '红枣'; array[8] = '8'; arr[9] = '壁纸'; array[9] = '9'; arr[10] = '标准件'; array[10] = '10'; arr[11] = '行车记录仪';

                    var data = '<li onclick=\'changeval("进行中行业","0");\'> &nbsp;进行中行业 </li><li onclick=\'changeval("全部","1");\'> &nbsp;全部 </li><li onclick=\'changeval("压缩机","2");\'> &nbsp;压缩机 </li><li onclick=\'changeval("泳池设备","3");\'> &nbsp;泳池设备 </li><li onclick=\'changeval("门禁系统","4");\'> &nbsp;门禁系统 </li><li onclick=\'changeval("机箱","5");\'> &nbsp;机箱 </li><li onclick=\'changeval("陶瓷","6");\'> &nbsp;陶瓷 </li><li onclick=\'changeval("水族箱","7");\'> &nbsp;水族箱 </li><li onclick=\'changeval("红枣","8");\'> &nbsp;红枣 </li><li onclick=\'changeval("壁纸","9");\'> &nbsp;壁纸 </li><li onclick=\'changeval("标准件","10");\'> &nbsp;标准件 </li><li onclick=\'changeval("行车记录仪","11");\'> &nbsp;行车记录仪 </li>';
                    if (arr.length >= 19) {
                        $("#suggest_ul").css("overflow", "auto");
                        $("#suggest_ul").css("width", "162px");
                        $("#suggest_ul").css("height", "427px");
                    }
                    $("#suggest_ul").html(data);
                    $("#category").focus(function () {
                        $(".dataList").css("display", "block");
                        $("#category1").focus();
                    });
                    $(".dataList").mouseover(function () {
                        $(".dataList").css("display", "block");
                    });
                    $(".dataList").mouseout(function () {
                        $(".dataList").css("display", "none");
                        $("#category").blur();
                    });
                    $(".dataList li").mouseover(function () {
                        $(this).css("background", "#eee");
                        $(this).parent().css("text-decoration", "none");
                        $(this).parent().css("color", "#000");

                    });
                    $(".dataList li").mouseout(function () {
                        $(this).css("background", "#fff");
                        $(this).parent().css("text-decoration", "none");
                    });
                    function onku() {
                        $("#category").val($("#category1").val());
                        var shuru = document.getElementById('category').value;
                        if (shuru != '') {
                            var arrayval = [];
                            var val = [];
                            var j = 0;
                            for (i = 0; i < arr.length; i++) {
                                var flag = arr[i].indexOf(shuru);
                                if (flag >= 0) {
                                    arrayval[j] = arr[i];
                                    val[j] = array[i];
                                    j++;
                                }
                            }
                            var contents = "";
                            if (arrayval) {
                                for (var j = 0; j < arrayval.length; j++) {
                                    contents = contents + "<a style='cursor:pointer;'><li onclick='changeval(\"" + arrayval[j] + "\"," + val[j] + ");'>" + arrayval[j] + "</li></a>";
                                }
                                if (arrayval.length >= 19) {
                                    $("#suggest_ul").css("overflow", "auto");
                                    $("#suggest_ul").css("width", "162px");
                                    $("#suggest_ul").css("height", "427px");
                                } else {
                                    $("#suggest_ul").css("width", "auto");
                                    $("#suggest_ul").css("height", "auto");
                                }
                            }
                            $("#suggest_ul").show();
                            $("#suggest_ul").html(contents);
                            $('#dbrandtitle').html('');
                            $('#category').html('');
                        } else {
                            $("#suggest_ul").html(data);
                        }
                    }
                    function changeval(keywords, val) {
                        $("#category1").val(keywords);
                        $("#category").val(keywords);
                        $('#suggest_ul').html('');
                        $("#suggest_ul").css("width", "auto");
                        $("#suggest_ul").css("height", "auto");
                        $('#dbrandtitle').html('<input type="hidden" name="catstatus" value=' + val + ' >');
                    }
                </script>
                <!-- 可输入下拉框引入end -->
                <input type="submit" value="搜 索" class="btn" style="margin-left: 170px;" />&nbsp;
                <input type="button" value="重 置" class="btn" onclick="window.location='?moduleid=13&file=index&action=';" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;<select name="datetype">
                    <option value="edittime" selected>更新日期</option>
                    <option value="addtime">发布日期</option>
                    <option value="totime">到期日期</option>
                </select>&nbsp;
                <script type="text/javascript" src="../js/calendar.js"></script>
                <input type="text" name="fromdate" id="fromdate" value="" size="10" onfocus="ca_show('fromdate', this, '');"
                    readonly ondblclick="this.value='';" />
                <img src="../images/calendar.gif" align="absmiddle"
                    onclick="ca_show('fromdate', this, '');" style="cursor: pointer;" />
                至
                <input type="text" name="todate" id="todate" value="" size="10" onfocus="ca_show('todate', this, '');"
                    readonly ondblclick="this.value='';" />
                <img src="../images/calendar.gif" align="absmiddle"
                    onclick="ca_show('todate', this, '');" style="cursor: pointer;" />&nbsp; <span id="catechange">
                        <input name="catid" id="catid_1" type="hidden" value="0" /><span id="load_category_1"><select
                            onchange="load_category(this.value, 1,0);"><option value="0">所属行业</option>
                            <option value="39421">家居建材/装饰五金</option>
                            <option value="39424">家电/厨卫</option>
                            <option value="39425">能源/化工/农用产品</option>
                            <option value="39426">床具/服装</option>
                            <option value="39427">保健/医疗器械/药品</option>
                            <option value="39428">交通/运输</option>
                            <option value="39429">网络/游戏/软件</option>
                            <option value="39431">现代服务业</option>
                            <option value="39432">食品/饮品/酒类</option>
                            <option value="39434">日用百货</option>
                            <option value="39683">乐器/娱乐</option>
                            <option value="39692">美发用品</option>
                            <option value="39698">户外</option>
                            <option value="39748">机电仪器仪表</option>
                            <option value="39870">电子制造</option>
                            <option value="39951">园林艺术</option>
                        </select>
                        </span>
                        <script type="text/javascript">
                            var category_moduleid = new Array; category_moduleid[1] = "13";
                            var category_title = new Array; category_title[1] = '所属行业';
                            var category_extend = new Array; category_extend[1] = '';
                            var category_catid = new Array; category_catid[1] = '0'; 
                         var category_deep = new Array; category_deep[1] = '0';
                        </script>
                        <script type="text/javascript" src="http://img.10brandchina.com/file/script/category.js"></script>
                        &nbsp; </span>
                <!--所属行业搜索star1-->
                <span id="catechange1" style="position: relative;">&nbsp;&nbsp;搜索所属行业
                    <input name="classification" type="text" id="classification" autocomplete="off" value="" />
                    <span id="brandtitle" class="f_red"></span>
                    <ul id="suggest_ulli" style="position: absolute; left: 33.8%; top: 120%; background: #fff;
                        width: 161px; display: block; cursor: pointer;">
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
                ID：<input type="text" size="4" name="itemid" value="" />&nbsp;
                <input type="checkbox" name="captcha" value="1" />防刷&nbsp;
                <input type="checkbox" name="baomavote" value="1" />宝妈兼职&nbsp;
                <input type="checkbox" name="frompc" value="1" />限制PC版网站投票&nbsp;
                <input type="checkbox" name="isshuapiao" value="1" />涉嫌刷票&nbsp;
                <input type="checkbox" name="mtoupiaolimit" value="1" />手机限制&nbsp;
                <input type="checkbox" name="apptoupiaolimit" value="1" />App限制&nbsp;
                <input type="checkbox" name="isauto" value="1" />自动限制&nbsp;
            </td>
        </tr>
    </table>
    </form>
    <form id="form1" runat="server">
    <div class="tt">
        品牌列表</div>
    <div>
    </div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True"
        CssClass="tb">
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>
                    <asp:CheckBox ID="CheckBox_Header" runat="server" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" />
                    <asp:Label ID="lbl_ID" runat="server" Text='<%# Bind("ID") %>' Visible="false"></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="序号">
                <HeaderStyle BackColor="#6694B8" Font-Size="8pt" />
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
                <ItemStyle Width="3%" />
            </asp:TemplateField>
            <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="../vote/showIndustry.aspx?ID={0}"
                DataTextField="IndustryName" HeaderText="分 类" />
            <asp:ImageField DataImageUrlField="LogoPath" ControlStyle-Width="80"
                HeaderText="LOGO">
            </asp:ImageField>
            <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="showbrand.aspx?brandID={0}"
                DataTextField="Name" HeaderText="标  题" />
            <asp:HyperLinkField DataTextField="userName" HeaderText="会  员" />
            <asp:BoundField DataField="updateTime" HeaderText="更新时间" />
            <asp:BoundField HeaderText="禁止投票/验证码自动" />
            <asp:BoundField HeaderText="限制PC网站" DataField="PCLimit" />
            <asp:BoundField HeaderText="手机每分钟限制" DataField="PhoneLimit" />
            <asp:BoundField HeaderText="App每分钟限制" DataField="AppLimit" />
            <asp:BoundField HeaderText="资质审核最大票数" DataField="AuditLimitValue" HtmlEncode="false" />
            <asp:BoundField HeaderText="刷票" DataField="AutoTicket" />
              <asp:TemplateField HeaderText="刷票">
                <ItemTemplate>
                   <input type="text" value='<%# Eval("AutoFrequency1_Value") %>' onblur='SaveFrequency(1,this.value,<%#Eval("Id")%>)' />分<br/>
                   <input type="text" value='<%# Eval("AutoFrequency2_Value") %>' onblur='SaveFrequency(2,this.value,<%#Eval("Id")%>)' />票
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="总票/真实投票/IP/刷票">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# bind("TotalTickets") %>'></asp:Label>&nbsp/
                    <asp:Label ID="Label2" runat="server" Text='<%# bind("RealTicket") %>'></asp:Label>&nbsp/
                     <a href='../vote/showTickets.aspx?ID=<%#Eval("Id")%>'></a>&nbsp/
                    <asp:Label ID="Label4" runat="server" Text='<%# bind("AutoTicket") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操  作">
                <ItemTemplate>
                    <a href='editBrand.html?action=edit&brandID=<%#Eval("Id") %>'>
                        <img src="../images/edit.png" width="16" height="16" title="编辑" alt="" /></a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <PagerTemplate>
            <asp:Label ID="Label_page" runat="server" Text="Label"></asp:Label>
        </PagerTemplate>
    </asp:GridView>
    <asp:Label ID="Label_page1" runat="server" Text="Label"></asp:Label>
    <asp:HiddenField ID="HiddenField_CurrentPage" runat="server" Value="-1" />
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="刷新数据" />
    </form>
</body>
</html>
