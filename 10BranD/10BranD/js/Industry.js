autoLoadCategory = false
var categoryID = 0
var userCtrlID = '#users'
$(document).ready(function () {
    try {



        var Request = new Object();
        Request = GetRequest();

        var action = Request['action']
       
       
        if (action == 'add') {

            loadIndustry(industryID)
        }
        else if (action == 'edit') {
            //  $("#tr_QRcode").hide() 
            categoryID = Request['ID']
            alert(categoryID)
            loadcategoryDetail(categoryID)

        } else if (action == 'recycle') {

            loadDeleteBrand()
        }
        else if (action == 'delete') {
          var id = Request['ID']
          alert(id)
            
        }
    }
    catch (e) {
        alert("Error---" + e.message);
        alert(e.description)
        alert(e.number)
        alert(e.name)
    }
})
 

function loadcategoryDetail(value) {

    if (value == 0) {
        return;
    }
    $.ajax({
        type: "post",
        url: "../ajax/Handler1.ashx?type=LoadcategoryDetail&ID=" + value,

        success: fillCategoryDetail,
        dataType: 'json',
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert(XMLHttpRequest.status);
            alert(XMLHttpRequest.readyState);
            alert(textStatus);
        },
        complete: function (XMLHttpRequest, textStatus) {
            //  alert(textStatus);
            this; // 调用本次AJAX请求时传递的options参数    
        }
    });
}
function fillCategoryDetail(data) {

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

function SaveCategory() {

    $.ajax({
        type: "post",
        url: "../ajax/Handler1.ashx?type=SaveCategory&ID=" + categoryID,
        data: CollectCategoryData(),

        success: function (data) {
            //  alert('保存' + data['Result'] + '--' + data['Error']);
            msg(data)
        },
        dataType: 'json',
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert(XMLHttpRequest.status);
            alert(XMLHttpRequest.readyState);
            alert(textStatus);
        },
        complete: function (XMLHttpRequest, textStatus) {
            //  alert(textStatus);
            //  this; // 调用本次AJAX请求时传递的options参数    
        }
    });
}

function CollectCategoryData() {
  
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

    if ($("#showerweima").attr("src") == "") {
        obj.QRCodeUrl = $("#showerweima").attr("src")
    }
   
    return JSON.stringify(obj);
}