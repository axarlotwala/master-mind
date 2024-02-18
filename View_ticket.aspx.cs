using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class View_ticket : System.Web.UI.Page
{
    SqlConnection sconn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["myConnection"].ToString());
 
    protected void Page_Load(object sender, EventArgs e)
    {
      
      if (Session["Customer"] != null)
            {
            bind_data(Session["Custid"]);
              }
              else
              {
           bind_data2(Session["Empid"]);
              }

    }

    private void bind_data2(object p)
    {
        SqlCommand cmd_sel = new SqlCommand("select *,(select title from Tbl_product where product_id=Tbl_ticket.product_id)as pname From Tbl_ticket where emp_id='" + p + "'", sconn);
        SqlDataAdapter adp = new SqlDataAdapter(cmd_sel);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        Repeater7.DataSource = ds;
        Repeater7.DataBind();
    }

private void bind_data(object p)
{
    SqlCommand cmd_sel = new SqlCommand("select *,(select title from Tbl_product where product_id=Tbl_ticket.product_id)as pname From Tbl_ticket where cust_id='" + p + "'", sconn);
    SqlDataAdapter adp = new SqlDataAdapter(cmd_sel);
    DataSet ds = new DataSet();
    adp.Fill(ds);

    Repeater7.DataSource = ds;
    Repeater7.DataBind();
}


protected void btnreview_Click(object sender, EventArgs e)
{

}
}