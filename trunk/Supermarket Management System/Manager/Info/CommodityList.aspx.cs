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

public partial class Manager_CommodityData : System.Web.UI.Page
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
        //����Sql��䣬�����Ա�����ע����Ϣ
        objCommand.CommandText = "INSERT INTO Commodity " + "(GoodsID, GoodsName, SellingPrice, MemberPrice, StockNum, AlarmNum, sellstate)"
            + "VALUES" + "(@GOODSID, @GOODSNAME, @SELLPRICE, @MEMBPRICE, @STONUM, @ALARNUM, @SELLSTATE)";

        //����Sql������������
        objCommand.Parameters.Add("GOODSID", SqlDbType.VarChar);
        objCommand.Parameters.Add("GOODSNAME", SqlDbType.VarChar);
        objCommand.Parameters.Add("SELLPRICE", SqlDbType.Decimal);
        objCommand.Parameters.Add("MEMBPRICE", SqlDbType.Decimal);
        objCommand.Parameters.Add("STONUM", SqlDbType.Int);
        objCommand.Parameters.Add("ALARNUM", SqlDbType.Int);
        objCommand.Parameters.Add("SELLSTATE", SqlDbType.Bit);


        //Sql��������ֵ
        objCommand.Parameters["GOODSID"].Value = TextBox1.Text.Trim();
        objCommand.Parameters["GOODSNAME"].Value = TextBox2.Text.Trim();
        objCommand.Parameters["SELLPRICE"].Value = TextBox3.Text.Trim();
        objCommand.Parameters["MEMBPRICE"].Value = TextBox4.Text.Trim();
        objCommand.Parameters["STONUM"].Value = TextBox7.Text.Trim();
        objCommand.Parameters["ALARNUM"].Value = TextBox8.Text.Trim();
        objCommand.Parameters["SELLSTATE"].Value = RadioButton1.Checked.ToString();



        try
        {
            //�����ݿ�����
            if (objConnection.State == ConnectionState.Closed)
            {
                objConnection.Open();
            }

            //��������
            objCommand.ExecuteNonQuery();
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
