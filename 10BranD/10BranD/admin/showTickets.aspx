<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="showTickets.aspx.cs" Inherits="BranD10.vote.showTickets" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="msgbox" onmouseover="closemsg();" style="display:none;"></div>
<div class="tt">吟飞</div>
 
<input type="hidden" name="moduleid" value="13"/>
<input type="hidden" name="file" value="toupiao"/>
<input type="hidden" name="action" value="clientlist"/>
<input type="hidden" name="catid" value="39382"/>
<input type="hidden" name="itemid" value="1917"/>
<input type="hidden" name="title" value="吟飞"/>
<input type="hidden" name="type" value="toupiao"/>
<input type="hidden" name="order" value="time"/>
<table cellpadding="2" cellspacing="1" class="tb">
<tr>
<td>
数字IP:<input type="text" name="numip" size="10" value=""/>
<%--参数：<input type="text" name="agent" size="50" value=""/>	--%>	
 <input type="text" name="psize" value="20" size="2" class="t_c" title="条/页"/>条/页
<input type="submit" value="搜 索" class="btn"/>&nbsp;
 
<input type="button" value="APP投票X" class="btn" onclick="window.open('shangadmin.php?order=time&moduleid=13&catid=39382&file=toupiao&action=apptoupiao&itemid=1917&title=吟飞')"/>&nbsp;
<input type="button" value="会员投票X" class="btn" onclick="window.open('shangadmin.php?order=time&moduleid=13&catid=39382&file=toupiao&action=membertoupiao&itemid=1917&title=吟飞')"/>&nbsp;
</td>
</tr>
</table>
    <div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True"
        CssClass="tb" DataKeyNames="BrandID">
        <Columns>
            
            <asp:BoundField DataField="Area" HeaderText="所在地区" HtmlEncode="false" />
            <asp:BoundField DataField="IP" HeaderText="IP" HtmlEncode="false" />
            <asp:BoundField DataField="CreateTime" HeaderText="时间" HtmlEncode="false" />
           

              <asp:HyperLinkField DataNavigateUrlFields="NoteHash,ID" DataNavigateUrlFormatString="?NoteHash={0}&ID={1}"
                DataTextField="Note" HeaderText="参数">  </asp:HyperLinkField>
        </Columns>
    </asp:GridView>
    </div>
    </form>
</body>
</html>
