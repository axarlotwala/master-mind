using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class User : System.Web.UI.MasterPage
{
    SqlConnection sconn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["myConnection"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Customer"] != null && Session["Customer"].ToString() != "")
        {
            Labelsession.Text = "Wel Come " + Session["Customer"].ToString();
            customer.Visible = true;
            mycart.Visible = true;
            myticket.Visible = true;
            myproduct.Visible = true;
            myccoiuny.Visible = true;
            signout.Visible = true;
            signin.Visible = false;
            employe.Visible = false;

        }
        else if (Session["Employee"] != null && Session["Employee"].ToString() != "")
        {
            Label1.Text = "Wel Come " + Session["Employee"].ToString();
            customer.Visible = false;
            employe.Visible = true;
            Logout.Visible = true;
            Login.Visible = false;
            Li3.Visible = true;
        }
        else
        {
            Labelsession.Text = "Wel Come Guest !!!";
            customer.Visible = true;
            mycart.Visible = false;
            myticket.Visible = false;
            myproduct.Visible = false;
            myccoiuny.Visible = false;
            signout.Visible = false;
            signin.Visible = true;
            employe.Visible = false;
        }
        view_category();
    }
    protected void view_category()
    {
        SqlDataAdapter adp2 = new SqlDataAdapter("select TOP 6 * from tbl_category ORDER BY categ_id DESC", sconn);
        DataSet ds2 = new DataSet();
        adp2.Fill(ds2);

        Repeater1.DataSource = ds2;
        Repeater1.DataBind();
    }
}
