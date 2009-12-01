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

public partial class Manager_StockMag : System.Web.UI.Page
{
    private static string strConnect = System.Configuration.ConfigurationManager.AppSettings["connStr"];
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnInsert_Click(object sender, EventArgs e)
    {
         //���ݿ�����
        SqlConnection objConnection = new SqlConnection(strConnect);
        //���ݿ�����
        SqlCommand objCommand = new SqlCommand("", objConnection);
        //����Sql��䣬������Ʒ��ⵥ
        objCommand.CommandText = "INSERT INTO GoodsStocking " + "(StockListID, StockID, GoodsID, StockDate, Amount, ProduceDate, shelflife, PurchasePrice)"
            + "VALUES" + "(@STOCKLIST, @STOCKID, @GOODSID, @STOCKDATE, @AMOUNT, @PRODUCEDATE, @SHELFLIFE, @PURCHASEPRICE)";

        //����Sql������������
        objCommand.Parameters.Add("STOCKLIST", SqlDbType.VarChar);
        objCommand.Parameters.Add("STOCKID", SqlDbType.VarChar);
        objCommand.Parameters.Add("GOODSID", SqlDbType.VarChar);
        objCommand.Parameters.Add("STOCKDATE", SqlDbType.DateTime);
        objCommand.Parameters.Add("AMOUNT", SqlDbType.Int);
        objCommand.Parameters.Add("PRODUCEDATE", SqlDbType.DateTime);
        objCommand.Parameters.Add("SHELFLIFE", SqlDbType.VarChar);
        objCommand.Parameters.Add("PURCHASEPRICE", SqlDbType.Decimal);



        //Sql��������ֵ
        objCommand.Parameters["STOCKLIST"].Value = TextBox1.Text.Trim();
        objCommand.Parameters["STOCKID"].Value = TextBox2.Text.Trim();
        objCommand.Parameters["GOODSID"].Value = TextBox3.Text.Trim();
        objCommand.Parameters["STOCKDATE"].Value = TextBox4.Text.Trim();
        objCommand.Parameters["AMOUNT"].Value = TextBox5.Text.Trim();
        objCommand.Parameters["PRODUCEDATE"].Value = TextBox6.Text.Trim();
        objCommand.Parameters["SHELFLIFE"].Value = TextBox7.Text.Trim();
        objCommand.Parameters["PURCHASEPRICE"].Value = TextBox8.Text.Trim();

        try
        {
            //�����ݿ�����
            if (objConnection.State == ConnectionState.Closed)
            {
                objConnection.Open();
            }

            //��������
            objCommand.ExecuteNonQuery();

            GridView1.DataBind();
            gvGoodsStockingList.DataBind();
        }
        catch (SqlException exp)
        {
            Session["Error"] = exp.Message;
            Response.Redirect("Error.aspx");

        }
        finally
        {
            //�ر����ݿ�����
            if (objConnection.State == ConnectionState.Open)
                objConnection.Close();
        }

    }
    
}
