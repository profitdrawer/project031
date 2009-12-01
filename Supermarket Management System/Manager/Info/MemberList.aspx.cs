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

public partial class Manager_Info_MemData : System.Web.UI.Page
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
        objCommand.CommandText = "INSERT INTO Member " + "(MemberID, MemberName, Cardstate, CardPwd, MemberAddress, MemberPhone, EnrollDate, AdvancePayment, TotalCost, ConsumerPoints)"
            + "VALUES" + "(@MEMID, @MEMNAME, @CARDSTATE, @CARDPWD, @MEMADD, @MEMPHONE, @ENROLLDATE, @ADVANCEPAY, @TOTALCOST, @CONSUMERPOINTS)";

        //设置Sql语句参数的类型
        objCommand.Parameters.Add("MEMID", SqlDbType.VarChar);
        objCommand.Parameters.Add("MEMNAME", SqlDbType.VarChar);
        objCommand.Parameters.Add("CARDSTATE", SqlDbType.Bit);
        objCommand.Parameters.Add("CARDPWD", SqlDbType.VarChar);
        objCommand.Parameters.Add("MEMADD", SqlDbType.VarChar);
        objCommand.Parameters.Add("MEMPHONE", SqlDbType.VarChar);
        objCommand.Parameters.Add("ENROLLDATE", SqlDbType.DateTime);
        objCommand.Parameters.Add("ADVANCEPAY", SqlDbType.Decimal);
        objCommand.Parameters.Add("TOTALCOST", SqlDbType.Decimal);
        objCommand.Parameters.Add("CONSUMERPOINTS", SqlDbType.Int);

        //Sql语句参数赋值
        objCommand.Parameters["MEMID"].Value = tbxMemberID.Text.Trim();
        objCommand.Parameters["MEMNAME"].Value = tbxMemberName.Text.Trim();
        objCommand.Parameters["CARDSTATE"].Value = radCardStatus.Checked.ToString();
        objCommand.Parameters["CARDPWD"].Value = tbxCardPwd.Text.Trim();
        objCommand.Parameters["MEMADD"].Value = tbxMemberAddress.Text.Trim();
        objCommand.Parameters["MEMPHONE"].Value = tbxMemberPhone.Text.Trim();
        objCommand.Parameters["ENROLLDATE"].Value = tbxEnrollDate.Text.Trim();
        objCommand.Parameters["ADVANCEPAY"].Value = tbxAdvancePayment.Text.Trim();
        objCommand.Parameters["TOTALCOST"].Value = tbxTotalCost.Text.Trim();
        objCommand.Parameters["CONSUMERPOINTS"].Value = tbxConsumerPoints.Text.Trim();


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
            gvMemberList.DataBind();
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
