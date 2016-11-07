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
    public partial class IndustryList : System.Web.UI.Page
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
            if (!string.IsNullOrEmpty(Request["ID"]))
            {
                id = int.Parse(Request["ID"]);
            }
            if (!string.IsNullOrEmpty(Request["PID"]))
            {
                pid = int.Parse(Request["PID"]);
            }

            if (Request["action"] == "delete")
            {
                DeleteIndustry(id);
            }
            else if (Request["action"] == "deleteMany")
            {
                DeleteIndustry();

            }
            else if (Request["action"] == "search")
            {
                var userID = int.Parse(Request.Form["userid"]);
                var status = int.Parse(Request.Form["status"]);
                string kw = Request.Form["kw"];
                if (userID > 0 || status > -1 || !string.IsNullOrEmpty(kw.Trim()))
                {
                    Dosearch(userID, status, kw);
                    return;
                }

            }
            BindData(pid);
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
        private void BindData(int pid)
        {
            List<Industry> allIndustrys = DB.Context.From<Model.Industry>().Where(p => p.ParentID == pid && p.IsDelete == false).ToList();
            int total = DB.Context.Count<Model.Industry>("ParentID>0 and IsDelete=false");
            int c = allIndustrys.Count;
            this.GridView1.DataSource = allIndustrys;

            this.GridView1.DataBind();
            showCount.Text = "分类总数: <strong class='f_red'>" + c + "</strong> 当前目录: <strong class='f_blue'>" + total + "</strong> ";
        }
    }
}