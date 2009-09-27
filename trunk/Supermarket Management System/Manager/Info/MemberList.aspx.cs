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
        //���ݿ�����
        SqlConnection objConnection = new SqlConnection(strConnect);
        //���ݿ�����
        SqlCommand objCommand = new SqlCommand("", objConnection);
        //����Sql��䣬�����Ա�����ע����Ϣ
        objCommand.CommandText = "INSERT INTO Member " + "(MemberID, MemberName, Cardstate, CardPwd, MemberAddress, MemberPhone, EnrollDate, AdvancePayment, TotalCost, ConsumerPoints)"
            + "VALUES" + "(@MEMID, @MEMNAME, @CARDSTATE, @CARDPWD, @MEMADD, @MEMPHONE, @ENROLLDATE, @ADVANCEPAY, @TOTALCOST, @CONSUMERPOINTS)";

        //����Sql������������
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

        //Sql��������ֵ
        objCommand.Parameters["MEMID"].Value = TextBox1.Text.Trim();
        objCommand.Parameters["MEMNAME"].Value = TextBox2.Text.Trim();
        objCommand.Parameters["CARDSTATE"].Value = RadioButton1.Checked.ToString();
        objCommand.Parameters["CARDPWD"].Value = TextBox4.Text.Trim();
        objCommand.Parameters["MEMADD"].Value = TextBox5.Text.Trim();
        objCommand.Parameters["MEMPHONE"].Value = TextBox6.Text.Trim();
        objCommand.Parameters["ENROLLDATE"].Value = TextBox7.Text.Trim();
        objCommand.Parameters["ADVANCEPAY"].Value = TextBox10.Text.Trim();
        objCommand.Parameters["TOTALCOST"].Value = TextBox9.Text.Trim();
        objCommand.Parameters["CONSUMERPOINTS"].Value = TextBox11.Text.Trim();


        try
        {
            //�����ݿ�����
            if (objConnection.State == ConnectionState.Closed)
            {
                objConnection.Open();
            }

            //��������
            objCommand.ExecuteNonQuery();
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
