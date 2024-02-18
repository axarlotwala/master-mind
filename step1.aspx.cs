using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.IO;

public partial class step1 : System.Web.UI.Page
{
    SqlConnection sconn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["myConnection"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
       
             SqlCommand cmd_sel = new SqlCommand("select * from Tbl_customer where contact_no=@contact_no", sconn);

            cmd_sel.Parameters.AddWithValue("@contact_no", txtContact.Text);
            cmd_sel.Connection = sconn;
            SqlDataAdapter adp = new SqlDataAdapter(cmd_sel);
            DataSet ds = new DataSet();
            adp.Fill(ds);


            if (ds.Tables[0].Rows.Count > 0)
            {
                Random generator = new Random();
                int r = generator.Next(100000, 1000000);
                string strUrl = "http://api.mVaayoo.com/mvaayooapi/MessageCompose?user=axarlotwala@gmail.com:123456789&senderID=TEST SMS&receipientno="+txtContact.Text+"&msgtxt=Your vaerification otp cod is "+ r +"&state=4";
                WebRequest request = HttpWebRequest.Create(strUrl);
                HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                Stream s = (Stream)response.GetResponseStream();
                StreamReader readStream = new StreamReader(s);
                string dataString = readStream.ReadToEnd();
                response.Close();
                s.Close();
                readStream.Close();

                 Session["Contact"] = txtContact.Text;
                 SqlCommand cmd = new SqlCommand("update tbl_customer set otp='" + r + "' where contact_no='" + txtContact.Text + "'",sconn);
                 sconn.Open();   
                cmd.ExecuteNonQuery();
                sconn.Close();
                Response.Redirect("step2.aspx");
              
            }
            else
            {
                divError.Visible = true;
            }
        }

    }
