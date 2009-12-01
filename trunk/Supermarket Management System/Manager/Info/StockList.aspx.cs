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
        //数据库连接
        SqlConnection objConnection = new SqlConnection(strConnect);
        //数据库命令
        SqlCommand objCommand = new SqlCommand("", objConnection);
        //设置Sql语句，插入会员输入的注册信息
        objCommand.CommandText = "INSERT INTO Stock (StockID, StockName, StockAddress, StockPhone)"
            + "VALUES" + "(@STOCKID, @STOCKNAME, @STOCKADD, @STOCKPHONE)";

        //设置Sql语句参数的类型
        objCommand.Parameters.Add("STOCKID", SqlDbType.VarChar);
        objCommand.Parameters.Add("STOCKNAME", SqlDbType.VarChar);
        objCommand.Parameters.Add("STOCKADD", SqlDbType.VarChar);
        objCommand.Parameters.Add("STOCKPHONE", SqlDbType.VarChar);
        

        //Sql语句参数赋值
        objCommand.Parameters["STOCKID"].Value = TextBox2.Text.Trim();
        objCommand.Parameters["STOCKNAME"].Value = TextBox3.Text.Trim();
        objCommand.Parameters["STOCKADD"].Value = TextBox4.Text.Trim();
        objCommand.Parameters["STOCKPHONE"].Value = TextBox5.Text.Trim();
        


        try
        {
            //打开数据库连接
            if (objConnection.State == ConnectionState.Closed)
            {
                objConnection.Open();
            }

            //插入数据
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
            //关闭数据库连接
            if (objConnection.State == ConnectionState.Open)
                objConnection.Close();
        }
            
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {

    }
}
