<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommentList.aspx.cs" Inherits="BranD10.Pages.CommentList" %>

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
                                <a href="?page=company">评论列表X</a>
                            </td>
                            <td id="Tab1" class="tab">
                                <a href="?page=name">评论审核X</a>
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
   
 <div class="tt">评论搜索</div>
<input type="hidden" name="moduleid" value="3"/>
<input type="hidden" name="file" value="comment"/>
<input type="hidden" name="action" value=""/>
<table cellpadding="2" cellspacing="1" class="tb">
<tr>
<td>
&nbsp;<select name="mid" ><option value="0">模块</option><option value="13">品牌</option><option value="16">产品</option><option value="4">公司</option><option value="7">行情</option><option value="21">资讯</option><option value="22">招商</option><option value="11">专题</option></select>&nbsp;

<select name="fields"  ><option value="0">原文标题</option><option value="1" selected=selected>内容</option><option value="2">会员名</option><option value="3">IP</option><option value="4">原文ID</option><option value="5">评论ID</option></select>&nbsp;
<input type="text" size="40" name="kw" value="" title="关键词"/>&nbsp;
<select name="star"  ><option value="0" selected=selected>评分</option><option value="1">差评</option><option value="2">中评</option><option value="3">好评</option></select>&nbsp;
<select name="order"  ><option value="0">结果排序方式</option><option value="1" selected=selected>添加时间降序</option><option value="2">添加时间升序</option><option value="3">回复时间降序</option><option value="4">回复时间升序</option><option value="5">引用次数降序</option><option value="6">引用次数升序</option><option value="7">支持次数降序</option><option value="8">支持次数升序</option><option value="9">反对次数降序</option><option value="10">反对次数升序</option><option value="11">评分高低降序</option><option value="12">评分高低升序</option></select>&nbsp;
<input type="text" name="psize" value="20" size="2" class="t_c" title="条/页"/>&nbsp;游客<input name="guest" type="checkbox" value="1"   />

<br />
<select name="catid">
<option value="0">所属行业</option>
	<option value="39355" >壁纸</option>
	<option value="39356" >沙发</option>
  
</select>&nbsp;

发布时间：<script type="text/javascript" src="../js/calendar.js"></script><input type="text" name="fromdate" id="fromdate" value="" size="10" onfocus="ca_show('fromdate', this, '');" readonly ondblclick="this.value='';"/> <img src="../images/calendar.gif" align="absmiddle" onclick="ca_show('fromdate', this, '');" style="cursor:pointer;"/> 至 <input type="text" name="todate" id="todate" value="" size="10" onfocus="ca_show('todate', this, '');" readonly ondblclick="this.value='';"/> <img src="../images/calendar.gif" align="absmiddle" onclick="ca_show('todate', this, '');" style="cursor:pointer;"/>&nbsp;
包含图片<input name="haspic" type="checkbox" value="1"   />&nbsp;
全部评论<input name="fastfind" type="checkbox" value="1"   />
<input type="submit" value="搜 索X" class="btn"/>&nbsp;
<input type="button" value="重 置" class="btn" onclick="Go('?moduleid=3&file=comment&action=');"/>
</td>
</tr>
</table>
    <div class="tt">
        评论管理</div>
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
           
            <asp:BoundField DataField="Text" HeaderText="评论内容" HtmlEncode="false" />
            <asp:BoundField DataField="BrandName" HeaderText="品牌" />
           <%--    <asp:TemplateField HeaderText="评论内容">
                <ItemTemplate>
                    <a href="editMessage.html?action=edit&ID=<%#Eval("Id") %>">
                        <img src="../images/edit.png" width="16" height="16" title="编辑" alt="" /></a>
                        <a href="?action=delete&ID=<%#Eval("ID")%>" onclick="return confirm('确定要删除数据吗？');">
                        <img src="../images/delete.png" width="16" height="16" title="删除" alt="" /></a>
                </ItemTemplate>
            </asp:TemplateField>--%>
           
             <asp:TemplateField HeaderText="操  作">
                <ItemTemplate>
                    <a href="editComment.html?action=edit&ID=<%#Eval("Id") %>">
                        <img src="../images/edit.png" width="16" height="16" title="编辑" alt="" /></a>
                        <a href="?action=delete&ID=<%#Eval("ID")%>" onclick="return confirm('确定要删除数据吗？');">
                        <img src="../images/delete.png" width="16" height="16" title="删除" alt="" /></a>
                </ItemTemplate>
            </asp:TemplateField>
       
        </Columns>
    </asp:GridView>
    <asp:Label ID="Label_page1" runat="server" Text="Label"></asp:Label>
  
    <div class="btns">
        <input type="submit" value=" 删除评论 " class="btn" onclick="if(_check()){if(confirm('确定要删除选中评论吗？此操作将不可撤销')){  this.form.action = '?action=deleteMany' }else{return false;}}" />&nbsp;
        <input type="submit" value="取消审核X " class="btn" onclick="if(_check()){this.form.action='?action=reject';}else{return false;}" />&nbsp;
        <input type="submit" value="改日期到X " class="btn" onclick="if(_check()){this.form.action='?&action=cancel';}else{return false;}" />
        <input type="text" name="todate" size="12" value="2016-09-23" />
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
