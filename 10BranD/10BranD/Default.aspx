<%@ Page Title="主页" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="BranD10._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">

  
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
       
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Button" />
       
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    
         <script type="text/javascript" src="../js/jquery.js">    </script>
	<script>
	  //  alert(navigator.userAgent+)
    </script>
<script type="text/javascript" src="http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js&ip=218.192.3.42">
    $.ajax({
        type: "get",
        url: "http://pv.sohu.com/cityjson?ie=utf-8",

        success: fillContractDetail,
        dataType: 'text',
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert(XMLHttpRequest.status);
            alert(XMLHttpRequest.readyState);
            alert(textStatus);
        },
        complete: function (XMLHttpRequest, textStatus) {
              alert(textStatus);
            this; // 调用本次AJAX请求时传递的options参数    
        }
    });
    function fillContractDetail(data) {

        alert(data)
        alert(remote_ip_info)
    }
</script>
<script type="text/javascript">
 
   // var ip = get_client_ip()
 
   // var i = remote_ip_info;
    //  document.write('IP范围:' + i['start'] + '-' + i['end'] + '\r\n<br />归属地:' + i['country'] + i['province'] + i['city'] + i['isp']);

    function get_client_ip() {
        if (getenv("HTTP_CLIENT_IP") && strcasecmp(getenv("HTTP_CLIENT_IP"), "unknown"))
            ip = getenv("HTTP_CLIENT_IP");
        else if (getenv("HTTP_X_FORWARDED_FOR") && strcasecmp(getenv("HTTP_X_FORWARDED_FOR"),
"unknown"))
            ip = getenv("HTTP_X_FORWARDED_FOR");
        else if (getenv("REMOTE_ADDR") && strcasecmp(getenv("REMOTE_ADDR"), "unknown"))
            ip = getenv("REMOTE_ADDR");
        else if (isset($_SERVER['REMOTE_ADDR']) && $_SERVER['REMOTE_ADDR']
&& strcasecmp($_SERVER['REMOTE_ADDR'], "unknown"))
            ip = $_SERVER['REMOTE_ADDR'];
        else
            ip = "unknown";
        return ip;
    } 
</script>

    </h2>
    <p>
        若要了解关于 ASP.NET 的详细信息，请访问 <a href="http://www.asp.net/cn" title="ASP.NET 网站">www.asp.net/cn</a>。
    </p>
    <p>
        您还可以找到 <a href="http://go.microsoft.com/fwlink/?LinkID=152368"
            title="MSDN ASP.NET 文档">MSDN 上有关 ASP.NET 的文档</a>。
    </p>
</asp:Content>
