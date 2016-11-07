<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FreeIndustry.aspx.cs" Inherits="BranD10.Pages.FreeIndustry" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" id='skin' type="text/css" href="../skin/style.css" /> 
   <%-- <script type="text/javascript" src="../js/jquery.js">    </script>
    <script type="text/javascript" src="../js/public.js">    </script>
    <script type="text/javascript" src="../js/entity.js">    </script>
    <script type="text/javascript" src="../js/prompt/ymPrompt.js">    </script>
    <link rel="stylesheet" id='Link1' type="text/css" href="../js/prompt/skin/qq/ymPrompt.css" />
   
    <script  type="text/javascript">
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
    </script>--%>
</head>
<body>
    <form id="form1" runat="server">
 
<div class="tt">空闲行业</div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  ShowHeaderWhenEmpty="True"  CssClass="tb" 
        DataKeyNames="Id">
        <Columns>
             
            <asp:TemplateField HeaderText="序号">
                <HeaderStyle BackColor="#6694B8" Font-Size="8pt" />
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
                <ItemStyle Width="3%" />
            </asp:TemplateField>
            <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="../vote/showIndustry.aspx?ID={0}"
                DataTextField="ID" HeaderText="ID" />
            <asp:BoundField DataField="Name" HeaderText="名称" />
            <asp:BoundField DataField="BrandCount" HeaderText="品牌数量" />
            <asp:BoundField DataField="ParentName" HeaderText="所属类别" />
            
        </Columns>
        <PagerTemplate>
            <asp:Label ID="Label_page" runat="server" Text="Label"></asp:Label>
        </PagerTemplate>
    </asp:GridView> 
    </form>
</body>
</html>
