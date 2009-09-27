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
        //���ݿ�����
        SqlConnection objConnection = new SqlConnection(strConnect);
        //���ݿ�����
        SqlCommand objCommand = new SqlCommand("", objConnection);
        //����Sql���
        objCommand.CommandText = 
            "SELECT EmployeeID, SysLoginPwd, " +
            "RoleName ";
        objCommand.CommandText +=
            "FROM Employee, UserRole ";
        objCommand.CommandText +=
            "WHERE PopedomID=RoleID AND EmployeeID = @NAME AND SysLoginPwd = @PASSWORD AND RoleName = @ROLE";
        //����Sql������
        objCommand.Parameters.Add("NAME", SqlDbType.VarChar);
        objCommand.Parameters.Add("PASSWORD", SqlDbType.VarChar);
        objCommand.Parameters.Add("ROLE",SqlDbType.VarChar);
        //Sql���������ֵ
        objCommand.Parameters["NAME"].Value = tbxName.Text.Trim();
        objCommand.Parameters["PASSWORD"].Value = tbxPassword.Text.Trim();
        objCommand.Parameters["ROLE"].Value = LoginRole.SelectedValue.ToString();

        try
        {
            //�����ݿ�����
            if (objConnection.State == ConnectionState.Closed)
            {
                objConnection.Open();
            }

            //��ȡ���н��
            SqlDataReader result = objCommand.ExecuteReader();
            if (result.Read() == true)
            {
                //�����û�ID��Sessionȫ�ֱ���
                Session["EmployeeID"] = result["EmployeeID"].ToString();
                Session["SysLoginPwd"] = result["SysLoginPwd"].ToString();
                Session["RoleName"] = result["RoleName"].ToString();
                //���ݵ�¼�û���Ȩ�ޣ���ת����ͬ��ҳ��
                if (Session["RoleName"].ToString() == "Manager")
                {
                    //����ǹ���Ա����ת��Manager.aspx
                    Response.Redirect("Manager/Manager.aspx");
                }
                else
                {
                    //���������Ա����ת��Cashier.aspx
                    if (Session["RoleName"].ToString() == "Cashier")
                    {
                        Response.Redirect("Cashier/CheckOut.aspx");
                    }
                    else
                    {
                        if (Session["RoleName"].ToString() == "Receptist")   //����Ƿ���̨��Ա����ת��Welcom.aspx
                            Response.Redirect("ReceptionDesk/ReceptionDesk.aspx");
                        
                    }
                }

               
            }
            //����Ļ�����ʾlabError
            else
            {
                labError.Visible = true;
            }
        }

        catch (SqlException exp)
        {
            //���session��Ĵ�����Ϣ,����ת��������ʾҳ��
            Session["Error"] = exp.Message;
            Response.Redirect("Error.aspx");
        }

        finally
        {
            //�ر����ݿ�����
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
