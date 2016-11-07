<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MessageList.aspx.cs" Inherits="BranD10.Pages.MessageList" %>

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
            }
            catch (e) {

            }
        })

        function getSelectIDS() {
            //  this.form.action = '?action=deleteMany'

        }
       
    </script>
</head>
<body>
    <form id="form1" runat="server">
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
                                <a href="?page=company">留言列表X</a>
                            </td>
                            <td id="Tab1" class="tab">
                                <a href="?page=name">模块设置X</a>
                            </td>
                            
                            <td class="tab_nav">
                                &nbsp;
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
                                    alt="" /><img src="../images/spacer.gif" width="20" height="24" title="帮助" onclick="Go('http://www.destoon.com/client.php?action=help&product=b2b&mfa=destoon-category-');"
                                        style="cursor: help;" alt="" /></div>
                </td>
            </tr>
        </table>
    </div>
   
<div class="tt">留言搜索</div>
<input type="hidden" name="moduleid" value="3"/>
<input type="hidden" name="file" value="guestbook"/>
<input type="hidden" name="action" value=""/>
<table cellpadding="2" cellspacing="1" class="tb">
<tr>
<td>
&nbsp;<select name="fields"  ><option value="0" selected=selected>按条件</option><option value="1">留言标题</option><option value="2">会员名</option><option value="3">联系人</option><option value="4">联系电话</option><option value="5">电子邮件</option><option value="6">QQ</option><option value="7">阿里旺旺</option><option value="8">MSN</option><option value="9">Skype</option><option value="10">留言IP</option><option value="11">留言内容</option><option value="12">回复内容</option></select>&nbsp;
<input type="text" size="30" name="kw" value="" title="关键词"/>&nbsp;
<select name="order"  ><option value="0" selected=selected>结果排序方式</option><option value="1">留言时间降序</option><option value="2">留言时间升序</option><option value="3">回复时间降序</option><option value="4">回复时间升序</option></select>&nbsp;
<select name="catid">
<option value="0">所属行业</option>
	<option value="39355" >壁纸</option>
	<option value="39356" >沙发</option>
	<option value="39374" >消防器材</option>
	 
</select>&nbsp;
<input type="text" name="psize" value="20" size="2" class="t_c" title="条/页"/>
<input type="submit" value="搜 索" class="btn"/>&nbsp;
<input type="button" value="重 置" class="btn" onclick="Go('?moduleid=3&file=guestbook&action=');"/>
</td>
</tr>
</table>
    <div class="tt">
        留言管理</div>
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
           
            <asp:BoundField DataField="Text" HeaderText="留言标题" />
            <asp:BoundField DataField="Name" HeaderText="会员" />
            <asp:BoundField DataField="IP" HeaderText="IP" />
            <asp:BoundField DataField="From" HeaderText="地区" />
            <asp:BoundField DataField="CreateDate" HeaderText="留言时间" />
        
            <asp:BoundField DataField="" HeaderText="回复时间" />
            <asp:BoundField DataField="Shown" HeaderText="显示" />
           
             <asp:TemplateField HeaderText="操  作">
                <ItemTemplate>
                    <a href="editMessage.html?action=edit&ID=<%#Eval("Id") %>">
                        <img src="../images/edit.png" width="16" height="16" title="编辑" alt="" /></a>
                        <a href="?action=delete&ID=<%#Eval("ID")%>" onclick="return confirm('确定要删除数据吗？');">
                        <img src="../images/delete.png" width="16" height="16" title="删除" alt="" /></a>
                </ItemTemplate>
            </asp:TemplateField>
       
        </Columns>
    </asp:GridView>
    <asp:Label ID="Label_page1" runat="server" Text="Label"></asp:Label>
  
    <div class="btns">
        <input type="submit" value=" 删除留言 " class="btn" onclick="if(_check()){if(confirm('确定要删除选中留言分类吗？此操作将不可撤销')){  this.form.action = '?action=deleteMany' }else{return false;}}" />&nbsp;
        <input type="submit" value="设置显示X " class="btn" onclick="if(_check()){this.form.action='?action=reject';}else{return false;}" />&nbsp;
        <input type="submit" value="设置隐藏X " class="btn" onclick="if(_check()){this.form.action='?&action=cancel';}else{return false;}" />
    </div>
    <script type="text/javascript">
        Menuon(0);
       
        function _check()
        {
            return true;
        }
        
</script>
    </form>
    <script type="text/javascript">        Menuon(2);</script>
    <br />
</body>
</html>
