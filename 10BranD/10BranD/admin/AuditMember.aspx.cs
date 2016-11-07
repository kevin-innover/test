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
    public partial class AuditMember : System.Web.UI.Page
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
            else if (Request["action"] == "auditMany")
            {
                Audit();
            }
            
            BindData( );
        }

        private void Audit()
        {
            List<string> ids = CommonMethod.GetSelectedIDs(GridView1);
            if (ids == null||ids.Count==0)
            {
                return;
            }
            var idstr = string.Join(",", ids);
            int r = DB.Context.Update<Users>(new Field("Audit"), true, string.Format("Id in ({0})", idstr));
            if (r > 0)
            {
                //log
            }
            else
            {
                //log
            }
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

            List<string> ids =CommonMethod. GetSelectedIDs(GridView1);
            if ( ids==null||ids.Count==0)
            {
                return;
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
            List<Users> allUsers = DB.Context.From<Model.Users>().Where(p=>p.IsDelete==false&&p.IsCompany==true&&p.Audit==false).ToList();
            this.GridView1.DataSource = allUsers;

            this.GridView1.DataBind();
        }
    }
}