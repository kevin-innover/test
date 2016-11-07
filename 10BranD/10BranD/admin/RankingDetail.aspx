<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RankingDetail.aspx.cs"
    Inherits="BranD10.Pages.RankingDetail" %>

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
        榜单详情</div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="ID" />
            <asp:BoundField DataField="BrandName" HeaderText="标  题" />
            <asp:ImageField   DataImageUrlField="LogoPath"   
                HeaderText="LOGO"   ControlStyle-Width="80">
            </asp:ImageField>
            <asp:TemplateField HeaderText="排名">
                <HeaderStyle BackColor="#6694B8" Font-Size="8pt" />
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
                <ItemStyle Width="3%" />
            </asp:TemplateField>
         
         
            <asp:BoundField DataField="StatusValue" HeaderText="奖牌证书" HtmlEncode="false"  />
            <asp:BoundField DataField="CompanyName" HeaderText="公司名称" />
            <asp:BoundField DataField="Websit" HeaderText="网址" />
            <asp:BoundField DataField="Addr" HeaderText="地址" />
            <asp:BoundField HeaderText="编辑时间" DataField="UpdateTime" />
            <asp:TemplateField HeaderText="操  作">
                <ItemTemplate>
                    <a href="editRanking.html?action=edit&ID=<%#Eval("Id") %>">
                        <img src="../images/edit.png" width="16" height="16" title="编辑" alt="" /></a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:Label ID="Label_page1" runat="server" Text="Label"></asp:Label>
    <asp:HiddenField ID="HiddenField_CurrentPage" runat="server" Value="-1" />
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="刷新数据" />
    </form>
</body>
</html>
