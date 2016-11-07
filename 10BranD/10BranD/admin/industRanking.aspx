<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="industRanking.aspx.cs"
    Inherits="BranD10.Pages.industRanking"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../js/jquery.js">    </script>
    <script>
        $(function () {
            $("#create").click(function () {

            });
        });
    </script>
    <link rel="stylesheet" href="../skin/style.css" type="text/css" />

</head>
<body>
    <form action="?" runat="server">
        <div id="msgbox" onmouseover="closemsg();" style="display: none;">
        </div>
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
                                    <a href="?moduleid=13&file=bangdan&action=add">添加榜单X</a>
                                </td>
                                <td class="tab_nav">
                                    &nbsp;
                                </td>
                                <td id="Tab1" class="tab">
                                    <a href="?moduleid=13&file=bangdan">榜单列表</a>
                                </td>
                                <td class="tab_nav">
                                    &nbsp;
                                </td>
                                <td id="Tab2" class="tab">
                                    <a href="?moduleid=13&file=bangdan&action=item">榜单详细</a>
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
                                        alt="" /><img src="../images/spacer.gif" width="20" height="24" title="帮助" onclick="Go('http://www.destoon.com/client.php?action=help&product=b2b&mfa=brand-bangdan-');"
                                            style="cursor: help;" alt="" /></div>
                    </td>
                </tr>
            </table>
        </div>
       
        <div class="tt">
            榜单搜索</div>
        <input type="hidden" name="moduleid" value="13" />
        <input type="hidden" name="file" value="bangdan" />
        <input type="hidden" name="action" value="" />
        <table cellpadding="2" cellspacing="1" class="tb">
            <tr>
                <td>
                    &nbsp;<select name="fields"><option value="0" selected="selected">模糊</option>
                        <option value="1">标题</option>
                    </select>&nbsp;
                    <input type="text" size="30" name="kw" value="" title="关键词" />&nbsp; &nbsp;&nbsp;<select
                        name="year">
                        <option value="2013">2013</option>
                        <option value="2014">2014</option>
                        <option value="2015">2015</option>
                        <option value="2016" selected="selected">2016</option>
                    </select>
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
                    <script type="text/javascript">                        var category_moduleid = new Array; category_moduleid[1] = "13"; var category_title = new Array; category_title[1] = '所属行业'; var category_extend = new Array; category_extend[1] = ''; var category_catid = new Array; category_catid[1] = '0'; var category_deep = new Array; category_deep[1] = '0';</script>
                    <script type="text/javascript" src="http://img.10brandchina.com/file/script/category.js"></script>
                    &nbsp;
                    <input type="text" name="psize" value="20" size="2" class="t_c" title="条/页" />
                    <input type="submit" value="搜 索" class="btn"  />&nbsp;
                    <input type="button" value="重 置X" class="btn" onclick="window.location='?moduleid=13&file=bangdan&action=';" />
                    <input type="button" value="奖牌证书" class="btn" onclick="window.open('/vote/certificate.php');" />
                </td>
            </tr>
        </table>
        
        <div class="tt">
            榜单列表</div>
         
      
       
         
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True" CssClass="tb" 
        PageSize="20" ShowHeaderWhenEmpty="True">
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
              <asp:BoundField DataField="Id" HeaderText="ID" />
            <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="../vote/showIndustry.aspx?ID={0}"
                DataTextField="IndustryName" HeaderText="分 类" />
          
            <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="showbrand.aspx?brandID={0}"
                DataTextField="Title" HeaderText="标  题" />
         
             <asp:BoundField DataField="Year" HeaderText="年  份" />
               <asp:HyperLinkField DataNavigateUrlFields="IndustryID,Year,IndustryName" DataNavigateUrlFormatString="rankPublishCenter.html?IndustryID={0}&y={1}&IndustryName={2}"
               HeaderText="媒体发布图" DataTextField="Id" DataTextFormatString="查看" />
            
            <asp:BoundField HeaderText="添加时间" DataField="CreateDate" />
            <asp:BoundField HeaderText="浏览数" DataField="ViewCount" />
             <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="RankingDetail.aspx?ID={0}"
                DataTextFormatString="查看详细"  DataTextField="Id" HeaderText="操作" />
             
        </Columns>
    </asp:GridView>
        
     
    <asp:Label ID="Label_page1" runat="server" Text="Label"></asp:Label>
    <asp:HiddenField ID="HiddenField_CurrentPage" runat="server" Value="-1" />
      <div class="btns">
            <input type="submit" value=" 彻底删除 " class="btn" onclick="if(confirm('确定要删除选中榜单吗？此操作将不可撤销')){this.form.action='?moduleid=13&file=bangdan&action=delete'}else{return false;}" />
        </div>
     </form>
</body>
</html>
