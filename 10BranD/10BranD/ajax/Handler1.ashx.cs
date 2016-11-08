using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using Model;
using Dos.ORM;
using System.Web.SessionState;
using System.IO;
using System.Drawing;
using System.Threading;

namespace BranD10.Ajax
{
    /// <summary>
    /// Handler1 的摘要说明
    /// </summary>
    public class Handler1 : IHttpHandler, IRequiresSessionState
    {
        JavaScriptSerializer serializer = new JavaScriptSerializer();
        private object getResult(bool result, string error)
        {
            var response = new
            {
                result = result,
                error = error
            };
            return response;
        }

        public void ProcessRequest(HttpContext context)
        {
            // context.Response.ContentType = "text/plain";
            var type = context.Request.QueryString["type"];
            int id = 0;
            Int32.TryParse(context.Request.QueryString["ID"], out id);
            bool result = false;
            string error = "";
            bool needReturn = false;
            try
            {
                #region

                if (type == "LoadBrand")
                {
                    result = LoadBrand(context, id);
                }
                
                else if (type == "SaveTicket")
                {//post new data
                    result = SaveTicket(context, id);
                }
                else if (type == "SearchCategory")
                {//post new data
                    result = SearchCategory(context, id);
                }
                else if (type == "CheckMember")
                {//post new data
                    result = CheckMember(context, out error);
                }

                else if (type == "GetCheckCode")
                {//post new data
                    CreateCheckCodeImage(context);
                }
                else if (type == "CheckCode")
                {//post new data
                    var code = context.Request.QueryString["code"];
                    result = context.Session["checkCode"].ToString().ToLower() == code.ToLower();
                    context.Session["checkCodeDateTime"] = DateTime.Now;
                }
                else if (type == "SaveBrand")
                {//post new data
                    result = SaveBrand(context, id);
                }
                else if (type == "SaveFrequency")
                {//post new data
                    result = SaveFrequency(context, id);
                }
                else if (type == "LoadIndustry")
                {//post new data
                    result = LoadIndustry(context, id);
                }

                else if (type == "LoadSubIndustry")
                {//post new data
                    result = LoadSubIndustry(context, id);
                }

                else if (type == "LoadcategoryDetail")
                {//post new data
                    result = LoadcategoryDetail(context, id);
                }
                else if (type == "SaveCategory")
                {//post new data
                    result = SaveCategory(context, id);
                }
                else if (type == "LoadAllUserNames")
                {//post new data
                    result = LoadAllUserNames(context, id);
                }
                else if (type == "LoadRank")
                {//post new data
                    result = LoadRank(context, id);
                }
                else if (type == "SaveRank")
                {//post new data
                    result = SaveRank(context, id);
                }
                else if (type == "loadRankList")
                {//post new data
                    result = loadRankList(context, id);
                }
                else if (type == "loadBrandList")
                {//post new data
                    result = loadBrandList(context, id);
                }
                else if (type == "loadBrandList")
                {//post new data
                    result = loadBrandList(context, id);
                }
                else if (type == "LoadUser")
                {//post new data
                    result = LoadUser(context, id);
                }
                else if (type == "SaveUser")
                {//post new data
                    result = SaveUser(context, id);
                }
                else if (type == "LoadMember")
                {//post new data
                    result = LoadMember(context, id);
                }
                else if (type == "SaveMember")
                {//post new data
                    result = SaveMember(context, id);
                }
                else if (type == "LoadMessage")
                {//post new data
                    result = LoadMessage(context, id);
                }
                else if (type == "SaveMessage")
                {//post new data
                    result = SaveMessage(context, id);
                }
                else if (type == "LoadContract")
                {//post new data
                    result = LoadContract(context, id);
                }
                else if (type == "SaveContract")
                {//post new data
                    result = SaveContract(context, id);
                }
                else if (type == "loadAllBrandNames")
                {//post new data
                    result = loadAllBrandNames(context, id);
                }
                else if (type == "loadCurrentUsername")
                {//post new data
                    context.Response.Write(context.Session["UserName"].ToString());
                }
                #endregion

            }
            catch (Exception ex)
            {

                result = false;
                error = ex.Message;
            }

            //??info 如果 出错，返回错误信息
            if (type.StartsWith("Save") || type.StartsWith("Check"))
            {
                var json = serializer.Serialize(getResult(result, error));
                context.Response.Write(json);
            }
        }

