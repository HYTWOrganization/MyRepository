using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Management;
using System.Threading;
using System.Web.Mvc;
using System.Web.Script.Services;
[ScriptService]
public partial class AjaxTest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public string getSearchInfo(string name)
    {
        string returnname = " ";
        ManagementObjectSearcher search = new ManagementObjectSearcher("select * from Win32_Processor ");
        foreach (ManagementObject searchname in search.Get())
        {
            returnname = String.Format(searchname[name].ToString());
        }
        return returnname;
        /*label1.Text = inf.searchinfo("Name");//处理器名字
        label4.Text = inf.searchinfo("Manufacturer");//处理器生产商
        label6.Text = inf.searchinfo("Version");//处理器版本信息
        label8.Text = inf.searchinfo("L2CacheSize");//处理器二级缓存大小
        label10.Text = inf.searchinfo("ExtClock"); //处理器外频
        label12.Text = inf.searchinfo("CurrentClockSpeed");//当前时钟频率
        label14.Text = inf.searchinfo("MaxClockSpeed");//　最大时钟频率 
        label16.Text = inf.searchinfo("LoadPercentage");// CPU当前使用率没问题*/
    }
    public string getCPU()
    {
        return getSearchInfo("LoadPercentage");
    }

    /*public static  string Ajax_Func1(int a, int b)
    {
        //string userHeaderMsg = Convert.ToString(Request.Headers["userHeader"]);
        //return (a + b).ToString();
        return "hello";
    }*/
  
    public static string Ajax_Func2(int a, int b)
    {
       // string userHeaderMsg = Convert.ToString(Request.Headers["userHeader"]);
        //return Content("hello") ;
        return "ehll";
    }
    public string Ajax_Func1()
    {
        // string userHeaderMsg = Convert.ToString(Request.Headers["userHeader"]);
        //return Content("hello");
        return "ehll";
    }
}