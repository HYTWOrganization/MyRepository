using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Collections;
using System.Management;
using System.Threading;
using System.Resources;
using System.Globalization;

public partial class SystemInfo : System.Web.UI.Page
{
    protected ResourceManager LocRM;
    protected void Page_Load(object sender, EventArgs e)
    {
        Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(Request.UserLanguages[0]);
        Thread.CurrentThread.CurrentUICulture = new CultureInfo(Request.UserLanguages[0]);
        LocRM = new ResourceManager("HandleSystemInfo.strings", typeof(SystemInfo).Assembly);

        string pname = HttpContext.GetGlobalResourceObject("strings", "pc_name", new CultureInfo(Request.UserLanguages[0])).ToString();

        ArrayList ipList = getIpAddress();
        String hostName = getComputerName();
        //Label1.Text = LocRM.GetString("pc_name");
        Label1.Text = pname;
        Label_Name.Text = hostName;
        if (ipList.Count == 1)
        {
            Label_IPv4.Text = ipList[0].ToString();
            Label_IPv6.Text = "无";
        }
        else
        {
            Label_IPv4.Text = ipList[1].ToString();
            Label_IPv6.Text = ipList[0].ToString();
        }
        Label_clientname.Text = Request.UserHostName;
        Label_clientip.Text = Request.UserHostAddress;//UserHostAddress;
    }
    //获取IP地址
    public ArrayList getIpAddress()
    {
        ArrayList ipList = new ArrayList();
        IPHostEntry ipe = Dns.GetHostEntry(Dns.GetHostName());
        for (int i = 0; i < ipe.AddressList.Length; i++)
        {
            ipList.Add(ipe.AddressList[i].ToString());
        }
        //IPAddress ipa = ipe.AddressList[0];
        return ipList;
    }
    //获取主机名称
    public string getComputerName()
    {
        return Dns.GetHostName();
    }
    //获取设备信息
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

    //[DllImport("kernel32.dll")]
    // 接口函数  
    /*public static extern void GlobalMemoryStatus(ref NC neic); 

    private MemoryInfor GetMemoryInfor()
    {
        MemoryInfor memoryInfo = new MemoryInfor();
        GlobalMemoryStatus(ref memoryInfo);
        return memoryInfo;
    }*/

    protected void Button1_Click(object sender, EventArgs e)
    {
       // for (int i = 0; i < 100; i++)
       // {
        //    Thread.Sleep(1000);
            string str = getSearchInfo("LoadPercentage");
            TextBox_CPU.Text += str + "\r\n";    
            
      //  }
            
    }
}