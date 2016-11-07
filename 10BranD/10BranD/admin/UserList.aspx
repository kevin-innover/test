<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" Inherits="BranD10.Pages.UserList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <script type="text/javascript" src="../js/jquery.js">    </script>
    <script type="text/javascript" src="../js/public.js">    </script>
    <script type="text/javascript" src="../js/prompt/ymPrompt.js">    </script>
    <link rel="stylesheet" id='Link1' type="text/css" href="../js/prompt/skin/qq/ymPrompt.css" />
    <link rel="stylesheet" id='skin' type="text/css" href="../skin/style.css" /> 
    <script>
        $(document).ready(function () {
            try {
                var Request = new Object();
                Request = GetRequest();

                var action = Request['action']

                if (action == 'Category') {
                    $(".subCategory").hide()
                }
             //   userCtrlID = "#users";
               // LoadAllUserNames(0 )
            }
            catch (e) {

            }
        })

        function getSelectIDS() {
            this.form.action = '?action=deleteMany'

        }
       
    </script>
</head>
<body>
    <form id="form1" runat="server">
 <div id="msgbox" onmouseover="closemsg();" style="display:none;"></div>
<div class="menu" onselectstart="return false" id="bc_menu">
<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
<td valign="bottom">
<table cellpadding="0" cellspacing="0">
<tr>
<td width="10">&nbsp;</td>
<td id="Tab0" class="tab"><a href="editUser.html?action=add" >添加专员</a></td><td class="tab_nav">&nbsp;</td><td id="Tab1" class="tab"><a href="UserList.aspx" >专员列表</a></td><td class="tab_nav">&nbsp;</td><td class="tab_nav">&nbsp;</td><td class="tab_nav">&nbsp;</td></tr>
</table>
</td>
<td width="110"><div><img src="../images/spacer.gif" width="40" height="24" title="刷新" onclick="window.location.reload();" style="cursor:pointer;" alt=""/><img src="../images/spacer.gif" width="20" height="24" title="后退" onclick="history.back(-1);" style="cursor:pointer;" alt=""/><img src="../images/spacer.gif" width="20" height="24" title="前进" onclick="history.go(1);" style="cursor:pointer;" alt=""/><img src="../images/spacer.gif" width="20" height="24" title="帮助" onclick="Go('http://www.destoon.com/client.php?action=help&product=b2b&mfa=destoon-category-');" style="cursor:help;" alt=""/></div></td>
</tr>
</table>
</div>
 
<input type="hidden" name="mid" value="13"/>
<input type="hidden" name="file" value="category"/>
 
 
<div class="tt">专员列表</div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  ShowHeaderWhenEmpty="True"  CssClass="tb" 
        DataKeyNames="Id">
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>
                    <asp:CheckBox ID="CheckBox_Header" runat="server"  />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server"     />
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
            <asp:BoundField DataField="Id" HeaderText="ID" />

            <asp:BoundField DataField="CName" HeaderText="姓名" />
            <asp:BoundField DataField="Name" HeaderText="会员名" />
            <asp:BoundField DataField="Tel" HeaderText="电话" />
            <asp:BoundField DataField="QQ" HeaderText="QQ" />
            <asp:BoundField DataField="AuditTel" HeaderText="资质审核电话" />
            <asp:BoundField DataField="AuditEmail" HeaderText="资质审核邮箱" />
            <asp:TemplateField HeaderText="最大数/使用数">
                <ItemTemplate>
                     <span><%#Eval("MaxCategory") %>&nbsp;/&nbsp;</span>
                     <span style="color:Red"><%#Eval("UsedCategory")%></span>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="UpdateTime" HeaderText="编辑时间" />
            <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="../vote/showIndustry.aspx?ID={0}"
             DataTextField="ID" DataTextFormatString="查看" HeaderText="工作日报X" />
          
            <asp:TemplateField HeaderText="操  作">
                <ItemTemplate>
                    
                    <a href="editUser.html?action=edit&ID=<%#Eval("ID") %>">
                        <img src="../images/edit.png" width="16" height="16" title="编辑" alt="" /></a>
                    <a href="?action=delete&ID=<%#Eval("ID")%>" onclick="return confirm('确定要删除数据吗？');">
                        <img src="../images/delete.png" width="16" height="16" title="删除" alt="" /></a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
       
    </asp:GridView>
   <div class="btns">
<input type="submit" value="删除选中" class="btn" onclick="if(confirm('确定要删除选中专员吗？此操作将不可撤销')){  this.form.action = '?action=deleteMany' }else{return false;}"/>
</div>
    </form>
</body>
</html>
