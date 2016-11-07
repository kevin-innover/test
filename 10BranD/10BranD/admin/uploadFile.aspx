<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="uploadFile.aspx.cs" Inherits="BranD10.Pages.uploadFile" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="../js/jquery.js">    </script>
    <script type="text/javascript" src="../js/public.js">    </script>
    <script type="text/javascript">

        var Request = new Object();
        Request = GetRequest();
        brandID = Request['brandID']

        var url = Request['url']

        $(document).ready(function () {
            try {

                if ($("#HiddenField1").val() == "") {
                    $("#Image1").prop("src", url)
                }
            }
            catch (e) {
                alert("Error---" + e.message);
                alert(e.description)
                alert(e.number)
                alert(e.name)
            }
        })
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 200;">
            <tr width="70" height="50">
                <td>
                    <asp:Image ID="Image1" Width="120" Height="80" runat="server" />
                    <tr width="70" height="20">
                        <td>
                            <asp:FileUpload ID="FileUpload1" runat="server"                                  />
                            <td>
                                <asp:HiddenField ID="HiddenField1" runat="server"  />
                    </tr>
                    <tr width="70" height="20">
                        <td>
                            <%--<asp:Button ID="btn_view" runat="server" Text="预览" OnClick="btn_view_Click" />--%>
                            <asp:Button ID="btn_save" runat="server" Text="上传" OnClick="btn_save_Click" />
                            <%--<input type="button" value="取消" onclick="window.close();" />--%>
                        </td>
                    </tr>
        </table>
    </div>
    </form>
</body>
</html>
