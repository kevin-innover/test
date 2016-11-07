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
    public partial class AuditCompany : System.Web.UI.Page
    {

        public string action;
        public int pageSize = 20;
        public int pageIndex = 1;
        public int industryID = -1;

        public string page = "";
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
            if (Request["psize"] != null)
            {
                pageSize = int.Parse(Request["psize"]);
            }

            if (Request["pageIndex"] != null)
            {
                pageIndex = int.Parse(Request["pageIndex"]);
            }

            if (!string.IsNullOrEmpty(Request["page"]))
            {
                page = Request["page"];
            }

            else if (Request["action"] == "pass")
            {
                Audit(true, null);
            }
            else if (Request["action"] == "reject")
            {
                var reason = Request["reason"];
                Audit(false, reason);
            }
            else if (Request["action"] == "cancel")
            {
                //  Cancel();
            }

            BindData();
        }

        private void Audit(bool pass, string rejectReason)
        {
            List<string> ids = CommonMethod.GetSelectedIDs(GridView1);
            if (ids == null || ids.Count == 0)
            {
                return;
            }
            var idstr = string.Join(",", ids);

            var fields = new Field[] { new Field("Audit"), new Field("RejectReason"), new Field("AuditUserID") };
            var values = new object[] { pass, rejectReason, Session[CommonMethod.S_UserID] };
            var r = DB.Context.Update<Company>(fields, values, string.Format("Id in ({0})", idstr));

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
        private void BindData()
        {
            //    List<Users> allUsers = DB.Context.From<Model.Company>().Where(p => p.IsDelete == false && p.IsCompany == true && p.Audit == false).ToList();
            var objs = DB.Context.From<Model.Company>().ToList();


            var entityCount = objs.Count();
            var pageCount = (entityCount + pageSize - 1) / pageSize;

            var pageFormate = "共 {0} 条 <a  href='?pageIndex=1{1}' >首页</a> <a href='?pageIndex={2}{1}'>上一页</a> <a href='?pageIndex={3}{1}'>下一页</a>  <a href='?pageIndex={4}{1}'>尾页</a> 当前第  {5} 页/共 {6} 页";
            //var addFormate = "&order={0}&action={1}{2}";
            //if (industryID > -1)
            //{
            //    addFormate = string.Format(addFormate, orderBy, action, "&industryID=" + industryID);

            //    brands = brands.Where(p => p.IndustryID == industryID);
            //    Label_page1.Text = string.Format(pageFormate, entityCount, addFormate, pageIndex - 1, pageIndex + 1, pageCount, pageIndex, pageCount);
            //}
            //else
            //{
            //    addFormate = string.Format(addFormate, orderBy, action, "");

            //    Label_page1.Text = string.Format(pageFormate, entityCount, addFormate, pageIndex - 1, pageIndex + 1, pageCount, pageIndex, pageCount);
            //}
            Label_page1.Text = string.Format(pageFormate, entityCount, "", pageIndex - 1, pageIndex + 1, pageCount, pageIndex, pageCount);

            this.GridView1.DataSource = objs;

            this.GridView1.DataBind();
        }
    }
}