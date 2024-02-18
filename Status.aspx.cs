using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Status : System.Web.UI.Page
{
    string mystring = System.Configuration.ConfigurationManager.ConnectionStrings["myConnection"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Empid"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        if (!IsPostBack)
        {

            fill_ticket_id();

        }
    }

    private void fill_ticket_id()
    {
        SqlConnection sconn = new SqlConnection(mystring);
        sconn.Open();

        SqlCommand cmd = new SqlCommand("select * from Tbl_ticket where ticket_id='"+Request.QueryString["tid"] +"'", sconn);
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        drpticktno.DataSource = ds;
        drpticktno.DataValueField = "ticket_id";
        drpticktno.DataTextField = "ticket_id";
        drpticktno.DataBind();


        sconn.Close();

    }


    protected void btnsubmit_Click(object sender, EventArgs e)
       {
            SqlConnection sconn = new SqlConnection(mystring);
            sconn.Open();
            string sqlQuery = "Update tbl_ticket set status='" + drpstatus.SelectedValue + "',descripation='" + txtdescp.Text.Trim() + "' where ticket_id = '" + drpticktno.SelectedValue + "'"; 
            SqlCommand sqlcmd = new SqlCommand(sqlQuery, sconn);
            int res = sqlcmd.ExecuteNonQuery();
            
            if (res != 1)
            {

            }
            else
            {
                Response.Redirect("view_ticket.aspx");
            }
            sconn.Close();
        }
    }