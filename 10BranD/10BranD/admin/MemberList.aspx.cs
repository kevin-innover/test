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
    public partial class MemberList : System.Web.UI.Page
    {
        private int  pageSize = 20;
        private int  pageCount = 0;
        private int  entityCount = 0;
        private int orderBy = 0;
        private int pageIndex = 1;
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
            if (Request["order"] != null)
            {
                orderBy = int.Parse(Request["order"]);
            }
            if (Request["pageIndex"] != null)
            {
                pageIndex = int.Parse(Request["pageIndex"]);
            }
            if (Request["page"] == "audit")
            { 
            
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
        

            List<Users> allUsers = DB.Context.From<Model.Users>().Where(p => p.IsDelete == false && p.IsCompany == true && p.Audit == true).ToList();

            var entityCount = allUsers.Count();
            var pageCount = (entityCount + pageSize - 1) / pageSize;

            var pageFormate = "共 {0} 条 <a  href='?pageIndex=1{1}' >首页</a> <a href='?pageIndex={2}{1}'>上一页</a> <a href='?pageIndex={3}{1}'>下一页</a>  <a href='?pageIndex={4}{1}'>尾页</a> 当前第  {5} 页/共 {6} 页";
            var addFormate = "&order={0}&action={1}{2}";

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

            //switch (orderBy)
            //{
            //    //更新时间降序
            //    case 1: allBrands = allBrands.OrderByDescending(p => p.UpdateTime).ToList(); break;
            //    case 2: allBrands = allBrands.OrderByDescending(p => p.TotalTickets).ToList(); break;
            //    default: break;
            //}

            this.GridView1.DataSource = allUsers;

            this.GridView1.DataBind();
        }
    }
}