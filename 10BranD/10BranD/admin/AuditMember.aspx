<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AuditMember.aspx.cs" Inherits="BranD10.Pages.AuditMember" %>

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
            //  this.form.action = '?action=deleteMany'

        }
       
    </script>
</head>
<body>
    <form id="form1"  runat="server">
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
                                <a href="editMember.html?action=add">添加会员</a>
                            </td>
                            <td class="tab_nav">
                                &nbsp;
                            </td>
                            <td id="Tab1" class="tab">
                                <a href="MemberList.aspx?page=list">会员列表</a>
                            </td>
                            <td id="Td1" class="tab">
                                <a href="MemberList.aspx?page=audit">审核会员</a>
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
    
    <div class="tt">
        会员搜索</div>
    <input type="hidden" name="moduleid" value="2" />
    <input type="hidden" name="action" value="check" />
    <table cellpadding="2" cellspacing="1" class="tb">
        <tr>
            <td>
                &nbsp;
                <select name="fields">
                    <option value="0" selected="selected">按条件</option>
                    <option value="1">公司名</option>
                    <option value="2">会员名</option>
                    <option value="3">密码</option>
                    <option value="4">姓名</option>
                    <option value="5">手机号码</option>
                    <option value="6">部门</option>
                    <option value="7">职位</option>
                    <option value="8">Email</option>
                    <option value="9">QQ</option>
                    <option value="10">MSN</option>
                    <option value="11">阿里旺旺</option>
                    <option value="12">Skype</option>
                    <option value="13">注册IP</option>
                    <option value="14">登录IP</option>
                    <option value="15">客服专员</option>
                    <option value="16">开户银行</option>
                    <option value="17">银行帐号</option>
                    <option value="18">支付宝</option>
                    <option value="19">推荐人</option>
                </select>&nbsp;
                <input type="text" size="30" name="kw" value="" title="关键词" />&nbsp;
                <select name="gender">
                    <option value="0" selected="selected">性别</option>
                    <option value="1">先生</option>
                    <option value="2">女士</option>
                </select>&nbsp;
                <select name="order">
                    <option value="0" selected="selected">结果排序方式</option>
                    <option value="1">注册时间降序</option>
                    <option value="2">注册时间升序</option>
                    <option value="3">登录时间降序</option>
                    <option value="4">登录时间升序</option>
                    <option value="5">登录次数降序</option>
                    <option value="6">登录次数升序</option>
                    <option value="7">账户资金降序</option>
                    <option value="8">账户资金升序</option>
                    <option value="9">会员积分降序</option>
                    <option value="10">会员积分升序</option>
                    <option value="11">短信余额降序</option>
                    <option value="12">短信余额升序</option>
                    <option value="13">密码排序</option>
                </select>&nbsp;
                <input type="text" name="psize" value="20" size="2" class="t_c" title="条/页" />
                <input type="submit" value="搜 索" class="btn" />&nbsp;
                <input type="button" value="重 置" class="btn" onclick="Go('?moduleid=2&action=check');" />
            </td>
        </tr>
    </table>
    
    <input type="hidden" name="mid" value="13" />
    <input type="hidden" name="file" value="category" />
    <div class="tt">
        会员管理</div>
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
            <asp:TemplateField HeaderText="序号">
                <HeaderStyle BackColor="#6694B8" Font-Size="8pt" />
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
                <ItemStyle Width="3%" />
            </asp:TemplateField>
            <asp:BoundField DataField="Id" HeaderText="ID" />
            <asp:BoundField DataField="CName" HeaderText="姓名" />
            <asp:BoundField DataField="CompanyName" HeaderText="公司" />
            <asp:BoundField DataField="Money" DataFormatString="{0:F}" HeaderText="资金" />
            <asp:BoundField DataField="MemberScore" DataFormatString="{0:F0}" HeaderText="积分" />
            <asp:BoundField DataField="SexValue" HeaderText="性别" />
            <asp:BoundField DataField="GroupValue" HeaderText="会员组" />
            <asp:BoundField DataField="CreateTime" HeaderText="注册时间" />
            <asp:BoundField DataField="UpdateTime" HeaderText="编辑时间" />
            <asp:TemplateField HeaderText="操  作">
                <ItemTemplate>
                    <a href="editMember.html?action=edit&ID=<%#Eval("ID") %>">
                        <img src="../images/edit.png" width="16" height="16" title="编辑" alt="" /></a>
                    <a href="?action=delete&ID=<%#Eval("ID")%>" onclick="return confirm('确定要删除数据吗？');">
                        <img src="../images/delete.png" width="16" height="16" title="删除" alt="" /></a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <div class="btns">
<span class="f_r">
分类总数:<strong class="f_red">951</strong>&nbsp;&nbsp;
当前目录:<strong class="f_blue">16</strong>&nbsp;&nbsp;
</span>
<asp:Label runat="server" ID="showCount"></asp:Label>
</div>
    <div class="btns">
        <input type="submit" value="通过审核" class="btn" onclick="this.form.action='?action=auditMany'" />
        <input type="submit" value=" 删除会员 " class="btn" onclick="if(confirm('确定要删除选中会员吗？此操作将不可撤销')){this.form.action='?action=deleteMany' }else{return false;}" />
        <input type="submit" value=" 禁止访问 X" class="btn" onclick="if(confirm('确定要禁止选中会员访问吗？')){this.form.action='?moduleid=2&action=move&groupids=2'}else{return false;}" />;
        <input type="submit" value=" 发送短信 X" class="btn" onclick="this.form.action='?moduleid=2&file=sendsms';" />&nbsp;
        <input type="submit" value=" 发送邮件X " class="btn" onclick="this.form.action='?moduleid=2&file=sendmail';" />&nbsp;
        <input type="submit" value=" 发送消息 X" class="btn" onclick="this.form.action='?moduleid=2&file=message&action=send';" />&nbsp;
        <input type="submit" value=" 移动至 X" class="btn" onclick="if(Dd('mgroupid').value==0){alert('请选择会员组');Dd('mgroupid').focus();return false;}this.form.action='?moduleid=2&action=move';" />
        <select name="groupid" id="Select1">
            <option value="0">会员组</option>
            <option value="1">管理员</option>
            <option value="2">禁止访问</option>
            <option value="3">游客</option>
            <option value="4">待审核会员</option>
            <option value="5">个人会员</option>
            <option value="6">企业会员</option>
            <option value="7">经销商</option>
            <option value="8">专卖店</option>
            <option value="9">品牌商</option>
        </select>
    </div>
    </form>
    <script type="text/javascript">        Menuon(2);</script>
    <br />
</body>
</html>
