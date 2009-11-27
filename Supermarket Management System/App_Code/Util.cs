using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// 一些实用方法
/// </summary>
public class Util
{
    private static string strConnect = System.Configuration.ConfigurationManager.AppSettings["connStr"];

    public static DataTable GetTableSchema(String tableName)
    {
        DataTable schemaTable = new DataTable();
        using (SqlConnection conn = new SqlConnection(strConnect))
        {
            SqlCommand command = new SqlCommand("SELECT * FROM " + tableName, conn);
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            conn.Open();
            adapter.FillSchema(schemaTable, SchemaType.Mapped);
            conn.Close();
        }
        return schemaTable;
    }
}
