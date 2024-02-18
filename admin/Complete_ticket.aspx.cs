﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_Complete_ticket : System.Web.UI.Page
{
    SqlConnection sconn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["myConnection"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        sconn.Open();

        SqlCommand cmd_sel = new SqlCommand("select  *,(select cust_name From Tbl_Customer where Cust_id=Tbl_ticket.cust_id) as cname ,(select title From Tbl_product where product_id=Tbl_ticket.product_id) as name From Tbl_Ticket where status='complete'", sconn);
        SqlDataAdapter adp = new SqlDataAdapter(cmd_sel);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        sconn.Close();

        Repeater15.DataSource = ds;
        Repeater15.DataBind();
    }
}