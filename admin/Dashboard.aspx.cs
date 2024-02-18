using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class admin_Dashboard : System.Web.UI.Page
{
   
    SqlConnection sconn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["myConnection"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        sconn.Open();
        SqlCommand uc = new SqlCommand("select Count(*) from Tbl_customer",sconn);
        Lbluser.Text = uc.ExecuteScalar().ToString();

        sconn.Close();
        sconn.Open();
        SqlCommand ti = new SqlCommand("select Count(*) from Tbl_ticket", sconn);
        Lblticket.Text = ti.ExecuteScalar().ToString();

        sconn.Close();

        sconn.Open();
        SqlCommand od = new SqlCommand("select Count(*) from Tbl_order", sconn);
        Lblorder.Text = od.ExecuteScalar().ToString();

        sconn.Close();
        sconn.Open();
        SqlCommand ei = new SqlCommand("select Count(*) from Tbl_employee", sconn);
        Lblemployee.Text =ei.ExecuteScalar().ToString();

        sconn.Close();
        GetChart();
    }

    public void GetChart()
    {
        SqlDataAdapter da = new SqlDataAdapter("select COUNT(order_id) as Count,Tbl_customer.cust_name from Tbl_order inner join Tbl_customer on Tbl_order.cust_id = Tbl_customer.cust_id group by Tbl_customer.cust_name", sconn);
        DataTable dt = new DataTable();
        da.Fill(dt);

        Chart1.DataSource = dt;
        Chart1.DataBind();
    }

}