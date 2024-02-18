using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_view_order : System.Web.UI.Page
{
    string mystring = System.Configuration.ConfigurationManager.ConnectionStrings["myConnection"].ToString();


    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
        {
            Response.Redirect("Login.aspx");
        }

        SqlConnection sconn = new SqlConnection(mystring);
        sconn.Open();

        SqlCommand cmd_sel = new SqlCommand("select *,(select cust_name from Tbl_customer where cust_id=Tbl_order.cust_id) as customer  From Tbl_order", sconn);
        SqlDataAdapter adp = new SqlDataAdapter(cmd_sel);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        Repeater5.DataSource = ds;
        Repeater5.DataBind();

        sconn.Close();                     
    }
    protected void Lbtndelete_Click(object sender, EventArgs e)
    {
        SqlConnection sconn = new SqlConnection(mystring);
        sconn.Open();
        SqlCommand del = new SqlCommand("delete from Tbl_order where detail_id='" + hforder_id.Value + "'", sconn);
        del.ExecuteNonQuery();
        Response.Redirect("view_order.aspx");
        sconn.Close();
    }
}