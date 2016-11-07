autoLoadCategory = false
var ID
$(
 function ()
 {
     try
     {
         var Request = new Object();
         Request = GetRequest();

         var page = Request['page']
         var action = Request['action']
         ID = Request['ID']

         switch (page)
         {
             case 'editMember':
                 LoadMember()
                 break;
             case 'editUser':
                 if (action == 'edit')
                 {
                     userID = Request['ID']
                     loadUser(userID)
                 }

                 break;
             case 'editMessage':
                 LoadMessage()
                 break;
             case 'editContract':

                 $("#brandtitle").autocomplete({
                     source: BrandNames
                 });
                 if (action == 'edit')
                 {
                     LoadContract()
                 }
                 else
                 {
                     industryID = 0
                     loadIndustry()
                     LoadAllUserNames(0)
                 }
                 break;

             case 'editBrand':

                 if (action == 'edit')
                 {
                     brandID = Request['brandID']
                     loadBrand(brandID)
                 }
                 else
                 {
                     brandID = 0;
                     loadCurrentUsername('#username')
                     loadIndustry()
                 }
                 break;
             case 'editBrand_m':

                 if (action == 'edit')
                 {
                     brandID = 91
                     loadBrand_m(brandID)
                 }
                 else
                 {
                     brandID = 0;
                     loadIndustry()
                 }
                 break;
             case 'editIndustry':

                 if (action == 'add')
                 {
                     loadIndustry(industryID)
                 }
                 else if (action == 'edit')
                 {
                     //  $("#tr_QRcode").hide() 
                     categoryID = Request['ID']
                     loadcategoryDetail(categoryID)

                 } else if (action == 'recycle')
                 {
                     loadDeleteBrand()
                 }
                 else if (action == 'delete')
                 {
                     var id = Request['ID']
                 }
                 break;
         }
     }
     catch (e)
     {
         alert("Error---" + e.message);
         alert(e.description)
         alert(e.number)
         alert(e.name)
     }

 })

function SaveFrequency(Fid, v, brandid)
{
    $.ajax({
        type: "post",
        url: "../ajax/Handler1.ashx?type=SaveFrequency&ID=" + brandid + "&v=" + v + "&Fid=" + Fid,

        success: function (data)
        {
            //  alert('保存' + data['Result'] + '--' + data['Error']);
            msg(data)

        },
        dataType: 'json',
        error: function (XMLHttpRequest, textStatus, errorThrown)
        {

            alert(XMLHttpRequest.status);
            alert(XMLHttpRequest.readyState);
            alert(textStatus);
        },
        complete: function (XMLHttpRequest, textStatus)
        {
            //  alert(textStatus);
            //  this; // 调用本次AJAX请求时传递的options参数    
        }
    });

}

function SaveFrequency(Fid, v, brandid)
{
    $.ajax({
        type: "post",
        url: "../ajax/Handler1.ashx?type=SaveFrequency&ID=" + brandid + "&v=" + v + "&Fid=" + Fid,

        success: function (data)
        {
            //  alert('保存' + data['Result'] + '--' + data['Error']);
            msg(data)
        },
        dataType: 'json',
        error: function (XMLHttpRequest, textStatus, errorThrown)
        {

            alert(XMLHttpRequest.status);
            alert(XMLHttpRequest.readyState);
            alert(textStatus);
        },
        complete: function (XMLHttpRequest, textStatus)
        {
            //  alert(textStatus);
            //  this; // 调用本次AJAX请求时传递的options参数    
        }
    });

}

function loadCurrentUsername(userContrl)
{
    $.ajax({
        type: "post",
        url: "../ajax/Handler1.ashx?type=loadCurrentUsername",

        success: function (data)
        {
            $(userContrl).val(data);
        },
        dataType: 'text',
        error: function (XMLHttpRequest, textStatus, errorThrown)
        {

            alert(XMLHttpRequest.status);
            alert(XMLHttpRequest.readyState);
            alert(textStatus);
        },
        complete: function (XMLHttpRequest, textStatus)
        {
            //  alert(textStatus);
            this; // 调用本次AJAX请求时传递的options参数    
        }
    });
}


