using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Dos.ORM;
using BranD10;
using System.Data.Common;
using System.Data.SqlClient;

namespace Model
{

    public partial class Ticketcache : Entity
    {
        public int IndustryID
        {
            get { return DB.Context.From<Model.Brand>().Where(p => p.Id == BrandID).First().IndustryID.Value; }
        }
    }
    public class TicketCacheAcount : Entity
    {
        private Int32 totalTickets;

        public Int32 TotalTickets
        {
            get { return totalTickets; }
            set { totalTickets = value; }
        }

        private Int32 brandID;

        public Int32 BrandID
        {
            get { return brandID; }
            set
            {
                brandID = value;

                _Brand = DB.Context.From<Model.Brand>().Where(p => p.Id == BrandID).First();
            }
        }
        public Brand _Brand;
        public Brand Brand
        {
            get
            {
                return _Brand;

            }
        }

        public string BrandName
        {
            get { return _Brand.Name; }
        }
        public string IndustryID
        {
            get { return _Brand.IndustryID.ToString(); }
        }
        private string industryName;

        public string IndustryName
        {
            get { return _Brand.IndustryName; }
        }
    }
    public partial class Contract : Entity
    {
        public Brand _Brand
        {
            get
            {
                return DB.Context.From<Model.Brand>().Where(p => p.Id == BrandID).First();
            }
        }
        public string UserName
        {

            get
            {
                var u = DB.Context.From<Model.Users>().Where(p => p.Id == UserID && p.IsDelete == false).First();
                if (u == null)
                {
                    return "";
                }
                return u.CName;
            }
        }

        public string LogoPath
        {
            get
            {
                return _Brand.LogoPath;
            }
        }
        public int IndustryID
        {
            get
            {
                return _Brand.IndustryID.Value;
            }
        }
        public int ParentIndustryID
        {
            get
            {
                return _Brand.ParentIndustryID;
            }
        }
        public string BrandTitle
        {
            get
            {
                return _Brand.Name;
            }
        }
        public string BrandLogo
        {
            get
            {
                return _Brand.LogoPath;
            }
        }
    }

    public partial class Message : Entity
    {
        public string NameValue
        {
            get
            {
                if (string.IsNullOrEmpty(Name))
                {
                    return "Guest";
                }
                return Name;
            }
        }
    }
    public partial class Comment : Entity
    {
        public string BrandName
        {
            get
            {
                var u = DB.Context.From<Model.Brand>().Where(p => p.Id == BrandID).First();
                if (u != null)
                {
                    return u.Name;
                }
                return "";
            }
        }
    }
    public partial class Brand : Entity
    {
        /// <summary>
        /// unit milesecond
        /// </summary>
        public int AutoFrequency
        {

            get {
                if (AutoFrequency1.HasValue && AutoFrequency2.HasValue && AutoFrequency1 <= 30 && AutoFrequency1 > 0 && AutoFrequency2>0)
                {
                    if (AutoFrequency1 < 1)
                    {
                        return (int )(AutoFrequency1.Value * 10*1000 / AutoFrequency2.Value);
                    }
                    else
                    {
                        return (int )(AutoFrequency1.Value * 60*1000 / AutoFrequency2.Value);
                    }
                }
                else
                {
                    return 0;    
                }
            }
        }
        public float AutoFrequency2_Value
        {
            get
            {
                return AutoFrequency2.HasValue ? AutoFrequency2.Value :0;
            }
        }
        public float AutoFrequency1_Value
        {
            get
            {
                return AutoFrequency1.HasValue ? AutoFrequency1.Value : 0;
            }
        }
        public string AuditLimitValue
        {
            get
            {
                var v = AuditLimit == 0 ? "" :string .Format (@"<span class=""f_red"">{0}</span>&nbsp&nbsp", AuditLimit.ToString()  );
                var img = @"<img  src='../images/img.gif' width='10' height='10' onclick='_preview(""{0}"");'/>&nbsp&nbsp";
                if (!string.IsNullOrEmpty(Image1))
                {
                    v += string.Format(img, Image1);
                }
                if (!string.IsNullOrEmpty(Image2))
                {
                    v += string.Format(img, Image2);
                }

                return v;
            }
        }
      
        public Int32 TotalTickets
        {
            get { return this.RealTicket + AutoTicket; }
        }

