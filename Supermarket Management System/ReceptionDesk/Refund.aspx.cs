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
using System.Data.SqlClient;


public partial class ReceptionDesk_Refund : System.Web.UI.Page
{
    private static string strConnect = System.Configuration.ConfigurationManager.AppSettings["connStr"];

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(strConnect);

        SqlCommand cmd = new SqlCommand("DELETE FROM Sale WHERE SaleUniqueIdentifier = @SaleUniqueIdentifier", conn);
        cmd.Parameters.Add("SaleUniqueIdentifier", SqlDbType.BigInt);
        long id = Convert.ToInt64(GridView1.SelectedValue);
        cmd.Parameters["SaleUniqueIdentifier"].Value = id;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        GridView1.DataBind();
        GridView1.SelectedIndex = -1;
    }
}