function loadcategoryDetail(value)
{
    if (value == 0)
    {
        return;
    }
    $.ajax({
        type: "post",
        url: "../ajax/Handler1.ashx?type=LoadcategoryDetail&ID=" + value,

        success: fillCategoryDetail,
        dataType: 'json',
        error: function (XMLHttpRequest, textStatus, errorThrown)
        {

            alert(XMLHttpRequest.status);
            alert(XMLHttpRequest.readyState);
            alert(textStatus);
        },
        complete: function (XMLHttpRequest, textStatus)
        {
            //  alert(textStatus);
            this; // 调用本次AJAX请求时传递的options参数    
        }
    });
}
function fillCategoryDetail(data)
{

    $("#catname").val(data["Name"])
    $("#catdir").val(data["EName"])
    $("#letter").val(data["CharIndex"])
    $('input[name="category[level]"]').val(data["leavel"])
    $("#seo_title").val(data["SEOTitle"])
    $("#seo_keywords").val(data["Meta_Keywords"])
    $("#seo_description").val(data["Meta_Desc"])
    $('input[name="category[level]"]').val(data["Level"])
    $('input[name="category[verification]"]').val(data["AuditLimit"])

    var status = data["Status"]
    $("input[name='category[status]'][value='" + status + "']").attr("checked", "checked");

    var voteLimit = data["VoteLimit"]
    $("input[name='category[xianzhi]'][value='" + voteLimit + "']").attr("checked", "checked");

    $('input[name="category[closepc]"]').attr("checked", data["ClosePC"]);


    $("#categoryfromdate").val(jsonDateFormat(data["BeginDate"]))
    $("#categorytodate").val(jsonDateFormat(data["EndDate"], false))
    $("#shuoming").val(data["VoteDesc"])
    $("#shuoming1").val(data["VoteDesc1"])

    $('input[name="category[fabumt]"]').val(data["PublishUrl"])
    $('input[name="category[erweima]"]').val(data["QRCodeUrl"])

    $("#content").val(data["AutoCommnet"])

    $("#showerweima").attr("src", data["QRCodeUrl"])


    industryID = data["ParentID"]

    loadIndustry(industryID)

    var userID = data["UserID"]

    LoadAllUserNames(userID)
}

function SaveCategory()
{

    $.ajax({
        type: "post",
        url: "../ajax/Handler1.ashx?type=SaveCategory&ID=" + categoryID,
        data: CollectCategoryData(),

        success: function (data)
        {
            //  alert('保存' + data['Result'] + '--' + data['Error']);
            msg(data)
        },
        dataType: 'json',
        error: function (XMLHttpRequest, textStatus, errorThrown)
        {

            alert(XMLHttpRequest.status);
            alert(XMLHttpRequest.readyState);
            alert(textStatus);
        },
        complete: function (XMLHttpRequest, textStatus)
        {
            //  alert(textStatus);
            //  this; // 调用本次AJAX请求时传递的options参数    
        }
    });
}

function CollectCategoryData()
{

    var obj = {};
    obj.Id = categoryID

    obj.ParentID = $("#bigIndustry").val()

    obj.Name = $("#catname").val()
    obj.EName = $("#catdir").val()

    obj.CharIndex = $("#letter").val()
    obj.Level = $('input[name="category[level]"]').val()
    obj.SEOTitle = $("#seo_title").val()
    obj.Meta_Keywords = $("#seo_keywords").val()
    obj.Meta_Desc = $("#seo_description").val()
    obj.AuditLimit = $('input[name="category[verification]"]').val()

    obj.Status = $("input[name='category[status]']:checked").val()


    obj.VoteLimit = $("input[name='category[xianzhi]']:checked").val()

    obj.ClosePC = $('input[name="category[closepc]"]').attr("checked") == 1
    obj.UserID = $('select[name="category[userid]"]').val();

    obj.BeginDate = $("#categoryfromdate").val()
    obj.EndDate = $("#categorytodate").val()
    obj.voteDesc = $("#shuoming").val()
    obj.voteDesc1 = $("#shuoming1").val()
    obj.PublishUrl = $('input[name="category[fabumt]"]').val()
    obj.QRCodeUrl = $('input[name="category[erweima]"]').val()
    obj.AutoCommnet = $("#content").val()

    if ($("#showerweima").attr("src") == "")
    {
        obj.QRCodeUrl = $("#showerweima").attr("src")
    }

    return JSON.stringify(obj);
}
function loadBrand(id)
{

    $.ajax({
        type: "get",
        url: "../ajax/Handler1.ashx?type=LoadBrand&ID=" + id,

        success: fillBrandTable,
        dataType: 'json',
        error: function (XMLHttpRequest, textStatus, errorThrown)
        {

            alert(XMLHttpRequest.status);
            alert(XMLHttpRequest.readyState);
            alert(textStatus);
        },
        complete: function (XMLHttpRequest, textStatus)
        {
            // alert(textStatus);
            this; // 调用本次AJAX请求时传递的options参数    
        }
    });
}

