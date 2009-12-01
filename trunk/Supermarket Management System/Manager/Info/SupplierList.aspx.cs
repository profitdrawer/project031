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

public partial class Manager_Info_SupplierList : System.Web.UI.Page
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
        objCommand.CommandText = "INSERT INTO Supplier " + "(SupplierID, SupplierName, SupplierAddress, SupplierPhone, linkman)"
            + "VALUES" + "(@SUPPLIERID, @SUPPLIERNAME, @SUPPLIERADD, @SUPPLIERPH, @LINKMAN)";

        //设置Sql语句参数的类型
        objCommand.Parameters.Add("SUPPLIERID", SqlDbType.VarChar);
        objCommand.Parameters.Add("SUPPLIERNAME", SqlDbType.VarChar);
        objCommand.Parameters.Add("SUPPLIERADD", SqlDbType.VarChar);
        objCommand.Parameters.Add("SUPPLIERPH", SqlDbType.VarChar);
        objCommand.Parameters.Add("LINKMAN", SqlDbType.VarChar);
        

        //Sql语句参数赋值
        objCommand.Parameters["SUPPLIERID"].Value = TextBox2.Text.Trim();
        objCommand.Parameters["SUPPLIERNAME"].Value = TextBox3.Text.Trim();
        objCommand.Parameters["SUPPLIERADD"].Value = TextBox4.Text.Trim();
        objCommand.Parameters["SUPPLIERPH"].Value = TextBox5.Text.Trim();
        objCommand.Parameters["LINKMAN"].Value = TextBox6.Text.Trim();
        

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
            gvSupplierList.DataBind();
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
