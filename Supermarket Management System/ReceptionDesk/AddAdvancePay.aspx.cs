using System;
using System.Data;
using System.Data.SqlClient;
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
        Response.Redirect("AddAdvancePay.aspx");
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

    protected void btnSupplement_Click(object sender, EventArgs e)
    {
        if (gridViewMember.SelectedIndex >= 0)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connStr"]);
            SqlCommand updateCommand = new SqlCommand(
                "UPDATE Member SET AdvancePayment = AdvancePayment + @PaymentAmount " + 
                "WHERE MemberID = @MemberID", conn);
            updateCommand.Parameters.Add("PaymentAmount", SqlDbType.Decimal);
            updateCommand.Parameters.Add("MemberID", SqlDbType.VarChar);
            updateCommand.Parameters["PaymentAmount"].Value = Convert.ToDecimal(tbxPaymentAmount.Text);
            updateCommand.Parameters["MemberID"].Value = Convert.ToString(gridViewMember.SelectedValue);
            conn.Open();
            updateCommand.ExecuteNonQuery();
            conn.Close();
            gridViewMember.DataBind();
        }
    }
    protected void gridViewMember_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