function loadBrand_m(id)
{

    $.ajax({
        type: "get",
        url: "../ajax/Handler1.ashx?type=LoadBrand&ID=" + id,

        success: fillBrandTable_m,
        dataType: 'json',
        error: function (XMLHttpRequest, textStatus, errorThrown)
        {

            alert(XMLHttpRequest.status);
            alert(XMLHttpRequest.readyState);
            alert(textStatus);
        },
        complete: function (XMLHttpRequest, textStatus)
        {
            // alert(textStatus);
            this; // 调用本次AJAX请求时传递的options参数    
        }
    });
}
function fillBrandTable_m(data)
{

    companyID = data["CompanyID"]
    industryID = data["ParentIndustryID"]

    categoryID = data["IndustryID"]

    $("#title").val(data["Name"])
    $('input[name="post[thumb]"]').val(data["LogoPath"])
    $("#weburl").val(data["Websit"]);
    $('#shangbiao').val(data["RegisterNumber"])

    $('#weixin_name').val(data["Weixin"])
    $('#weixin_pic').val(data["WeixinImg"])
    $('#weibo_name').val(data["Weibo"])
    $('#weibo_pic').val(data["WeiboImg"])
    $('#weibo_linkurl').val(data["WeiboUrl"])

    $('#content').val(data["Content"])

    loadIndustry()
}

function fillBrandTable(data)
{

    companyID = data["CompanyID"]
    industryID = data["ParentIndustryID"]

    categoryID = data["IndustryID"]

    $("#remark").text(data["Note"])
    $("#title").val(data["Name"])
    $("#toupiao").val(data["TotalTickets"])
    $('input[name="post[addtime]"]').val(jsonDateFormat(data["CreateTime"]))
    $('input[name="post[remark]"]').val(data["Note"])
    $('input[name="post[thumb]"]').val(data["LogoPath"])

    $('input[name="post_fields[contact]"]').val(data["Contact"])
    $('input[name="post_fields[cjob]"]').val(data["ContactPosition"])
    $('input[name="post_fields[ctel]"]').val(data["Tel"])
    $('input[name="post_fields[cqq]"]').val(data["Qq"])
    $('input[name="post_fields[cfax]"]').val(data["Fax"])
    $('input[name="post_fields[cemail]"]').val(data["Email"])

    $('input[name="post_fields[maxtoupiao]"]').val(data["AuditLimit"])
    $('input[name="post_fields[mtoupiaolimit]"]').val(data["PhoneLimit"])
    $('input[name="post_fields[apptoupiaolimit]"]').val(data["AppLimit"])

    $('#topten_1').prop('checked', data["IsTop10"])
    $('#stoptoupiao_0').prop('checked', data["StopVote"])
    $('#closepc_0').prop('checked', data["StopPCVote"])
    $('#frompc_0').prop('checked', data["LimitPCVote"])

    $('#isshuapiao').val(Number(data["FakeTicket"]))

    $('input[name="post[note]"]').val(data["RejectReason"])

    var status = data["Status"]

    $("input[name='post[status]'][value='" + status + "']").attr("checked", "checked");

    $("#homepage").val(data["Websit"])
    $("#viewURL").attr('href', data["Websit"]);

    $("#gongsi").val(data["CompanyName"])
    $('input[name="post_fields[zhucehao]"]').val(data["CRegisterNumber"])
    $('input[name="post_fields[dizhi]"]').val(data["Addr"])

    $('#shangbiao').val(data["RegisterNumber"])
    $('#thumb1').val(data["Image1"])

    $('#thumb2').val(data["Image2"])

    loadIndustry()

    $("#load_area_1 option").each(function ()
    {
        var txt = $(this).text();

        if (txt == data["Area"])
        {
            $(this).attr("selected", true);

            return false;
        }
    });


}

