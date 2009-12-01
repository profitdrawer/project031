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


public partial class Manager_Info_EmployeeData : System.Web.UI.Page
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
        objCommand.CommandText = "INSERT INTO Employee " + "(EmployeeID, EmployeeName, SysLoginPwd, Post, EmployeeAddress, EmployeePhone, PopedomID)"
            + "VALUES" + "(@EMPLOYEEID, @EMPLOYEENAME, @PWD, @POST, @EMPLADD, @EMPPHONE, @POPEDOMID)";

        //设置Sql语句参数的类型
        objCommand.Parameters.Add("EMPLOYEEID", SqlDbType.VarChar);
        objCommand.Parameters.Add("EMPLOYEENAME", SqlDbType.VarChar);
        objCommand.Parameters.Add("PWD", SqlDbType.VarChar);
        objCommand.Parameters.Add("POST", SqlDbType.VarChar);
        objCommand.Parameters.Add("EMPLADD", SqlDbType.VarChar);
        objCommand.Parameters.Add("EMPPHONE", SqlDbType.VarChar);
        objCommand.Parameters.Add("POPEDOMID", SqlDbType.Int);


        //Sql语句参数赋值
        objCommand.Parameters["EMPLOYEEID"].Value = TextBox1.Text.Trim();
        objCommand.Parameters["EMPLOYEENAME"].Value = TextBox2.Text.Trim();
        objCommand.Parameters["PWD"].Value = TextBox3.Text.Trim();
        objCommand.Parameters["POST"].Value = TextBox4.Text.Trim();
        objCommand.Parameters["EMPLADD"].Value = TextBox5.Text.Trim();
        objCommand.Parameters["EMPPHONE"].Value = TextBox6.Text.Trim();
        objCommand.Parameters["POPEDOMID"].Value = TextBox7.Text.Trim();



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
            gvEmployeeList.DataBind();
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
