﻿//------------------------------------------------------------------------------
// <auto-generated>
//     此代码由工具生成。
//     运行时版本:4.0.30319.17929
//     Website: http://ITdos.com/Dos/ORM/Index.html
//     对此文件的更改可能会导致不正确的行为，并且如果
//     重新生成代码，这些更改将会丢失。
// </auto-generated>
//------------------------------------------------------------------------------


using System;
using System.Data;
using System.Data.Common;
using Dos.ORM;
using Dos.ORM.Common;

namespace Model
{

	/// <summary>
	/// 实体类Brand 。(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Table("brand")]
	[Serializable]
	public partial class Brand : Entity 
	{
		#region Model
		private int _Id;
		private string _Name;
		private string _LogoPath;
		private int? _IndustryID;
		private DateTime _CreateTime;
		private DateTime? _UpdateTime;
		private DateTime? _PayTime;
		private string _Note;
		private int _RealTicket;
		private int _AutoTicket;
		private float? _AutoFrequency1;
		private float? _AutoFrequency2;
		private int? _AuditLimit;
		private int? _AppLimit;
		private int? _CreatorUserID;
		private string _RegisterNumber;
		private int _Status;
		private bool? _FakeTicket;
		private int? _AdminUserID;
		private int? _PhoneLimit;
		private int? _PCLimit;
		private string _Tel;
		private string _Qq;
		private string _Fax;
		private string _Email;
		private bool _IsTop10;
		private bool _StopVote;
		private bool _StopPCVote;
		private bool _LimitPCVote;
		private string _RejectReason;
		private string _Image1;
		private string _Image2;
		private int? _MemberID;
		private int? _CompanyID;
		private string _Weixin;
		private string _WeixinImg;
		private string _Weibo;
		private string _WeiboImg;
		private string _WeiboUrl;
		private string _Content;
		private string _Websit;
		/// <summary>
		/// 编号
		/// </summary>
		public int Id
		{
			get{ return _Id; }
			set
			{
				this.OnPropertyValueChange(_.Id,_Id,value);
				this._Id=value;
			}
		}
		/// <summary>
		/// 名称
		/// </summary>
		public string Name
		{
			get{ return _Name; }
			set
			{
				this.OnPropertyValueChange(_.Name,_Name,value);
				this._Name=value;
			}
		}
		/// <summary>
		/// 图片路径
		/// </summary>
		public string LogoPath
		{
			get{ return _LogoPath; }
			set
			{
				this.OnPropertyValueChange(_.LogoPath,_LogoPath,value);
				this._LogoPath=value;
			}
		}
		/// <summary>
		/// 行业ID
		/// </summary>
		public int? IndustryID
		{
			get{ return _IndustryID; }
			set
			{
				this.OnPropertyValueChange(_.IndustryID,_IndustryID,value);
				this._IndustryID=value;
			}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime CreateTime
		{
			get{ return _CreateTime; }
			set
			{
				this.OnPropertyValueChange(_.CreateTime,_CreateTime,value);
				this._CreateTime=value;
			}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime? UpdateTime
		{
			get{ return _UpdateTime; }
			set
			{
				this.OnPropertyValueChange(_.UpdateTime,_UpdateTime,value);
				this._UpdateTime=value;
			}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime? PayTime
		{
			get{ return _PayTime; }
			set
			{
				this.OnPropertyValueChange(_.PayTime,_PayTime,value);
				this._PayTime=value;
			}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Note
		{
			get{ return _Note; }
			set
			{
				this.OnPropertyValueChange(_.Note,_Note,value);
				this._Note=value;
			}
		}
		/// <summary>
		/// 
		/// </summary>
		public int RealTicket
		{
			get{ return _RealTicket; }
			set
			{
				this.OnPropertyValueChange(_.RealTicket,_RealTicket,value);
				this._RealTicket=value;
			}
		}
		/// <summary>
		/// 
		/// </summary>
		public int AutoTicket
		{
			get{ return _AutoTicket; }
			set
			{
				this.OnPropertyValueChange(_.AutoTicket,_AutoTicket,value);
				this._AutoTicket=value;
			}
		}
		/// <summary>
		/// 
		/// </summary>
		public float? AutoFrequency1
		{
			get{ return _AutoFrequency1; }
			set
			{
				this.OnPropertyValueChange(_.AutoFrequency1,_AutoFrequency1,value);
				this._AutoFrequency1=value;
			}
		}
		/// <summary>
		/// 
		/// </summary>
		public float? AutoFrequency2
		{
			get{ return _AutoFrequency2; }
			set
			{
				this.OnPropertyValueChange(_.AutoFrequency2,_AutoFrequency2,value);
				this._AutoFrequency2=value;
			}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? AuditLimit
		{
			get{ return _AuditLimit; }
			set
			{
				this.OnPropertyValueChange(_.AuditLimit,_AuditLimit,value);
				this._AuditLimit=value;
			}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? AppLimit
		{
			get{ return _AppLimit; }
			set
			{
				this.OnPropertyValueChange(_.AppLimit,_AppLimit,value);
				this._AppLimit=value;
			}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? CreatorUserID
		{
			get{ return _CreatorUserID; }
			set
			{
				this.OnPropertyValueChange(_.CreatorUserID,_CreatorUserID,value);
				this._CreatorUserID=value;
			}
		}
		/// <summary>
		/// 
		/// </summary>
		public string RegisterNumber
		{
			get{ return _RegisterNumber; }
			set
			{
				this.OnPropertyValueChange(_.RegisterNumber,_RegisterNumber,value);
				this._RegisterNumber=value;
			}
		}
		/// <summary>
		/// 
		/// </summary>
		public int Status
		{
			get{ return _Status; }
			set
			{
				this.OnPropertyValueChange(_.Status,_Status,value);
				this._Status=value;
			}
		}
		/// <summary>
		/// 
		/// </summary>
		public bool? FakeTicket
		{
			get{ return _FakeTicket; }
			set
			{
				this.OnPropertyValueChange(_.FakeTicket,_FakeTicket,value);
				this._FakeTicket=value;
			}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? AdminUserID
		{
			get{ return _AdminUserID; }
			set
			{
				this.OnPropertyValueChange(_.AdminUserID,_AdminUserID,value);
				this._AdminUserID=value;
			}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? PhoneLimit
		{
			get{ return _PhoneLimit; }
			set
			{
				this.OnPropertyValueChange(_.PhoneLimit,_PhoneLimit,value);
				this._PhoneLimit=value;
			}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? PCLimit
		{
			get{ return _PCLimit; }
			set
			{
				this.OnPropertyValueChange(_.PCLimit,_PCLimit,value);
				this._PCLimit=value;
			}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Tel
		{
			get{ return _Tel; }
			set
			{
				this.OnPropertyValueChange(_.Tel,_Tel,value);
				this._Tel=value;
			}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Qq
		{
			get{ return _Qq; }
			set
			{
				this.OnPropertyValueChange(_.Qq,_Qq,value);
				this._Qq=value;
			}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Fax
		{
			get{ return _Fax; }
			set
			{
				this.OnPropertyValueChange(_.Fax,_Fax,value);
				this._Fax=value;
			}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Email
		{
			get{ return _Email; }
			set
			{
				this.OnPropertyValueChange(_.Email,_Email,value);
				this._Email=value;
			}
		}
		/// <summary>
		/// 
		/// </summary>
		public bool IsTop10
		{
			get{ return _IsTop10; }
			set
			{
				this.OnPropertyValueChange(_.IsTop10,_IsTop10,value);
				this._IsTop10=value;
			}
		}
		/// <summary>
		/// 
		/// </summary>
		public bool StopVote
		{
			get{ return _StopVote; }
			set
			{
				this.OnPropertyValueChange(_.StopVote,_StopVote,value);
				this._StopVote=value;
			}
		}
		/// <summary>
		/// 
		/// </summary>
		public bool StopPCVote
		{
			get{ return _StopPCVote; }
			set
			{
				this.OnPropertyValueChange(_.StopPCVote,_StopPCVote,value);
				this._StopPCVote=value;
			}
		}
		/// <summary>
		/// 
		/// </summary>
		public bool LimitPCVote
		{
			get{ return _LimitPCVote; }
			set
			{
				this.OnPropertyValueChange(_.LimitPCVote,_LimitPCVote,value);
				this._LimitPCVote=value;
			}
		}
		/// <summary>
		/// 
		/// </summary>
		public string RejectReason
		{
			get{ return _RejectReason; }
			set
			{
				this.OnPropertyValueChange(_.RejectReason,_RejectReason,value);
				this._RejectReason=value;
			}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Image1
		{
			get{ return _Image1; }
			set
			{
				this.OnPropertyValueChange(_.Image1,_Image1,value);
				this._Image1=value;
			}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Image2
		{
			get{ return _Image2; }
			set
			{
				this.OnPropertyValueChange(_.Image2,_Image2,value);
				this._Image2=value;
			}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? MemberID
		{
			get{ return _MemberID; }
			set
			{
				this.OnPropertyValueChange(_.MemberID,_MemberID,value);
				this._MemberID=value;
			}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? CompanyID
		{
			get{ return _CompanyID; }
			set
			{
				this.OnPropertyValueChange(_.CompanyID,_CompanyID,value);
				this._CompanyID=value;
			}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Weixin
		{
			get{ return _Weixin; }
			set
			{
				this.OnPropertyValueChange(_.Weixin,_Weixin,value);
				this._Weixin=value;
			}
		}
		/// <summary>
		/// 
		/// </summary>
		public string WeixinImg
		{
			get{ return _WeixinImg; }
			set
			{
				this.OnPropertyValueChange(_.WeixinImg,_WeixinImg,value);
				this._WeixinImg=value;
			}
		}
		/// <summary>
		/// weibo
		/// </summary>
		public string Weibo
		{
			get{ return _Weibo; }
			set
			{
				this.OnPropertyValueChange(_.Weibo,_Weibo,value);
				this._Weibo=value;
			}
		}
		/// <summary>
		/// 
		/// </summary>
		public string WeiboImg
		{
			get{ return _WeiboImg; }
			set
			{
				this.OnPropertyValueChange(_.WeiboImg,_WeiboImg,value);
				this._WeiboImg=value;
			}
		}
		/// <summary>
		/// 
		/// </summary>
		public string WeiboUrl
		{
			get{ return _WeiboUrl; }
			set
			{
				this.OnPropertyValueChange(_.WeiboUrl,_WeiboUrl,value);
				this._WeiboUrl=value;
			}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Content
		{
			get{ return _Content; }
			set
			{
				this.OnPropertyValueChange(_.Content,_Content,value);
				this._Content=value;
			}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Websit
		{
			get{ return _Websit; }
			set
			{
				this.OnPropertyValueChange(_.Websit,_Websit,value);
				this._Websit=value;
			}
		}
		#endregion

		#region Method
		/// <summary>
		/// 获取实体中的主键列
		/// </summary>
		public override Field[] GetPrimaryKeyFields()
		{
			return new Field[] {
				_.Id};
		}
		/// <summary>
		/// 获取列信息
		/// </summary>
		public override Field[] GetFields()
		{
			return new Field[] {
				_.Id,
				_.Name,
				_.LogoPath,
				_.IndustryID,
				_.CreateTime,
				_.UpdateTime,
				_.PayTime,
				_.Note,
				_.RealTicket,
				_.AutoTicket,
				_.AutoFrequency1,
				_.AutoFrequency2,
				_.AuditLimit,
				_.AppLimit,
				_.CreatorUserID,
				_.RegisterNumber,
				_.Status,
				_.FakeTicket,
				_.AdminUserID,
				_.PhoneLimit,
				_.PCLimit,
				_.Tel,
				_.Qq,
				_.Fax,
				_.Email,
				_.IsTop10,
				_.StopVote,
				_.StopPCVote,
				_.LimitPCVote,
				_.RejectReason,
				_.Image1,
				_.Image2,
				_.MemberID,
				_.CompanyID,
				_.Weixin,
				_.WeixinImg,
				_.Weibo,
				_.WeiboImg,
				_.WeiboUrl,
				_.Content,
				_.Websit};
		}
		/// <summary>
		/// 获取值信息
		/// </summary>
		public override object[] GetValues()
		{
			return new object[] {
				this._Id,
				this._Name,
				this._LogoPath,
				this._IndustryID,
				this._CreateTime,
				this._UpdateTime,
				this._PayTime,
				this._Note,
				this._RealTicket,
				this._AutoTicket,
				this._AutoFrequency1,
				this._AutoFrequency2,
				this._AuditLimit,
				this._AppLimit,
				this._CreatorUserID,
				this._RegisterNumber,
				this._Status,
				this._FakeTicket,
				this._AdminUserID,
				this._PhoneLimit,
				this._PCLimit,
				this._Tel,
				this._Qq,
				this._Fax,
				this._Email,
				this._IsTop10,
				this._StopVote,
				this._StopPCVote,
				this._LimitPCVote,
				this._RejectReason,
				this._Image1,
				this._Image2,
				this._MemberID,
				this._CompanyID,
				this._Weixin,
				this._WeixinImg,
				this._Weibo,
				this._WeiboImg,
				this._WeiboUrl,
				this._Content,
				this._Websit};
		}
		#endregion

		#region _Field
		/// <summary>
		/// 字段信息
		/// </summary>
		public class _
		{
			/// <summary>
			/// * 
			/// </summary>
			public readonly static Field All = new Field("*","brand");
			/// <summary>
			/// 编号
			/// </summary>
			public readonly static Field Id = new Field("Id","brand","编号");
			/// <summary>
			/// 名称
			/// </summary>
			public readonly static Field Name = new Field("Name","brand","名称");
			/// <summary>
			/// 图片路径
			/// </summary>
			public readonly static Field LogoPath = new Field("LogoPath","brand","图片路径");
			/// <summary>
			/// 行业ID
			/// </summary>
			public readonly static Field IndustryID = new Field("IndustryID","brand","行业ID");
			/// <summary>
			/// 
			/// </summary>
			public readonly static Field CreateTime = new Field("CreateTime","brand","CreateTime");
			/// <summary>
			/// 
			/// </summary>
			public readonly static Field UpdateTime = new Field("UpdateTime","brand","UpdateTime");
			/// <summary>
			/// 
			/// </summary>
			public readonly static Field PayTime = new Field("PayTime","brand","PayTime");
			/// <summary>
			/// 
			/// </summary>
			public readonly static Field Note = new Field("Note","brand","Note");
			/// <summary>
			/// 
			/// </summary>
			public readonly static Field RealTicket = new Field("RealTicket","brand","RealTicket");
			/// <summary>
			/// 
			/// </summary>
			public readonly static Field AutoTicket = new Field("AutoTicket","brand","AutoTicket");
			/// <summary>
			/// 
			/// </summary>
			public readonly static Field AutoFrequency1 = new Field("AutoFrequency1","brand","AutoFrequency1");
			/// <summary>
			/// 
			/// </summary>
			public readonly static Field AutoFrequency2 = new Field("AutoFrequency2","brand","AutoFrequency2");
			/// <summary>
			/// 
			/// </summary>
			public readonly static Field AuditLimit = new Field("AuditLimit","brand","AuditLimit");
			/// <summary>
			/// 
			/// </summary>
			public readonly static Field AppLimit = new Field("AppLimit","brand","AppLimit");
			/// <summary>
			/// 
			/// </summary>
			public readonly static Field CreatorUserID = new Field("CreatorUserID","brand","CreatorUserID");
			/// <summary>
			/// 
			/// </summary>
			public readonly static Field RegisterNumber = new Field("RegisterNumber","brand","RegisterNumber");
			/// <summary>
			/// 
			/// </summary>
			public readonly static Field Status = new Field("Status","brand","Status");
			/// <summary>
			/// 
			/// </summary>
			public readonly static Field FakeTicket = new Field("FakeTicket","brand","FakeTicket");
			/// <summary>
			/// 
			/// </summary>
			public readonly static Field AdminUserID = new Field("AdminUserID","brand","AdminUserID");
			/// <summary>
			/// 
			/// </summary>
			public readonly static Field PhoneLimit = new Field("PhoneLimit","brand","PhoneLimit");
			/// <summary>
			/// 
			/// </summary>
			public readonly static Field PCLimit = new Field("PCLimit","brand","PCLimit");
			/// <summary>
			/// 
			/// </summary>
			public readonly static Field Tel = new Field("Tel","brand","Tel");
			/// <summary>
			/// 
			/// </summary>
			public readonly static Field Qq = new Field("Qq","brand","Qq");
			/// <summary>
			/// 
			/// </summary>
			public readonly static Field Fax = new Field("Fax","brand","Fax");
			/// <summary>
			/// 
			/// </summary>
			public readonly static Field Email = new Field("Email","brand","Email");
			/// <summary>
			/// 
			/// </summary>
			public readonly static Field IsTop10 = new Field("IsTop10","brand","IsTop10");
			/// <summary>
			/// 
			/// </summary>
			public readonly static Field StopVote = new Field("StopVote","brand","StopVote");
			/// <summary>
			/// 
			/// </summary>
			public readonly static Field StopPCVote = new Field("StopPCVote","brand","StopPCVote");
			/// <summary>
			/// 
			/// </summary>
			public readonly static Field LimitPCVote = new Field("LimitPCVote","brand","LimitPCVote");
			/// <summary>
			/// 
			/// </summary>
			public readonly static Field RejectReason = new Field("RejectReason","brand","RejectReason");
			/// <summary>
			/// 
			/// </summary>
			public readonly static Field Image1 = new Field("Image1","brand","Image1");
			/// <summary>
			/// 
			/// </summary>
			public readonly static Field Image2 = new Field("Image2","brand","Image2");
			/// <summary>
			/// 
			/// </summary>
			public readonly static Field MemberID = new Field("MemberID","brand","MemberID");
			/// <summary>
			/// 
			/// </summary>
			public readonly static Field CompanyID = new Field("CompanyID","brand","CompanyID");
			/// <summary>
			/// 
			/// </summary>
			public readonly static Field Weixin = new Field("weixin","brand","weixin");
			/// <summary>
			/// 
			/// </summary>
			public readonly static Field WeixinImg = new Field("weixinImg","brand","weixinImg");
			/// <summary>
			/// weibo
			/// </summary>
			public readonly static Field Weibo = new Field("weibo","brand","weibo");
			/// <summary>
			/// 
			/// </summary>
			public readonly static Field WeiboImg = new Field("weiboImg","brand","weiboImg");
			/// <summary>
			/// 
			/// </summary>
			public readonly static Field WeiboUrl = new Field("weiboUrl","brand","weiboUrl");
			/// <summary>
			/// 
			/// </summary>
			public readonly static Field Content = new Field("Content","brand","Content");
			/// <summary>
			/// 
			/// </summary>
			public readonly static Field Websit = new Field("Websit","brand","Websit");
		}
		#endregion


	}
}

