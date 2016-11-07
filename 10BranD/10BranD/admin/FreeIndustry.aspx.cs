using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using Dos.ORM;
namespace BranD10.Pages
{
    public partial class FreeIndustry : System.Web.UI.Page
    {
        public static int pageSize = 20;
        public static int pageCount = 0;
        public static int entityCount = 0;
        static List<Industry> allBrands = DB.Context.From<Model.Industry>().Select().ToList();
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
            int id = 0;
            int pid = 0;
            
            BindData( );
        }
       
 
        /// <summary>
        ///刷新GridView数据
        /// </summary>
        private void BindData( )
        {
            List<Industry> allIndustrys = DB.Context.From<Model.Industry>().Where(p =>  p.IsDelete == false&&p.UserID==0).ToList();

            this.GridView1.DataSource = allIndustrys;

            this.GridView1.DataBind();
        }
    }
}