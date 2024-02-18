using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_All_Ticket : System.Web.UI.Page
{
    SqlConnection sconn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["myConnection"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        sconn.Open();

        SqlCommand cmd_sel = new SqlCommand("select * from Tbl_ticket", sconn);
        SqlDataAdapter adp = new SqlDataAdapter(cmd_sel);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        sconn.Close();
    }
}