function SaveBrand()
{
    if (!checkBrand())
    {
        alert("false")
        return;
    }
    $.ajax({
        type: "post",
        url: "../ajax/Handler1.ashx?type=SaveBrand&ID=" + brandID,
        data: CollectBrandData(),

        success: function (data)
        {
            msg(data)
            //  alert('保存' + data['Result'] + '--' + data['Error']);
        },
        dataType: 'json',
        error: function (XMLHttpRequest, textStatus, errorThrown)
        {

            alert(XMLHttpRequest.status);
            alert(XMLHttpRequest.readyState);
            alert(textStatus);
        },
        complete: function (XMLHttpRequest, textStatus)
        {
            //  alert(textStatus);
            //  this; // 调用本次AJAX请求时传递的options参数    
        }
    });
}

function CollectBrandData()
{

    var brand = {};
    brand.Id = brandID;
    brand.Name = $("#title").val();
    brand.Note = $("#remark").val();

    brand.IndustryID = $("#subIndustry").val();

    brand.Contact = $('input[name="post_fields[contact]"]').val()
    brand.ContactPosition = $('input[name="post_fields[cjob]"]').val()
    brand.Tel = $('input[name="post_fields[ctel]"]').val()
    brand.Qq = $('input[name="post_fields[cqq]"]').val()
    brand.Fax = $('input[name="post_fields[cfax]"]').val()
    brand.Email = $('input[name="post_fields[cemail]"]').val()

    brand.AuditLimit = $('input[name="post_fields[maxtoupiao]"]').val()
    brand.PhoneLimit = $('input[name="post_fields[mtoupiaolimit]"]').val()
    brand.AppLimit = $('input[name="post_fields[apptoupiaolimit]"]').val()

    brand.RegisterNumber = $("#shangbiao").val()
    brand.Image1 = $("#thumb1").val()
    brand.Image2 = $("#thumb1").val()
    brand.LogoPath = $("#thumb").val()

    brand.IsTop10 = $('#topten_1').prop('checked')
    brand.StopVote = $('#stoptoupiao_0').prop('checked')
    brand.StopPCVote = $('#closepc_0').prop('checked')

    brand.LimitPCVote = $('#frompc_0').prop('checked')

    brand.FakeTicket = $('#isshuapiao').val() == 1

    brand.RejectReason = $('input[name="post[note]"]').val()

    brand.Status = $("input[name='post[status]']:checked").val()


    brand.CompanyName = $("#gongsi").val();
    brand.CRegisterNumber = $('#zhucehao').val()
    brand.Addr = $('#dizhi').val()
    brand.Area = $("#load_area_1  option:selected").text();
    brand.Websit = $("#homepage").val();

    return JSON.stringify(brand);
}

function SaveBrand_m()
{
    if (!checkBrand())
    {
        alert("false")
        return;
    }
    $.ajax({
        type: "post",
        url: "../ajax/Handler1.ashx?type=SaveBrand&ID=" + brandID,
        data: CollectBrandData_m(),

        success: function (data)
        {
            msg(data)
            //  alert('保存' + data['Result'] + '--' + data['Error']);
        },
        dataType: 'json',
        error: function (XMLHttpRequest, textStatus, errorThrown)
        {

            alert(XMLHttpRequest.status);
            alert(XMLHttpRequest.readyState);
            alert(textStatus);
        },
        complete: function (XMLHttpRequest, textStatus)
        {
            //  alert(textStatus);
            //  this; // 调用本次AJAX请求时传递的options参数    
        }
    });
}

function CollectBrandData_m()
{
    var brand = {};
    brand.Id = brandID;
    brand.Name = $("#title").val();

    brand.IndustryID = $("#subIndustry").val();
    brand.LogoPath = $("#thumb").val()
    brand.Websit = $("#weburl").val()

    brand.Weixin = $("#weixin_name").val()
    brand.WeixinImg = $("#weixin_pic").val()
    brand.Weibo = $("#weibo_name").val()
    brand.WeiboImg = $("#weibo_pic").val()
    brand.WeiboUrl = $("#weibo_linkurl").val()
    brand.RegisterNumber = $("#shangbiao").val()
    brand.Content = $("#content").val()

    return JSON.stringify(brand);
}

