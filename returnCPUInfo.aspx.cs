using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Management;
using System.Threading;

public partial class returnCPUInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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
    }
    public string getCPUInfo()
    { 
        string cpuInfo =  getSearchInfo("LoadPercentage");
        //return "abc";
        return cpuInfo;
    }
}