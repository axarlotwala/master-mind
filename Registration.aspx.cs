using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Registration : System.Web.UI.Page
{
    SqlConnection sconn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["myConnection"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
   
    }
    protected void btnsubmit_Click1(object sender, EventArgs e)
    { 
        int res=0;
        try
         {
             string pimage = DateTime.Now.Ticks + Fileprofile.FileName;
             Fileprofile.SaveAs(Server.MapPath("img/Customer/") + pimage);

            sconn.Open();
            String SqlQuery = "INSERT INTO Tbl_customer values('" + txtcustname.Text + "','" + txtcustcontact.Text + "','" + txtcustemail.Text + "','" + txtcustpassword.Text + "','" + txtcustaddress.Text + "','" + DateTime.Now.ToLocalTime() + "','No','','" + pimage + "')";
            SqlCommand cmd = new SqlCommand(SqlQuery, sconn);
          

            res=cmd.ExecuteNonQuery();
         }
        catch (Exception ex)
         {
            sconn.Close();

         }
        finally
         {
            sconn.Close();
            Clearvalues();
         }
                if (res != -1)
                    {
                        divSuccess.Visible = true;
                        divError.Visible = false;
                        Clearvalues();
                    }
                    else
                    {
                        divSuccess.Visible = false;
                        divError.Visible = true;
                    }
    }
    private void Clearvalues()
    {
 	    txtcustname.Text = "";
        txtcustcontact.Text = "";
        txtcustemail.Text = "";
        txtcustpassword.Text = "";
        txtcustaddress.Text = "";
    }

}