function LoadContract()
{
    $.ajax({
        type: "post",
        url: "../ajax/Handler1.ashx?type=LoadContract&ID=" + ID,

        success: fillContractDetail,
        dataType: 'json',
        error: function (XMLHttpRequest, textStatus, errorThrown)
        {

            alert(XMLHttpRequest.status);
            alert(XMLHttpRequest.readyState);
            alert(textStatus);
        },
        complete: function (XMLHttpRequest, textStatus)
        {
            //  alert(textStatus);
            this; // 调用本次AJAX请求时传递的options参数    
        }
    });
}
function fillContractDetail(data)
{
    $("#brandtitle").val(data["BrandTitle"])
    $("#thumb").val(data["BrandLogo"])
    $("#company").val(data["CompanyName"])
    $('#money').val(data["Charge"])
    $("#thumb1").val(data["ViewBill"])
    $("#thumb2").val(data["View"])
    $("#postchargetime").val(jsonDateFormat(data["CreateDate"]))

    industryID = data["ParentIndustryID"]
    categoryID = data["IndustryID"]

    loadIndustry()

    loadAllBrandNames(categoryID)

    LoadAllUserNames(data["UserID"])
}


function SaveContract()
{

    if (!check())
    {
        return;
    }

    $.ajax({
        type: "post",
        url: "../ajax/Handler1.ashx?type=SaveContract&ID=" + ID,
        data: CollectContractData(),

        success: function (data)
        {
            msg(data)
        },
        dataType: 'json',
        error: function (XMLHttpRequest, textStatus, errorThrown)
        {
            error(XMLHttpRequest, textStatus, errorThrown)
            //            alert(XMLHttpRequest.status);
            //            alert(XMLHttpRequest.readyState);
            //            alert(textStatus);
        },
        complete: function (XMLHttpRequest, textStatus)
        {

            //  this; // 调用本次AJAX请求时传递的options参数    
        }
    });
}

function CollectContractData()
{

    var obj = {};
    obj.Id = ID

    obj.BrandID = selectBrandID

    obj.Charge = $('#money').val()
    obj.ViewBill = $("#thumb1").val()
    obj.View = $("#thumb2").val()

    obj.CompanyName = $("#company").val();

    obj.CreateDate = $("#postchargetime").val()

    obj.UserID = $('select[name="post[userid]"]').val();

    return JSON.stringify(obj);
}


function LoadMessage()
{


    $.ajax({
        type: "post",
        url: "../ajax/Handler1.ashx?type=LoadMessage&ID=" + ID,

        success: fillMessageDetail,
        dataType: 'json',
        error: function (XMLHttpRequest, textStatus, errorThrown)
        {

            alert(XMLHttpRequest.status);
            alert(XMLHttpRequest.readyState);
            alert(textStatus);
        },
        complete: function (XMLHttpRequest, textStatus)
        {
            //  alert(textStatus);
            this; // 调用本次AJAX请求时传递的options参数    
        }
    });
}
function fillMessageDetail(data)
{
    // Guest  IP:180.99.11.69 来自 江苏 
    var member = String.format("{0} IP:{1} 来自：{2}", data["NameValue"], data["IP"], data["From"])
    $("#member").text(member)

    $("#Ano").prop('checked', data["Ano"])
    $("#content").val(data["Text"])
    if (!data["Ano"])
    {
        $("#name").html(data["NameValue"])
        $("#tel").html(data["Tel"])
        $("#email").html(data["Email"])
        $('#tel').html(data["Tel"])
        $("#qq").html(data["QQ"])
        $("#ali").html(data["Ali"])
        $("#msn").html(data["MSN"])
        $("#skype").html(data["Skype"])
    }

    $("#reply").text(data["Reply"])
    if (data["Shown"])
    {
        $("#show1").attr("checked", "checked");
    }
    else
    {
        $("#show0").attr("checked", "checked");
    }
}

function SaveMessage()
{

    $.ajax({
        type: "post",
        url: "../ajax/Handler1.ashx?type=SaveMessage&ID=" + ID,
        data: CollectMessageData(),

        success: function (data)
        {
            msg(data)
        },
        dataType: 'json',
        error: function (XMLHttpRequest, textStatus, errorThrown)
        {
            error(XMLHttpRequest, textStatus, errorThrown)
            //            alert(XMLHttpRequest.status);
            //            alert(XMLHttpRequest.readyState);
            //            alert(textStatus);
        },
        complete: function (XMLHttpRequest, textStatus)
        {

            //  this; // 调用本次AJAX请求时传递的options参数    
        }
    });
}

function CollectMessageData()
{
    var obj = {};
    obj.Id = ID

    obj.Reply = $("#reply").val()

    obj.Shown = $('#show1').prop('checked')

    return JSON.stringify(obj);
}


