using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
            if (Session["Customer"] != null)
            {
                Session["Customer"] = null;
                Session["Custid"] = null;
                Session.Abandon();
                Session.Clear();
                Response.Redirect("Login.aspx");
            }

            if (Session["Employee"] != null)
            {


                Session["Employee"] = null;
                  
                    Session.Abandon();
                    Session.Clear();
                    Response.Redirect("Login.aspx");
                

            }
    }
}