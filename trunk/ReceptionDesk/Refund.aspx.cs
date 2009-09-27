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

        //数据库连接
        SqlConnection objConnection = new SqlConnection(strConnect);
        //数据库命令
        SqlCommand objCommand1 = new SqlCommand("", objConnection);
        SqlCommand objCommand2 = new SqlCommand("", objConnection);
        //设置Sql语句，插入会员输入的注册信息
        objCommand1.CommandText = "DELETE FROM Sale WHERE SellListID=@SELLID";
        objCommand2.CommandText = "UPDATE Commodity SET sellstate='0' WHERE GoodsID=@GOODSID";
       

        //设置Sql语句参数的类型
        objCommand1.Parameters.Add("SELLID", SqlDbType.VarChar);
        objCommand2.Parameters.Add("GOODSID",SqlDbType.VarChar);
        
        //Sql语句参数赋值
        objCommand1.Parameters["SELLID"].Value = TextBox1.Text.Trim();
        objCommand2.Parameters["GOODSID"].Value = TextBox2.Text.Trim();
        
        try
        {
            //打开数据库连接
            if (objConnection.State == ConnectionState.Closed)
            {
                objConnection.Open();
            }

            //插入数据
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
            //关闭数据库连接
            if (objConnection.State == ConnectionState.Open)
                objConnection.Close();
        }

    }
}
