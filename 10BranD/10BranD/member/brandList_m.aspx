<%@ Page Language="C#" EnableEventValidation="true"  AutoEventWireup="true" CodeBehind="brandList_m.aspx.cs" Inherits="BranD10.Pages.brandList_m" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="Content-Type" content="text/html;charset=gb2312" />

    <link rel="stylesheet" href="skin/style.css" type="text/css" />
    <script type="text/javascript" src="../js/jquery.js">    </script>
    <script type="text/javascript" src="../js/public.js">    </script>
    <script type="text/javascript" src="../js/entity.js">    </script>
    <script type="text/javascript" src="../js/brandlist_m.js">    </script>
    <script type="text/javascript" src="../js/prompt/ymPrompt.js">    </script>
    <link rel="stylesheet" id='skin' type="text/css" href="../js/prompt/skin/qq/ymPrompt.css" />
    <script type="text/javascript">
        function checkkw()
        {
            return true;
            //��ʱ�����
            //if (!$("#bigIndustry").val()) {

            //}
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="menu">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td class="tab" id="add">
                        <a href="editBrand_m.html?action=add"><span>���Ʒ��</span></a>
                    </td>
                    <td class="tab_nav">&nbsp;
                    </td>
                    <td class="tab" id="s3">
                        <a href="?action=pass"><span>�ѷ���<span class="px10">(28244)</span></span></a>
                    </td>
                    <td class="tab_nav">&nbsp;
                    </td>
                    <td class="tab" id="s2" >
                        <a href="?action=check"><span>�����<span class="px10">(806)</span></span></a>
                    </td>
                    <td class="tab_nav">&nbsp;
                    </td>
                    <td class="tab" id="s5" style="display:none">
                        <a href="my.php?mid=13&status=5"><span>��֧��X<span class="px10">(0)</span></span></a>
                    </td>
                    <td class="tab_nav">&nbsp;
                    </td>
                    <td class="tab" id="s1">
                        <a href="?action=reject"><span>δͨ��<span class="px10">(4)</span></span></a>
                    </td>
                    <td class="tab_nav">&nbsp;
                    </td>
                    <td class="tab" id="s4" style="display:none">
                        <a href="my.php?mid=13&status=4"><span>�ѹ���X<span class="px10">(0)</span></span></a>
                    </td>
                    <td class="tab_nav">&nbsp;
                    </td>
                    <td class="tab" id="s7" style="display:none">
                        <a href="my.php?mid=13&status=7"><span>�����˿�X</span></a>
                    </td>
                </tr>
            </table>
        </div>
        <div class="warn" class="f_red" style="line-height: 25px; width: auto;">
            <span class="f_b">���ڶ������ˢƱ�����˵����</span>Ϊ�ž����಻������Ϊ��Ʒ���������� <span class="f_red"><b>�ϲ����ˢƱ��Ϊ</b></span>�����Թ�����������ˢƱ��ҵ<span
                class="f_red"><b>���Լ�Ʊ��������������߽�ȡ����ѡ�ʸ�</b></span>��Ʒ����������������Ʊ�������Σ�ˢƱ��Υ���ֶ� ����ҵ��ϵ��Ҳ����ҵ���Զ���ˢƱ��Ա����<span
                    class="f_red"><b>���������ţ�����</b></span>������ɲ���Ҫ����ʧ������һ��<span class="f_red"><b>��ƽ������</b></span>��ͶƱ������
        <div style="text-align: right">
            ��������Ʒ�������� www.10brandchina.com &nbsp; &nbsp;<a href="/guestbook/"><span class="f_blue">��Ҫ�ٱ�
                &nbsp;</span></a>
        </div>
        </div>
        <div class="tt">  
            <form action="?" onsubmit="return checkkw()">
                <select
                    id="bigIndustry" name="IndustryID" onchange="loadcategory(this.value);">
                    <option value="0">ѡ����ҵ</option>
                </select>
                <select id="subIndustry" name="catid"  >
                    <option value="0">ѡ�����</option>
                </select>

                <input type="text" size="50" name="kw" value="" title="�ؼ���">&nbsp;
        <input type="submit" value=" �� �� " class="btn">
                <input type="button" value=" �� �� " class="btn" onclick="Go();">
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
                    DataTextField="IndustryName" HeaderText="�� ��" />
                <asp:ImageField DataImageUrlField="LogoPath" ControlStyle-Width="80" HeaderText="ͼƬ">
                </asp:ImageField>
                <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="showbrand.aspx?brandID={0}"
                    DataTextField="Name" HeaderText="��  ��" />
                <asp:BoundField DataField="RejectReason" HeaderText="δͨ��ԭ��" />
                <asp:BoundField DataField="updateTime" HeaderText="����ʱ��" />
                <asp:BoundField HeaderText="ͶƱ��" DataField="TotalTickets" />
                <asp:BoundField HeaderText="ͶƱ���� X" DataField="" />
                <asp:TemplateField HeaderText="��  ��">
                    <ItemTemplate>
                        <a name="editUrl" href='editBrand_m.html?action=edit&brandID=<%#Eval("Id") %>&status=<%#Eval("Status") %>' onclick="return checkStatus()">
                            <img src="../images/edit.png" width="16" height="16" title="�༭" alt="" /></a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:Label ID="Label_page1" runat="server" Text="Label"></asp:Label>
        <asp:HiddenField ID="HiddenField_CurrentPage" runat="server" Value="-1" />
         <asp:HiddenField ID="HiddenField_Paras" runat="server" value=""/>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="ˢ������" />
    </form>
</body>
</html>
