<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractList.aspx.cs" Inherits="BranD10.Pages.ContractList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
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
                                <a href="editContract?action=add">添加合同</a>
                            </td>
                            <td class="tab_nav">
                                &nbsp;
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
                                    alt="" /><img src="../images/spacer.gif" width="20" height="24" title="帮助" onclick="Go('http://www.destoon.com/client.php?action=help&product=b2b&mfa=brand-paybrand-');"
                                        style="cursor: help;" alt="" /></div>
                </td>
            </tr>
        </table>
    </div>
    <form action="" runat="server">
    <div class="tt">
        搜索</div>
    <input type="hidden" name="moduleid" value="13" />
    <input type="hidden" name="action" value="" />
    <input type="hidden" name="file" value="paybrand" />
    <table cellpadding="2" cellspacing="1" class="tb">
        <tr>
            <td>
                &nbsp;<select name="fields"><option value="0" selected="selected">品牌名</option>
                    <option value="1">公司名</option>
                    <option value="2">行业专员</option>
                    <option value="3">行业</option>
                </select>&nbsp;
                <input type="text" size="30" name="kw" value="" title="关键词" />&nbsp;
                <select name="order">
                    <option value="0" selected="selected">结果排序方式</option>
                    <option value="1">添加时间降序</option>
                    <option value="2">添加时间升序</option>
                    <option value="3">收费时间降序</option>
                    <option value="4">收费时间升序</option>
                </select>&nbsp; 日期
                <script type="text/javascript" src="../js/calendar.js"></script>
                <input type="text" name="fromdate" id="fromdate" value="" size="10" onfocus="ca_show('fromdate', this, '');"
                    readonly ondblclick="this.value='';" />
                <img src="../images/calendar.gif" align="absmiddle" onclick="ca_show('fromdate', this, '');"
                    style="cursor: pointer;" />
                至
                <input type="text" name="todate" id="todate" value="" size="10" onfocus="ca_show('todate', this, '');"
                    readonly ondblclick="this.value='';" />
                <img src="../images/calendar.gif" align="absmiddle" onclick="ca_show('todate', this, '');"
                    style="cursor: pointer;" />&nbsp;
                <input type="text" name="psize" value="20" size="2" class="t_c" title="条/页" />
                <input type="submit" value="搜 索" class="btn" />&nbsp;
                <input type="button" value="重 置" class="btn" onclick="window.location='?moduleid=13&file=paybrand&action=';" />
            </td>
        </tr>
    </table>
    <div class="tt">
        合同列表</div>
    <th>
        ID
    </th>
    <th>
        行业
    </th>
    <th>
        品牌名
    </th>
    <th>
        品牌LOGO
    </th>
    <th>
        公司名
    </th>
    <th>
        发票截图
    </th>
    <th>
        合同截图
    </th>
    <th>
        添加时间
    </th>
    <th>
        收费时间
    </th>
    <th>
        收费金额
    </th>
    <th>
        发票
    </th>
    <th>
        行业专员
    </th>
    <th>
        操作
    </th>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True"
        CssClass="tb" DataKeyNames="Id">
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>
                    <asp:CheckBox ID="CheckBox_Header" runat="server" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" />
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:BoundField DataField="Id" HeaderText="ID" HtmlEncode="false" />
            <asp:BoundField DataField="_Brand.IndustryName" HeaderText="行业" HtmlEncode="false" />
            <asp:BoundField DataField="_Brand.Name" HeaderText="品牌名" HtmlEncode="false" />
            <asp:ImageField DataImageUrlField="LogoPath" HeaderText="品牌LOGO" ControlStyle-Width="72"
                ControlStyle-Height="40">
            </asp:ImageField>
            <asp:BoundField DataField="CompanyName" HeaderText="公司名" HtmlEncode="false" />
            <asp:ImageField DataImageUrlField="ViewBill" HeaderText="发票截图" ControlStyle-Width="72"
                ControlStyle-Height="40">
            </asp:ImageField>
            <asp:ImageField DataImageUrlField="View" HeaderText="合同截图" ControlStyle-Width="72"
                ControlStyle-Height="40">
            </asp:ImageField>
            <asp:BoundField DataField="CreateDate" HeaderText="添加时间" HtmlEncode="false" />
            <asp:BoundField DataField="Charge" HeaderText="收费金额" HtmlEncode="false" />
            <asp:BoundField DataField="UserName" HeaderText="行业专员" HtmlEncode="false" />
            <asp:TemplateField HeaderText="操  作">
                <ItemTemplate>
                    <a href="editContract.html?action=edit&ID=<%#Eval("Id") %>">
                        <img src="../images/edit.png" width="16" height="16" title="编辑" alt="" /></a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:Label ID="Label_page1" runat="server" Text="Label"></asp:Label>

    <div class="btns">
    </div>
    </form>
    
    <br />
    <script type="text/javascript">        Menuon(1);</script>
</body>
</html>