function LoadMember()
{


    $.ajax({
        type: "post",
        url: "../ajax/Handler1.ashx?type=LoadMember&ID=" + ID,

        success: fillMemberDetail,
        dataType: 'json',
        error: function (XMLHttpRequest, textStatus, errorThrown)
        {

            alert(XMLHttpRequest.status);
            alert(XMLHttpRequest.readyState);
            alert(textStatus);
        },
        complete: function (XMLHttpRequest, textStatus)
        {
            //  alert(textStatus);
            this; // 调用本次AJAX请求时传递的options参数    
        }
    });
}
function fillMemberDetail(data)
{

    $("#username").val(data["Name"])
    $("#truename").val(data["CName"])
    $("#qq").val(data["QQ"])
    $('#tel').val(data["Tel"])
    $("#num").val(data["MaxCategory"])
    $("#audit_tel").val(data["AuditTel"])
    $("#mail").val(data["AuditEmail"])
    $('#audit_file').val(data["AuditFile"])
}

function SaveMember()
{

    $.ajax({
        type: "post",
        url: "../ajax/Handler1.ashx?type=SaveMember&ID=" + userID,
        data: CollectMemberData(),

        success: function (data)
        {

            msg(data)
        },
        dataType: 'json',
        error: function (XMLHttpRequest, textStatus, errorThrown)
        {
            error(XMLHttpRequest, textStatus, errorThrown)
            //            alert(XMLHttpRequest.status);
            //            alert(XMLHttpRequest.readyState);
            //            alert(textStatus);
        },
        complete: function (XMLHttpRequest, textStatus)
        {

            //  this; // 调用本次AJAX请求时传递的options参数    
        }
    });
}

function CollectMemberData()
{

    var obj = {};
    obj.Id = userID
    obj.Name = $("#username").val()
    obj.CName = $("#truename").val()
    obj.QQ = $("#qq").val()
    obj.Tel = $("#tel").val()
    obj.MaxCategory = $("#num").val()
    obj.AuditTel = $("#audit_tel").val()
    obj.AuditEmail = $("#mail").val()
    obj.AuditFile = $("#audit_file").val()


    return JSON.stringify(obj);
}


function LoadUser(value)
{

    if (value == 0)
    {
        return;
    }
    $.ajax({
        type: "post",
        url: "../ajax/Handler1.ashx?type=LoadUser&ID=" + value,

        success: fillUserDetail,
        dataType: 'json',
        error: function (XMLHttpRequest, textStatus, errorThrown)
        {

            alert(XMLHttpRequest.status);
            alert(XMLHttpRequest.readyState);
            alert(textStatus);
        },
        complete: function (XMLHttpRequest, textStatus)
        {
            //  alert(textStatus);
            this; // 调用本次AJAX请求时传递的options参数    
        }
    });
}
function fillUserDetail(data)
{

    $("#username").val(data["Name"])
    $("#truename").val(data["CName"])
    $("#qq").val(data["QQ"])
    $('#tel').val(data["Tel"])
    $("#num").val(data["MaxCategory"])
    $("#audit_tel").val(data["AuditTel"])
    $("#mail").val(data["AuditEmail"])
    $('#audit_file').val(data["AuditFile"])
}

function SaveUser()
{

    $.ajax({
        type: "post",
        url: "../ajax/Handler1.ashx?type=SaveUser&ID=" + userID,
        data: CollectUserData(),

        success: function (data)
        {

            msg(data)
        },
        dataType: 'json',
        error: function (XMLHttpRequest, textStatus, errorThrown)
        {
            error(XMLHttpRequest, textStatus, errorThrown)
            //            alert(XMLHttpRequest.status);
            //            alert(XMLHttpRequest.readyState);
            //            alert(textStatus);
        },
        complete: function (XMLHttpRequest, textStatus)
        {

            //  this; // 调用本次AJAX请求时传递的options参数    
        }
    });
}

function CollectUserData()
{

    var obj = {};
    obj.Id = userID
    obj.Name = $("#username").val()
    obj.CName = $("#truename").val()
    obj.QQ = $("#qq").val()
    obj.Tel = $("#tel").val()
    obj.MaxCategory = $("#num").val()
    obj.AuditTel = $("#audit_tel").val()
    obj.AuditEmail = $("#mail").val()
    obj.AuditFile = $("#audit_file").val()


    return JSON.stringify(obj);
}


