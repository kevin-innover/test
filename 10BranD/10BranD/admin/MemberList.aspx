<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemberList.aspx.cs" Inherits="BranD10.Pages.MemberList" %>

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
                                <a href="editMember.html?action=add">添加会员</a>
                            </td>
                            <td class="tab_nav">
                                &nbsp;
                            </td>
                            <td id="Tab1" class="tab">
                                <a href="MemberList.aspx">会员列表</a>
                            </td>
                            <td id="Td1" class="tab">
                                <a href="AuditMember.aspx">审核会员</a>
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
                        <img src="../images/spacer.gif" width="40" height="24" title="刷  新" onclick="window.location.reload();"
                            style="cursor: pointer;" alt="" /><img src="../images/spacer.gif" width="20" height="24"
                                title="后退" onclick="history.back(-1);" style="cursor: pointer;" alt="" /><img src="../images/spacer.gif"
                                    width="20" height="24" title="前进" onclick="history.go(1);" style="cursor: pointer;"
                                    alt="" /><img src="../images/spacer.gif" width="20" height="24" title="帮助?" onclick="Go('http://www.destoon.com/client.php?action=help&product=b2b&mfa=destoon-category-');"
                                        style="cursor: help;" alt="" /></div>
                </td>
            </tr>
        </table>
    </div>
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
    <asp:Label ID="Label_page1" runat="server" Text="Label"></asp:Label>
   
    <div class="btns">
        <input type="submit" value=" 删除会员 " class="btn" onclick="if(confirm('确定要删除选中会员吗？系统将删除选中用户所有信息，此操作将不可撤销')){this.form.action='?action=deleteMany' }else{return false;}" />&nbsp;
        <input type="submit" value=" 禁止访问X " class="btn" onclick="if(confirm('确定要禁止选中会员访问吗？')){this.form.action='?moduleid=2&action=move&groupids=2'}else{return false;}" />&nbsp;
        <input type="submit" value=" 登录验证X " class="btn" onclick="if(confirm('确定要选中会员登录验证码？')){this.form.action='?moduleid=2&action=delvmobile'}else{return false;}" />&nbsp;
        <input type="submit" value=" 设置VIPX " class="btn" onclick="this.form.action='?moduleid=4&file=vip&action=add';" />&nbsp;
        <input type="submit" value=" 资金增减X " class="btn" onclick="this.form.action='?moduleid=2&file=record&action=add';" />&nbsp;
        <input type="submit" value=" 积分奖惩X " class="btn" onclick="this.form.action='?moduleid=2&file=credit&action=add';" />&nbsp;
        <input type="submit" value=" 短信增减X " class="btn" onclick="this.form.action='?moduleid=2&file=sms&action=add';" />&nbsp;
        <input type="submit" value=" 发送短信X " class="btn" onclick="this.form.action='?moduleid=2&file=sendsms';" />&nbsp;
        <input type="submit" value=" 发送邮件X " class="btn" onclick="this.form.action='?moduleid=2&file=sendmail';" />&nbsp;
        <input type="submit" value=" 发送消息X " class="btn" onclick="this.form.action='?moduleid=2&file=message&action=send';" />&nbsp;
        <input type="submit" value=" 贸易提醒X " class="btn" onclick="this.form.action='?moduleid=2&file=alert&action=add';" />&nbsp;
        <input type="submit" value=" 移动至X " class="btn" onclick="if(Dd('mgroupid').value==0){alert('请选择会员组');Dd('mgroupid').focus();return false;}this.form.action='?moduleid=2&action=move';" />
        <select name="groupid" id="mgroupid">
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
    
    
    <div class="tt">
        修改会员名</div>
     
    <input type="hidden" name="moduleid" value="2" />
    <input type="hidden" name="file" value="index" />
    <input type="hidden" name="action" value="rename" />
    <a name="#editusername"></a>
    <table cellpadding="2" cellspacing="1" class="tb">
        <tr>
            <td>
                &nbsp;当前会员名：
                <input type="text" name="cusername" size="20" value="" />
                &nbsp; 新会员名：
                <input type="text" name="nusername" size="20" />
                &nbsp;
                <input type="submit" name="submit" value=" 确 定 " class="btn" />&nbsp;&nbsp;<span
                    class="f_gray">如无特殊情况，建议不要频繁修改会员名</span>
            </td>
        </tr>
    </table>
    
    <div class="tt">
        手机查询</div>
    <table cellpadding="2" cellspacing="1" class="tb">
        <tr>
            <td>
                &nbsp;手机号：
                <input type="text" name="mob" size="30" id="mob" />
                &nbsp;
                <input type="button" value=" 查 询 " class="btn" onclick="if(Dd('mob').value){_mobile(Dd('mob').value);}" />&nbsp;&nbsp;<span
                    class="f_gray">可查询手机所在地区</span>
            </td>
        </tr>
    </table>
    <div class="tt">
        IP查询</div>
    <table cellpadding="2" cellspacing="1" class="tb">
        <tr>
            <td>
                &nbsp;IP地址：
                <input type="text" name="ip" size="30" id="ip" />
                &nbsp;
                <input type="button" value=" 查 询 " class="btn" onclick="if(Dd('ip').value){_ip(Dd('ip').value);}" />&nbsp;&nbsp;<span
                    class="f_gray">可查询IP所在地区</span>
            </td>
        </tr>
    </table>
    <div class="tt">
        IP解锁</div>
    
    <input type="hidden" name="moduleid" value="2" />
    <input type="hidden" name="file" value="index" />
    <input type="hidden" name="action" value="unlock" />
    <table cellpadding="2" cellspacing="1" class="tb">
        <tr>
            <td>
                &nbsp;IP地址：
                <input type="text" name="ip" size="30" />
                &nbsp;
                <input type="submit" name="submit" value=" 解 锁 " class="btn" />&nbsp;&nbsp;<span
                    class="f_gray">可解除因登录失败次数过多而被锁定登录的IP</span>
            </td>
        </tr>
    </table>
     </form>
    <br />
    <br />
    <br />
    <script type="text/javascript">        Menuon(1);</script>
</body>
</html>
