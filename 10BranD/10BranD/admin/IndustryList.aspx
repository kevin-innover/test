<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IndustryList.aspx.cs" Inherits="BranD10.Pages.IndustryList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <script type="text/javascript" src="../js/jquery.js">    </script>
    <script type="text/javascript" src="../js/public.js">    </script>
    <script type="text/javascript" src="../js/entity.js">    </script>
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
                userCtrlID = "#users";
                LoadAllUserNames(0 )
            }
            catch (e) {

            }
        })

        function getSelectIDS() {
            this.form.action = '?action=deleteMany'

        }
        function search() {

            alert('ss');
            this.form.action = '?action=search'
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
<td id="Tab0" class="tab"><a href="editIndustry.html?action=add" >添加分类</a></td><td class="tab_nav">&nbsp;</td><td id="Tab1" class="tab"><a href="?file=category&mid=13" >管理分类</a></td><td class="tab_nav">&nbsp;</td><td id="Tab2" class="tab"><a href="?file=category&action=copy&mid=13" >分类复制</a></td><td class="tab_nav">&nbsp;</td><td id="Tab3" class="tab"><a href="?file=category&action=letters&mid=13" >批量索引</a></td><td class="tab_nav">&nbsp;</td><td id="Tab4" class="tab"><a href="?file=category&action=url&mid=13" >更新地址</a></td><td class="tab_nav">&nbsp;</td><td id="Tab5" class="tab"><a href="?file=category&action=count&mid=13" >更新统计</a></td><td class="tab_nav">&nbsp;</td><td id="Tab6" class="tab"><a href="?file=category&action=cache&mid=13" >更新缓存</a></td><td class="tab_nav">&nbsp;</td></tr>
</table>
</td>
<td width="110"><div><img src="../images/spacer.gif" width="40" height="24" title="刷新" onclick="window.location.reload();" style="cursor:pointer;" alt=""/><img src="../images/spacer.gif" width="20" height="24" title="后退" onclick="history.back(-1);" style="cursor:pointer;" alt=""/><img src="../images/spacer.gif" width="20" height="24" title="前进" onclick="history.go(1);" style="cursor:pointer;" alt=""/><img src="../images/spacer.gif" width="20" height="24" title="帮助" onclick="Go('http://www.destoon.com/client.php?action=help&product=b2b&mfa=destoon-category-');" style="cursor:help;" alt=""/></div></td>
</tr>
</table>
</div><div class="tt">注意事项</div>
<table cellpadding="2" cellspacing="1" class="tb">
<tr>
<td>&nbsp;&nbsp;&nbsp;1、如果进行了<span class="f_red">修改</span>或<span class="f_red">删除</span>分类操作，为了保证操作速度，系统不自动修复结构。请在<span class="f_red">管理完成</span>或<span class="f_red">操作失败</span>时，点更新缓存以修复分类结构至最新。</td>
</tr>
<tr>
<td>&nbsp;&nbsp;&nbsp;2、<span class="f_red">删除分类</span>会将分类下的信息移至回收站，分类本身可以修改名称和上级分类，没有特殊情况不建议直接删除分类。</td>
</tr>
<tr>
<td>&nbsp;&nbsp;&nbsp;3、修改上级ID可以快速修改分类的上级分类，改变分类结构。</td>
</tr>
</table>
 
<input type="hidden" name="mid" value="13"/>
<input type="hidden" name="file" value="category"/>
<div class="tt">分类搜索</div>
<table cellpadding="2" cellspacing="1" class="tb">
<tr>
<td>&nbsp;
<input type="text" size="30" name="kw" value="" title="关键词"/>&nbsp;
<select name="userid" id="users"  ><option value="0" selected="selected">选择专员</option><option value="7">田静</option><option value="6">张倩</option><option value="40899">于凤梅</option><option value="18406">郝艳</option><option value="27518">田颖</option><option value="31224">刘倩</option><option value="31367">唐立新</option><option value="37731">曹贺</option><option value="37755">张灵芝</option><option value="38756">姜程</option><option value="29480">王卫东</option><option value="39915">赵梓然</option><option value="40414">孔茹</option><option value="41452">王梅</option><option value="79051">李娜</option><option value="88998">申婧妍</option><option value="140351">白会科</option><option value="1">暂无</option></select>&nbsp;
<select name="status"  ><option value="-1" selected="selected">选择状态</option><option value="0">已结束</option><option value="2">进行中</option><option value="2">已揭晓</option><option value="3">未开始</option></select>&nbsp;
<select name="captcha"  ><option value="0" selected=selected>验证码</option><option value="1">自动</option><option value="2">英文</option><option value="3">中文</option><option value="4">问题</option><option value="5">中文1</option><option value="6">中文2</option><option value="7">中文3</option><option value="8">滑动</option></select>&nbsp;
<input type="submit"   id="search" onclick="this.form.action='?action=search'" value="搜 索" class="btn"/>&nbsp;
<input type="button" value="重 搜" class="btn" onclick="Go('?mid=13&file=category');"/>&nbsp;
</td>
</tr>
</table>
 
 
<div class="tt">分类管理</div>
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
            <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="../vote/showIndustry.aspx?ID={0}"
                DataTextField="ID" HeaderText="ID" />
            <asp:BoundField DataField="Name" HeaderText="分类名" />
            <asp:BoundField DataField="StatusValue" HeaderText="状  态" />
            <asp:BoundField DataField="UserName" HeaderText="行业专员" />
            <asp:BoundField DataField="" HeaderText="验证码类型X" />
            <asp:BoundField DataField="Ranking" HeaderText="资质认证排名X" />
            <asp:BoundField DataField="" HeaderText="显示图片X" />
            <asp:BoundField DataField="" HeaderText="短信提票X" />
            <asp:BoundField DataField="InfoCount" HeaderText="信息数量X" />
            <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="?action=Category&ID={0}&PID={0}"
                DataTextField="ChildCount" HeaderText="子类">
                <HeaderStyle CssClass="subCategory" />
                <ItemStyle CssClass="subCategory" />
            </asp:HyperLinkField>
            <asp:TemplateField HeaderText="操  作">
                <ItemTemplate>
                    <a href="editIndustry.html?action=add&ID=<%#Eval("ID") %>&PID=<%#Eval("ParentID") %>" class="subCategory">
                        <img src="../images/add.png" width="16" height="16" title="添加子分类" alt="" /></a>
                    <a href="editIndustry.html?action=edit&ID=<%#Eval("ID") %>">
                        <img src="../images/edit.png" width="16" height="16" title="编辑" alt="" /></a>
                    <a href="?action=delete&ID=<%#Eval("ID")%>&PID=<%#Eval("ParentID") %>" onclick="return confirm('确定要删除数据吗？');">
                        <img src="../images/delete.png" width="16" height="16" title="删除" alt="" /></a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <PagerTemplate>
            <asp:Label ID="Label_page" runat="server" Text="Label"></asp:Label>
        </PagerTemplate>
    </asp:GridView>
   <div class="btns">
<span class="f_r">
分类总数:<strong class="f_red">951</strong>&nbsp;&nbsp;
当前目录:<strong class="f_blue">16</strong>&nbsp;&nbsp;
</span>
<asp:Label runat="server" ID="showCount"></asp:Label>
<input type="submit" name="submit" value="更新分类" class="btn" onclick="this.form.action='?PID=0'"/>&nbsp;
<input type="submit" value="删除选中" class="btn" onclick="if(confirm('确定要删除选中分类吗？此操作将不可撤销')){  this.form.action = '?action=deleteMany' }else{return false;}"/>
</div>
    </form>
</body>
</html>
