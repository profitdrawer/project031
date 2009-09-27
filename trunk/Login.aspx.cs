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

public partial class Login : System.Web.UI.Page
{
    private static string strConnect = System.Configuration.ConfigurationManager.AppSettings["connStr"];
    protected void Page_Load(object sender, EventArgs e)
    {
         if(!IsPostBack)
        {
            initLoginRole();
        }
        
    }

    private void initLoginRole()
    {
        LoginRole.Items.Clear();
        LoginRole.Enabled = true;
        LoginRole.Items.Add("<Not Set>");
        LoginRole.Items.Add("Cashier");
        LoginRole.Items.Add("Receptist");
        LoginRole.Items.Add("Manager");
        
    }


    protected void LoginButton_Click(object sender, EventArgs e)
    {
        //数据库连接
        SqlConnection objConnection = new SqlConnection(strConnect);
        //数据库命令
        SqlCommand objCommand = new SqlCommand("", objConnection);
        //设置Sql语句
        objCommand.CommandText = 
            "SELECT EmployeeID, SysLoginPwd, " +
            "RoleName ";
        objCommand.CommandText +=
            "FROM Employee, UserRole ";
        objCommand.CommandText +=
            "WHERE PopedomID=RoleID AND EmployeeID = @NAME AND SysLoginPwd = @PASSWORD AND RoleName = @ROLE";
        //设置Sql语句参数
        objCommand.Parameters.Add("NAME", SqlDbType.VarChar);
        objCommand.Parameters.Add("PASSWORD", SqlDbType.VarChar);
        objCommand.Parameters.Add("ROLE",SqlDbType.VarChar);
        //Sql语句能数赋值
        objCommand.Parameters["NAME"].Value = tbxName.Text.Trim();
        objCommand.Parameters["PASSWORD"].Value = tbxPassword.Text.Trim();
        objCommand.Parameters["ROLE"].Value = LoginRole.SelectedValue.ToString();

        try
        {
            //打开数据库连接
            if (objConnection.State == ConnectionState.Closed)
            {
                objConnection.Open();
            }

            //获取运行结果
            SqlDataReader result = objCommand.ExecuteReader();
            if (result.Read() == true)
            {
                //设置用户ID的Session全局变量
                Session["EmployeeID"] = result["EmployeeID"].ToString();
                Session["SysLoginPwd"] = result["SysLoginPwd"].ToString();
                Session["RoleName"] = result["RoleName"].ToString();
                //根据登录用户的权限，跳转到不同的页面
                if (Session["RoleName"].ToString() == "Manager")
                {
                    //如果是管理员，跳转到Manager.aspx
                    Response.Redirect("Manager/Manager.aspx");
                }
                else
                {
                    //如果是收银员，跳转到Cashier.aspx
                    if (Session["RoleName"].ToString() == "Cashier")
                    {
                        Response.Redirect("Cashier/CheckOut.aspx");
                    }
                    else
                    {
                        if (Session["RoleName"].ToString() == "Receptist")   //如果是服务台人员，跳转到Welcom.aspx
                            Response.Redirect("ReceptionDesk/ReceptionDesk.aspx");
                        
                    }
                }

               
            }
            //出错的话，显示labError
            else
            {
                labError.Visible = true;
            }
        }

        catch (SqlException exp)
        {
            //填充session里的错误信息,并跳转到错误显示页面
            Session["Error"] = exp.Message;
            Response.Redirect("Error.aspx");
        }

        finally
        {
            //关闭数据库连接
            if (objConnection.State == ConnectionState.Open)
            {
                objConnection.Close();
            }
        }
    }

    protected void CancelButton_Click(object sender, EventArgs e)
    {
        LoginRole.Items.Clear();
        tbxName.Text = "";
        tbxPassword.Text = "";
        labError.Visible = false;
        initLoginRole();
    }
}