        private bool SearchCategory(HttpContext context, int id)
        {
            var name = context.Request.QueryString["name"];
            var objs = DB.Context.From<Model.Industry>().Where(p => p.ParentID > 0 && p.Name.Contains(name)).ToList();
            var html="";
            if (objs.Count>0)
            {
                  html+=@"<span>";
               html+=@"<input type=""button"" value=""关闭"" onclick=""Dh('catesch');""/></br>";
               html+=@"<span style=""font-weight:bold;"">为您找到以下相关分类，请选择:</span></br>";
          foreach (var cate in objs)
	{
              var status=((IndustryStatusEnum)cate.Status).ToString();
              html += string.Format(@"<input type=""radio"" name=""post_fields[captcha]"" value=""0"" id=""captcha_0"" onclick=""selectCate({3},{4})""/>{0}》{1}【{2}】<br/>", cate.ParentName, cate.Name, status, cate.ParentID, cate.Id);
	}
 html+=@"</span>";
            }

            context.Response.Write(html);
            return true;
        }

        private bool CheckMember(HttpContext context, out string error)
        {
            error = "";
            var job = context.Request.QueryString["job"];
            var v = context.Request.QueryString["value"];
            int c = 0;
            switch (job)
            {
                case "mobile":
                    c = DB.Context.From<Model.Users>().Where(p => p.IsCompany && p.Tel == v).Count();
                    if (c > 0)
                    {
                        error = "此手机号已经注册，请联系管理员！";
                        return false;
                    }
                    break;
                case "brand":
                    var cateID = context.Request.QueryString["cateID"];
                    
                    c = DB.Context.From<Model.Brand>().Where(p => p.IndustryID==int.Parse(cateID) && p.Name == v).Count();
                    if (c > 0)
                    {
                        error = "此品牌名称已经存在，请联系管理员！";
                        return false;
                    }
                    break;
                case "vcompany":
                    c = DB.Context.From<Model.Company>().Where(p => p.Name == v).Count();
                    if (c > 0)
                    {
                        error = "公司名称已经存在，请联系管理员！";
                        return false;
                    }
                    break;
                case "SendSCode":
                    long mobile = 0;
                    if (v.Length != 11 || !v.StartsWith("1") || !long.TryParse(v, out mobile))
                    {
                        error = "此手机号输入格式错误！";
                        return false;
                    }

                    c = DB.Context.From<Model.Users>().Where(p => p.IsCompany && p.Tel == v).Count();
                    if (c > 0)
                    {
                        error = "此手机号已经注册，请联系管理员！";
                        return false;
                    }
                    var code = context.Request.QueryString["code"];
                    if (context.Session["checkCodeDateTime"] != null)
                    {
                        var last = DateTime.Parse(context.Session["checkCodeDateTime"].ToString());
                        if ((DateTime.Now - last).TotalSeconds > CommonMethod.CheckCodeTimeOut || context.Session["checkCode"].ToString().ToLower() != code.ToLower())
                        {
                            error = "验证码不正确或已失效，请点击验证码更换后再试！";
                            return false;
                        }
                    }

                    if (context.Session["mobileCodeSendTime"] != null)
                    {
                        var last = DateTime.Parse(context.Session["mobileCodeSendTime"].ToString());
                        if ((DateTime.Now - last).TotalSeconds < CommonMethod.MobileCodeMinInterval)
                        {
                            error = "短信发送过快，请过几分钟后再试！";
                            return false;
                        }
                    }

                    if (context.Session["mobileCodeErrorTimes"] != null)
                    {
                        var errorTimes = Int32.Parse(context.Session["mobileCodeErrorTimes"].ToString());

                        if (errorTimes > 6)
                        {
                            if (context.Session["mobileCodeErrorTime"] != null)
                            {
                                var errorOverTime = DateTime.Parse(context.Session["mobileCodeErrorOverTime"].ToString());
                                if ((DateTime.Now - errorOverTime).TotalMinutes > CommonMethod.MobileCodeErrorClearInterval)
                                {
                                    context.Session["mobileCodeErrorTimes"] = 0;
                                }
                                else
                                {
                                    //次数超了，并且不需要清零
                                    error = "当前IP尝试发送次数太多，请过几分钟后再试！";
                                    return false;
                                }
                            }
                            else
                            {
                                context.Session["mobileCodeErrorTime"] = DateTime.Now;
                                error = "当前IP尝试发送次数太多，请过几分钟后再试！";
                                return false;
                            }
                        }
                    }

                    string mobilecode = "";
                    if (CommonMethod.SendCode(v, ref mobilecode))
                    {
                        context.Session["mobileCode"] = mobilecode;
                        context.Session["mobileCodeSendTime"] = DateTime.Now;
                    }
                    else
                    {
                        error = "发送失败，请稍后重试！";
                        return false;
                    }
                    break;

                default:
                    error = "发生错误，请联系管理员！";
                    return false;
                    break;
            }
            return true;
        }


