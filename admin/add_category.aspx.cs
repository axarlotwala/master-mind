using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_Default : System.Web.UI.Page
{
   
    SqlConnection sconn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["myConnection"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
        {
            Response.Redirect("Login.aspx");
        }

        if (!IsPostBack)
        {
            if (Request.QueryString["upd"] != null && Request.QueryString["upd"].ToString() != "")
            {                
                bind_div_data(Request.QueryString["upd"]);                
            }
        }

    }

    private void bind_div_data(string s)
    {
        SqlCommand sel = new SqlCommand("select * from tbl_category where categ_id='"+ s +"'", sconn);
        sconn.Open();
        SqlDataReader dr = sel.ExecuteReader();
        if (dr.Read())
        {
            ViewState["cid"] = dr["categ_id"];
            txtname.Text = dr["categ_name"].ToString();
            txtdescp.Text = dr["categ_description"].ToString();
            lblhead.InnerText = "Update Category";
            imgfile.Visible = true;
            hfOldImageName.Value = dr["categ_image"].ToString();
            imgfile.Src = "image/category/" + dr["categ_image"].ToString();
            RequiredFieldValidator2.Enabled = false;
            btnsubmit.Text = "Update";
            btnreset.Text = "Cancel";
        }
        sconn.Close();
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
       
            if (ViewState["cid"] == null || ViewState["cid"].ToString() == "")
            {
                SqlCommand sel = new SqlCommand("select * from Tbl_category where categ_name = '"+txtname.Text.Trim()+"'",sconn);
                SqlDataAdapter adp = new SqlDataAdapter(sel);
                DataSet ds = new DataSet();
                adp.Fill(ds);
                
              
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                    divError.Visible = true;
                    return;
                    }

              else
              {
                string fname = DateTime.Now.Ticks + FileUpload1.FileName;
                FileUpload1.SaveAs(Server.MapPath("image/category/") + fname);

                string sqlQuery = "INSERT INTO tbl_category values('" + txtname.Text.Trim() + "','" + fname + "','" + txtdescp.Text.Trim() + "')";
                SqlCommand sqlcmd = new SqlCommand(sqlQuery, sconn);
                sconn.Open();
           
                int res = 0;
                try
                {
                    res = sqlcmd.ExecuteNonQuery();
                    if (res != -1)
                    {
                        divSuccess.Visible = true;
                        divError.Visible = false;
                        ClearValues();
                    }
                    else
                    {
                        divSuccess.Visible = false;
                        divError.Visible = true;
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
            else
            {
                string fname = "";
                if (FileUpload1.FileName != "")
                {
                    fname = DateTime.Now.Ticks + FileUpload1.FileName;
                }
                else
                {
                    fname = hfOldImageName.Value;
                }

                string sqlQuery = "Update tbl_category set categ_name='" + txtname.Text.Trim() + "',categ_image='" + fname + "',categ_description='" + txtdescp.Text.Trim() + "' where categ_id='" + ViewState["cid"].ToString() + "'";
                SqlCommand sqlcmd = new SqlCommand(sqlQuery, sconn);
                sconn.Open();
         
                int res = 0;
                try
                {
                    res = sqlcmd.ExecuteNonQuery();
                    if (res != -1)
                    {
                        if (FileUpload1.FileName != "")
                        {
                            FileUpload1.SaveAs(Server.MapPath("image/category/") + fname);
                        }
                        divSuccess.Visible = true;
                        divError.Visible = false;
                        ClearValues();
                        Response.Redirect("view_category.aspx");
                    }
               
                    else
                    {
                      // RequireFieldvalidater = False; 
                        divSuccess.Visible = false;
                        divError.Visible = true;
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
private void ClearValues()
{
        txtname.Text = "";
        txtdescp.Text = "";
        imgfile.Visible = false;
        hfOldImageName.Value = "";
        ViewState["cname"] = null;
}        
    }
