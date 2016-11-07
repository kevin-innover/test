
  var year , industryID 
        $(document).ready(function () {
    try {
        IndustryCtrlID = '#bigIndustry'

        var Request = new Object();
        Request = GetRequest();
          year = Request['y']
          industryID = Request['i']
      
        loadRankList(rankID)
    }
    catch (e) {
        alert("Error---" + e.message);
        alert(e.description)
        alert(e.number)
        alert(e.name)
    }
})



function loadRankList(id) {

    $.ajax({
        type: "get",
        url: "../ajax/Handler1.ashx?type=loadRankList&year=" + year + "&industryID=" + industryID,

        success: fillloadRankList,
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

function fillloadRankList(data) {
  
//    <div class="item">
//<div class="ranking">1 辽霸</div>
//<div class="left"><a href="/brand/show-htm-itemid-52385.html" target="_blank"><img src="http://pic.10brandchina.com/201609/06/18-00-10-119-40916.jpg" alt="辽霸" width="128" height="68" /></a></div>
//<div class="right">
//<strong>盘锦金社裕农农产品连锁有限公司</strong><br />
//网址：<a href="http://www.jsynjt.com/" target="_blank">http://www.jsynjt.com/</a><br />
//</div>
//</div>
    var rankDesc = "";
    var brandPage="showBrand.html"
    $(data).each(function (index) {
      //  var v = $(this)[0]["Id"]
        var brandname = $(this)[0]["BrandName"]
        var LogoPath = $(this)[0]["LogoPath"]
        var CompanyName = $(this)[0]["CompanyName"]
        var Websit = $(this)[0]["Websit"]
        var Addr = $(this)[0]["Addr"]
       
       rankDesc += '<div class="item">'
        rankDesc += String.format('<div class="ranking">{0} {1}</div>', index, brandname)
        rankDesc += String.format('<div class="left"><a href="{0}" target="_blank"><img src="{1}" alt="{2}" width="128" height="68" /></a></div>', brandPage, LogoPath, brandname)
        rankDesc += '<div class="right">'
        rankDesc += String.format('<strong>{0}</strong><br />', CompanyName)
        rankDesc += String.format('网址：<a href="{0}" target="_blank">{0}</a><br />', Websit)
        rankDesc += Addr+'</div>'
        rankDesc += '</div>'

    });
  //  alert($("div .item:first").html())
   // alert($("div .bshare-custom").html())
   // alert($("div .item_bg").html())
    // alert($("div .item_bg:first").html())

    $("div.item_bg").append(rankDesc)
   //  alert(rankDesc)
} 