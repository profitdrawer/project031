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

public partial class Cashier_GoodsQuery : System.Web.UI.Page
{
    private static string strConnect = System.Configuration.ConfigurationManager.AppSettings["connStr"];
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            gvCommoditySearch.Visible = true;
    }

    //���������¼�
    protected void btnSearch_Click(object sender, EventArgs e)
    {
     /*  //���ݿ�����
        SqlConnection objConnection = new SqlConnection(strConnect);
        //���ݿ�����
        SqlCommand objCommand = new SqlCommand("", objConnection);
        //����Sql���
        objCommand.CommandText = "SELECT GoodsID, GoodsName, SellingPrice, MemberPrice, sellstate, GoodsMoreInfo " + "FROM Commodity " + "WHERE 1=1 ";

        if(tbxCommodityName.Text != "")
        {
            objCommand.CommandText += "AND GoodsName like '@COMMODITYNAME'";
        }

        if(tbxPriceFrom.Text != "")
        {
            objCommand.CommandText += "AND SellingPrice >= @PRICEFROM";
            objCommand.Parameters.Add("PRICEFROM", SqlDbType.Decimal);
            objCommand.Parameters["PRICEFROM"].Value = tbxPriceFrom.Text.Trim();
        }
        if(tbxPriceTo.Text != "")
        {
            objCommand.CommandText += "AND SellingPrice <= @PRICETO";
            objCommand.Parameters.Add("PRICETO", SqlDbType.Decimal);
            objCommand.Parameters["PRICETO"].Value = tbxPriceTo.Text.Trim();
        }

        //����Sql����������
        objCommand.Parameters.Add("COMMODITYNAME", SqlDbType.VarChar);
        
        

        //Sql��������ֵ
        objCommand.Parameters["COMMODITYNAME"].Value = "%" + tbxCommodityName.Text.Trim() + "%";     

        //����ʹ��DataAdapter��DataSet��ȡ����
        DataSet objDataset = new DataSet();
        SqlDataAdapter objAdapter = new SqlDataAdapter();
        objAdapter.SelectCommand = new SqlCommand(objCommand.CommandText, objConnection);

        try
        {
            //�����ݿ�����
            if (objConnection.State == ConnectionState.Closed)
            {
                objConnection.Open();
            }
            //�������
            objAdapter.Fill(objDataset);
        }
        catch (SqlException exp)
        {
            Session["Error"] = exp.Message;
            Response.Redirect("Error.aspx");
        }
        finally
        {
            //�ر����ݿ�����
            if(objConnection.State == ConnectionState.Open)
            {
                objConnection.Close();
            }
        }

        //��������Դ
        //gvCommoditySearch.DataSource = objDataset.Tables["Commodity"];
        //������Դ
        //gvCommoditySearch.DataBind();
   */

    }

    protected void btnClearSearch_Click(object sender, EventArgs e)
    {
        tbxCommodityName.Text = "";
        tbxPriceFrom.Text = "";
        tbxPriceTo.Text = "";
    }
    protected void gvCommoditySearch_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
