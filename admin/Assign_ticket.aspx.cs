using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class admin_Assign_ticket : System.Web.UI.Page
{
    string mystring = System.Configuration.ConfigurationManager.ConnectionStrings["myConnection"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            view_employee();
            view_ticket();
    
        }

    }

    protected void view_employee()
    {
        SqlConnection sconn = new SqlConnection(mystring);
        sconn.Open();

        SqlCommand cmd_sel = new SqlCommand("select * from Tbl_employee where block='No'", sconn);
        SqlDataAdapter adp = new SqlDataAdapter(cmd_sel);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        ddlemployee.DataSource = ds;
        ddlemployee.DataValueField = "emp_id";
        ddlemployee.DataTextField = "emp_name";
        ddlemployee.DataBind();

        sconn.Close();
    }
    protected void view_ticket()
    {
        SqlConnection sconn = new SqlConnection(mystring);
        sconn.Open();

        SqlCommand cmd_sel = new SqlCommand("select * from Tbl_ticket where status='switch' or status='pending'", sconn);
        SqlDataAdapter adp = new SqlDataAdapter(cmd_sel);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        ddlticket.DataSource = ds;
        ddlticket.DataValueField = "ticket_id";
        ddlticket.DataTextField = "ticket_id";
        ddlticket.DataBind();

        sconn.Close();
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        SqlConnection sconn = new SqlConnection(mystring);
        sconn.Open();
        string sqlQuery = "Update tbl_ticket set emp_id='" + ddlemployee.SelectedValue + "',assign_date='" + DateTime.Now.ToShortDateString() +"',status='Assign' where ticket_id='" + ddlticket.SelectedValue + "'";
        SqlCommand sqlcmd = new SqlCommand(sqlQuery, sconn);
        int res=sqlcmd.ExecuteNonQuery();
        sconn.Close();
        if (res != 1)
        {

        }
        else
        {
            Response.Redirect("view_ticket.aspx");
        }
         
    }
}