        public Int32 TicketCount
        {
            get
            {
                var c = DB.Context.Count<Model.Ticket>("1=1");
                return c;
            }
        }
        public string userName
        {
            get
            {
                if (Admin != null)
                {
                    return Admin.Name;
                }
                return "暂无";
            }
        }
        public string AuditTel
        {
            get
            {
                if (Admin != null)
                {
                    return Admin.AuditTel;
                }
                return "暂无";
            }
        }
        public string AuditQQ
        {
            get
            {
                if (Admin != null)
                {
                    return Admin.QQ;
                }
                return "暂无";
            }
        }
        public Users Admin
        {
            get
            {
                return DB.Context.From<Model.Users>().Where(p => p.Id == AdminUserID && p.IsDelete == false).First();
            }
        }
        private Industry _Industry
        {
            get
            {
                return DB.Context.From<Model.Industry>().Where(p => p.Id == IndustryID).First();
            }
        }
        public string IndustryName
        {
            get
            {
                return _Industry == null ? null : _Industry.Name;
            }
        }
        public int ParentIndustryID
        {
            get
            {
                return _Industry == null ? 0 : _Industry.ParentID;
            }
        }
        public string  ParentIndustryName
        {
            get
            {
                return _Industry == null ? "" : _Industry.ParentName;
            }
        }
        public Company Company
        {
            get
            {
                return DB.Context.From<Model.Company>().Where(p => p.Id == CompanyID).First();
            }

        }


        public string _CRegisterNumber;

        public string CRegisterNumber
        {
            get { return Company == null ? null : Company.CRegisterNumber; }
            set { _CRegisterNumber = value; }
        }

        public string _Addr;
        public string Addr
        {
            get { return Company == null ? null : Company.Addr; }
            set { _Addr = value; }
        }
        /// <summary>
        /// return value
        /// </summary>
        public string _CompanyName;

        public string CompanyName
        {
            get { return Company == null ? null : Company.Name; }
            set { _CompanyName = value; }
        }
    }

    public partial class Industry : Entity
    {

        public string StatusValue
        {
            get
            {
                return ((IndustryStatusEnum)Status).ToString();
            }
        }
        public string UserName
        {
            get
            {
                if (UserID == null || UserID == 0)
                {
                    return "暂无";
                }

                var u = DB.Context.From<Model.Users>().Where(p => p.Id == UserID && p.IsDelete == false).First();
                if (u != null)
                {
                    return u.Name;
                }
                return "暂无";
            }
        }
        /// <summary>
        /// 资质认证排名
        /// </summary>
        public int Ranking
        {
            get
            {
                return 0;
            }
        }
        /// <summary>
        /// 资质认证排名
        /// </summary>
        public int InfoCount
        {
            get
            {

                return 0;
            }
        }
        public int ChildCount
        {
            get
            {
                return DB.Context.Count<Model.Industry>(" ParentID=" + Id);
            }
        }
        public int BrandCount
        {
            get
            {
                return DB.Context.Count<Model.Brand>(" IndustryID=" + Id);
            }
        }
        public string ParentName
        {
            get
            {
                var parent = DB.Context.From<Model.Industry>().Where(p => p.Id == ParentID).First();
                if (parent != null)
                {
                    return parent.Name;
                }
                return "";
            }
        }



    }
    public partial class Ranking : Entity
    {
        public string IndustryName
        {
            get
            {
                var name = DB.Context.From<Model.Industry>().Where(p => p.Id == IndustryID).First().Name;
                return name;
            }
        }

    }

    public partial class Brandranking : Entity
    {
        public string StatusValue
        {
            get
            {
                if (Status == 0)
                {
                    return "无";
                }
                return string.Format(@"<a href='../admin/prize.html?ID={0}'>查看</a'>", Id);
            }
        }
        public string LogoPath
        {
            get
            {
                return DB.Context.From<Model.Brand>().Where(p => p.Id == BrandID).First().LogoPath;
            }
        }
        private string imagePath;

        public string ImagePath
        {
            get { return imagePath; }
            set { imagePath = value; }
        }


    }

    public partial class Users : Entity
    {
        public int UsedCategory
        {
            get
            {
                return DB.Context.Count<Model.Industry>(" UserID=" + Id);

            }
        }
        public string CompanyName
        {
            get
            {
                try
                {
                    var company = DB.Context.From<Model.Brand>().Where(p => p.MemberID == Id).First();
                    if (company == null)
                    {
                        return "无";
                    }
                    return company.CompanyName;
                }
                catch (Exception ex)
                {
                    return "无";
                }
            }
        }
        public string SexValue
        {
            get
            {
                return Sex ? "男" : "女";
            }
        }
        public string GroupValue
        {
            get
            {
                if (!_MemberGroup.HasValue)
                {
                    return null;

                }
                return ((MemberGroupEnum)_MemberGroup).ToString();
            }
        }
    }
    public partial class Company : Entity
    {
        public string AuditStatus
        {
            get
            {
                return Audit ? "已认证" : "未认证";

            }
        }
        public Users Member
        {
            get
            {
                return DB.Context.From<Model.Users>().Where(p => p.Id == MemberID).First();

            }
        }
        public string AuditUser
        {
            get
            {
                return DB.Context.From<Model.Users>().Where(p => p.Id == AuditUserID).First().Name;

            }
        }

        public string MemberMobile
        {
            get
            {
                return Member.Tel;

            }
        }
        public string MemberIP
        {
            get
            {
                return Member.LoginIP;

            }
        }
    }
}