        private bool SaveTicket(HttpContext context, int id)
        {
            string json = context.Request.Form[0].ToString();

            Ticket ticket = serializer.Deserialize<Ticket>(json);

            //ticket.CreateTime = DateTime.Now;

            var r = DB.Context.Insert<Ticket>(ticket);
            DB.Context.Insert<Ticketcache>(ticket.ToTicketcache());
            return r > 0;
        }

        private bool loadAllBrandNames(HttpContext context, int id)
        {
            var objs = DB.Context.From<Model.Brand>().Where(p => p.IndustryID == id).ToList();

            var json = serializer.Serialize(objs);
            context.Response.Write(json);
            return true;
        }

        private bool SaveContract(HttpContext context, int id)
        {
            string json = context.Request.Form[0].ToString();

            var obj = serializer.Deserialize<Contract>(json);

            if (id > 0)
            {
                // update 

                //??check
                //   obj.CreateDate = DateTime.Now;
                int r = DB.Context.Update<Contract>(obj);

                return r > 0;
            }
            else
            {
                // new
                obj.CreateDate = DateTime.Now;
                var r = DB.Context.Insert<Contract>(obj);

                return r > 0;
            }
        }

        private bool LoadContract(HttpContext context, int id)
        {
            var objs = DB.Context.From<Model.Contract>().Where(p => p.Id == id).First();

            var json = serializer.Serialize(objs);
            context.Response.Write(json);
            return true;
        }

        private bool LoadMessage(HttpContext context, int id)
        {
            var objs = DB.Context.From<Model.Message>().Where(p => p.Id == id).First();

            var json = serializer.Serialize(objs);
            context.Response.Write(json);
            return true;
        }
        private bool SaveMessage(HttpContext context, int id)
        {
            string json = context.Request.Form[0].ToString();

            var obj = serializer.Deserialize<Message>(json);

            if (id > 0)
            {
                // update 

                //??check
                //   obj.CreateDate = DateTime.Now;
                int r = DB.Context.Update<Message>(obj);

                return r > 0;
            }
            else
            {
                // new
                obj.CreateDate = DateTime.Now;
                var r = DB.Context.Insert<Message>(obj);

                return r > 0;
            }
        }
        private bool SaveMember(HttpContext context, int id)
        {
            string json = context.Request.Form[0].ToString();

            var obj = serializer.Deserialize<Users>(json);

            if (id > 0)
            {
                // update 

                //??check
                obj.UpdateTime = DateTime.Now;
                int r = DB.Context.Update<Users>(obj);

                return r > 0;
            }
            else
            {
                // new
                obj.CreateTime = DateTime.Now;
                var r = DB.Context.Insert<Users>(obj);

                return r > 0;
            }
        }

        private bool LoadMember(HttpContext context, int id)
        {
            var objs = DB.Context.From<Model.Users>().Where(p => p.Id == id && p.IsCompany == true).First();

            var json = serializer.Serialize(objs);
            context.Response.Write(json);
            return true;
        }

        private bool SaveUser(HttpContext context, int id)
        {
            string json = context.Request.Form[0].ToString();

            var obj = serializer.Deserialize<Users>(json);

            if (id > 0)
            {
                // update 

                //??check
                obj.UpdateTime = DateTime.Now;
                int r = DB.Context.Update<Users>(obj);

                return r > 0;
            }
            else
            {
                // new
                obj.CreateTime = DateTime.Now;
                var r = DB.Context.Insert<Users>(obj);

                return r > 0;
            }
        }

        private bool loadBrandList(HttpContext context, int id)
        {
            var action = context.Request.QueryString["action"];

            var status = BrandStatusEnum.Pass;
            switch (action)
            {
                case "check": status = BrandStatusEnum.WaitAudit; break;
                case "recycle": status = BrandStatusEnum.Delete; break;
                case "reject": status = BrandStatusEnum.Reject; break;
                default: break;
            }
            ;
            var brands = DB.Context.From<Model.Brand>().Where(p => p.Status == (int)status).ToList();

            var json = serializer.Serialize(brands);
            context.Response.Write(json);
            return true;
        }

        private bool loadRankList(HttpContext context, int id)
        {
            var year = int.Parse(context.Request.QueryString["year"]);
            var industryID = int.Parse(context.Request.QueryString["industryID"]);
            var objs = DB.Context.From<Model.Brandranking>().Where(p => p.Year == year && p.IndustryID == industryID).ToList();

            var json = serializer.Serialize(objs);
            context.Response.Write(json);
            return true;
        }

