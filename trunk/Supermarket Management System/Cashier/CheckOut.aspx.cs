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

public partial class Cashier_cashier : System.Web.UI.Page
{
    private static string strConnect = System.Configuration.ConfigurationManager.AppSettings["connStr"];
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //初始化付款方式
            initDealWay();
            
            initSellDate();
            btnInsert.Visible = true;
        }

    }

    private void initSellDate()
    {
        tbxSellDate.Text = DateTime.Now.ToString();
    }

   private void initDealWay()
    {
        DrDpdealway.Items.Clear();
        DrDpdealway.Enabled = true;
        DrDpdealway.Items.Add("<Not Set>");
        DrDpdealway.Items.Add("Cash");
        DrDpdealway.Items.Add("MemberCard");
        DrDpdealway.Items.Add("PendingOrder");
    }



    protected void btnBuy_Click(object sender, EventArgs e)
    {
        /*SqlConnection objConnection = new SqlConnection(strConnect);
        SqlCommand objCommand = new SqlCommand("", objConnection);

        objCommand.CommandText = "SELECT GoodsID, GoodsName, ";
           

        if (DrDpdealway.Text.Trim() == "Cash")
            objCommand.CommandText += "SellingPrice";
        else
            if(DrDpdealway.Text.Trim() == "MemberCard" || DrDpdealway.Text.Trim() == "PendingOrder")
                objCommand.CommandText += "MemberPrice";

        objCommand.CommandText += "FROM Commodity " + "WHERE GoodsID = @GOODSID";

        objCommand.Parameters.Add("GOODSID", SqlDbType.VarChar);

        objCommand.Parameters["GOODSID"].Value = tbxBuyGoodsID.Text.Trim();

        DataSet objDataset = new DataSet();
        SqlDataAdapter objAdapter = new SqlDataAdapter(objCommand);

        try 
        {
            if(objConnection.State == ConnectionState.Closed)
                objConnection.Open();

            objAdapter.Fill(objDataset, "Commodity");
        }
        catch(SqlException exp)
        {
            Session["Error"] = exp.Message;
            Response.Redirect("Error.aspx");
        }
        finally
        {
            if(objConnection.State == ConnectionState.Open)
            {
                objConnection.Close();
            }
        }

        gvBuyGoods.DataSource = objDataset.Tables["Commodity"];
        gvBuyGoods.DataBind();*/
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("GoodsSearch.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        /*SqlConnection objConnection = new SqlConnection(strConnect);
        SqlCommand objCommand = new SqlCommand("", objConnection);

        objCommand.CommandText = "INSERT INTO " + "()";*/



    }


    protected void btnInsert_Click(object sender, EventArgs e)
    {

        SqlConnection objConnection = new SqlConnection(strConnect);
        SqlCommand objCommand = new SqlCommand("", objConnection);

        objCommand.CommandText = "INSERT INTO Sale (SellListID,GoodsID, SellNum, SellDateTime, Dealway, EmployeeID)" +
            " VALUES ('@SELLLISTID', '@GOODSID', '@SELLNUM', '@SELLDATETIME', '@DEALWAY', '@EMPLOYEEID')";

        objCommand.Parameters.Add("SELLLISTID",SqlDbType.VarChar);
        objCommand.Parameters.Add("GOODSID",SqlDbType.VarChar);
        objCommand.Parameters.Add("SELLNUM",SqlDbType.Int);
        objCommand.Parameters.Add("SELLDATETIME",SqlDbType.DateTime);
        objCommand.Parameters.Add("DEALWAY",SqlDbType.Int);

        objCommand.Parameters["SELLLISTID"].Value = TextBox3.Text.Trim();
        objCommand.Parameters["GOODSID"].Value = tbxBuyGoodsID.Text.Trim();
        objCommand.Parameters["SELLNUM"].Value = TextBox1.Text.Trim();
        objCommand.Parameters["SELLDATETIME"].Value = tbxSellDate.Text.Trim();
        objCommand.Parameters["DEALWAY"].Value = 0;
        objCommand.Parameters["EMPLOYEEID"].Value = tbxEmployeeID.Text.Trim();

        try
        {
            if (objConnection.State == ConnectionState.Closed)
                objConnection.Open();

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
