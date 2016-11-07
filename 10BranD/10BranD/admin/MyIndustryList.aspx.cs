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
    public partial class MyIndustryList : System.Web.UI.Page
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
            //            var userID = Session["UserID"].ToString();
            var userID = 1;
            if (!IsPostBack)
            {

            }
            else
            {

            }
            int id = 0;
            int pid = 0; 
            var status = -1;
            if (!string .IsNullOrEmpty(Request.Form["status1"]) )
            {
                status = int.Parse(Request["status1"]);
            } 

            BindData(userID, status);
        }

        private void Dosearch(int userID, int status, string keywords)
        {
            var where = "";
            if (userID > 0)
            {
                where += "UserID=" + userID;
            }
            if (status >= 0)
            {
                if (where != "")
                {
                    where += "and Status=" + status;
                }
                else
                {
                    where += "Status=" + status;
                }
            }
            if (keywords != "")
            {
                if (where != "")
                {
                    where += string.Format("and Name like '%{0}%'", keywords);
                }
                else
                {
                    where += string.Format("Name like '%{0}%'", keywords);
                }
            }
            List<Industry> allIndustrys = DB.Context.From<Model.Industry>().Where(new WhereClip(where)).ToList();

            this.GridView1.DataSource = allIndustrys;

            this.GridView1.DataBind();
        }

        private void DeleteIndustry(int id)
        {
            if (DB.Context.Delete<Industry>(id) > 0)
            {
                //log
            }
            else
            {
                //log
            }
        }
        private void DeleteIndustry()
        {

            List<string> ids = new List<string>();
            foreach (GridViewRow row in GridView1.Rows)
            {
                CheckBox CheckBox = (CheckBox)row.FindControl("CheckBox1");//找到CheckBox
                if (CheckBox == null)
                {
                    return;
                }
                if (CheckBox.Checked == true)//判断是否选中
                {
                    var id = this.GridView1.DataKeys[row.RowIndex].Value.ToString();
                    ids.Add(id);
                }
            }
            var idstr = string.Join(",", ids);
            int r = DB.Context.Update<Industry>(new Field("IsDelete"), true, string.Format("Id in ({0})", idstr));
            if (r > 0)
            {
                //log
            }
            else
            {
                //log
            }
        }
        /// <summary>
        ///刷新GridView数据
        /// </summary>
        private void BindData(int userid, int status)
        {
            var allIndustrys = DB.Context.From<Model.Industry>().Where(p => p.UserID == userid&&p.ParentID>0);
            if (status > -1)
            {
                allIndustrys = allIndustrys.Where(p => p.Status == status);
            }

            this.GridView1.DataSource = allIndustrys.ToList();

            this.GridView1.DataBind();
        }
    }
}