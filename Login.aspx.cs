using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Drawing.Imaging;
using System.Drawing;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using System.Threading;
using System.ComponentModel;
using System.IO.Ports;
using System.Globalization;

namespace bramhacorp
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["temp.Properties.Settings.tempConnectionString"].ConnectionString);
        public static string s;
        public string docmax { get; set; }
        bool countid = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            //string useragent = Request.Headers["User-Agent"].ToString();
            var userAgent = Request.Headers["User-Agent"];
            string uaString = Convert.ToString(userAgent[0]);


            //var uaParser = Parser.GetDefault();
            //ClientInfo c = uaParser.Parse(uaString);
            if (!IsPostBack)
            {


                try
                {

                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }
                    //Application["countid"] = "1";

                    Application["amauniqueid"] = null;
                    
               
                   

                }
                catch (Exception ex)
                {
                }
                finally
                {
                    if (con.State == ConnectionState.Open)
                    {
                        con.Close();
                        Response.Redirect("inventorytemp.aspx?uid=" + Session["stringuid"].ToString() +" ", false);
                        
                    }

                }
            }
        }



        protected void btnlogin_Click(object sender, EventArgs e)
        {
            try
            {
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }


                if (txtloginname.Text != "" && txtloginpass.Text != "")
                {
                    SqlCommand cmd = new SqlCommand("select  *,name as name from CustomerMaster   where isaccountverify='1' and password=@password and  mobileno=@mobileno ", con);
                    cmd.Parameters.AddWithValue("@password", encryptdecrypt.Encrypt(txtloginpass.Text));
                    cmd.Parameters.AddWithValue("@mobileno", txtloginname.Text);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt2 = new DataTable();
                    da.Fill(dt2);
                    if (dt2.Rows.Count > 0)
                    {
                        Application["amauniqueid"] = dt2.Rows[0]["id"].ToString();
                        lblmesg.Text = "";
                        Session["id"] = dt2.Rows[0]["id"].ToString();
                        Response.Redirect("inventorytemp.aspx?uid=" + dt2.Rows[0]["id"].ToString(), false);

                    }
                    else
                    {
                        lblmesg.Text = "Invalid Credentials";
                    }
                }

            }
            catch (Exception ex)
            {

            }
            finally
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                    
                }
                //lblmesg.Text = "";

            }

        }

        protected void showRegister_Click(object sender, EventArgs e)
        {
            divcontainer.Attributes["style"] = " display:block;right: 0px; left: 0px; margin: 0px auto; bottom: 0px; top: auto;";
            divright.Attributes["style"] = " display:none;";

        }

    }
}