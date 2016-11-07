<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyIndustryList.aspx.cs" Inherits="BranD10.Pages.MyIndustryList" %>

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
    <script type="text/javascript">
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

            this.form.action = '?action=search'
        }
        function submitData() {
           
         //   this.form.action = '?action=search'
         //            alert('submitData')
      //   this.form..submit()
            //    document.  alert('ss');
            $("#search").click()
          
         }
    </script>
</head>
<body>
    <form id="form1" runat="server">
 <div id="msgbox" onmouseover="closemsg();" style="display:none;"></div>
 
<input type="hidden" name="mid" value="13"/>
<input type="hidden" name="file" value="category"/>
 
 
<div class="tt">分类管理</div>
<input type="submit"   id="search"  style="visibility:hidden" />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True" CssClass="tb"
        PageSize="20" DataKeyNames="Id" ShowHeaderWhenEmpty="True">
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
            <asp:BoundField DataField="ParentName" HeaderText="所属类别" />
            <asp:BoundField DataField="BrandCount" HeaderText="品牌数量" />
            <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="../admin/brandList.aspx?industryID={0}"
                DataTextField="BrandCount" HeaderText="品牌数量" />
           
              <asp:TemplateField>
                <HeaderTemplate>
                <%--<asp:DropDownList></asp:DropDownList>--%>

                  <select name="status1"    onchange="submitData();" ><option value="-1" selected="selected">选择状态</option><option value="0">已结束</option><option value="2">进行中</option><option value="2">已揭晓</option><option value="3">未开始</option></select>&nbsp;
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="lbl_ID2" runat="server" Text='<%# Bind("StatusValue") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:BoundField DataField="" HeaderText="验证码类型X" />
            <asp:BoundField DataField="Ranking" HeaderText="资质认证排名X" />
            <asp:BoundField DataField="" HeaderText="显示图片X" />
            <asp:BoundField DataField="" HeaderText="开始投票提票X" />
            
            <asp:TemplateField HeaderText="操  作">
                <ItemTemplate>
                   
                    <a href="editIndustry.html?action=edit&ID=<%#Eval("ID") %>">
                        <img src="../images/edit.png" width="16" height="16" title="编辑" alt="" /></a>
                    
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
