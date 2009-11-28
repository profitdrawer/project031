using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class ReceptionDesk_ReceptionDesk : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddAvancePay.aspx");
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Response.Redirect("Region.aspx");
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Refund.aspx");
    }
    protected void linkLogout_Click(object sender, EventArgs e)
    {
        Session.Remove("EmployeeID");
        Session.Remove("SysLoginPwd");
        Session.Remove("RoleName");
        Response.Redirect("../Login.aspx");
    }
}
