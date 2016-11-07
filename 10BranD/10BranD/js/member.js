
$('#search-keyword').keyup(function ()
{
    //alert($('#search-keyword').attr('value'));
    if ($('#search-keyword').attr('value') == '')
    {
        $('#suggest_ul1').hide();
    }
    else if ($('#search-keyword').attr('value').length < 1)
    {
    } else
    {
        $.ajax({
            type: 'POST',
            url: '/brand/search.php?action=seleiis',
            data: { keyword: $('#search-keyword').attr('value') },
            dataType: 'json',
            success: function (data)
            {
                if (data != 0)
                {
                    // console.log(data[0].title);
                    var contentss = "";
                    for (var i = 0; i < data.length; i++)
                    {
                        var keywords = data[i].title;
                        //alert(keywords);
                        //alert(skey);

                        contentss = contentss + "<a href='javascript:void(0);'><li onmouseover=over('ali" + i + "');  onmouseout=out('ali" + i + "');   id='ali" + i + "' onclick=changekk('ali" + i + "');>" + keywords + "</li></a>";

                    }
                    //alert(contents);
                    $("#suggest_ul1").show();
                    $("#suggest_ul1").html(contentss);
                    $('#dbrandtitle1').html('');
                } else
                {
                    $('#dbrandtitle1').html('');
                }
            }
        });
    }
});
function changekk(id)
{

    con = $('#' + id).text();

    $('#search-keyword').attr('value', con);

    $('#suggest_ul1').hide(0);


}
function over(fontStyle)
{
    document.getElementById(fontStyle).style.background = '#ffe3d9';
}
function out(fontStyle)
{
    document.getElementById(fontStyle).style.background = 'white';
}


function getRand() { return 'm' + Math.random().toString().substr(2); }
function showcaptcha()
{
    if (Dd('captchapng').style.display == 'none') { Dd('captchapng').style.display = ''; }
    if (Dd('captchapng').src.indexOf('loading.gif') != -1)
    {
        reloadcaptcha()
    }
    if (Dd('captcha').value == '点击显示')
    {
        Dd('captcha').value = '';
    }
    Dd('captcha').className = '';
}
function reloadcaptcha()
{

    ischeckcaptcha = false;
    rnd = getRand();
    Dd('rnd').value = rnd;
    Dd('captchapng').src = '../ajax/Handler1.ashx?type=GetCheckCode&id=' + rnd;
    Dd('ccaptcha').innerHTML = '';
    Dd('captcha').value = '';
}
function checkcaptcha(s)
{
    if (ischeckcaptcha) { return; } else { ischeckcaptcha = true; }
    if (!is_captcha(s) || s.length != 4)
    {
        ischeckcaptcha = false;
        return;
    }
    $.ajax({
        type: "get",
        url: "../ajax/Handler1.ashx?type=CheckCode&code=" + s,

        success: function (data)
        {
            if (data['result'])
            {
                Dd('ccaptcha').innerHTML = '&nbsp;&nbsp;<img src="../images/check_right.gif" align="absmiddle"/>';
            }
            else
            {
                ischeckcaptcha = false;
                Dd('captcha').focus;
                Dd('ccaptcha').innerHTML = '&nbsp;&nbsp;<img src="../images/check_error.gif" align="absmiddle"/>';

            }
        },
        dataType: 'json',
        error: function (XMLHttpRequest, textStatus, errorThrown)
        {
            ischeckcaptcha = false;
            Dd('captcha').focus;
            Dd('ccaptcha').innerHTML = '&nbsp;&nbsp;<img src="../images/check_error.gif" align="absmiddle"/>';

        }

    });
}




