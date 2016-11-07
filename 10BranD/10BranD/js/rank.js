
$(document).ready(function () {
    try {
        var Request = new Object();
        Request = GetRequest();

        var action = Request['action']
        if (action == 'add') {
            brandID = 0;

        }
        else if (action == 'edit') {
            rankID = Request['ID']
        
            loadRank(rankID)
        }
    }
    catch (e) {
        alert("Error---" + e.message);
        alert(e.description)
        alert(e.number)
        alert(e.name)
    }
})



function loadRank(id) {

    $.ajax({
        type: "post",
        url: "../ajax/Handler1.ashx?type=LoadRank&ID=" + id  ,

        success: fillRankTable,
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

function fillRankTable(data) {

    brandID = data["BrandID"]

    $("#title").val(data["BrandName"])
    $("#thumb").val(data["LogoPathValue"])
    $("#thumb1").val(data["LOGO1"])
    $("#thumb2").val(data["LOGO2"])
    $("#mailinfo").val(data["MailAddr"])
    $("#homepage").val(data["Websit"])
    $("#viewURL").attr('href', data["Websit"]);

    $("#company").val(data["CompanyName"])
    $("#address").val(data["Addr"])

    var status = data["Status"]
    $("input[name='post[status]'][value='" + status + "']").attr("checked", "checked");

}


function SaveRank() {
 
 if (check()) {
  
        $.ajax({
            type: "post",
            url: "../ajax/Handler1.ashx?type=SaveRank&ID=" + rankID,
            data: CollectData(),

            success: function (data) {
                msg(data)
                //  alert('保存' + data['Result'] + '--' + data['Error']);
            },
            dataType: 'json',
            error: function (XMLHttpRequest, textStatus, errorThrown) {

                alert(XMLHttpRequest.status);
                alert(XMLHttpRequest.readyState);
                alert(textStatus);
            },
            complete: function (XMLHttpRequest, textStatus) {
                  alert('保存完成');
                //  this; // 调用本次AJAX请求时传递的options参数    
            }
        });
    }

}

function CollectData() {

    var rank = {};
    rank.Id = rankID;
    rank.BrandID = brandID;
    rank.BrandName = $("#title").val();
    rank.LogoPath = $("#thumb").val();
    alert(rank.LogoPath)
    rank.LOGO1 = $("#thumb1").val();
    rank.LOGO2 = $("#thumb2").val();
    rank.MailAddr = $("#mailinfo").val();
    rank.Websit = $("#homepage").val();
    rank.CompanyName = $("#company").val();
    rank.Addr = $("#address").val();

    rank.Status = $("input[name='post[status]']:checked").val()

    return JSON.stringify(rank);
}
function uploadFile() {

    var url = $('input[name="post[thumb]"]').val()

    ymPrompt.win('../admin/uploadFile.aspx?brandID=' + brandID + "&url=" + url, 300, 220, '上传文件', null, null, null, true)

}


 

 


