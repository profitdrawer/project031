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

public partial class Cashier_GoodsQuery : System.Web.UI.Page
{
    private static string strConnect = System.Configuration.ConfigurationManager.AppSettings["connStr"];

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            gvCommoditySearch.Visible = true;
    }

    //µ¥»÷ËÑË÷ÊÂ¼þ
    protected void btnSearch_Click(object sender, EventArgs e)
    {
    }

    protected void btnClearSearch_Click(object sender, EventArgs e)
    {
        tbxCommodityName.Text = "";
        tbxPriceFrom.Text = "";
        tbxPriceTo.Text = "";
    }

    protected void gvCommoditySearch_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void btnRegisterGoodsShortage_Click(object sender, EventArgs e)
    {
        if (gvCommoditySearch.SelectedIndex != -1)
        {
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["connStr"]);
            SqlCommand cmd = new SqlCommand(
                "INSERT INTO GoodsShortageProcessing(GoodsId, GoodsName, RegisterTime) VALUES (@GoodsId, @GoodsName, @RegisterTime)", conn);
            cmd.Parameters.Add("GoodsId", SqlDbType.VarChar);
            cmd.Parameters.Add("GoodsName", SqlDbType.VarChar);
            cmd.Parameters.Add("RegisterTime", SqlDbType.DateTime);

            GridViewRow row = gvCommoditySearch.SelectedRow;
            cmd.Parameters["GoodsId"].Value = row.Cells[1].Text;
            cmd.Parameters["GoodsName"].Value = row.Cells[2].Text;
            cmd.Parameters["RegisterTime"].Value = DateTime.Now;

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
}