        private bool LoadRank(HttpContext context, int id)
        {
            var objs = DB.Context.From<Model.Brandranking>().Where(p => p.Id == id).First();

            var json = serializer.Serialize(objs);
            context.Response.Write(json);
            return true;
        }
        private bool SaveRank(HttpContext context, int id)
        {
            string json = context.Request.Form[0].ToString();
            var obj = serializer.Deserialize<Brandranking>(json);
            if (id > 0)
            {
                obj.UpdateTime = DateTime.Now;
                int r = DB.Context.Update<Brandranking>(obj);

                var r2 = DB.Context.Update<Brand>(new Field("ImagePath"), obj.ImagePath, "Id=" + obj.BrandID);
                return r > 0;
            }
            else
            {
                var r = DB.Context.Insert<Brandranking>(obj);
                return r > 0;
            }

        }

        private bool LoadAllUserNames(HttpContext context, int id)
        {
            var objs = DB.Context.From<Model.Users>().Select(new Field("Id"), new Field("CName")).ToList();

            var json = serializer.Serialize(objs);
            context.Response.Write(json);
            return true;
        }
        private bool LoadUser(HttpContext context, int id)
        {
            var objs = DB.Context.From<Model.Users>().Where(p => p.Id == id && p.IsCompany == false).First();

            var json = serializer.Serialize(objs);
            context.Response.Write(json);
            return true;
        }
        private bool SaveCategory(HttpContext context, int id)
        {
            string json = context.Request.Form[0].ToString();
            var obj = serializer.Deserialize<Industry>(json);
            if (id > 0)
            {
                // update

                //check
                //??
                //save
                //if (string.IsNullOrEmpty(obj.QRCodeUrl))
                //{
                //    reQRImage()
                //}
                int r = DB.Context.Update<Industry>(obj);

                if (r > 0 && obj.Status == (int)IndustryStatusEnum.揭榜)
                {
                    //创建榜单
                    obj.CreateRank();
                    return r > 0;
                }

            }
            else
            {
                // new
                obj.CreateTime = DateTime.Now;
                obj.QRCodeUrl = "";



                var r = DB.Context.Insert<Industry>(obj);
                if (r > 0)
                {
                    var _id = DB.Context.Max<Industry>(new Field("Id"), "");
                    int newID = int.Parse(_id.ToString());
                    var url = CommonMethod.CategoryDomain + newID;

                    string relativeFileName = Path.Combine(CommonMethod.UploadFolder_QR, newID + ".jpg");
                    var localFileName = context.Server.MapPath(relativeFileName);
                    CommonMethod.CheckFileName(localFileName);

                    BranD10.QRcodecs.CreateCode_Choose(url, localFileName);
                    //  Field field, object value, Where where
                    DB.Context.Update<Industry>(obj);

                    r = DB.Context.Update<Industry>(new Field("QRCodeUrl"), relativeFileName, "Id=" + newID);
                    if (r > 0)
                    {

                    }
                    else
                    {

                    }
                }
            }
            return true;
        }

        private bool LoadcategoryDetail(HttpContext context, int id)
        {
            var category = DB.Context.From<Model.Industry>().Where(p => p.Id == id).First();
            //   var IndustryList = DB.Context.From<Model.Industry>().Select().ToList();
            if (category != null)
            {
                var json = serializer.Serialize(category);
                context.Response.Write(json);
                return true;
            }
            else
            {
                return false;
            }
        }

        private bool SaveFrequency(HttpContext context, int id)
        {
            var fid = context.Request.QueryString["Fid"];
            var v = context.Request.QueryString["v"];
            var fileName = "AutoFrequency" + fid;
            var r = DB.Context.Update<Brand>(new Field(fileName), v, "Id=" + id);
            if (r == 0)
            {
                return false;
            }

            var brand = DB.Context.From<Model.Brand>().Where(p => p.Id == id).First();

            TicketManager.Instance.RefreshTime(brand);
            return true;
        }
        private bool SaveBrand(HttpContext context, int id)
        {
            string json = context.Request.Form[0].ToString();
            var brand = serializer.Deserialize<Brand>(json);
            updateBrandCompany(brand);
            if (id > 0)
            {
                // update 

                //??check

                int r = DB.Context.Update<Brand>(brand);

                return r > 0;
            }
            else
            {
                // new
                brand.CreateTime = DateTime.Now;
                brand.AutoFrequency1 = 0;
                brand.AutoFrequency2 = 1;
                brand.CreatorUserID = Int32.Parse(context.Session[CommonMethod.S_UserID].ToString());
                
                var user=(context.Session[CommonMethod.S_User] as Users);
                if (user.IsCompany)
                {
                    brand.Status = (int)BrandStatusEnum.WaitAudit;
                    brand.MemberID = user.Id;
                }
                else
                {
                    brand.CreatorUserID = user.Id;
                }
                var r = DB.Context.Insert<Brand>(brand);

                return r > 0;
            }
        }

