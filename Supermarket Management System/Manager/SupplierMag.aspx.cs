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

public partial class Manager_SupplierMag : System.Web.UI.Page
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
        //����Sql��䣬������Ʒ��Ӧ��
        objCommand.CommandText = "INSERT INTO GoodsProviding " + "(ListID, GoodsID, SupplierID, NeedNum, ListDate, AffordMoney)"
            + "VALUES" + "(@LIST, @GOODS, @SUPPLIER, @NUM, @DATE, @MONEY)";

        //����Sql������������
        objCommand.Parameters.Add("LIST", SqlDbType.VarChar);
        objCommand.Parameters.Add("GOODS", SqlDbType.VarChar);
        objCommand.Parameters.Add("SUPPLIER", SqlDbType.VarChar);
        objCommand.Parameters.Add("NUM", SqlDbType.Int);
        objCommand.Parameters.Add("DATE", SqlDbType.DateTime);
        objCommand.Parameters.Add("MONEY", SqlDbType.Decimal);

        //Sql��������ֵ
        objCommand.Parameters["LIST"].Value = TextBox1.Text.Trim();
        objCommand.Parameters["GOODS"].Value = TextBox2.Text.Trim();
        objCommand.Parameters["SUPPLIER"].Value = TextBox3.Text.Trim();
        objCommand.Parameters["NUM"].Value = TextBox4.Text.Trim();
        objCommand.Parameters["DATE"].Value = TextBox5.Text.Trim();
        objCommand.Parameters["MONEY"].Value = TextBox6.Text.Trim();

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
            gvGoodsProvidingList.DataBind();
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