var vid = '';
function trim(str)
{
    return str.replace(/(^\s*)|(\s*$)/g, "");
}
function validator(id)
{
    vid = id;
    idVal = trim(Dd(id).value);
    Dd(id).value = idVal;
    if (idVal.length < 3) return true;
    if (id == 'mobile')
    {
        if (idVal.length < 11) return false;
        if (!(/^1[34578]\d{9}$/.test(idVal)))
        {
            alert("手机号码不存在，请重填！");
            return false;
        }
      
    }
    if (id == 'password')
    {
        //??需要补充密码强度验证

        // if (!(/^1[34578]\d{9}$/.test(idVal)))
        if (idVal.length < 6)
        {
            alert("密码过于简单，请重填");
            Dd(id).value = ''
            return false;
        }
        return true;
    } 
    
     CheckMember('type=CheckMember&job=' + id + '&value=' + idVal, _validator);
    
}
function _validator(data)
{
    Dd('d' + vid).innerHTML = !data['result'] ? '<img src="../images/check_error.gif" align="absmiddle"/> ' + data['error'] : '<img src="../images/check_right.gif" align="absmiddle"/> ';
}
function err_msg(str, id)
{
    Dd('d' + id).innerHTML = '<img src="http://img.10brandchina.com/skin/default/image/check_' + (str ? 'error' : 'right') + '.gif" align="absmiddle"/> ' + str;
}
function validate(type)
{
    if (type == 'cpassword')
    {
        if (Dd('cpassword').value != Dd('password').value)
        {
            err_msg('两次输入的密码不一致', type);
        } else
        {
            if (Dd('cpassword').value.length >= 6)
            {
                err_msg('', type);
            }
        }
    }
    if (type == 'truename')
    {
        if (Dd('truename').value.length < 2)
        {
            err_msg('请输入真实姓名', type);
        } else
        {
            err_msg('', type);
        }
    }
    if (type == 'telephone')
    {
        if (Dd('telephone').value.match(/^[0-9\-\(\)\+\.]{7,}$/))
        {
            err_msg('', type);
        } else
        {
            err_msg('请输入公司电话', type);
        }
    }
}
function reg(type)
{
    $(":radio").each(function ()
    {
        if ($(this).attr("checked"))
        {
            Ds('tgroup' + $(this).attr('value'));
        } else
        {
            Dh('tgroup' + $(this).attr('value'));
        }
    });
    if (type)
    {
        Ds('company_detail');
        //Dh('sendmcode');
    } else
    {
        Dh('company_detail');
        //Ds('sendmcode');
    }
}
function Df(ID)
{
    Dd(ID).focus();
}
function check()
{
    f = 'captcha';
    if (!is_captcha(Dd(f).value))
    {
        Dmsg('请填写验证码', f);
        return false;
    }
    var f, p;
    f = 'mobile';
    if (Dd(f).value == '')
    {
        err_msg('请填写会员登录名', f);
        Df(f);
        return false;
    }
    if (Dd('d' + f).innerHTML.indexOf('error') != -1)
    {
        Df(f);
        return false;
    }
    f = 'password';
    if (Dd(f).value.length < 6)
    {
        err_msg('请填写会员登录密码', f);
        Df(f);
        return false;
    }
    if (Dd('d' + f).innerHTML.indexOf('error') != -1)
    {
        Df(f);
        return false;
    }
    f = 'cpassword';
    if (Dd(f).value == '')
    {
        err_msg('请重复输入密码', f);
        Df(f);
        return false;
    }
    if (Dd('password').value != Dd(f).value)
    {
        err_msg('两次输入的密码不一致', f);
        Df(f);
        return false;
    }
    /*f = 'truename';
    if(Dd(f).value == '') {
    err_msg('请填写真实姓名', f);
    Df(f);
    return false;
    }
    f = 'email';
    if(Dd(f).value.length < 6) {
    err_msg('请填写电子邮箱', f);
    Df(f);
    return false;
    }
    if(Dd('d'+f).innerHTML.indexOf('error') != -1) {
    Df(f);
    return false;
    }
    if(Dd('areaid_1').value == 0) {
    Dmsg('请选择所在地', 'areaid');
    return false;
    }*/
    f = 'mobilecode';
    if (!Dd(f).value.match(/^[0-9]{6}$/))
    {
        Dmsg('请填写手机验证码', f);
        return false;
    }
    if (Dd('g_9').checked == true)
    {
        f = 'vcompany';
        if (Dd(f).value == '')
        {
            err_msg('请填写公司名称', f);
            Df(f);
            return false;
        }
        if (Dd('d' + f).innerHTML.indexOf('error') != -1)
        {
            Df(f);
            return false;
        }
        if (Dd('type').value == '')
        {
            Dmsg('请选择公司类型', 'type');
            return false;
        }
        f = 'telephone';
        if (Dd(f).value.length < 7)
        {
            err_msg('请填写公司电话', f);
            Df(f);
            return false;
        }
    }

    return true;
}
function SendCode()
{
    if (Dd('demail').innerHTML.indexOf('right') == -1)
    {
        Dd('email').focus();
        return;
    }
    makeRequest('action=sendscode&value=' + Dd('email').value, 'register.php', '_SendCode');
    Dh('sendok');
    Dd('send_code').value = '正在发送';
    Dd('send_code').disabled = true;
}
function _SendCode()
{
    var f = 'email';
    if (xmlHttp.readyState == 4 && xmlHttp.status == 200)
    {
        Dd('send_code').value = xmlHttp.responseText == 1 ? '发送成功' : '立即发送';
        Dd('send_code').disabled = xmlHttp.responseText == 1 ? true : false;
        if (xmlHttp.responseText == 1)
        {
            Ds('sendok');
            Dd('dsendok').innerHTML = '<img src="http://img.10brandchina.com/member/image/ico_mailok.gif" align="absmiddle"/> <span class="f_green">邮件发送成功，</span> <a href="goto.php?action=emailcode&email=' + Dd(f).value + '" target="_blank">立即查收</a>';
            StopCode();
        } else if (xmlHttp.responseText == 2)
        {
            err_msg('邮件格式错误，请检查', f);
            Df(f);
        } else if (xmlHttp.responseText == 3)
        {
            err_msg('邮件地址已存在，请更换', f);
            Df(f);
        } else if (xmlHttp.responseText == 4)
        {
            err_msg('此邮件域名已经被禁止注册，请更换', f);
            Df(f);
        } else if (xmlHttp.responseText == 5)
        {
            alert('邮件发送过快，请稍后再试');
        } else if (xmlHttp.responseText == 6)
        {
            alert('尝试发送次数太多，请稍后再试');
        } else if (xmlHttp.responseText == 7)
        {
            alert('验证码不正确或已失效，请点击验证码更换后再试！');
        } else
        {
            alert('未知错误，请重试');
        }
    }
}
function StopCode()
{
    Dd('send_code').disabled = true;
    var i = 60;
    var interval = window.setInterval(
function ()
{
    if (i == 0)
    {
        Dd('send_code').value = '立即发送';
        Dd('send_code').disabled = false;
        clearInterval(interval);
    } else
    {
        Dd('send_code').value = '重新发送(' + i + ')';
        i--;
    }
},
1000);
}
function SendSCode()
{
    if (Dd('ccaptcha').innerHTML.indexOf('right') == -1)
    {
        Dd('captcha').focus();
        alert('请先填写正确的验证码！');
        return;
        }
    
    if (Dd('dmobile').innerHTML.indexOf('right') == -1)
    {
        err_msg('请填写正确手机号', 'mobile');
        return;
    }
    CheckMember('type=CheckMember&job=SendSCode&value=' + Dd('mobile').value + "&code=" + Dd('captcha').value, _SendSCode);

    Dh('sendsok');
    Dd('send_scode').value = '正在发送';
    Dd('send_scode').disabled = true;
}
function _SendSCode(data)
{
    var f = 'mobile';

    if (data["result"])
    {
        Ds('sendsok');
        Dd('dsendsok').innerHTML = '<img src="../images/ico_mailok.gif" align="absmiddle"/> <span class="f_green">短信发送成功</span>';
       
    }
    else if (data["error"])
    {
        err_msg(data["error"], f);
        Df(f);
    }
    else
    {
        err_msg('未知错误，请检查', f);
        Df(f);
    }
    alert('ss')
    StopSCode();
    //        else if (xmlHttp.responseText == 2)
    //        {
    //            err_msg('手机号码格式错误，请检查', f);
    //            Df(f);
    //        } else if (xmlHttp.responseText == 3)
    //        {
    //            err_msg('手机号码已存在，请更换', f);
    //            Df(f);
    //        } else if (xmlHttp.responseText == 5)
    //        {
    //            alert('短信发送过快，请过几分钟后再试');
    //        } else if (xmlHttp.responseText == 6)
    //        {
    //            alert('当前IP尝试发送次数太多，请过几分钟后再试');
    //        } else if (xmlHttp.responseText == 7)
    //        {
    //            alert('验证码不正确或已失效，请点击验证码更换后再试！');
    //        } else
    //        {
    //            alert('未知错误，请重试');
    //        }

}
function StopSCode()
{
    Dd('send_scode').disabled = true;
    var i = 60;
    var interval = window.setInterval(
function ()
{
    if (i == 0)
    {
        Dd('send_scode').value = '立即发送';
        Dd('send_scode').disabled = false;
        clearInterval(interval);
    } else
    {
        Dd('send_scode').value = '重新发送(' + i + ')';
        i--;
    }
},
1000);
}
reg(1);