        private void updateBrandCompany(Brand brand)
        {
            var company = DB.Context.From<Model.Company>().Where(p => p.Name == brand._CompanyName).First();

            if (company != null)
            {
                company.Addr = brand._Addr;
                company.Name = brand._CompanyName;
                company.CRegisterNumber = brand._CRegisterNumber;

                int c = DB.Context.Update<Company>(company);
                if (c == 0)
                {
                    //log update Brand.Company failed
                }
            }
            else
            {
                company = new Company();
                company.Addr = brand._Addr;
                company.Name = brand._CompanyName;
                company.CRegisterNumber = brand._CRegisterNumber;

                int c = DB.Context.Insert<Company>(company);
                if (c > 0)
                {
                    //log update Brand.Company failed
                    company = DB.Context.From<Model.Company>().Where(p => p.Name == company.Name).First();
                    brand.CompanyID = company.Id;
                }
            }
        }



        private bool LoadIndustry(HttpContext context, int id)
        {

            // var IndustryList = DB.Context.From<Model.Industry>().Where(p => p.ParentID == 0).Select(new Field("Id"), new Field("Name"), new Field("ParentID")).ToList();
            var IndustryList = DB.Context.From<Model.Industry>().Where(p => p.ParentID == 0).Select(new Field("Id"), new Field("Name")).ToList();

            var json = serializer.Serialize(IndustryList);
            context.Response.Write(json);
            return true;

        }
        private bool LoadSubIndustry(HttpContext context, int parentID)
        {

            var IndustryList = DB.Context.From<Model.Industry>().Where(p => p.ParentID == parentID).Select(new Field("Id"), new Field("Name")).ToList();

            var json = serializer.Serialize(IndustryList);
            context.Response.Write(json);
            return true;

        }

        private bool LoadBrand(HttpContext context, int id)
        {
            var brand = DB.Context.From<Model.Brand>().Where(p => p.Id == id).First();

            var json = serializer.Serialize(brand);
            context.Response.Write(json);
            return true;

        }

        private void CreateCheckCodeImage(HttpContext context)
        {
            string Code = "";

            int codeNum = 4;

            System.Random random = new Random();
            string str = "123456789ABCDEFGHIJKLMNPQRSTUVWXYZ";


            for (int i = 1; i <= codeNum; i++)
            {
                Code = Code + str[random.Next(0, str.Length - 1)];
            }
            context.Session["checkCode"] = Code.ToLower();

            System.Drawing.Bitmap image = new System.Drawing.Bitmap((int)Math.Ceiling((Code.Length * 12.5)), 22);
            Graphics g = Graphics.FromImage(image);

            try
            {
                //清空图片背景色
                g.Clear(Color.White);

                //画图片的背景噪音线
                for (int i = 0; i < 3; i++)
                {
                    int x1 = random.Next(image.Width);
                    int x2 = random.Next(image.Width);
                    int y1 = random.Next(image.Height);
                    int y2 = random.Next(image.Height);

                    g.DrawLine(new Pen(Color.Black), x1, y1, x2, y2);
                }

                Font font = new System.Drawing.Font("Arial", 12, (System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic));
                System.Drawing.Drawing2D.LinearGradientBrush brush = new System.Drawing.Drawing2D.LinearGradientBrush(new Rectangle(0, 0, image.Width, image.Height), Color.Blue, Color.DarkRed, 1.2f, true);
                g.DrawString(Code, font, brush, 0, 0);

                //画图片的前景噪音点
                for (int i = 0; i < 10; i++)
                {
                    int x = random.Next(image.Width);
                    int y = random.Next(image.Height);

                    image.SetPixel(x, y, Color.FromArgb(random.Next()));
                }

                //画图片的边框线
                g.DrawRectangle(new Pen(Color.Silver), 0, 0, image.Width - 1, image.Height - 1);

                System.IO.MemoryStream ms = new System.IO.MemoryStream();
                image.Save(ms, System.Drawing.Imaging.ImageFormat.Gif);
                context.Response.ClearContent();
                context.Response.ContentType = "image/Gif";
                context.Response.BinaryWrite(ms.ToArray());
            }
            finally
            {
                g.Dispose();
                image.Dispose();
            }
        }
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

    }
}