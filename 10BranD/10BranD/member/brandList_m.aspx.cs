using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;

namespace BranD10.Pages
{
    public partial class brandList_m : System.Web.UI.Page
    {
        private string action;
        private int pageSize = 20;
        private int pageIndex = 1;
        private int industryID = -1;
        private int orderBy = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            var a = DB.Context.From<Model.Users>(" Id=2");

            //if (Session["UserName"] == null)
            //{
            //    Response.Redirect("Default.aspx");
            //}
            if (!IsPostBack)
            {
               
            }
            else
            {

            }
         //   Request.Url
           // Request.Url.OriginalString ,
            action = Request["action"];

            if (Request["psize"] != null)
            {
                pageSize = int.Parse(Request["psize"]);
            }

            if (Request["pageIndex"] != null)
            {
                pageIndex = int.Parse(Request["pageIndex"]);
            }

          
            if (Request["order"] != null)
            {
                orderBy = int.Parse(Request["order"]);
            }

  if (Request["industryID"] != null)
            {
                industryID = int.Parse(Request["industryID"]);
            }
            BindData();
        }

        /// <summary>
        ///刷新GridView数据
        /// </summary>
        private void BindData()
        {
            var status = BrandStatusEnum.Pass;
            switch (action)
            {
                case "check": status = BrandStatusEnum.WaitAudit; break;
                case "recycle": status = BrandStatusEnum.Delete; break;
                case "reject": status = BrandStatusEnum.Reject; break;
                default: break;
            }
            
            var brands = DB.Context.From<Model.Brand>().Where(p => p.Status == (int)status);

          

           // brands = DB.Context.From<Model.Brand>().Where(p => p.IndustryID == (int));


           var entityCount = brands.Count();
           var pageCount = (entityCount + pageSize-1) / pageSize;

            var pageFormate = "共 {0} 条 <a  href='?pageIndex=1{1}' >首页</a> <a href='?pageIndex={2}{1}'>上一页</a> <a href='?pageIndex={3}{1}'>下一页</a>  <a href='?pageIndex={4}{1}'>尾页</a> 当前第  {5} 页/共 {6} 页";
            var addFormate =  "&order={0}&action={1}{2}";
            if (industryID > -1)
            {
                addFormate = string.Format(addFormate, orderBy, action, "&industryID=" + industryID);

                brands = brands.Where(p => p.IndustryID == industryID);
                Label_page1.Text = string.Format(pageFormate, entityCount, addFormate, pageIndex - 1, pageIndex + 1, pageCount, pageIndex, pageCount);
            }
            else
            {
                addFormate = string.Format(addFormate, orderBy, action, "");

                Label_page1.Text = string.Format(pageFormate, entityCount, addFormate, pageIndex - 1, pageIndex + 1, pageCount, pageIndex, pageCount);
            }
            List<Brand> allBrands = brands.Page(pageSize, pageIndex).ToList();

            switch (orderBy)
            {
                //更新时间降序
                case 1: allBrands = allBrands.OrderByDescending(p => p.UpdateTime).ToList(); break;
                case 2: allBrands = allBrands.OrderByDescending(p => p.TotalTickets).ToList(); break;
                default: break;
            }

            this.GridView1.DataSource = allBrands;

            this.GridView1.DataBind();


            HiddenField_CurrentPage.Value = pageIndex.ToString();

        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }


    }
}