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

    

    protected void Button1_Click(object sender, EventArgs e)
    {
        //���ݿ�����
        SqlConnection objConnection = new SqlConnection(strConnect);
        //���ݿ�����
        SqlCommand objCommand = new SqlCommand("", objConnection);
        //����Sql��䣬�����Ա�����ע����Ϣ
        objCommand.CommandText = "INSERT INTO Stock (StockID, StockName, StockAddress, StockPhone)"
            + "VALUES" + "(@STOCKID, @STOCKNAME, @STOCKADD, @STOCKPHONE)";

        //����Sql������������
        objCommand.Parameters.Add("STOCKID", SqlDbType.VarChar);
        objCommand.Parameters.Add("STOCKNAME", SqlDbType.VarChar);
        objCommand.Parameters.Add("STOCKADD", SqlDbType.VarChar);
        objCommand.Parameters.Add("STOCKPHONE", SqlDbType.VarChar);
        

        //Sql��������ֵ
        objCommand.Parameters["STOCKID"].Value = TextBox2.Text.Trim();
        objCommand.Parameters["STOCKNAME"].Value = TextBox3.Text.Trim();
        objCommand.Parameters["STOCKADD"].Value = TextBox4.Text.Trim();
        objCommand.Parameters["STOCKPHONE"].Value = TextBox5.Text.Trim();
        


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
            gvStockList.DataBind();
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

    protected void btnSearch_Click(object sender, EventArgs e)
    {

    }
}
