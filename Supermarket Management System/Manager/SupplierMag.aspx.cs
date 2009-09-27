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

        //数据库连接
        SqlConnection objConnection = new SqlConnection(strConnect);
        //数据库命令
        SqlCommand objCommand = new SqlCommand("", objConnection);
        //设置Sql语句，插入会员输入的注册信息
        objCommand.CommandText = "INSERT INTO GoodsProviding " + "(ListID, GoodsID, SupplierID, NeedNum, ListDate, AffordMoney)"
            + "VALUES" + "(@LIST, @GOODS, @SUPPLIER, @NUM, @DATE, @MONEY)";

        //设置Sql语句参数的类型
        objCommand.Parameters.Add("LIST", SqlDbType.VarChar);
        objCommand.Parameters.Add("GOODS", SqlDbType.VarChar);
        objCommand.Parameters.Add("SUPPLIER", SqlDbType.VarChar);
        objCommand.Parameters.Add("NUM", SqlDbType.Int);
        objCommand.Parameters.Add("DATE", SqlDbType.DateTime);
        objCommand.Parameters.Add("MONEY", SqlDbType.Decimal);

        //Sql语句参数赋值
        objCommand.Parameters["LIST"].Value = TextBox1.Text.Trim();
        objCommand.Parameters["GOODS"].Value = TextBox2.Text.Trim();
        objCommand.Parameters["SUPPLIER"].Value = TextBox3.Text.Trim();
        objCommand.Parameters["NUM"].Value = TextBox4.Text.Trim();
        objCommand.Parameters["DATE"].Value = TextBox5.Text.Trim();
        objCommand.Parameters["MONEY"].Value = TextBox6.Text.Trim();

        try
        {
            //打开数据库连接
            if (objConnection.State == ConnectionState.Closed)
            {
                objConnection.Open();
            }

            //插入数据
            objCommand.ExecuteNonQuery();
        }

        catch (SqlException exp)
        {
            Session["Error"] = exp.Message;
            Response.Redirect("Error.aspx");

        }

        finally
        {
            //关闭数据库连接
            if (objConnection.State == ConnectionState.Open)
                objConnection.Close();
        }

    }
}
