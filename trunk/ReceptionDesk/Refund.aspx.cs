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
    protected void Button1_Click(object sender, EventArgs e)
    {

        //���ݿ�����
        SqlConnection objConnection = new SqlConnection(strConnect);
        //���ݿ�����
        SqlCommand objCommand1 = new SqlCommand("", objConnection);
        SqlCommand objCommand2 = new SqlCommand("", objConnection);
        //����Sql��䣬�����Ա�����ע����Ϣ
        objCommand1.CommandText = "DELETE FROM Sale WHERE SellListID=@SELLID";
        objCommand2.CommandText = "UPDATE Commodity SET sellstate='0' WHERE GoodsID=@GOODSID";
       

        //����Sql������������
        objCommand1.Parameters.Add("SELLID", SqlDbType.VarChar);
        objCommand2.Parameters.Add("GOODSID",SqlDbType.VarChar);
        
        //Sql��������ֵ
        objCommand1.Parameters["SELLID"].Value = TextBox1.Text.Trim();
        objCommand2.Parameters["GOODSID"].Value = TextBox2.Text.Trim();
        
        try
        {
            //�����ݿ�����
            if (objConnection.State == ConnectionState.Closed)
            {
                objConnection.Open();
            }

            //��������
            objCommand1.ExecuteNonQuery();
            objCommand2.ExecuteNonQuery();
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
