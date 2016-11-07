<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="BranD10.ajax.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <script type="text/javascript" src="../js/jquery.js"></script>
    <script type="text/javascript" src="../js/public.js"></script>
</head>
<body>
    <form method="post" target="UploadThumb" enctype="multipart/form-data" action="ajax/FileHandler.ashx"
    onsubmit="return isUP(\'upthumb\');">
    <input type="hidden" name="moduleid" value="' + m + '" /><input type="hidden" name="from"
        value="thumb" /><input type="hidden" name="old" value="' + o + '" /><input type="hidden"
            name="fid" value="' + i + '" /><table cellpadding="3">
                <tr>
                    <td>
                        <input id="remote_0" type="radio" name="isremote" value="0" checked onclick="ReLo(0, \'upthumb\');" /><label
                            for="remote_0">
                            ' + L['up_local'] + '</label>&nbsp;&nbsp;&nbsp;<input id="remote_1" type="radio"
                                name="isremote" value="1" onclick="ReLo(1, \'upthumb\');" /><label for="remote_1">
                                    ' + L['up_remote'] + '</label>
                    </td>
                </tr>
                <tr id="remote_url" style="display: none;">
                    <td>
                        <input id="remote" type="text" size="30" name="remote" value="http://" onclick="if(this.value==\'http://\')this.value=\'\';" />
                    </td>
                </tr>
                <tr id="local_url">
                    <td>
                        <input id="upthumb" type="file" size="20" name="upthumb" onchange="if(isImg(\'upthumb\')){this.form.submit();Dd(\'Dsubmit\').disabled=true;Dd(\'Dsubmit\').value=\'' + L['uploading'] + '\';}" />
                    </td>
                </tr>
                <tr style="display: ' + s + '">
                    <td>
                        ' + L['width'] + '
                        <input type="text" size="3" name="width" value="' + w + '" />
                        px &nbsp;&nbsp;&nbsp;' + L['height'] + '
                        <input type="text" size="3" name="height" value="' + h + '" />
                        px
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" class="btn" value="' + L['upload'] + '" id="Dsubmit" />&nbsp;&nbsp;<input
                            type="button" class="btn" value="' + L['cancel'] + '" onclick="cDialog();" />
                    </td>
                </tr>
            </table>
    </form>
</body>
</html>
