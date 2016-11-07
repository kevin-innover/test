﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text.RegularExpressions;

namespace BranD10
{
    public class BrowserInfo
    {
        public static string GetIPAddress
        {
            get
            {
                var result = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
                if (!string.IsNullOrEmpty(result))
                {
                    //可能有代理    
                    if (result.IndexOf(".") == -1)        //没有“.”肯定是非IPv4格式    
                        result = null;
                    else
                    {
                        if (result.IndexOf(",") != -1)
                        {
                            //有“,”，估计多个代理。取第一个不是内网的IP。    
                            result = result.Replace("  ", "").Replace("'", "");
                            string[] temparyip = result.Split(",;".ToCharArray());
                            for (int i = 0; i < temparyip.Length; i++)
                            {
                                if (IsIPAddress(temparyip[i])
                                        && temparyip[i].Substring(0, 3) != "10."
                                        && temparyip[i].Substring(0, 7) != "192.168"
                                        && temparyip[i].Substring(0, 7) != "172.16.")
                                {
                                    return temparyip[i];        //找到不是内网的地址    
                                }
                            }
                        }
                        else if (IsIPAddress(result))  //代理即是IP格式    
                            return result;
                        else
                            result = null;        //代理中的内容  非IP，取IP    
                    }

                }

                string IpAddress = (HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != null && HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != String.Empty) ? HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] : HttpContext.Current.Request.ServerVariables["HTTP_X_REAL_IP"];

                if (string.IsNullOrEmpty(result))
                    result = HttpContext.Current.Request.ServerVariables["HTTP_X_REAL_IP"];

                if (string.IsNullOrEmpty(result))
                    result = HttpContext.Current.Request.UserHostAddress;

                return result;
            }
        }



        #region  判断是否是IP格式

        ///  <summary>  
        ///  判断是否是IP地址格式  0.0.0.0  
        ///  </summary>  
        ///  <param  name="str1">待判断的IP地址</param>  
        ///  <returns>true  or  false</returns>  
        public static bool IsIPAddress(string str1)
        {
            if (string.IsNullOrEmpty(str1) || str1.Length < 7 || str1.Length > 15) return false;

            const string regFormat = @"^d{1,3}[.]d{1,3}[.]d{1,3}[.]d{1,3}$";

            var regex = new Regex(regFormat, RegexOptions.IgnoreCase);
            return regex.IsMatch(str1);
        }

        #endregion

        #region 获取公网IP
        /// <summary>  
        /// 获取公网IP  
        /// </summary>  
        /// <returns></returns>  
        public static string GetNetIP()
        {
            string tempIP = "";
            try
            {
                System.Net.WebRequest wr = System.Net.WebRequest.Create("http://city.ip138.com/ip2city.asp");
                System.IO.Stream s = wr.GetResponse().GetResponseStream();
                System.IO.StreamReader sr = new System.IO.StreamReader(s, System.Text.Encoding.GetEncoding("gb2312"));
                string all = sr.ReadToEnd(); //读取网站的数据  

                int start = all.IndexOf("[") + 1;
                int end = all.IndexOf("]", start);
                tempIP = all.Substring(start, end - start);
                sr.Close();
                s.Close();
            }
            catch(Exception ex)
            {
                if (System.Net.Dns.GetHostEntry(System.Net.Dns.GetHostName()).AddressList.Length > 1)
                    tempIP = System.Net.Dns.GetHostEntry(System.Net.Dns.GetHostName()).AddressList[1].ToString();
                if (string.IsNullOrEmpty(tempIP))
                    return GetIP();
            }
            return tempIP;
        }
        #endregion

        /// <summary>  
        /// 获取客户端IP地址  
        /// </summary>  
        /// <returns></returns>  
        public static string GetIP()
        {
            string result = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (string.IsNullOrEmpty(result))
            {
                result = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            }
            if (string.IsNullOrEmpty(result))
            {
                result = HttpContext.Current.Request.UserHostAddress;
            }
            if (string.IsNullOrEmpty(result))
            {
                return "0.0.0.0";
            }
            return result;
        }
    }
}