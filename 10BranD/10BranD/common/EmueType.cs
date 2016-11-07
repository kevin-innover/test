using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BranD10
{


    public enum MemberGroupEnum
    {
        // 	 企业会员      经销商     专卖店     品牌商     个人会员
        //   Company=1,
        企业会员 = 1,
        // Saler,
        经销商,
        // Store,
        专卖店,
        //  Business,
        品牌商,
        //  Person
        个人会员
    }
    public enum BrandStatusEnum
    {
        // 通过  待审  拒绝  过期  删除
        Pass,
        WaitAudit,
        Reject,
        OutDate,
        Delete
    }
    public enum IndustryStatusEnum
    {
        // 正在进行 榜单揭晓 投票结束 未开始
        结束 = 0,
        投票 = 1,
        揭榜 = 2,
        闲置 = 3
    }
    public enum UserPermisonsEnum
    {
        //添加用户
        AddUser,
        //添加
        AddUser1
    }
    public enum TicketTypeEnum
    {
        // 0auto, web 微信   微博 
        Auto,
        Web,
        Weixin,
        Weibo
    }
    public enum IndustryVoteLimit
    {
        OnlyOneTime,//只一次
        None,//不限制
        Min5,//
        Min10,
        Min30
    }
    public enum BrandRandStatusEnum
    {
        // 有 仅证书 仅奖牌 仅显示  不显示
        不显示,
        有,
        仅证书,
        仅奖牌,
        仅显示
    }
}