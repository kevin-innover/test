using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;

namespace BranD10.Pages
{
    public partial class industRanking : System.Web.UI.Page
    {

        public   int pageSize = 20;
        //   public static count pageSize = 20;
        public static int pageCount = 0;

        public static int entityCount = 0;

        static List<Brand> allBrands = DB.Context.From<Model.Brand>().Select().ToList();
        protected void Page_Load(object sender, EventArgs e)
        {
            var a = DB.Context.From<Model.Users>(" Id=2");

            //if (Session["UserName"] == null)
            //{
            //    Response.Redirect("Default.aspx");
            //}
          
            if (!IsPostBack)
            {
                if (pageCount == 0)
                {
                    FreshData();
                }
                Session["pageSize"] = 20;
            }
            else
            {
                pageSize = int.Parse(Request.Form["psize"]);
            }

            if (Request["pageSize"] != null)
            {
                pageSize = int.Parse(Request["pageSize"]);
            }

            if (Request["pageIndex"] != null)
            {
                BindData(int.Parse(Request["pageIndex"]));
            }
            else
            {
                BindData(1);
            }
        }

        /// <summary>
        ///刷新GridView数据
        /// </summary>
        private void BindData(int pageIndex = 1)
        {
            var objs = DB.Context.From<Model.Ranking>();

            Label_page1.Text = string.Format(CommonMethod.PageFormate, entityCount, "&pageSize=" + pageSize, pageIndex - 1, pageIndex + 1, pageCount, pageIndex, pageCount);

            List<Ranking> allRanking = objs.Page(pageSize, pageIndex).ToList();

            this.GridView1.DataSource = allRanking;

            this.GridView1.DataBind();


            HiddenField_CurrentPage.Value = pageIndex.ToString();

        }
        /// <summary>
        ///刷新GridView数据
        /// </summary>
        private void FreshData()
        {
            entityCount = DB.Context.Count<Model.Ranking>("");

            pageCount = CommonMethod.GetPageCount(entityCount, pageSize);

            HiddenField_CurrentPage.Value = "1";
        }

        protected void GridView1_PageIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //防止新索引溢出
            //newPageIndex = newPageIndex < 0 ? 0 : newPageIndex;
            //newPageIndex = newPageIndex >= theGrid.PageCount ? theGrid.PageCount - 1 : newPageIndex;

            //  this.GridView1.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            FreshData();
        }


    }
}