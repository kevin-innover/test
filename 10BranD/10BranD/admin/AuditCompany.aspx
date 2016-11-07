<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AuditCompany.aspx.cs" Inherits="BranD10.Pages.AuditCompany" %>

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
                                <a href="?page=company">公司认证</a>
                            </td>
                            <td id="Tab1" class="tab">
                                <a href="?page=name">实名认证</a>
                            </td>
                            <td id="Td1" class="tab">
                                <a href="?page=mobile">手机认证</a>
                            </td>
                            <td id="Td2" class="tab">
                                <a href="?page=email">邮件认证</a>
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
        记录搜索</div>
    <input type="hidden" name="moduleid" value="2" />
    <input type="hidden" name="action" value="check" />
    <table cellpadding="2" cellspacing="1" class="tb">
        <tr>
            <td>
                <select name="fields">
                    <option value="0" selected="selected">按条件</option>
                    <option value="1">认证项</option>
                    <option value="2">会员名</option>
                    <option value="3">操作人</option>
                </select>&nbsp;
                <input type="text" size="20" name="kw" value="" />
                &nbsp;
                <script type="text/javascript" src="../js/calendar.js"></script>
                <input type="text" name="fromtime" id="fromtime" value="" size="10" onfocus="ca_show('fromtime', this, '-');"
                    readonly ondblclick="this.value='';" />
                <img src="../images/calendar.gif" align="absmiddle"
                    onclick="ca_show('fromtime', this, '-');" style="cursor: pointer;" />
                至
                <input type="text" name="totime" id="totime" value="" size="10" onfocus="ca_show('totime', this, '-');"
                    readonly ondblclick="this.value='';" />
                <img src="../images/calendar.gif" align="absmiddle"
                    onclick="ca_show('totime', this, '-');" style="cursor: pointer;" />&nbsp;
                <select name="action">
                    <option value="">认证类型</option>
                    <option value="company" selected="selected">公司认证</option>
                    <option value="truename">实名认证</option>
                    <option value="mobile">手机认证</option>
                    <option value="email">邮件认证</option>
                </select>&nbsp;
                <select name="status">
                    <option value="0">状态</option>
                    <option value="3">已认证</option>
                    <option value="2">未认证</option>
                </select>&nbsp;
                <input type="text" name="psize" value="20" size="2" class="t_c" title="条/页" />&nbsp;
                <input type="submit" value="搜 索" class="btn" />&nbsp;
                <input type="button" value="重 置" class="btn" onclick="Go('?moduleid=2&file=validate&action=company');" />
            </td>
        </tr>
    </table>
    <input type="hidden" name="mid" value="13" />
    <input type="hidden" name="file" value="category" />
    <div class="tt">
        认证记录</div>
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
           
            <asp:BoundField DataField="Type" HeaderText="类型" />
            <asp:BoundField DataField="Name" HeaderText="公司名称" />
        
            <asp:ImageField DataImageUrlField="AuditImage1" HeaderText="证件1"></asp:ImageField>
            <asp:ImageField DataImageUrlField="AuditImage2" HeaderText="证件2"></asp:ImageField>
            <asp:ImageField DataImageUrlField="AuditImage3" HeaderText="证件3"></asp:ImageField>
            <asp:BoundField DataField="MemberMobile" HeaderText="会员" />
            <asp:BoundField DataField="memberIP" HeaderText="IP" />
            <asp:BoundField DataField="CreateDate" HeaderText="提交时间" />
            <asp:BoundField DataField="AuditUser" HeaderText="操作人" />
            <asp:BoundField DataField="AuditStatus" HeaderText="状态" />

       
        </Columns>
    </asp:GridView>
    <asp:Label ID="Label_page1" runat="server" Text="Label"></asp:Label>

    <table>
        <tr>
            <td>
                &nbsp;<textarea style="width: 300px; height: 40px;" name="reason" id="reason" onfocus="if(this.value=='')this.value='操作原因';" />操作原因</textarea>
            </td>
            <td>
                <input type="checkbox" name="msg" id="msg" value="1" checked />
                消息通知
                <input type="checkbox" name="sms" id="sms" value="1" />
                短信通知
            </td>
        </tr>
    </table>
    <div class="btns">
        <input type="submit" value=" 通过认证 " class="btn" onclick="if(_check()){this.form.action='?action=pass';}else{return false;}" />&nbsp;
        <input type="submit" value=" 拒绝认证 " class="btn" onclick="if(_reject()){this.form.action='?action=reject';}else{return false;}" />&nbsp;
        <input type="submit" value=" 取消认证 " class="btn" onclick="if(_cancel()){this.form.action='?&action=cancel';}else{return false;}" />
    </div>
    <script type="text/javascript">
        Menuon(0);
        function is_reason() {
            return Dd('reason').value.length > 2 && Dd('reason').value != '操作原因';
        }
        function _check() {
            return true;
        }
        function _reject() {
            if ((Dd('msg').checked || Dd('sms').checked) && !is_reason()) {
                alert('请填写操作原因或者取消通知');
                return false;
            }
            if (is_reason() && (!Dd('msg').checked && !Dd('sms').checked)) {
                alert('至少需要选择一种通知方式');
                return false;
            }
            return true;
        }
        function _cancel() {
            if ((Dd('msg').checked || Dd('sms').checked) && !is_reason()) {
                alert('请填写操作原因或者取消通知');
                return false;
            }
            if (is_reason() && (!Dd('msg').checked && !Dd('sms').checked)) {
                alert('至少需要选择一种通知方式');
                return false;
            }
            return confirm('此操作不可撤销，确定要继续吗？');
        }
</script>
    </form>
    <script type="text/javascript">        Menuon(2);</script>
    <br />
</body>
</html>
