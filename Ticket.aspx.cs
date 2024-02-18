using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Ticket : System.Web.UI.Page
{
    SqlConnection sconn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["myConnection"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Customer"] == null)
        {
            Response.Redirect("homepage.aspx");
        }
    }
     protected void btnsubmit_Click(object sender, EventArgs e)
    {
      
        string fname = DateTime.Now.Ticks + fimage.FileName;
       fimage.SaveAs(Server.MapPath("Upload/Ticket/") + fname);

       String SqlQuery = "INSERT INTO tbl_ticket values('" + Session["Custid"] + "','" + Request.QueryString["pid"] + "','" + txtdescp.Text.Trim() + "','" + txtaddress.Text.Trim() + "','" + txtlandmark.Text.Trim() + "','" + lat.Value + "','" + logi.Value + "' ,'" + DateTime.Now.ToString() + "','" + Convert.ToDateTime(txtnextdate.Text.Trim()) + "','" + fname + "','','','','','pending')";
            SqlCommand sqlcmd = new SqlCommand(SqlQuery, sconn);
            sconn.Open();
            
            int res = 0;
            try
            {              
                res = sqlcmd.ExecuteNonQuery();
                if (res != -1)
                {
                    divSuccess.Visible = true;
                    divError.Visible = false;
                }
                 else
                {
                    divSuccess.Visible = false;
                    divError.Visible = true;
                    Response.Redirect("view_ticket.aspx");
                }  
    
            }
            catch (Exception ex)
                {
                divSuccess.Visible = false;
                divError.Visible = true;
                }
            sconn.Close();
    }
   
}