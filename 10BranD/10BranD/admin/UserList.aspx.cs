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
    public partial class UserList : System.Web.UI.Page
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
            

            if (Request["action"] == "delete")
            {
                Delete(id);
            }
            else if (Request["action"] == "deleteMany")
            {
                Delete();

            }
            
            BindData( );
        }


        private void Delete(int id)
        {
            if (DB.Context.Update<Users>(new Field("IsDelete"), true, string.Format("Id = ({0})", id)) > 0)
            {
                //log
            }
            else
            {
                //log
            }
        }
        private void Delete()
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
            int r = DB.Context.Update<Users>(new Field("IsDelete"), true, string.Format("Id in ({0})", idstr));
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
        private void BindData( )
        {
            List<Users> allUsers = DB.Context.From<Model.Users>().Where(p => p.IsDelete == false && p.IsCompany == false).ToList();
            this.GridView1.DataSource = allUsers;

            this.GridView1.DataBind();
        }
    }
}