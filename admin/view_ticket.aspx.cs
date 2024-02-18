using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;



public partial class admin_view_ticket : System.Web.UI.Page
{
    string mystring = System.Configuration.ConfigurationManager.ConnectionStrings["myConnection"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["del"] != null && Request.QueryString["del"].ToString() != "")
        {
            SqlConnection sconn = new SqlConnection(mystring);
            sconn.Open();
            SqlCommand del = new SqlCommand("delete from Tbl_ticket where ticket_id=' " + Request.QueryString["del"] + "'", sconn);
            del.ExecuteNonQuery();
            Response.Redirect("view_category.aspx");
            sconn.Close();
        }
         view_ticket();

    }

    private void view_ticket()
    {
        
        SqlConnection Sconn = new SqlConnection(mystring);
        Sconn.Open();


        SqlCommand cmd_sel = new SqlCommand("select *,(select title from Tbl_product Where product_id=tbl_ticket.product_id)as pid ,(select emp_name from Tbl_Employee Where emp_id=Tbl_ticket.emp_id)as ename,(select cust_name from Tbl_customer Where cust_id=Tbl_ticket.cust_id)as cname from tbl_ticket", Sconn);

        SqlDataAdapter adp = new SqlDataAdapter(cmd_sel);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        Repeater12.DataSource = ds;
        Repeater12.DataBind();
        Sconn.Close();

    }
    protected void Lbtndelete_Click(object sender, EventArgs e)
    {
        SqlConnection sconn = new SqlConnection(mystring);
        sconn.Open();
        SqlCommand del = new SqlCommand("delete from Tbl_ticket where ticket_id='" + hfcid.Value + "'", sconn);
        del.ExecuteNonQuery();
        Response.Redirect("view_ticket.aspx");
        sconn.Close();
    }
    }
