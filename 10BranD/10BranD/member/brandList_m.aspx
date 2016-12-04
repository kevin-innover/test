<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="brandList_m.aspx.cs" Inherits="BranD10.Pages.brandList_m" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="skin/style.css" type="text/css" />
    <script src="../js/jquery.js">    </script>
    <script type="text/javascript" src="../js/public.js">    </script>
    <script type="text/javascript" src="../js/entity.js">    </script>
    <script type="text/javascript" src="../js/brandlist_m.js">    </script>
    <script type="text/javascript" src="../js/prompt/ymPrompt.js">    </script>
    <link rel="stylesheet" id='skin' type="text/css" href="../js/prompt/skin/qq/ymPrompt.css" />
    <script type="text/javascript">
        function checkKW() {
            return true;
            //暂时不检查
            //if (!$("#bigIndustry").val()) {
                
            //}
        }
    </script>
</head>
<body>
    <form action="?">
        <input name="catid" id="catid_1" type="hidden" value="0" />
        <input type="hidden" name="moduleid" value="13" />
        <input type="hidden" name="action" value="" />
    </form>
    <form id="form1" runat="server">
        <div class="menu">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td class="tab" id="add">
                        <a href="editBrand_m.html?action=add"><span>添加品牌</span></a>
                    </td>
                    <td class="tab_nav">&nbsp;
                    </td>
                    <td class="tab" id="s3">
                        <a href="?action=pass"><span>已发布<span class="px10">(28244)</span></span></a>
                    </td>
                    <td class="tab_nav">&nbsp;
                    </td>
                    <td class="tab" id="s2">
                        <a href="?action=check"><span>审核中<span class="px10">(806)</span></span></a>
                    </td>
                    <td class="tab_nav">&nbsp;
                    </td>
                    <td class="tab" id="s5">
                        <a href="my.php?mid=13&status=5"><span>待支付X<span class="px10">(0)</span></span></a>
                    </td>
                    <td class="tab_nav">&nbsp;
                    </td>
                    <td class="tab" id="s1">
                        <a href="?action=reject"><span>未通过<span class="px10">(4)</span></span></a>
                    </td>
                    <td class="tab_nav">&nbsp;
                    </td>
                    <td class="tab" id="s4">
                        <a href="my.php?mid=13&status=4"><span>已过期X<span class="px10">(0)</span></span></a>
                    </td>
                    <td class="tab_nav">&nbsp;
                    </td>
                    <td class="tab" id="s7">
                        <a href="my.php?mid=13&status=7"><span>申请退款X</span></a>
                    </td>
                </tr>
            </table>
        </div>
        <div class="warn" class="f_red" style="line-height: 25px; width: auto;">
            <span class="f_b">关于恶意软件刷票的情况说明：</span>为杜绝此类不正当行为，品牌排行网将 <span class="f_red"><b>严查软件刷票行为</b></span>，并对购买或利用软件刷票企业<span
                class="f_red"><b>予以减票处罚，情节严重者将取消评选资格</b></span>。品牌排行网不会以涨票，包名次，刷票等违规手段 跟企业联系，也请企业主对恶意刷票人员做到<span
                    class="f_red"><b>不听！不信！不汇款！</b></span>避免造成不必要的损失，保持一个<span class="f_red"><b>公平，公正</b></span>的投票环境。
        <div style="text-align: right">
            ————品牌排行网 www.10brandchina.com &nbsp; &nbsp;<a href="/guestbook/"><span class="f_blue">我要举报
                &nbsp;</span></a>
            </div>
        </div>
        <div class="tt">
            <form action="?s=0" onsubmit="return checkKW()">
                <input type="hidden" name="mid" value="13">
                <input type="hidden" name="status" value="3">
                <select
                    id="bigIndustry" name="IndustryID" onchange="load_category(this.value, 1,0);">
                    <option value="0">选择大类</option>
                </select>
                <select id="subIndustry" name="catid" style="height: 80px; width: 160px; display: none;">
                    <option value="0">选择小类</option>
                </select>

                <input type="text" size="50" name="kw" value="" title="关键词">&nbsp;
        <input type="submit" value=" 搜 索 " class="btn">
                <input type="button" value=" 重 置 " class="btn" onclick="Go('?');">
                <a name="fff" href="javascript:void(0);" onclick="picBig();">
                    <img src="./files/toupxtsicon.png" height="35" width="50"></a>
                <div id="divCenter" align="center" style="position: absolute; z-index: 9; display: none; background-color: #eee; width: 430px; height: 740px; left: 70%; top: 10%; border: 0px solid #222;">
                    <a href="javascript:void(0);" onclick="picClose();">
                        <img src="./files/toupxts.png"></a>
                </div>
            </form>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True"
            CssClass="tb">
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
                <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="../vote/showIndustry.aspx?ID={0}"
                    DataTextField="IndustryName" HeaderText="分 类" />
                <asp:ImageField DataImageUrlField="LogoPath" ControlStyle-Width="80" HeaderText="图片">
                </asp:ImageField>
                <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="showbrand.aspx?brandID={0}"
                    DataTextField="Name" HeaderText="标  题" />
                <asp:BoundField DataField="RejectReason" HeaderText="未通过原因" />
                <asp:BoundField DataField="updateTime" HeaderText="更新时间" />
                <asp:BoundField HeaderText="投票数" DataField="TotalTickets" />
                <asp:BoundField HeaderText="投票趋势 X" DataField="" />
                <asp:TemplateField HeaderText="操  作">
                    <ItemTemplate>
                        <a name="editUrl" href='editBrand_m.html?action=edit&brandID=<%#Eval("Id") %>' onclick="return checkStatus()">
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
