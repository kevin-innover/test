<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VoteAudit.aspx.cs" Inherits="BranD10.Pages.VoteAudit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <script type="text/javascript" src="../js/jquery.js">    </script>
    <script type="text/javascript" src="../js/public.js">    </script>
    <script type="text/javascript" src="../js/prompt/ymPrompt.js">    </script>
    <link rel="stylesheet" id='Link1' type="text/css" href="../js/prompt/skin/qq/ymPrompt.css" />
    <link rel="stylesheet" id='skin' type="text/css" href="../skin/style.css" />
    <script type="text/javascript" language="javascript">
     
        function shuaSpeed() {
            alert('s')
            sNum = $("#shuaSpeed  option:selected").val();
            
            s = sNum * 60;
            set_cookie('shuaSpeed2', sNum, 30);
            clearInterval(timer1);
            if (sNum > 0) {
                timer1 = setInterval("strtime()", 1000);
            }
        }
        var timer1 = null;
        
        var sNum = get_cookie('shuaSpeed2');
        
        var s = 0;
        if (sNum) {
            s = 60 * sNum;
            $('#shuaSpeed option:eq(' + sNum + ')').attr('selected', 'selected');
        }
        else {
            sNum = 0; 
        }
        function strtime() {
            if (s-- <= 0) {
                location.reload();
            }
        }
        if (sNum > 0) {
        alert(t)
            timer1 = setInterval("strtime()", 1000);
        }

</script>
</head>
<body>
    <div id="msgbox" onmouseover="closemsg();" style="display: none;">
    </div>
    
    <form action="?action=search" runat="server">
    
    <div id="Div1" onmouseover="closemsg();" style="display:none;"></div>
<div class="tt">每隔
<select id="shuaSpeed" onchange="shuaSpeed()" >
<option value="0">关闭</option>
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
<option value="7">7</option>
<option value="8">8</option>
<option value="9">9</option>
<option value="10">10</option>
</select>分钟刷新页面</div>
 
<input type="hidden" name="moduleid" value="13"/>
<input type="hidden" name="file" value="monitor2"/>
<table cellpadding="2" cellspacing="1" class="tb">
<tr>
<td>
最近时间:
<input name="time" type="radio" value="86400"  />一天 &nbsp;&nbsp;
<input name="time" type="radio" value="43200"  />12小时 &nbsp;&nbsp;
<input name="time" type="radio" value="21600"  />6小时 &nbsp;&nbsp;
<input name="time" type="radio" value="10800"  />3小时 &nbsp;&nbsp;
<input name="time" type="radio" value="3600"  />1小时 &nbsp;&nbsp;
<input name="time" type="radio" value="1800"  />30分钟 &nbsp;&nbsp;
<input name="time" type="radio" value="600"  />10分钟 &nbsp;&nbsp;
<select name="catid">
<option value="0" selected="selected">全部</option>
	<option value="39355" >壁纸</option>
	<option value="39356" >沙发</option>
	<option value="39374" >消防器材</option>

</select>
类型：
<input name="ispc" type="radio" value="0" checked="checked" />全部 
<input name="ispc" type="radio" value="2"  />电脑 
<input name="ispc" type="radio" value="1"  />手机 
<input name="ispc" type="radio" value="3"  />App 
<input name="ispc" type="radio" value="4"  />会员 
<input name="ispc" type="radio" value="5"  />自动
<input type="submit" value="查 看" class="btn"/>&nbsp;
<input type="button" value="清 空" class="btn" onclick="if(confirm('确定要清空数据吗？此操作将不可撤销')){window.location='?action=clear';}">

<a href="?moduleid=13&file=toupiao&action=search&agent=iPhone 5SGLOBAL">参数搜索</a>

</td>
</tr>
</table>
 
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True"
        CssClass="tb" DataKeyNames="BrandID">
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
            <asp:BoundField DataField="IndustryName" HeaderText="行业" HtmlEncode="false" />

             <%-- <asp:HyperLinkField DataNavigateUrlFields="_Industry.Id" DataNavigateUrlFormatString="?CategoryID={0}"
                DataTextField="IndustryName" HeaderText="行业">  </asp:HyperLinkField>--%>
                 <asp:HyperLinkField DataNavigateUrlFields="BrandID" DataNavigateUrlFormatString="showTickets.aspx?ID={0}"
                DataTextField="BrandName" HeaderText="品牌">  </asp:HyperLinkField>
           
            <asp:BoundField DataField="TotalTickets" HeaderText="票数" HtmlEncode="false" />
           
            <asp:TemplateField HeaderText="操  作">
                <ItemTemplate>
                    <a href="editBrand.html?action=edit&ID=<%#Eval("BrandID") %>">
                        <img src="../images/edit.png" width="16" height="16" title="编辑" alt="" /></a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <div class="btns">
    </div>
    </form>
    <br />
    
    <script type="text/javascript">        Menuon(1);</script>
</body>
</html>
