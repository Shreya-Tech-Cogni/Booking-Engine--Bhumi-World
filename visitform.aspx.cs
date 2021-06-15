using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.Net.Mail;

namespace bramhacorp
{
    public partial class visitform : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["temp.Properties.Settings.tempConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                //txtdate.Attributes["min"] = DateTime.Now.ToString("2020-10-");
                txtdate.Attributes["min"] = DateTime.Now.ToString("yyyy-MM-dd");
                //txtdate.Attributes["min"] = DateTime.Now+1.ToString("yyyy-MM-dd");
                
                
            }
            //con.O
        }
        protected void lnksubmit_Click(object sender, EventArgs e)
        {

            try
            {
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                if (txtfirstname.Text != "" && txtlastname.Text != "" && txtemail.Text != "" && txtmobileno.Text != "" && txtdate.Text != "" && DropDownList1.SelectedItem.Value != "")
                {
                    SqlCommand cmd2 = new SqlCommand("select id,emailid,mobileno from customermaster where emailid=@emailid and mobileno=@mobileno", con);
                    cmd2.Parameters.AddWithValue("@emailid", txtemail.Text);
                    cmd2.Parameters.AddWithValue("@mobileno", txtmobileno.Text);
                    SqlDataAdapter adp = new SqlDataAdapter(cmd2);
                    DataTable dt24 = new DataTable();
                    adp.Fill(dt24);
                    if (dt24.Rows.Count > 0)
                    {
                        //pnlsitevistform.Visible = false;
                        //pnlreg.Visible = true;
                        insertdata();

                        Session["userid"] = dt24.Rows[0]["id"].ToString();
                    }
                    else
                    {
                        pnlsitevistform.Visible = false;
                        pnlreg.Visible = true;
                        
                        
                        pnlSuccessmsg.Visible = false;
                        pnlthanks.Visible = false;



                    }
                }
                else
                {
                    lblmsg.Text = "Please fill the form";
                }


                //if (k > 0)
                //{
                //    ////SqlCommand cmd2 = new SqlCommand("select c.emailid,c.mobileno from customermaster as c inner join visitrequest as v on c.emailid=v.emailid and c.mobileno=v.mobileno ",con);
                //    //SqlCommand cmd2 = new SqlCommand("select id,emailid,mobileno from customermaster where emailid=@emailid and mobileno=@mobileno", con);
                //    //cmd2.Parameters.AddWithValue("@emailid", txtemail.Text);
                //    //cmd2.Parameters.AddWithValue("@mobileno", txtmobileno.Text);
                //    //SqlDataAdapter adp = new SqlDataAdapter(cmd2);
                //    //DataTable dt24 = new DataTable();
                //    //adp.Fill(dt24);
                //    //if (dt24.Rows.Count > 0)
                //    {

                //        string message = "Your details have been saved successfully.";
                //        string script = "window.onload = function(){ alert('";
                //        script += message;
                //        script += "')};";
                //        ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
                //    }
                //    else
                //    {
                //        //pnlreg.Visible = true;
                //        //pnlsitevistform.Visible = false;
                //    }


                //    //if (txtfirstname.Text != "" && txtlastname.Text != "" && txtemail.Text != "" && txtmobileno.Text != "" && txtremark.Text != "")
                //    //{
                //    //    string message = "Your details have been saved successfully.";
                //    //    string script = "window.onload = function(){ alert('";
                //    //    script += message;
                //    //    script += "')};";
                //    //    ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
                //    //}
                //}



            }
            catch (Exception ex)
            {
                //
            }
            finally
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
                //pnlsitevistform.Visible = false;
                // pnlreg.Visible = true;

            }




        }
        protected void insertdata()
        {
            try
            {
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                if (txtfirstname.Text != "" && txtlastname.Text != "" && txtemail.Text != "" && txtmobileno.Text != "" && txtdate.Text != "" && DropDownList1.SelectedItem.Value != "")
                {

                    SqlCommand cmd = new SqlCommand("insert into sitevisitrequest(firstname,entrydate,lastname,emailid,mobileno,visitdate,visittime,remark) values(@firstname,@entrydate,@lastname,@emailid,@mobileno,@visitdate,@visittime,@remark)", con);
                    cmd.Parameters.AddWithValue("@firstname", txtfirstname.Text);
                    cmd.Parameters.AddWithValue("@entrydate", encryptdecrypt.indiandate());
                    cmd.Parameters.AddWithValue("@lastname", txtlastname.Text);
                    cmd.Parameters.AddWithValue("@emailid", txtemail.Text);
                    cmd.Parameters.AddWithValue("@mobileno", txtmobileno.Text);
                    cmd.Parameters.AddWithValue("@visitdate", Convert.ToDateTime(txtdate.Text));
                    cmd.Parameters.AddWithValue("@visittime", DropDownList1.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@remark", txtremark.Text);
                    int k = cmd.ExecuteNonQuery();
                    pnlsitevistform.Visible = false;
                    pnlreg.Visible = false;
                    pnlSuccessmsg.Visible = true;
                    pnlthanks.Visible = true;
                    //lblheader.Text = "Successful";
                    lblsitevisitmsg.Text = "You data submitted successfully . Our team will get in touch with you shortly.";
                    pnlsuccess.Visible = true;
                }
                else
                {
                    lblmsg.Text = "Please fill the required details";
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
            }

        }
        protected void lnklogin_Click(object sender, EventArgs e)
        {

            if (lnklogin.CommandArgument.ToString() == "0")
            {
                pnlfor.Visible = false;
                pnlotp.Visible = false;
                Button1.Visible = false;

                pnlregi.Visible = true;
                btnregister.Visible = true;
                btnlogin.Visible = false;
                pnllogin.Visible = false;

                lnklogin.CommandArgument = "1";
                lnklogin.Text = "Go to Login";
                lbllogin.Text = "registration";
                lblmesg.Text = "";


                lnkforget.Visible = false;
                txtname.Text = "";
                
                txtotp.Text = "";
                txtemailid.Text = txtemail.Text;
                txtmob.Text = txtmobileno.Text;
                txtloginpass.Text = "";
                btnresendotp.Visible = false;
                txtloginname.Text = "";
                
            }
            else if (lnklogin.CommandArgument.ToString() == "1")
            {
                pnlfor.Visible = false;
                lblmesg.Text = "";
                lbllogin.Text = "Login";
                pnlotp.Visible = false;
                Button1.Visible = false;

                pnlregi.Visible = false;
                btnregister.Visible = false;
                btnlogin.Visible = true;
                pnllogin.Visible = true;

                lnklogin.CommandArgument = "0";
                lnklogin.Text = "Don't have an account? Register ";


                lnkforget.Visible = true;
                txtname.Text = "";
                txtemailid.Text = "";
                txtotp.Text = "";
                txtmob.Text = "";
                txtloginpass.Text = "";
                txtloginname.Text = "";
                btnresendotp.Visible = false;

            }
        }

        protected void timerresendotp_Tick(object sender, EventArgs e)
        {
            try
            {
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                btnresendotp.Visible = true;
                timerresendotp.Enabled = false;
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
            }
        }
        protected void showRegister_Click(object sender, EventArgs e)
        {
            divcontainer.Attributes["style"] = " display:block;right: 0px; left: 0px; margin: 0px auto; bottom: 0px; top: auto;";


        }



        protected void btnlogin_Click(object sender, EventArgs e)
        {

            try
            {
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                if (txtloginname.Text.Length != 10)
                {
                    lblmesg.Text = "Please enter 10 digits mobile number.";
                    return;
                }

                if (txtloginname.Text != "" && txtloginpass.Text != "")
                {
                    SqlCommand cmd = new SqlCommand("select  id,name as name from CustomerMaster   where isaccountverify='1' and password=@password and  mobileno=@mobileno ", con);
                    cmd.Parameters.AddWithValue("@password", encryptdecrypt.Encrypt(txtloginpass.Text));
                    cmd.Parameters.AddWithValue("@mobileno", txtloginname.Text);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt2 = new DataTable();
                    da.Fill(dt2);
                    if (dt2.Rows.Count > 0)
                    {
                        Session["id"] = dt2.Rows[0]["id"].ToString();
                        Session["username"] = dt2.Rows[0]["name"].ToString();
                        Session["projectid"] = "2";
                        pnlotp.Visible = false;
                        Button1.Visible = false;

                        pnlregi.Visible = false;
                        btnregister.Visible = false;
                        btnlogin.Visible = false;
                        pnllogin.Visible = false;

                        //pnlsitevistform.Visible = true;
                        //pnlreg.Visible = false;
                        //insertdata();
                        lblmesg.Text = "";


                        lblagree.Text = "";
                        lnklogin.Visible = false;
                        lnkforget.Visible = false;
                        Session["stringuid"] = dt2.Rows[0]["id"].ToString();
                        DataBind();
                        string uid = Session["id"].ToString();
                        string executiveid = "0";
                        string weblink = "";
                        string locallink = "", emobileno = "", cmobileno = "", cname = "", cemailid = "", eemailid = "";
                        SqlCommand cmd2 = new SqlCommand("select executiveid,name,mobileno,emailid from customermaster where id=@uid ", con);
                        cmd2.Parameters.AddWithValue("@uid", uid);
                        SqlDataAdapter adp = new SqlDataAdapter(cmd2);
                        DataTable dt = new DataTable();
                        adp.Fill(dt);
                        if (dt.Rows.Count > 0)
                        {
                            string eid = dt.Rows[0]["executiveid"].ToString();
                            cname = dt.Rows[0]["name"].ToString();
                            cmobileno = dt.Rows[0]["mobileno"].ToString();
                            cemailid = dt.Rows[0]["emailid"].ToString();
                            if (eid != "" && eid != null)
                            {
                                SqlCommand cmdee = new SqlCommand("select TOP(1) id,weblink,mobileno,emailid From galaxyaccount where isonline='1' and id=@id ", con);
                                cmdee.Parameters.AddWithValue("@id", eid);
                                SqlDataAdapter adp1 = new SqlDataAdapter(cmdee);
                                DataTable dt1 = new DataTable();
                                adp1.Fill(dt1);
                                if (dt1.Rows.Count > 0)
                                {
                                    executiveid = dt1.Rows[0]["id"].ToString();
                                    locallink = dt1.Rows[0]["weblink"].ToString();
                                    emobileno = dt1.Rows[0]["mobileno"].ToString();
                                    eemailid = dt1.Rows[0]["emailid"].ToString();
                                    weblink = "https://engage.embassy.in/thecollection/AdminLogin";
                                }
                                else
                                {
                                    SqlCommand cmdee1 = new SqlCommand("select top(1) id,weblink,mobileno,emailid From galaxyaccount where isonline='1' and ( id not in (select executiveid from leadassigntable)) and deptid=2 ORDER BY NEWID()", con);
                                    cmdee1.Parameters.AddWithValue("@id", eid);
                                    SqlDataAdapter adp12 = new SqlDataAdapter(cmdee1);
                                    DataTable dt12 = new DataTable();
                                    adp12.Fill(dt12);
                                    if (dt12.Rows.Count > 0)
                                    {

                                        executiveid = dt12.Rows[0]["id"].ToString();
                                        locallink = dt12.Rows[0]["weblink"].ToString();
                                        emobileno = dt12.Rows[0]["mobileno"].ToString();
                                        eemailid = dt12.Rows[0]["emailid"].ToString();
                                        weblink = "https://engage.embassy.in/thecollection/AdminLogin";
                                        SqlCommand cmdee1h = new SqlCommand(" insert into  leadassigntable (executiveid) values(@executiveid)", con);
                                        cmdee1h.Parameters.AddWithValue("@executiveid", executiveid);
                                        cmdee1h.ExecuteNonQuery();
                                    }
                                    else
                                    {

                                        SqlCommand cmdee1k = new SqlCommand("select TOP(1) id,weblink,mobileno,emailid From galaxyaccount where ( id not in (select executiveid from leadassigntable)) and deptid=2 ORDER BY NEWID()", con);
                                        cmdee1k.Parameters.AddWithValue("@id", eid);
                                        SqlDataAdapter adp12k = new SqlDataAdapter(cmdee1k);
                                        DataTable dt12k = new DataTable();
                                        adp12k.Fill(dt12k);
                                        if (dt12k.Rows.Count == 0)
                                        {

                                            SqlCommand cmdee1h = new SqlCommand("delete from leadassigntable where executiveid>0", con);
                                            cmdee1h.ExecuteNonQuery();
                                            SqlCommand cmdee1g = new SqlCommand("select  TOP(1) id,weblink,mobileno,emailid  From galaxyaccount where  isonline='1' and deptid=2 ORDER BY NEWID()", con);
                                            cmdee1g.Parameters.AddWithValue("@id", eid);
                                            SqlDataAdapter adp12g = new SqlDataAdapter(cmdee1g);
                                            DataTable dt12g = new DataTable();
                                            adp12g.Fill(dt12g);
                                            if (dt12g.Rows.Count > 0)
                                            {
                                                executiveid = dt12g.Rows[0]["id"].ToString();
                                                locallink = dt12g.Rows[0]["weblink"].ToString();
                                                emobileno = dt12g.Rows[0]["mobileno"].ToString();
                                                eemailid = dt12g.Rows[0]["emailid"].ToString();
                                                weblink = "https://engage.embassy.in/thecollection/AdminLogin";
                                                SqlCommand cmdee1hh = new SqlCommand(" insert into  leadassigntable (executiveid) values(@executiveid)", con);
                                                cmdee1hh.Parameters.AddWithValue("@executiveid", executiveid);
                                                cmdee1hh.ExecuteNonQuery();
                                            }
                                            else
                                            {

                                                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('all Executives are offline please try again later after some time')", true);
                                            }
                                        }
                                        else
                                        {
                                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('all Executives are offline please try again later after some time')", true);

                                        }

                                    }
                                }
                                SqlCommand cmdf = new SqlCommand("update customermaster set  weblink=@weblink, statusid=@statusid,statusdate=@statusdate, executiveid=@executiveid,isrequestaccepted=@isrequestaccepted,requesteddate=@requesteddate where  id=@uid ", con);
                                cmdf.Parameters.AddWithValue("@uid", uid);
                                cmdf.Parameters.AddWithValue("@executiveid", executiveid);
                                cmdf.Parameters.AddWithValue("@isrequestaccepted", "0");
                                cmdf.Parameters.AddWithValue("@statusid", "1");
                                cmdf.Parameters.AddWithValue("@statusdate", encryptdecrypt.indiandate());
                                cmdf.Parameters.AddWithValue("@requesteddate", encryptdecrypt.indiandate());
                                cmdf.Parameters.AddWithValue("@weblink", weblink);
                                cmdf.ExecuteNonQuery();

                            }
                            else
                            {
                                SqlCommand cmdee1 = new SqlCommand("select  TOP(1) id,weblink,mobileno,emailid   From galaxyaccount where isonline='1' and ( id not in (select executiveid from leadassigntable)) and deptid=2 ORDER BY NEWID()", con);
                                cmdee1.Parameters.AddWithValue("@id", eid);
                                SqlDataAdapter adp12 = new SqlDataAdapter(cmdee1);
                                DataTable dt12 = new DataTable();
                                adp12.Fill(dt12);
                                if (dt12.Rows.Count > 0)
                                {

                                    executiveid = dt12.Rows[0]["id"].ToString();
                                    locallink = dt12.Rows[0]["weblink"].ToString();
                                    emobileno = dt12.Rows[0]["mobileno"].ToString();
                                    eemailid = dt12.Rows[0]["emailid"].ToString();
                                    weblink = "https://engage.embassy.in/thecollection/AdminLogin";
                                    SqlCommand cmdee1h = new SqlCommand(" insert into  leadassigntable (executiveid) values(@executiveid)", con);
                                    cmdee1h.Parameters.AddWithValue("@executiveid", executiveid);
                                    cmdee1h.ExecuteNonQuery();
                                }
                                else
                                {

                                    SqlCommand cmdee1k = new SqlCommand("select  TOP(1) id,weblink,mobileno,emailid  From galaxyaccount where ( id not in (select executiveid from leadassigntable)) and deptid=2 ORDER BY NEWID()", con);
                                    cmdee1k.Parameters.AddWithValue("@id", eid);
                                    SqlDataAdapter adp12k = new SqlDataAdapter(cmdee1k);
                                    DataTable dt12k = new DataTable();
                                    adp12k.Fill(dt12k);
                                    if (dt12k.Rows.Count == 0)
                                    {

                                        SqlCommand cmdee1h = new SqlCommand("delete from leadassigntable where executiveid>0", con);
                                        cmdee1h.ExecuteNonQuery();
                                        SqlCommand cmdee1g = new SqlCommand("select  TOP(1) id,weblink,mobileno,emailid  From galaxyaccount where  isonline='1' and deptid=2 ORDER BY NEWID()", con);
                                        cmdee1g.Parameters.AddWithValue("@id", eid);
                                        SqlDataAdapter adp12g = new SqlDataAdapter(cmdee1g);
                                        DataTable dt12g = new DataTable();
                                        adp12g.Fill(dt12g);
                                        if (dt12g.Rows.Count > 0)
                                        {
                                            executiveid = dt12g.Rows[0]["id"].ToString();
                                            locallink = dt12g.Rows[0]["weblink"].ToString();
                                            emobileno = dt12g.Rows[0]["mobileno"].ToString();
                                            eemailid = dt12g.Rows[0]["emailid"].ToString();
                                            weblink = "https://engage.embassy.in/thecollection/AdminLogin";
                                            SqlCommand cmdee1hh = new SqlCommand(" insert into  leadassigntable (executiveid) values(@executiveid)", con);
                                            cmdee1hh.Parameters.AddWithValue("@executiveid", executiveid);
                                            cmdee1hh.ExecuteNonQuery();
                                        }
                                        else
                                        {

                                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('all Executives are offline please try again later after some time')", true);
                                        }
                                    }
                                    else
                                    {
                                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('all Executives are offline please try again later after some time')", true);

                                    }

                                }

                                SqlCommand cmdf = new SqlCommand("update customermaster set  weblink=@weblink, statusid=@statusid,statusdate=@statusdate, executiveid=@executiveid,isrequestaccepted=@isrequestaccepted,requesteddate=@requesteddate where  id=@uid ", con);
                                cmdf.Parameters.AddWithValue("@uid", uid);
                                cmdf.Parameters.AddWithValue("@executiveid", executiveid);
                                cmdf.Parameters.AddWithValue("@isrequestaccepted", "0");
                                cmdf.Parameters.AddWithValue("@statusid", "1");
                                cmdf.Parameters.AddWithValue("@statusdate", encryptdecrypt.indiandate());
                                cmdf.Parameters.AddWithValue("@requesteddate", encryptdecrypt.indiandate());
                                cmdf.Parameters.AddWithValue("@weblink", weblink);
                                cmdf.ExecuteNonQuery();
                            }


                        }





                        SqlCommand cmdee1kj = new SqlCommand("select distinct r.roomid From roommasterexecutive as rr left outer join roommaster as r on r.id=rr.roomid where rr.executiveid=@id and rr.projectid=@projectid", con);
                        cmdee1kj.Parameters.AddWithValue("@id", executiveid);
                        cmdee1kj.Parameters.AddWithValue("@projectid", Session["projectid"].ToString());
                        SqlDataAdapter adp12kj = new SqlDataAdapter(cmdee1kj);
                        DataTable dt12kj = new DataTable();
                        adp12kj.Fill(dt12kj);
                        if (dt12kj.Rows.Count > 0)
                        {
                            Session["roomid"] = dt12kj.Rows[0]["roomid"].ToString();
                        }
                        SqlCommand cmdv = new SqlCommand("Select id,isrequestaccepted,reasonid,requesteddate,accepteddate from customermaster where id=@id", con);
                        cmdv.Parameters.AddWithValue("@id", uid);
                        SqlDataAdapter adp12gv = new SqlDataAdapter(cmdv);
                        DataTable dt12gv = new DataTable();
                        adp12gv.Fill(dt12gv);
                        if (dt12gv.Rows.Count > 0)
                        {
                            string custid = dt12gv.Rows[0]["id"].ToString();
                            // string executiveid = dr1["executiveid"].ToString();
                            string isrequestaccepted = dt12gv.Rows[0]["isrequestaccepted"].ToString();
                            string reasonid = dt12gv.Rows[0]["reasonid"].ToString();
                            string requesteddate = dt12gv.Rows[0]["requesteddate"].ToString();
                            string accepteddate = dt12gv.Rows[0]["accepteddate"].ToString();


                            SqlCommand cmdb = new SqlCommand("Insert Into customerrequestlog (custid,executiveid,isrequestaccepted,reasonid,requesteddate,accepteddate,entrydate,entryby) values  (@custid,@executiveid,@isrequestaccepted,@reasonid,@requesteddate,@accepteddate,@entrydate,@entryby)", con);
                            cmdb.Parameters.AddWithValue("@custid", custid);
                            cmdb.Parameters.AddWithValue("@executiveid", executiveid);
                            cmdb.Parameters.AddWithValue("@isrequestaccepted", isrequestaccepted);
                            cmdb.Parameters.AddWithValue("@reasonid", reasonid);
                            if (!string.IsNullOrEmpty(requesteddate))
                            {
                                cmdb.Parameters.AddWithValue("@requesteddate", dt12gv.Rows[0]["requesteddate"]);
                            }
                            else
                            {
                                cmdb.Parameters.AddWithValue("@requesteddate", DBNull.Value);
                            }
                            if (!string.IsNullOrEmpty(accepteddate))
                            {
                                cmdb.Parameters.AddWithValue("@accepteddate", dt12gv.Rows[0]["accepteddate"]);
                            }
                            else
                            {
                                cmdb.Parameters.AddWithValue("@accepteddate", DBNull.Value);
                            }
                            cmdb.Parameters.AddWithValue("@entrydate", encryptdecrypt.indiandate());
                            cmdb.Parameters.AddWithValue("@entryby", executiveid);
                            cmdb.ExecuteNonQuery();
                        }
                        else
                        {

                        }


                        HttpWebRequest myReq1 = (HttpWebRequest)WebRequest.Create("http://sms.mobileadz.in/api/push.json?apikey=5e56f95decd26&sender=CGNLMN&mobileno=" + emobileno + "&text=Name: " + cname + " Mobile No: " + cmobileno + " , Just logged on The Collection");
                        HttpWebResponse myResp1 = (HttpWebResponse)myReq1.GetResponse();
                        System.IO.StreamReader respStreamReader1 = new System.IO.StreamReader(myResp1.GetResponseStream());
                        string responseString1 = respStreamReader1.ReadToEnd();
                        respStreamReader1.Close();
                        myResp1.Close();

                        lblemailid.Attributes.Remove("class");
                        lblmobile.Attributes.Remove("class");
                        lblname.Attributes.Remove("class");
                        txtemailid.Text = "";
                        txtmob.Text = "";
                        txtname.Text = "";
                        //Timer1.Enabled = true;
                        Session["executiveemailid"] = eemailid;

                        divcontainer.Attributes["style"] = " display:none;";
                        MailMessage mail = new MailMessage();
                        string htmlBody1 = "<!doctype html><html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\"xmlns:o=\"urn:schemas-microsoft-com:office:office\"> <head> <meta charset=\"UTF-8\"> <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"> <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\"> <title>Bramhacorp</title> <link href=\"https://fonts.googleapis.com/css2?family=Ubuntu&display=swap\" rel=\"stylesheet\"> <style type=\"text/css\"> body{font-family: \"ubuntu\", sans-serif; font-weight: 300; line-height: 1.5em; letter-spacing: 0.3px;}.fontclass{font-family: \"ubuntu\", sans-serif; font-weight: 300; line-height: 1.5em; letter-spacing: 0.3px;}</style> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"templateContainer\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; max-width: 600px; border: 0\" width=\"100%\"> <tr> <td id=\"templatePreheader\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; background-color: #6a798d; border-top: 0; border-bottom: 0; padding-top: 16px; padding-bottom: 8px\" valign=\"top\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnTextBlock\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody class=\"mcnTextBlockOuter\"> <tr> <td class=\"mcnTextBlockInner\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%\" valign=\"top\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnTextContentContainer\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody> <tr> <td class=\"mcnTextContent\" style='mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; word-break: break-word; color: white; font-family: \"Ubuntu\",sans-serif; font-size: 24px; line-height: 150%; text-align: left; padding-top: 9px; padding-right: 18px; padding-bottom: 9px; padding-left: 18px;' valign=\"top\"> <a class=\"fontclass\" href=\"#\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; color: white; font-weight: 700;letter-spacing: 2px; text-decoration: none\" target=\"_blank\" title=\"\"> Bramhacorp </a> </td></tr></tbody> </table> </td></tr></tbody> </table> </td></tr><tr> <td id=\"templateHeader\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; background-color: #6a798d; border-top: 0; border-bottom: 0; padding-top: 16px; padding-bottom: 0\" valign=\"top\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnImageBlock\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody class=\"mcnImageBlockOuter\"> <tr> <td class=\"mcnImageBlockInner\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding: 0px\" valign=\"top\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnImageContentContainer\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody> <tr> <td class=\"mcnImageContent\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-right: 0px; padding-left: 0px; padding-top: 0; padding-bottom: 0; text-align: center;\" valign=\"top\"> <a class=\"\" href=\"#\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; color: #6a798d; font-weight: normal; text-decoration: none\" target=\"_blank\" title=\"\"><a class=\"\" href=\"#\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; color: #6a798d; font-weight: normal; text-decoration: none\" target=\"_blank\" title=\"\"> <img align=\"center\" alt=\"Forgot your password?\" class=\"mcnImage\" src=\"https://static.lingoapp.com/assets/images/email/il-password-reset@2x.png\" style=\"-ms-interpolation-mode: bicubic; border: 0; height: auto; outline: none; text-decoration: none; vertical-align: bottom; max-width: 1200px; padding-bottom: 0; display: inline !important; vertical-align: bottom;\" width=\"600\"></img> </a></a> </td></tr></tbody> </table> </td></tr></tbody> </table> </td></tr><tr> <td id=\"templateBody\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; background-color: #6a798d; border-top: 0; border-bottom: 0; padding-top: 0; padding-bottom: 0\" valign=\"top\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnTextBlock\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody class=\"mcnTextBlockOuter\"> <tr> <td class=\"mcnTextBlockInner\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%\" valign=\"top\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnTextContentContainer\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody> <tr> <td class=\"mcnTextContent\" style='mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; word-break: break-word; color: White; font-family: \"Ubuntu\",sans-serif; font-size: 16px; line-height: 150%; text-align: center; padding-top: 9px; padding-right: 18px; padding-bottom: 9px; padding-left: 18px;' valign=\"top\"> <h1 class=\"null\" style='color: White; font-family: \"Ubuntu\",sans-serif; font-size: 32px; font-style: normal; font-weight: bold; line-height: 125%; letter-spacing: 2px; text-align: center; display: block; margin: 0; padding: 0'> <span style=\"text-transform: uppercase\">Customer Just Logged In</span></h1> <h2 class=\"null\" style='color: White; font-family: \"Ubuntu\",sans-serif; font-size: 24px; font-style: normal; font-weight: bold; line-height: 125%; letter-spacing: 1px; text-align: center; display: block; margin: 0; padding: 0'> <span style=\"text-transform: uppercase\"> Name: " + cname + "<br/> Mobile No: " + cmobileno + " <br/> Email ID : " + cemailid + " </span></h2> </td></tr></tbody> </table> </td></tr></tbody> </table> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnTextBlock\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody class=\"mcnTextBlockOuter\"> <tr> <td class=\"mcnTextBlockInner\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%\" valign=\"top\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnTextContentContainer\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody> <tr> <td class=\"mcnTextContent\" style='mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; word-break: break-word; color: White; font-family: \"Ubuntu\",sans-serif; font-size: 16px; line-height: 150%; text-align: center; padding-top: 9px; padding-right: 18px; padding-bottom: 9px; padding-left: 18px;' valign=\"top\"><br></br> </td></tr></tbody> </table> </td></tr></tbody> </table> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnButtonBlock\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody class=\"mcnButtonBlockOuter\"> <tr> <td align=\"center\" class=\"mcnButtonBlockInner\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 18px; padding-right: 18px; padding-bottom: 18px; padding-left: 18px;\" valign=\"top\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnButtonBlock\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody class=\"mcnButtonBlockOuter\"> <tr> <td align=\"center\" class=\"mcnButtonBlockInner\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 0; padding-right: 18px; padding-bottom: 18px; padding-left: 18px;\" valign=\"top\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnButtonContentContainer\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; border-collapse: separate !important; border-radius: 48px; background-color: white;\"> <tbody> <tr> <td align=\"center\" class=\"mcnButtonContent\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; font-family: 'Ubuntu',sans-serif; font-size: 16px; padding-top: 24px; padding-right: 48px; padding-bottom: 24px; padding-left: 48px;\" valign=\"middle\">  </td></tr></tbody> </table> </td></tr></tbody> </table> </td></tr></tbody> </table> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnImageBlock\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody class=\"mcnImageBlockOuter\"> <tr> <td class=\"mcnImageBlockInner\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding: 0px\" valign=\"top\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnImageContentContainer\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody> <tr> <td class=\"mcnImageContent\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-right: 0px; padding-left: 0px; padding-top: 0; padding-bottom: 0; text-align: center;\" valign=\"top\"> </td></tr></tbody> </table> </td></tr></tbody> </table> </td></tr></table> </td></tr></table> </center> </body></html>";
                        AlternateView htmlView1 = AlternateView.CreateAlternateViewFromString(htmlBody1, null, "text/html");
                        mail.IsBodyHtml = true;
                        mail.AlternateViews.Add(htmlView1);
                        mail.Subject = "Customer Logged In";
                        mail.From = new MailAddress("bramhavr@gmail.com");
                        mail.To.Add(encryptdecrypt.Decrypt(eemailid)); ;
                        mail.IsBodyHtml = true;
                        SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                        smtp.EnableSsl = true;
                        NetworkCredential netCre = new NetworkCredential("bramhavr@gmail.com", "bramha#123");
                        smtp.Credentials = netCre;
                        try
                        {
                            smtp.Send(mail);
                        }
                        catch (Exception ex)
                        {
                        }
                        //Response.Redirect(GetRouteUrl("home", new { }), false);
                        pnlbookingformdisplay.Visible = true;


                    }
                    else
                    {
                        lblmesg.Text = "Invalid Credentials";
                        //exampleModal.Attributes["style"] = "display: none; z-index: 0; opacity: 0; ";


                    }
                }
                else
                {


                    if (txtloginname.Text == "")
                    {
                        lblmesg.Text = "Please Enter Mobile Number";
                    }
                    if (txtloginpass.Text == "")
                    {
                        lblmesg.Text = "Please Enter Password";
                    }
                }

            }
            catch (Exception ex)
            {
                lblmesg.Text = "Try after refreshing a page.";
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
        protected void Registerotp_Click(object sender, EventArgs e)
        {
            try
            {

                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }

                int mko = 0;
                if (txtexecutive.Text != "")
                {
                    if (txtexecutive.Text.Length == 10)
                    {
                        mko = 0;
                    }
                    else
                    {
                        mko = 1;
                    }
                }
                if (txtotp.Text != "" && txtpass.Text != "" && txtcmpass.Text != "" && mko == 0)
                {
                    if (txtemailid.Text != "" && txtmob.Text != "")
                    {
                        SqlCommand cmd = new SqlCommand("select   name as name,otp,id from CustomerMaster   where emailID=@emailID and mobileno=@mobileno ", con);

                        cmd.Parameters.AddWithValue("@mobileno", txtmob.Text);
                        cmd.Parameters.AddWithValue("@emailID", txtemailid.Text);
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt2 = new DataTable();
                        da.Fill(dt2);
                        if (dt2.Rows.Count > 0)
                        {
                            if (txtotp.Text.Trim() == dt2.Rows[0]["OTP"].ToString())
                            {
                                if (txtcmpass.Text.Trim() != txtpass.Text.Trim())
                                {
                                    lblmesg.Text = "Password does not match";
                                    return;
                                }

                                string exeid = "0";
                                if (txtexecutive.Text != "")
                                {
                                    if (txtexecutive.Text.Length == 10)
                                    {

                                        SqlCommand cmdee = new SqlCommand("select TOP(1) id,weblink,mobileno,emailid From galaxyaccount where  mobileno=@id ", con);
                                        cmdee.Parameters.AddWithValue("@id", txtexecutive.Text);
                                        SqlDataAdapter adp1 = new SqlDataAdapter(cmdee);
                                        DataTable dt1 = new DataTable();
                                        adp1.Fill(dt1);
                                        if (dt1.Rows.Count > 0)
                                        {
                                            exeid = dt1.Rows[0]["id"].ToString();
                                        }
                                        else
                                        {

                                            lblmesg.Text = "Wrong Executive Code.";
                                            return;

                                        }
                                    }
                                }
                                Session["id"] = dt2.Rows[0]["id"].ToString();
                                Session["username"] = dt2.Rows[0]["name"].ToString();
                               Session["projectid"] = "5";
                                Session["stringuid"] = dt2.Rows[0]["id"].ToString();


                                SqlCommand cmdf = new SqlCommand("update customermaster set confirmpassword=@confirmpassword,password=@password,statusid=@statusid,statusdate=@statusdate, executiveid=@executiveid,isrequestaccepted=@isrequestaccepted,requesteddate=@requesteddate, isaccountverify=@isaccountverify,isotpsend=@isotpsend, lastotpverifeddate=@lastotpverifeddate where  emailID=@emailID and mobileno=@mobileno ", con);
                                cmdf.Parameters.AddWithValue("@executiveid", exeid);
                                cmdf.Parameters.AddWithValue("@isrequestaccepted", "0");
                                cmdf.Parameters.AddWithValue("@statusid", "1");
                                cmdf.Parameters.AddWithValue("@statusdate", encryptdecrypt.indiandate());
                                cmdf.Parameters.AddWithValue("@password", encryptdecrypt.Encrypt(txtpass.Text.Trim()));
                                cmdf.Parameters.AddWithValue("@confirmpassword", encryptdecrypt.Encrypt(txtcmpass.Text.Trim()));
                                cmdf.Parameters.AddWithValue("@requesteddate", encryptdecrypt.indiandate());
                                cmdf.Parameters.AddWithValue("@isaccountverify", "1");
                                cmdf.Parameters.AddWithValue("@mobileno", txtmob.Text);
                                cmdf.Parameters.AddWithValue("@emailID", txtemailid.Text);
                                cmdf.Parameters.AddWithValue("@isotpsend", "1");
                                cmdf.Parameters.AddWithValue("@lastotpverifeddate", encryptdecrypt.indiandate());
                                cmdf.ExecuteNonQuery();
                                pnlotp.Visible = false;
                                Button1.Visible = false;

                                pnlregi.Visible = false;
                                btnregister.Visible = false;
                                btnlogin.Visible = false;
                                pnllogin.Visible = false;



                                lblagree.Text = "";

                                lnklogin.Visible = false;
                                lnkforget.Visible = false;
                                lblmesg.Text = "";
                                txtname.Text = "";
                                txtemailid.Text = "";
                                txtmob.Text = "";
                                txtotp.Text = "";
                                btnresendotp.Visible = false;
                                string uid = Session["id"].ToString();
                                string executiveid = "0";
                                string weblink = "";
                                string locallink = "", emobileno = "", cmobileno = "", cname = "", cemailid = "", eemailid = "";
                                SqlCommand cmd2 = new SqlCommand("select executiveid,name,mobileno,emailid from customermaster where id=@uid ", con);
                                cmd2.Parameters.AddWithValue("@uid", uid);
                                SqlDataAdapter adp = new SqlDataAdapter(cmd2);
                                DataTable dt = new DataTable();
                                adp.Fill(dt);
                                if (dt.Rows.Count > 0)
                                {
                                    string eid = dt.Rows[0]["executiveid"].ToString();
                                    cname = dt.Rows[0]["name"].ToString();
                                    cmobileno = dt.Rows[0]["mobileno"].ToString();
                                    cemailid = dt.Rows[0]["emailid"].ToString();
                                    if (eid != "" && eid != null)
                                    {
                                        SqlCommand cmdee = new SqlCommand("select TOP(1) id,weblink,mobileno,emailid From galaxyaccount where isonline='1' and id=@id ", con);
                                        cmdee.Parameters.AddWithValue("@id", eid);
                                        SqlDataAdapter adp1 = new SqlDataAdapter(cmdee);
                                        DataTable dt1 = new DataTable();
                                        adp1.Fill(dt1);
                                        if (dt1.Rows.Count > 0)
                                        {
                                            executiveid = dt1.Rows[0]["id"].ToString();
                                            locallink = dt1.Rows[0]["weblink"].ToString();
                                            emobileno = dt1.Rows[0]["mobileno"].ToString();
                                            eemailid = dt1.Rows[0]["emailid"].ToString();
                                            weblink = "https://engage.embassy.in/thecollection/AdminLogin";
                                        }
                                        else
                                        {
                                            SqlCommand cmdee1 = new SqlCommand("select top(1) id,weblink,mobileno,emailid From galaxyaccount where isonline='1' and ( id not in (select executiveid from leadassigntable)) and deptid=2 ORDER BY NEWID()", con);
                                            cmdee1.Parameters.AddWithValue("@id", eid);
                                            SqlDataAdapter adp12 = new SqlDataAdapter(cmdee1);
                                            DataTable dt12 = new DataTable();
                                            adp12.Fill(dt12);
                                            if (dt12.Rows.Count > 0)
                                            {

                                                executiveid = dt12.Rows[0]["id"].ToString();
                                                locallink = dt12.Rows[0]["weblink"].ToString();
                                                emobileno = dt12.Rows[0]["mobileno"].ToString();
                                                eemailid = dt12.Rows[0]["emailid"].ToString();
                                                weblink = "https://engage.embassy.in/thecollection/AdminLogin";
                                                SqlCommand cmdee1h = new SqlCommand(" insert into  leadassigntable (executiveid) values(@executiveid)", con);
                                                cmdee1h.Parameters.AddWithValue("@executiveid", executiveid);
                                                cmdee1h.ExecuteNonQuery();
                                            }
                                            else
                                            {

                                                SqlCommand cmdee1k = new SqlCommand("select TOP(1) id,weblink,mobileno,emailid From galaxyaccount where ( id not in (select executiveid from leadassigntable)) and deptid=2 ORDER BY NEWID()", con);
                                                cmdee1k.Parameters.AddWithValue("@id", eid);
                                                SqlDataAdapter adp12k = new SqlDataAdapter(cmdee1k);
                                                DataTable dt12k = new DataTable();
                                                adp12k.Fill(dt12k);
                                                if (dt12k.Rows.Count == 0)
                                                {

                                                    SqlCommand cmdee1h = new SqlCommand("delete from leadassigntable where executiveid>0", con);
                                                    cmdee1h.ExecuteNonQuery();
                                                    SqlCommand cmdee1g = new SqlCommand("select  TOP(1) id,weblink,mobileno,emailid  From galaxyaccount where  isonline='1' and deptid=2 ORDER BY NEWID()", con);
                                                    cmdee1g.Parameters.AddWithValue("@id", eid);
                                                    SqlDataAdapter adp12g = new SqlDataAdapter(cmdee1g);
                                                    DataTable dt12g = new DataTable();
                                                    adp12g.Fill(dt12g);
                                                    if (dt12g.Rows.Count > 0)
                                                    {
                                                        executiveid = dt12g.Rows[0]["id"].ToString();
                                                        locallink = dt12g.Rows[0]["weblink"].ToString();
                                                        emobileno = dt12g.Rows[0]["mobileno"].ToString();
                                                        eemailid = dt12g.Rows[0]["emailid"].ToString();
                                                        weblink = "https://engage.embassy.in/thecollection/AdminLogin";
                                                        SqlCommand cmdee1hh = new SqlCommand(" insert into  leadassigntable (executiveid) values(@executiveid)", con);
                                                        cmdee1hh.Parameters.AddWithValue("@executiveid", executiveid);
                                                        cmdee1hh.ExecuteNonQuery();
                                                    }
                                                    else
                                                    {

                                                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('all Executives are offline please try again later after some time')", true);
                                                    }
                                                }
                                                else
                                                {
                                                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('all Executives are offline please try again later after some time')", true);

                                                }

                                            }
                                        }
                                        cmdf = new SqlCommand("update customermaster set  weblink=@weblink, statusid=@statusid,statusdate=@statusdate, executiveid=@executiveid,isrequestaccepted=@isrequestaccepted,requesteddate=@requesteddate where  id=@uid ", con);
                                        cmdf.Parameters.AddWithValue("@uid", uid);
                                        cmdf.Parameters.AddWithValue("@executiveid", executiveid);
                                        cmdf.Parameters.AddWithValue("@isrequestaccepted", "0");
                                        cmdf.Parameters.AddWithValue("@statusid", "1");
                                        cmdf.Parameters.AddWithValue("@statusdate", encryptdecrypt.indiandate());
                                        cmdf.Parameters.AddWithValue("@requesteddate", encryptdecrypt.indiandate());
                                        cmdf.Parameters.AddWithValue("@weblink", weblink);
                                        cmdf.ExecuteNonQuery();

                                    }
                                    else
                                    {
                                        SqlCommand cmdee1 = new SqlCommand("select  TOP(1) id,weblink,mobileno,emailid   From galaxyaccount where isonline='1' and ( id not in (select executiveid from leadassigntable)) and deptid=2 ORDER BY NEWID()", con);
                                        cmdee1.Parameters.AddWithValue("@id", eid);
                                        SqlDataAdapter adp12 = new SqlDataAdapter(cmdee1);
                                        DataTable dt12 = new DataTable();
                                        adp12.Fill(dt12);
                                        if (dt12.Rows.Count > 0)
                                        {

                                            executiveid = dt12.Rows[0]["id"].ToString();
                                            locallink = dt12.Rows[0]["weblink"].ToString();
                                            emobileno = dt12.Rows[0]["mobileno"].ToString();
                                            eemailid = dt12.Rows[0]["emailid"].ToString();
                                            weblink = "https://engage.embassy.in/thecollection/AdminLogin";
                                            SqlCommand cmdee1h = new SqlCommand(" insert into  leadassigntable (executiveid) values(@executiveid)", con);
                                            cmdee1h.Parameters.AddWithValue("@executiveid", executiveid);
                                            cmdee1h.ExecuteNonQuery();
                                        }
                                        else
                                        {

                                            SqlCommand cmdee1k = new SqlCommand("select  TOP(1) id,weblink,mobileno,emailid  From galaxyaccount where ( id not in (select executiveid from leadassigntable)) and deptid=2 ORDER BY NEWID()", con);
                                            cmdee1k.Parameters.AddWithValue("@id", eid);
                                            SqlDataAdapter adp12k = new SqlDataAdapter(cmdee1k);
                                            DataTable dt12k = new DataTable();
                                            adp12k.Fill(dt12k);
                                            if (dt12k.Rows.Count == 0)
                                            {

                                                SqlCommand cmdee1h = new SqlCommand("delete from leadassigntable where executiveid>0", con);
                                                cmdee1h.ExecuteNonQuery();
                                                SqlCommand cmdee1g = new SqlCommand("select  TOP(1) id,weblink,mobileno,emailid  From galaxyaccount where  isonline='1' and deptid=2 ORDER BY NEWID()", con);
                                                cmdee1g.Parameters.AddWithValue("@id", eid);
                                                SqlDataAdapter adp12g = new SqlDataAdapter(cmdee1g);
                                                DataTable dt12g = new DataTable();
                                                adp12g.Fill(dt12g);
                                                if (dt12g.Rows.Count > 0)
                                                {
                                                    executiveid = dt12g.Rows[0]["id"].ToString();
                                                    locallink = dt12g.Rows[0]["weblink"].ToString();
                                                    emobileno = dt12g.Rows[0]["mobileno"].ToString();
                                                    eemailid = dt12g.Rows[0]["emailid"].ToString();
                                                    weblink = "https://engage.embassy.in/thecollection/AdminLogin";
                                                    SqlCommand cmdee1hh = new SqlCommand(" insert into  leadassigntable (executiveid) values(@executiveid)", con);
                                                    cmdee1hh.Parameters.AddWithValue("@executiveid", executiveid);
                                                    cmdee1hh.ExecuteNonQuery();
                                                }
                                                else
                                                {

                                                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('all Executives are offline please try again later after some time')", true);
                                                }
                                            }
                                            else
                                            {
                                                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('all Executives are offline please try again later after some time')", true);

                                            }

                                        }

                                        cmdf = new SqlCommand("update customermaster set  weblink=@weblink, statusid=@statusid,statusdate=@statusdate, executiveid=@executiveid,isrequestaccepted=@isrequestaccepted,requesteddate=@requesteddate where  id=@uid ", con);
                                        cmdf.Parameters.AddWithValue("@uid", uid);
                                        cmdf.Parameters.AddWithValue("@executiveid", executiveid);
                                        cmdf.Parameters.AddWithValue("@isrequestaccepted", "0");
                                        cmdf.Parameters.AddWithValue("@statusid", "1");
                                        cmdf.Parameters.AddWithValue("@statusdate", encryptdecrypt.indiandate());
                                        cmdf.Parameters.AddWithValue("@requesteddate", encryptdecrypt.indiandate());
                                        cmdf.Parameters.AddWithValue("@weblink", weblink);
                                        cmdf.ExecuteNonQuery();
                                    }


                                }





                                SqlCommand cmdee1kj = new SqlCommand("select distinct r.roomid From roommasterexecutive as rr left outer join roommaster as r on r.id=rr.roomid where rr.executiveid=@id and rr.projectid=@projectid", con);
                                cmdee1kj.Parameters.AddWithValue("@id", executiveid);
                                cmdee1kj.Parameters.AddWithValue("@projectid", Session["projectid"].ToString());
                                SqlDataAdapter adp12kj = new SqlDataAdapter(cmdee1kj);
                                DataTable dt12kj = new DataTable();
                                adp12kj.Fill(dt12kj);
                                if (dt12kj.Rows.Count > 0)
                                {
                                    Session["roomid"] = dt12kj.Rows[0]["roomid"].ToString();
                                }

                                SqlCommand cmdv = new SqlCommand("Select id,isrequestaccepted,reasonid,requesteddate,accepteddate from customermaster where id=@id", con);
                                cmdv.Parameters.AddWithValue("@id", uid);
                                SqlDataAdapter adp12gv = new SqlDataAdapter(cmdv);
                                DataTable dt12gv = new DataTable();
                                adp12gv.Fill(dt12gv);
                                if (dt12gv.Rows.Count > 0)
                                {
                                    string custid = dt12gv.Rows[0]["id"].ToString();
                                    // string executiveid = dr1["executiveid"].ToString();
                                    string isrequestaccepted = dt12gv.Rows[0]["isrequestaccepted"].ToString();
                                    string reasonid = dt12gv.Rows[0]["reasonid"].ToString();
                                    string requesteddate = dt12gv.Rows[0]["requesteddate"].ToString();
                                    string accepteddate = dt12gv.Rows[0]["accepteddate"].ToString();


                                    SqlCommand cmdb = new SqlCommand("Insert Into customerrequestlog (custid,executiveid,isrequestaccepted,reasonid,requesteddate,accepteddate,entrydate,entryby) values  (@custid,@executiveid,@isrequestaccepted,@reasonid,@requesteddate,@accepteddate,@entrydate,@entryby)", con);
                                    cmdb.Parameters.AddWithValue("@custid", custid);
                                    cmdb.Parameters.AddWithValue("@executiveid", executiveid);
                                    cmdb.Parameters.AddWithValue("@isrequestaccepted", isrequestaccepted);
                                    cmdb.Parameters.AddWithValue("@reasonid", reasonid);
                                    if (!string.IsNullOrEmpty(requesteddate))
                                    {
                                        cmdb.Parameters.AddWithValue("@requesteddate", dt12gv.Rows[0]["requesteddate"]);
                                    }
                                    else
                                    {
                                        cmdb.Parameters.AddWithValue("@requesteddate", DBNull.Value);
                                    }
                                    if (!string.IsNullOrEmpty(accepteddate))
                                    {
                                        cmdb.Parameters.AddWithValue("@accepteddate", dt12gv.Rows[0]["accepteddate"]);
                                    }
                                    else
                                    {
                                        cmdb.Parameters.AddWithValue("@accepteddate", DBNull.Value);
                                    }
                                    cmdb.Parameters.AddWithValue("@entrydate", encryptdecrypt.indiandate());
                                    cmdb.Parameters.AddWithValue("@entryby", executiveid);
                                    cmdb.ExecuteNonQuery();
                                }
                                else
                                {

                                }
                                if (!string.IsNullOrEmpty(emobileno))
                                {
                                    HttpWebRequest myReq1 = (HttpWebRequest)WebRequest.Create("http://sms.mobileadz.in/api/push.json?apikey=602d0dc21e4d2&sender=CGNLMN&mobileno=" + emobileno + "&text=Name: " + cname + " Mobile No: " + cmobileno + " , Just registered on the Embassy");
                                    //HttpWebRequest myReq1 = (HttpWebRequest)WebRequest.Create("http://sms.mobileadz.in/api/push.json?apikey=5e56f95decd26&sender=CGNLMN&mobileno=" + emobileno + "&text=Name: " + cname + " Mobile No: " + cmobileno + " , Just registered on the collection");
                                    HttpWebResponse myResp1 = (HttpWebResponse)myReq1.GetResponse();
                                    System.IO.StreamReader respStreamReader1 = new System.IO.StreamReader(myResp1.GetResponseStream());
                                    string responseString1 = respStreamReader1.ReadToEnd();
                                    respStreamReader1.Close();
                                    myResp1.Close();
                                }
                                if (!string.IsNullOrEmpty(eemailid))
                                {
                                    MailMessage mail = new MailMessage();
                                    string htmlBody1 = "<!doctype html><html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\"xmlns:o=\"urn:schemas-microsoft-com:office:office\"> <head> <meta charset=\"UTF-8\"> <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"> <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\"> <title>Bramhacorp</title> <link href=\"https://fonts.googleapis.com/css2?family=Ubuntu&display=swap\" rel=\"stylesheet\"> <style type=\"text/css\"> body{font-family: \"ubuntu\", sans-serif; font-weight: 300; line-height: 1.5em; letter-spacing: 0.3px;}.fontclass{font-family: \"ubuntu\", sans-serif; font-weight: 300; line-height: 1.5em; letter-spacing: 0.3px;}</style> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"templateContainer\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; max-width: 600px; border: 0\" width=\"100%\"> <tr> <td id=\"templatePreheader\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; background-color: #6a798d; border-top: 0; border-bottom: 0; padding-top: 16px; padding-bottom: 8px\" valign=\"top\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnTextBlock\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody class=\"mcnTextBlockOuter\"> <tr> <td class=\"mcnTextBlockInner\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%\" valign=\"top\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnTextContentContainer\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody> <tr> <td class=\"mcnTextContent\" style='mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; word-break: break-word; color: white; font-family: \"Ubuntu\",sans-serif; font-size: 24px; line-height: 150%; text-align: left; padding-top: 9px; padding-right: 18px; padding-bottom: 9px; padding-left: 18px;' valign=\"top\"> <a class=\"fontclass\" href=\"#\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; color: white; font-weight: 700;letter-spacing: 2px; text-decoration: none\" target=\"_blank\" title=\"\"> Bramhacorp </a> </td></tr></tbody> </table> </td></tr></tbody> </table> </td></tr><tr> <td id=\"templateHeader\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; background-color: #6a798d; border-top: 0; border-bottom: 0; padding-top: 16px; padding-bottom: 0\" valign=\"top\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnImageBlock\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody class=\"mcnImageBlockOuter\"> <tr> <td class=\"mcnImageBlockInner\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding: 0px\" valign=\"top\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnImageContentContainer\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody> <tr> <td class=\"mcnImageContent\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-right: 0px; padding-left: 0px; padding-top: 0; padding-bottom: 0; text-align: center;\" valign=\"top\"> <a class=\"\" href=\"#\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; color: #6a798d; font-weight: normal; text-decoration: none\" target=\"_blank\" title=\"\"><a class=\"\" href=\"#\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; color: #6a798d; font-weight: normal; text-decoration: none\" target=\"_blank\" title=\"\"> <img align=\"center\" alt=\"Forgot your password?\" class=\"mcnImage\" src=\"https://static.lingoapp.com/assets/images/email/il-password-reset@2x.png\" style=\"-ms-interpolation-mode: bicubic; border: 0; height: auto; outline: none; text-decoration: none; vertical-align: bottom; max-width: 1200px; padding-bottom: 0; display: inline !important; vertical-align: bottom;\" width=\"600\"></img> </a></a> </td></tr></tbody> </table> </td></tr></tbody> </table> </td></tr><tr> <td id=\"templateBody\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; background-color: #6a798d; border-top: 0; border-bottom: 0; padding-top: 0; padding-bottom: 0\" valign=\"top\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnTextBlock\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody class=\"mcnTextBlockOuter\"> <tr> <td class=\"mcnTextBlockInner\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%\" valign=\"top\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnTextContentContainer\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody> <tr> <td class=\"mcnTextContent\" style='mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; word-break: break-word; color: White; font-family: \"Ubuntu\",sans-serif; font-size: 16px; line-height: 150%; text-align: center; padding-top: 9px; padding-right: 18px; padding-bottom: 9px; padding-left: 18px;' valign=\"top\"> <h1 class=\"null\" style='color: White; font-family: \"Ubuntu\",sans-serif; font-size: 32px; font-style: normal; font-weight: bold; line-height: 125%; letter-spacing: 2px; text-align: center; display: block; margin: 0; padding: 0'> <span style=\"text-transform: uppercase\">Customer Just Logged In</span></h1> <h2 class=\"null\" style='color: White; font-family: \"Ubuntu\",sans-serif; font-size: 24px; font-style: normal; font-weight: bold; line-height: 125%; letter-spacing: 1px; text-align: center; display: block; margin: 0; padding: 0'> <span style=\"text-transform: uppercase\"> Name: " + cname + "<br/> Mobile No: " + cmobileno + " <br/> Email ID : " + cemailid + " </span></h2> </td></tr></tbody> </table> </td></tr></tbody> </table> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnTextBlock\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody class=\"mcnTextBlockOuter\"> <tr> <td class=\"mcnTextBlockInner\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%\" valign=\"top\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnTextContentContainer\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody> <tr> <td class=\"mcnTextContent\" style='mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; word-break: break-word; color: White; font-family: \"Ubuntu\",sans-serif; font-size: 16px; line-height: 150%; text-align: center; padding-top: 9px; padding-right: 18px; padding-bottom: 9px; padding-left: 18px;' valign=\"top\"><br></br> </td></tr></tbody> </table> </td></tr></tbody> </table> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnButtonBlock\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody class=\"mcnButtonBlockOuter\"> <tr> <td align=\"center\" class=\"mcnButtonBlockInner\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 18px; padding-right: 18px; padding-bottom: 18px; padding-left: 18px;\" valign=\"top\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnButtonBlock\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody class=\"mcnButtonBlockOuter\"> <tr> <td align=\"center\" class=\"mcnButtonBlockInner\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 0; padding-right: 18px; padding-bottom: 18px; padding-left: 18px;\" valign=\"top\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnButtonContentContainer\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; border-collapse: separate !important; border-radius: 48px; background-color: white;\"> <tbody> <tr> <td align=\"center\" class=\"mcnButtonContent\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; font-family: 'Ubuntu',sans-serif; font-size: 16px; padding-top: 24px; padding-right: 48px; padding-bottom: 24px; padding-left: 48px;\" valign=\"middle\">  </td></tr></tbody> </table> </td></tr></tbody> </table> </td></tr></tbody> </table> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnImageBlock\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody class=\"mcnImageBlockOuter\"> <tr> <td class=\"mcnImageBlockInner\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding: 0px\" valign=\"top\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnImageContentContainer\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody> <tr> <td class=\"mcnImageContent\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-right: 0px; padding-left: 0px; padding-top: 0; padding-bottom: 0; text-align: center;\" valign=\"top\"> </td></tr></tbody> </table> </td></tr></tbody> </table> </td></tr></table> </td></tr></table> </center> </body></html>";
                                    AlternateView htmlView1 = AlternateView.CreateAlternateViewFromString(htmlBody1, null, "text/html");
                                    mail.IsBodyHtml = true;
                                    mail.AlternateViews.Add(htmlView1);
                                    mail.Subject = "New Customer Registration";
                                    mail.From = new MailAddress("bramhavr@gmail.com");
                                    // mail.To.Add(encryptdecrypt.Decrypt(eemailid));;
                                    mail.To.Add(encryptdecrypt.Decrypt(eemailid));
                                    mail.IsBodyHtml = true;
                                    SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                                    smtp.EnableSsl = true;
                                    NetworkCredential netCre = new NetworkCredential("bramhavr@gmail.com", "bramha#123");
                                    smtp.Credentials = netCre;
                                    try
                                    {
                                        smtp.Send(mail);
                                    }
                                    catch (Exception ex)
                                    {
                                    }
                                }
                                lblemailid.Attributes.Remove("class");
                                lblmobile.Attributes.Remove("class");
                                lblname.Attributes.Remove("class");
                                txtemailid.Text = "";
                                txtmob.Text = "";
                                txtname.Text = "";
                                //Timer1.Enabled = true;
                                divcontainer.Attributes["style"] = " display:none;";
                                Session["executiveemailid"] = eemailid;
                                //Response.Redirect(GetRouteUrl("home", new { }), false);
                                //pnlreg.Visible = false;
                                //pnlsitevistform.Visible = true;

                                //SqlCommand cmd22 = new SqlCommand("insert into sitevisitrequest(firstname,entrydate,lastname,emailid,mobileno,visitdate,visittime,remark) values(@firstname,@entrydate,@lastname,@emailid,@mobileno,@visitdate,@visittime,@remark)", con);
                                //cmd22.Parameters.AddWithValue("@firstname", txtfirstname.Text);
                                //cmd22.Parameters.AddWithValue("@entrydate", encryptdecrypt.indiandate());
                                //cmd22.Parameters.AddWithValue("@lastname", txtlastname.Text);
                                //cmd22.Parameters.AddWithValue("@emailid", txtemail.Text);
                                //cmd22.Parameters.AddWithValue("@mobileno", txtmobileno.Text);
                                //cmd22.Parameters.AddWithValue("@visitdate", Convert.ToDateTime(txtdate.Text));
                                //cmd22.Parameters.AddWithValue("@visittime", DropDownList1.SelectedItem.Text);
                                //cmd22.Parameters.AddWithValue("@remark", txtremark.Text);
                                //int k = cmd.ExecuteNonQuery();

                                //lblmsg.Text = "data submitted successfully";
                                //site visit form

                                pnlsitevistform.Visible = true;
                                pnlreg.Visible = false;
                                insertdata();
                                lblmesg.Text = "";


                            }
                            else
                            {
                                btnresendotp.Visible = true;
                                lblmesg.Text = "Wrong Otp";
                                return;

                            }

                            //Timer1.Enabled = true;
                            timerresendotp.Enabled = false;
                            //  lblsignup.Text = "This email ID is already registerd.Please try login with Email ID and Password.";
                        }
                    }

                }
                else
                {
                    if (txtotp.Text == "")
                    {
                        lblmesg.Text = "Please Enter OTP";
                        return;
                    }

                    if (txtpass.Text == "")
                    {
                        lblmesg.Text = "Please Enter Password";
                        return;
                    }

                    if (txtcmpass.Text == "")
                    {
                        lblmesg.Text = "Please Enter Confirm Password";
                        return;
                    }
                    if (txtexecutive.Text != "")
                    {
                        if (txtexecutive.Text.Length == 10)
                        {
                            mko = 0;
                        }
                        else
                        {
                            mko = 1;
                        }
                    }
                    if (txtexecutive.Text != "")
                    {
                        if (txtexecutive.Text.Length != 10)
                        {
                            lblmesg.Text = "Please Enter 10 digit Executive Code (Optional)";
                            return;
                        }
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


        protected void resendotp_Click(object sender, EventArgs e)
        {
            try
            {
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                LoopOTP:
                var chars1 = "1234567890";
                var stringChars1 = new char[6];
                var random1 = new Random();
                for (int i = 0; i < stringChars1.Length; i++)
                {
                    stringChars1[i] = chars1[random1.Next(chars1.Length)];
                }
                var s1 = new String(stringChars1);


                SqlCommand cmd23 = new SqlCommand("select top(1) id from CustomerMaster where OTP=@OTP", con);
                cmd23.Parameters.AddWithValue("@OTP", s1);
                SqlDataAdapter da23 = new SqlDataAdapter(cmd23);
                DataTable dt23 = new DataTable();
                da23.Fill(dt23);


                if (dt23.Rows.Count > 0)
                {
                    goto LoopOTP;
                }

                SqlCommand cmd = new SqlCommand("select  *,name as name from CustomerMaster   where emailID=@emailID and mobileno=@mobileno ", con);

                cmd.Parameters.AddWithValue("@mobileno", txtmob.Text);
                cmd.Parameters.AddWithValue("@emailID", txtemailid.Text);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt2 = new DataTable();
                da.Fill(dt2);
                if (dt2.Rows.Count > 0)
                {
                    Session["id"] = dt2.Rows[0]["id"].ToString();
                    SqlCommand cmd12 = new SqlCommand("Update CustomerMaster set OTP=@otp where id=@id", con);
                    cmd12.Parameters.AddWithValue("@otp", s1);
                    cmd12.Parameters.AddWithValue("@id", Session["id"].ToString());
                    cmd12.ExecuteNonQuery();
                }
                HttpWebRequest myReq1 = (HttpWebRequest)WebRequest.Create("http://sms.mobileadz.in/api/push.json?apikey=5e56f95decd26&sender=CGNLMN&mobileno=" + txtmob.Text.Trim() + "&text=%20Dear%20Customer,%0a%0a" + s1 + "%20is%20your%20one%20time%20password%20(OTP).%20Please%20enter%20the%20OTP%20to%20complete%20your%20registration%0a%0aThank%20you%0aTeam%20Embassy");
                //HttpWebRequest myReq1 = (HttpWebRequest)WebRequest.Create("http://sms.mobileadz.in/api/push.json?apikey=5e56f95decd26&sender=CGNLMN&mobileno=" + txtmob.Text.Trim() + "&text=%20Dear%20Customer,%0a%0a" + s1 + "%20is%20your%20one%20time%20password%20(OTP).%20Please%20enter%20the%20OTP%20to%20complete%20your%20registration%0a%0aThank%20you%0aTeam%20BramhaCorp");
                HttpWebResponse myResp1 = (HttpWebResponse)myReq1.GetResponse();
                System.IO.StreamReader respStreamReader1 = new System.IO.StreamReader(myResp1.GetResponseStream());
                string responseString1 = respStreamReader1.ReadToEnd();
                respStreamReader1.Close();
                myResp1.Close();
                pnlotp.Visible = true;
                Button1.Visible = true;
                btnregister.Visible = false;
                lblmesg.Text = "";
                txtotp.Text = "";
                btnresendotp.Visible = false;
                timerresendotp.Enabled = true;
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
                Session["id"] = null;
                //lblmesg.Text = "";

            }
        }

        protected void Register_Click(object sender, EventArgs e)
        {
            //document.getElementById("btnlogin").addEventListener("click", onBodyClick);
            //document.getElementById("btnlogin").addEventListener("touchend", onBodyClick);
            try
            {


                if (txtmob.Text.Length != 10)
                {
                    lblmesg.Text = "Please enter 10 digits mobile number.";
                    return;
                }
                if (txtname.Text.Trim() != "" && txtmob.Text != "" && txtemailid.Text != "" && txtmob.Text.Length == 10)
                {
                    try
                    {
                        if (con.State != ConnectionState.Open)
                        {
                            con.Open();
                        }
                        int intemail = 0, intmobileno = 0;
                        if (txtemailid.Text != "")
                        {
                            SqlCommand cmd = new SqlCommand("select  id from CustomerMaster   where emailID=@emailID and isaccountverify='1' ", con);
                            cmd.Parameters.AddWithValue("@emailID", txtemailid.Text);
                            SqlDataAdapter da = new SqlDataAdapter(cmd);
                            DataTable dt = new DataTable();
                            da.Fill(dt);
                            if (dt.Rows.Count > 0)
                            {
                                lblmesg.Text = " Already registered user";
                                lnklogin.CommandArgument = "1";
                                // lblmesg.Text = "";
                                lbllogin.Text = "Login";
                                pnlotp.Visible = false;
                                Button1.Visible = false;

                                pnlregi.Visible = false;
                                btnregister.Visible = false;
                                btnlogin.Visible = true;
                                pnllogin.Visible = true;
                                lnklogin.CommandArgument = "0";
                                lnklogin.Text = "Don't have an account? Register ";

                                lnkforget.Visible = true;
                                txtname.Text = "";
                                txtemailid.Text = "";
                                txtmob.Text = "";
                                txtotp.Text = "";
                                return;
                            }
                        }
                        if (intemail != 1)
                        {
                            if (txtmob.Text != "")
                            {
                                SqlCommand cmd = new SqlCommand("select id,isaccountverify from CustomerMaster   where mobileno=@mobileno ", con);
                                cmd.Parameters.AddWithValue("@mobileno", txtmob.Text);
                                SqlDataAdapter da = new SqlDataAdapter(cmd);
                                DataTable dt = new DataTable();
                                da.Fill(dt);
                                if (dt.Rows.Count > 0)
                                {
                                    //and isaccountverify='1'
                                    if (dt.Rows[0]["isaccountverify"].ToString() == "1")
                                    {
                                        lblmesg.Text = " Already registered user";
                                        lnklogin.CommandArgument = "1";
                                        // lblmesg.Text = "";
                                        lbllogin.Text = "Login";
                                        pnlotp.Visible = false;
                                        Button1.Visible = false;
                                        pnlregi.Visible = false;
                                        btnregister.Visible = false;
                                        btnlogin.Visible = true;
                                        pnllogin.Visible = true;
                                        lnklogin.CommandArgument = "0";
                                        lnklogin.Text = "Don't have an account? Register ";


                                        lnkforget.Visible = true;
                                        txtname.Text = "";
                                        txtemailid.Text = "";
                                        txtmob.Text = "";
                                        txtotp.Text = "";
                                        return;
                                    }
                                    else
                                    {
                                        LoopOTP:
                                        var chars1 = "1234567890";
                                        var stringChars1 = new char[6];
                                        var random1 = new Random();
                                        for (int i = 0; i < stringChars1.Length; i++)
                                        {
                                            stringChars1[i] = chars1[random1.Next(chars1.Length)];
                                        }
                                        var s1 = new String(stringChars1);
                                        SqlCommand cmd23 = new SqlCommand("select top(1) id from CustomerMaster where OTP=@OTP", con);
                                        cmd23.Parameters.AddWithValue("@OTP", s1);
                                        SqlDataAdapter da23 = new SqlDataAdapter(cmd23);
                                        DataTable dt23 = new DataTable();
                                        da23.Fill(dt23);
                                        if (dt23.Rows.Count > 0)
                                        {
                                            goto LoopOTP;
                                        }
                                        cmd = new SqlCommand("select  id from CustomerMaster   where mobileno=@mobileno ", con);
                                        cmd.Parameters.AddWithValue("@mobileno", txtmob.Text);
                                        da = new SqlDataAdapter(cmd);
                                        DataTable dt2 = new DataTable();
                                        da.Fill(dt2);
                                        if (dt2.Rows.Count > 0)
                                        {
                                            Session["id"] = dt2.Rows[0]["id"].ToString();
                                            SqlCommand cmd12 = new SqlCommand("Update CustomerMaster set OTP=@otp where id=@id", con);
                                            cmd12.Parameters.AddWithValue("@otp", s1);
                                            cmd12.Parameters.AddWithValue("@id", Session["id"].ToString());
                                            cmd12.ExecuteNonQuery();
                                        }

                                        /// otp mail
                                        MailMessage msg = new MailMessage("embassyvr2021@gmail.com", txtemailid.Text);
                                        msg.Subject = "Embassy Register OTP";
                                        Session["otp"] = s1;

                                        msg.Body = string.Format("Dear {0}, </br> <p> Your OTP is {1} </p><br/>", txtname.Text, s1);
                                        msg.IsBodyHtml = true;
                                        SmtpClient smtp = new SmtpClient();
                                        smtp.Host = "smtp.gmail.com";
                                        smtp.EnableSsl = true;
                                        NetworkCredential nc = new NetworkCredential();
                                        nc.UserName = "embassyvr2021@gmail.com";
                                        nc.Password = "embassy#123";
                                        smtp.UseDefaultCredentials = true;
                                        smtp.Credentials = nc;
                                        smtp.Port = 587;
                                        smtp.Send(msg);

                                        HttpWebRequest myReq1 = (HttpWebRequest)WebRequest.Create("http://sms.mobileadz.in/api/push.json?apikey=602d0dc21e4d2&sender=CGNLMN&mobileno=" + txtmob.Text.Trim() + "&text=%20Dear%20Customer,%0a%0a" + s1 + "%20is%20your%20one%20time%20password%20(OTP).%20Please%20enter%20the%20OTP%20to%20complete%20your%20registration%0a%0aThank%20you%0aTeam%20Embassy");
                                        HttpWebResponse myResp1 = (HttpWebResponse)myReq1.GetResponse();
                                        System.IO.StreamReader respStreamReader1 = new System.IO.StreamReader(myResp1.GetResponseStream());
                                        string responseString1 = respStreamReader1.ReadToEnd();
                                        respStreamReader1.Close();
                                        myResp1.Close();

                                        pnlotp.Visible = true;
                                        Button1.Visible = true;
                                        btnregister.Visible = false;
                                        lblmesg.Text = "";
                                        txtotp.Text = "";
                                        btnresendotp.Visible = false;
                                        timerresendotp.Enabled = true;
                                        return;
                                    }
                                }
                            }
                        }

                        if (intemail == 0 && intmobileno == 0)
                        {
                            Loop:
                            var chars = "123456789";
                            var stringChars = new char[9];
                            var random = new Random();
                            for (int i = 0; i < stringChars.Length; i++)
                            {
                                stringChars[i] = chars[random.Next(chars.Length)];
                            }
                            var s = new String(stringChars);
                            SqlCommand cmd2 = new SqlCommand("select top(1) id from CustomerMaster where uid=@uid", con);
                            cmd2.Parameters.AddWithValue("@uid", s);
                            SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
                            DataTable dt2 = new DataTable();
                            da2.Fill(dt2);
                            LoopOTP:
                            var chars1 = "1234567890";
                            var stringChars1 = new char[6];
                            var random1 = new Random();
                            for (int i = 0; i < stringChars1.Length; i++)
                            {
                                stringChars1[i] = chars1[random1.Next(chars1.Length)];
                            }
                            var s1 = new String(stringChars1);
                            SqlCommand cmd23 = new SqlCommand("select top(1) id from CustomerMaster where OTP=@OTP", con);
                            cmd23.Parameters.AddWithValue("@OTP", s1);
                            SqlDataAdapter da23 = new SqlDataAdapter(cmd23);
                            DataTable dt23 = new DataTable();
                            da23.Fill(dt23);
                            if (dt2.Rows.Count > 0)
                            {
                                goto Loop;
                            }
                            else if (dt23.Rows.Count > 0)
                            {
                                goto LoopOTP;
                            }
                            else
                            {
                                float hno = 0;
                                SqlCommand cmd = new SqlCommand("Insert into CustomerMaster(uid, entrydate,name, mobileno, emailid, isactive,isaccountverify,OTP,isotpsend,lastotpverifeddate)values(@uid,@entrydate,@name,@mobileno,@emailid,@isactive,@isaccountverify,@OTP,@isotpsend,@lastotpverifeddate)", con);
                                cmd.Parameters.AddWithValue("@entrydate", encryptdecrypt.indiandate());
                                cmd.Parameters.AddWithValue("@uid", s);
                                cmd.Parameters.AddWithValue("@name", txtname.Text);
                                cmd.Parameters.AddWithValue("@mobileno", txtmob.Text);
                                cmd.Parameters.AddWithValue("@emailid", txtemailid.Text);
                                cmd.Parameters.AddWithValue("@IsActive", 1);
                                cmd.Parameters.AddWithValue("@isaccountverify", "0");
                                cmd.Parameters.AddWithValue("@OTP", s1);
                                cmd.Parameters.AddWithValue("@isotpsend", "0");
                                cmd.Parameters.AddWithValue("@lastotpverifeddate", encryptdecrypt.indiandate());
                                int k = cmd.ExecuteNonQuery();
                                if (k > 0)
                                {
                                    //MailMessage mail = new MailMessage();
                                    //string htmlBody1 = "<!doctype html><html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\"xmlns:o=\"urn:schemas-microsoft-com:office:office\"><head><!--[if gte mso 15]> <xml> <o:OfficeDocumentSettings> <o:AllowPNG/> <o:PixelsPerInch>96</o:PixelsPerInch> </o:OfficeDocumentSettings> </xml><![endif]--> <meta charset=\"UTF-8\"> <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"> <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\"> <title>Reset Your Lingo Password</title><!--[if !mso]> <link href='https://fonts.googleapis.com/css?family=Asap:400,400italic,700,700italic' rel='stylesheet' type='text/css'> <style type=\"text/css\"> @media only screen and (min-width:768px){.templateContainer{width: 600px !important;}}@media only screen and (max-width: 480px){body, table, td, p, a, li, blockquote{-webkit-text-size-adjust: none !important;}}@media only screen and (max-width: 480px){body{width: 100% !important; min-width: 100% !important;}}@media only screen and (max-width: 480px){#bodyCell{padding-top: 10px !important;}}@media only screen and (max-width: 480px){.mcnImage{width: 100% !important;}}@media only screen and (max-width: 480px){.mcnCaptionTopContent, .mcnCaptionBottomContent, .mcnTextContentContainer, .mcnBoxedTextContentContainer, .mcnImageGroupContentContainer, .mcnCaptionLeftTextContentContainer, .mcnCaptionRightTextContentContainer, .mcnCaptionLeftImageContentContainer, .mcnCaptionRightImageContentContainer, .mcnImageCardLeftTextContentContainer, .mcnImageCardRightTextContentContainer{max-width: 100% !important; width: 100% !important;}}@media only screen and (max-width: 480px){.mcnBoxedTextContentContainer{min-width: 100% !important;}}@media only screen and (max-width: 480px){.mcnImageGroupContent{padding: 9px !important;}}@media only screen and (max-width: 480px){.mcnCaptionLeftContentOuter .mcnTextContent, .mcnCaptionRightContentOuter .mcnTextContent{padding-top: 9px !important;}}@media only screen and (max-width: 480px){.mcnImageCardTopImageContent, .mcnCaptionBlockInner .mcnCaptionTopContent:last-child .mcnTextContent{padding-top: 18px !important;}}@media only screen and (max-width: 480px){.mcnImageCardBottomImageContent{padding-bottom: 9px !important;}}@media only screen and (max-width: 480px){.mcnImageGroupBlockInner{padding-top: 0 !important; padding-bottom: 0 !important;}}@media only screen and (max-width: 480px){.mcnImageGroupBlockOuter{padding-top: 9px !important; padding-bottom: 9px !important;}}@media only screen and (max-width: 480px){.mcnTextContent, .mcnBoxedTextContentColumn{padding-right: 18px !important; padding-left: 18px !important;}}@media only screen and (max-width: 480px){.mcnImageCardLeftImageContent, .mcnImageCardRightImageContent{padding-right: 18px !important; padding-bottom: 0 !important; padding-left: 18px !important;}}@media only screen and (max-width: 480px){.mcpreview-image-uploader{display: none !important; width: 100% !important;}}@media only screen and (max-width: 480px){/* @tab Mobile Styles @section Heading 1 @tip Make the first-level headings larger in size for better readability on small screens. */ h1{/*@editable*/ font-size: 20px !important; /*@editable*/ line-height: 150% !important;}}@media only screen and (max-width: 480px){/* @tab Mobile Styles @section Heading 2 @tip Make the second-level headings larger in size for better readability on small screens. */ h2{/*@editable*/ font-size: 20px !important; /*@editable*/ line-height: 150% !important;}}@media only screen and (max-width: 480px){/* @tab Mobile Styles @section Heading 3 @tip Make the third-level headings larger in size for better readability on small screens. */ h3{/*@editable*/ font-size: 18px !important; /*@editable*/ line-height: 150% !important;}}@media only screen and (max-width: 480px){/* @tab Mobile Styles @section Heading 4 @tip Make the fourth-level headings larger in size for better readability on small screens. */ h4{/*@editable*/ font-size: 16px !important; /*@editable*/ line-height: 150% !important;}}@media only screen and (max-width: 480px){/* @tab Mobile Styles @section Boxed Text @tip Make the boxed text larger in size for better readability on small screens. We recommend a font size of at least 16px. */ .mcnBoxedTextContentContainer .mcnTextContent, .mcnBoxedTextContentContainer .mcnTextContent p{/*@editable*/ font-size: 16px !important; /*@editable*/ line-height: 150% !important;}}@media only screen and (max-width: 480px){/* @tab Mobile Styles @section Preheader Visibility @tip Set the visibility of the email's preheader on small screens. You can hide it to save space. */ #templatePreheader{/*@editable*/ display: block !important;}}@media only screen and (max-width: 480px){/* @tab Mobile Styles @section Preheader Text @tip Make the preheader text larger in size for better readability on small screens. */ #templatePreheader .mcnTextContent, #templatePreheader .mcnTextContent p{/*@editable*/ font-size: 12px !important; /*@editable*/ line-height: 150% !important;}}@media only screen and (max-width: 480px){/* @tab Mobile Styles @section Header Text @tip Make the header text larger in size for better readability on small screens. */ #templateHeader .mcnTextContent, #templateHeader .mcnTextContent p{/*@editable*/ font-size: 16px !important; /*@editable*/ line-height: 150% !important;}}@media only screen and (max-width: 480px){/* @tab Mobile Styles @section Body Text @tip Make the body text larger in size for better readability on small screens. We recommend a font size of at least 16px. */ #templateBody .mcnTextContent, #templateBody .mcnTextContent p{/*@editable*/ font-size: 16px !important; /*@editable*/ line-height: 150% !important;}}@media only screen and (max-width: 480px){/* @tab Mobile Styles @section Footer Text @tip Make the footer content text larger in size for better readability on small screens. */ #templateFooter .mcnTextContent, #templateFooter .mcnTextContent p{/*@editable*/ font-size: 12px !important; /*@editable*/ line-height: 150% !important;}}</style></head><body style=\"-ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; background-color: #f57153; height: 100%; margin: 0; padding: 0; width: 100%\"> <center> <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" height=\"100%\" id=\"bodyTable\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; background-color: #f57153; height: 100%; margin: 0; padding: 0; width: 100%\" width=\"100%\"> <tr> <td align=\"center\" id=\"bodyCell\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; border-top: 0; height: 100%; margin: 0; padding: 0; width: 100%\" valign=\"top\"><!--[if gte mso 9]> <table align=\"center\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"600\" style=\"width:600px;\"> <tr> <td align=\"center\" valign=\"top\" width=\"600\" style=\"width:600px;\"><![endif]--> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"templateContainer\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; max-width: 600px; border: 0\" width=\"100%\"> <tr> <td id=\"templatePreheader\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; background-color: #f57153; border-top: 0; border-bottom: 0; padding-top: 16px; padding-bottom: 8px\" valign=\"top\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnTextBlock\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody class=\"mcnTextBlockOuter\"> <tr> <td class=\"mcnTextBlockInner\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%\" valign=\"top\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnTextContentContainer\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody> <tr> <td class=\"mcnTextContent\" style='mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; word-break: break-word; color: white; font-family: \"Asap\", Helvetica, sans-serif; font-size: 24px; line-height: 150%; text-align: left; padding-top: 9px; padding-right: 18px; padding-bottom: 9px; padding-left: 18px;' valign=\"top\"> <a href=\"http://www.MatchBox.Prop3d.in\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; color: white; font-weight: 700; text-decoration: none\" target=\"_blank\" title=\"MatchBox is project management tool\"> MatchBox </a> </td></tr></tbody> </table> </td></tr></tbody> </table> </td></tr><tr> <td id=\"templateHeader\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; background-color: #f7f7ff; border-top: 0; border-bottom: 0; padding-top: 16px; padding-bottom: 0\" valign=\"top\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnImageBlock\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody class=\"mcnImageBlockOuter\"> <tr> <td class=\"mcnImageBlockInner\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding: 0px\" valign=\"top\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnImageContentContainer\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody> <tr> <td class=\"mcnImageContent\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-right: 0px; padding-left: 0px; padding-top: 0; padding-bottom: 0; text-align: center;\" valign=\"top\"> <a class=\"\" href=\"http://www.MatchBox.Prop3d.in\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; color: #f57153; font-weight: normal; text-decoration: none\" target=\"_blank\" title=\"\"><a class=\"\" href=\"http://www.MatchBox.Prop3d.in\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; color: #f57153; font-weight: normal; text-decoration: none\" target=\"_blank\" title=\"\"> <img align=\"center\" alt=\"Forgot your password?\" class=\"mcnImage\" src=\"https://static.lingoapp.com/assets/images/email/il-password-reset@2x.png\" style=\"-ms-interpolation-mode: bicubic; border: 0; height: auto; outline: none; text-decoration: none; vertical-align: bottom; max-width: 1200px; padding-bottom: 0; display: inline !important; vertical-align: bottom;\" width=\"600\"></img> </a></a> </td></tr></tbody> </table> </td></tr></tbody> </table> </td></tr><tr> <td id=\"templateBody\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; background-color: #f7f7ff; border-top: 0; border-bottom: 0; padding-top: 0; padding-bottom: 0\" valign=\"top\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnTextBlock\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody class=\"mcnTextBlockOuter\"> <tr> <td class=\"mcnTextBlockInner\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%\" valign=\"top\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnTextContentContainer\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody> <tr> <td class=\"mcnTextContent\" style='mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; word-break: break-word; color: #2a2a2a; font-family: \"Asap\", Helvetica, sans-serif; font-size: 16px; line-height: 150%; text-align: center; padding-top: 9px; padding-right: 18px; padding-bottom: 9px; padding-left: 18px;' valign=\"top\"> <h1 class=\"null\" style='color: #2a2a2a; font-family: \"Asap\", Helvetica, sans-serif; font-size: 32px; font-style: normal; font-weight: bold; line-height: 125%; letter-spacing: 2px; text-align: center; display: block; margin: 0; padding: 0'> <span style=\"text-transform: uppercase\">Want To Create Your</span></h1> <h2 class=\"null\" style='color: #2a2a2a; font-family: \"Asap\", Helvetica, sans-serif; font-size: 24px; font-style: normal; font-weight: bold; line-height: 125%; letter-spacing: 1px; text-align: center; display: block; margin: 0; padding: 0'> <span style=\"text-transform: uppercase\">New password?</span></h2> </td></tr></tbody> </table> </td></tr></tbody> </table> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnTextBlock\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody class=\"mcnTextBlockOuter\"> <tr> <td class=\"mcnTextBlockInner\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%\" valign=\"top\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnTextContentContainer\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody> <tr> <td class=\"mcnTextContent\" style='mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; word-break: break-word; color: #2a2a2a; font-family: \"Asap\", Helvetica, sans-serif; font-size: 16px; line-height: 150%; text-align: center; padding-top: 9px; padding-right: 18px; padding-bottom: 9px; padding-left: 18px;' valign=\"top\"> Not to worry, we got you! Let’s get you a new password. <br></br> </td></tr></tbody> </table> </td></tr></tbody> </table> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnButtonBlock\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody class=\"mcnButtonBlockOuter\"> <tr> <td align=\"center\" class=\"mcnButtonBlockInner\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 18px; padding-right: 18px; padding-bottom: 18px; padding-left: 18px;\" valign=\"top\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnButtonBlock\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody class=\"mcnButtonBlockOuter\"> <tr> <td align=\"center\" class=\"mcnButtonBlockInner\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 0; padding-right: 18px; padding-bottom: 18px; padding-left: 18px;\" valign=\"top\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnButtonContentContainer\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; border-collapse: separate !important; border-radius: 48px; background-color: #F57153;\"> <tbody> <tr> <td align=\"center\" class=\"mcnButtonContent\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; font-family: 'Asap', Helvetica, sans-serif; font-size: 16px; padding-top: 24px; padding-right: 48px; padding-bottom: 24px; padding-left: 48px;\" valign=\"middle\"> <a class=\"mcnButton \" href=\"http://www.MatchBox.Prop3d.in/MatchBox-Set-New-Password/" + s1 + "\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; display: block; color: #f57153; font-weight: normal; text-decoration: none; font-weight: normal; letter-spacing: 1px; line-height: 100%; text-align: center; text-decoration: none; color: #FFFFFF; text-transform: uppercase;\" target=\"_blank\" title=\"Click to Set New Password\">Create New password</a> </td></tr></tbody> </table> </td></tr></tbody> </table> </td></tr></tbody> </table> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnImageBlock\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody class=\"mcnImageBlockOuter\"> <tr> <td class=\"mcnImageBlockInner\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding: 0px\" valign=\"top\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnImageContentContainer\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody> <tr> <td class=\"mcnImageContent\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-right: 0px; padding-left: 0px; padding-top: 0; padding-bottom: 0; text-align: center;\" valign=\"top\"> </td></tr></tbody> </table> </td></tr></tbody> </table> </td></tr></table><!--[if gte mso 9]> </td></tr></table><![endif]--> </td></tr></table> </center></body></html>";
                                    //AlternateView htmlView1 = AlternateView.CreateAlternateViewFromString(htmlBody1, null, "text/html");
                                    //mail.IsBodyHtml = true;
                                    //mail.AlternateViews.Add(htmlView1);
                                    //mail.Subject = "Greetings From MatchBox. Create a New Password";
                                    //mail.From = new MailAddress("embassyvr2021@gmail.com");
                                    //mail.To.Add(txtemailid.Text);
                                    //mail.IsBodyHtml = true;
                                    //SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                                    //smtp.EnableSsl = true;
                                    //NetworkCredential netCre = new NetworkCredential("embassyvr2021@gmail.com", "embassy#123");
                                    //smtp.Credentials = netCre;
                                    //try
                                    //{
                                    //    //smtp.Send(mail);
                                    //    //pnlmain.Visible = false;
                                    //    //pnlotp.Visible = true;
                                    //    //pnlupdate.Update();
                                    //}
                                    //catch (Exception ex)
                                    //{
                                    //}  

                                    HttpWebRequest myReq1 = (HttpWebRequest)WebRequest.Create("http://sms.mobileadz.in/api/push.json?apikey=602d0dc21e4d2&sender=CGNLMN&mobileno=" + txtmob.Text.Trim() + "&text=%20Dear%20Customer,%0a%0a" + s1 + "%20is%20your%20one%20time%20password%20(OTP).%20Please%20enter%20the%20OTP%20to%20complete%20your%20registration%0a%0aThank%20you%0aTeam%20Embassy");
                                    //HttpWebRequest myReq1 = (HttpWebRequest)WebRequest.Create("http://sms.mobileadz.in/api/push.json?apikey=5e56f95decd26&sender=CGNLMN&mobileno=" + txtmob.Text.Trim() + "&text=%20Dear%20Customer,%0a%0a" + s1 + "%20is%20your%20one%20time%20password%20(OTP).%20Please%20enter%20the%20OTP%20to%20complete%20your%20registration%0a%0aThank%20you%0aTeam%20Embassy");
                                    HttpWebResponse myResp1 = (HttpWebResponse)myReq1.GetResponse();
                                    System.IO.StreamReader respStreamReader1 = new System.IO.StreamReader(myResp1.GetResponseStream());
                                    string responseString1 = respStreamReader1.ReadToEnd();
                                    respStreamReader1.Close();
                                    myResp1.Close();

                                    /// otp mail
                                    MailMessage msg = new MailMessage("embassyvr2021@gmail.com", txtemailid.Text);
                                    msg.Subject = "Embassy Register OTP";
                                    Session["otp"] = s1;

                                    msg.Body = string.Format("Dear {0}, </br></br> Your OTP is {1} <br/>", txtname.Text, s1);
                                    msg.IsBodyHtml = true;
                                    SmtpClient smtp = new SmtpClient();
                                    smtp.Host = "smtp.gmail.com";
                                    smtp.EnableSsl = true;
                                    NetworkCredential nc = new NetworkCredential();
                                    nc.UserName = "embassyvr2021@gmail.com";
                                    nc.Password = "embassy#123";
                                    smtp.UseDefaultCredentials = true;
                                    smtp.Credentials = nc;
                                    smtp.Port = 587;
                                    smtp.Send(msg);
                                    pnlotp.Visible = true;
                                    Button1.Visible = true;
                                    btnregister.Visible = false;
                                    timerresendotp.Enabled = true;
                                    lblresend.Visible = true;
                                }
                            }
                        }
                        else
                        {
                            //hide registration
                            divcontainer.Attributes["style"] = " display:none;";
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
                    }
                }
                else
                {
                    if (txtemailid.Text.Trim() == "")
                    {
                        lblemailid.Attributes["class"] = "invalid";
                    }
                    else
                    {
                        lblemailid.Attributes.Remove("class");
                    }
                    if (txtmob.Text.Trim() == "")
                    {
                        lblmobile.Attributes["class"] = "invalid";
                    }
                    else
                    {
                        lblmobile.Attributes.Remove("class");
                    }
                    if (txtname.Text.Trim() == "")
                    {
                        lblname.Attributes["class"] = "invalid";
                    }
                    else
                    {
                        lblname.Attributes.Remove("class");
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
            }
        }


        protected void lnkforget_Click(object sender, EventArgs e)
        {
            try
            {
                lblmesg.Text = "";
                pnlotp.Visible = false;
                Button1.Visible = false;

                pnlregi.Visible = false;
                btnregister.Visible = false;
                btnlogin.Visible = true;
                pnllogin.Visible = true;



                lnkforget.Visible = true;
                txtname.Text = "";
                txtemailid.Text = "";
                txtotp.Text = "";
                txtmob.Text = "";
                txtloginpass.Text = "";
                txtloginname.Text = "";
                btnresendotp.Visible = false;
                pnlotp.Visible = false;
                Button1.Visible = false;

                pnlregi.Visible = false;
                btnregister.Visible = false;
                btnlogin.Visible = false;
                pnllogin.Visible = false;

                lnklogin.CommandArgument = "1";
                lnklogin.Text = "Go to Login";
                lbllogin.Text = "registration";
                lblmesg.Text = "";


                lnkforget.Visible = false;
                txtname.Text = "";
                txtemailid.Text = "";
                txtotp.Text = "";
                txtmob.Text = "";
                txtloginpass.Text = "";
                btnresendotp.Visible = false;
                txtloginname.Text = "";

                lbllogin.Text = "Forgot Password";
                pnlfor.Visible = true;
                btnforgot.Visible = true;
                btnforcon.Visible = false;

                lblforcmpass.Visible = false;
                lblforpass.Visible = false;
                lblforotp.Visible = false;





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
            }
        }
        protected void btnforgetReg_Click(object sender, EventArgs e)
        {
            try
            {
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }


                if (txtforotp.Text != "" && txtforpass.Text != "" && txtforcmpass.Text != "")
                {
                    if (txtformob.Text != "")
                    {
                        SqlCommand cmd = new SqlCommand("select  *,name as name from CustomerMaster   where  mobileno=@mobileno and isaccountverify='1'", con);

                        cmd.Parameters.AddWithValue("@mobileno", txtformob.Text);
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt2 = new DataTable();
                        da.Fill(dt2);
                        if (dt2.Rows.Count > 0)
                        {
                            if (txtforotp.Text.Trim() == dt2.Rows[0]["OTP"].ToString())
                            {
                                if (txtforcmpass.Text.Trim() != txtforpass.Text.Trim())
                                {
                                    lblmesg.Text = "Can not match Password";
                                    return;
                                }
                                Session["id"] = dt2.Rows[0]["id"].ToString();


                                SqlCommand cmdf = new SqlCommand("update customermaster set confirmpassword=@confirmpassword,password=@password,statusid=@statusid,statusdate=@statusdate, executiveid=@executiveid,isrequestaccepted=@isrequestaccepted,requesteddate=@requesteddate, isaccountverify=@isaccountverify,isotpsend=@isotpsend, lastotpverifeddate=@lastotpverifeddate where  mobileno=@mobileno ", con);

                                cmdf.Parameters.AddWithValue("@executiveid", "0");
                                cmdf.Parameters.AddWithValue("@isrequestaccepted", "0");
                                cmdf.Parameters.AddWithValue("@statusid", "1");
                                cmdf.Parameters.AddWithValue("@statusdate", encryptdecrypt.indiandate());
                                cmdf.Parameters.AddWithValue("@password", encryptdecrypt.Encrypt(txtforpass.Text.Trim()));
                                cmdf.Parameters.AddWithValue("@confirmpassword", encryptdecrypt.Encrypt(txtforcmpass.Text.Trim()));
                                cmdf.Parameters.AddWithValue("@requesteddate", encryptdecrypt.indiandate());
                                cmdf.Parameters.AddWithValue("@isaccountverify", "1");
                                cmdf.Parameters.AddWithValue("@mobileno", txtformob.Text);
                                cmdf.Parameters.AddWithValue("@isotpsend", "1");
                                cmdf.Parameters.AddWithValue("@lastotpverifeddate", encryptdecrypt.indiandate());
                                cmdf.ExecuteNonQuery();

                                pnlfor.Visible = false;
                                pnlotp.Visible = false;
                                Button1.Visible = false;

                                pnlregi.Visible = false;
                                btnregister.Visible = false;
                                btnlogin.Visible = false;
                                pnllogin.Visible = false;

                                lblmesg.Text = "";


                                lblagree.Text = "";

                                lnklogin.Visible = false;
                                lnkforget.Visible = false;
                                lblmesg.Text = "";
                                txtname.Text = "";
                                txtemailid.Text = "";
                                txtformob.Text = "";
                                txtforotp.Text = "";
                                pnlfor.Visible = false;
                                lblmesg.Text = "";
                                lbllogin.Text = "Login";
                                pnlotp.Visible = false;
                                Button1.Visible = false;

                                pnlregi.Visible = false;
                                btnregister.Visible = false;
                                btnlogin.Visible = true;
                                pnllogin.Visible = true;

                                lnklogin.CommandArgument = "0";
                                lnklogin.Text = "Don't have an account? Register ";


                                lnkforget.Visible = true;
                                txtname.Text = "";
                                txtemailid.Text = "";
                                txtotp.Text = "";
                                txtmob.Text = "";
                                txtloginpass.Text = "";
                                txtloginname.Text = "";
                                btnresendotp.Visible = false;

                            }
                            else
                            {
                                //btnresendotp.Visible = true;
                                lblmesg.Text = "Wrong Otp";
                                return;

                            }

                            //Timer1.Enabled = true;
                            //  lblsignup.Text = "This email ID is already registerd.Please try login with Email ID and Password.";
                        }
                    }



                }
                else
                {
                    if (txtforotp.Text == "")
                    {
                        lblmesg.Text = "Please Enter OTP";
                        return;
                    }

                    if (txtforpass.Text == "")
                    {
                        lblmesg.Text = "Please Enter Password";
                        return;
                    }

                    if (txtforcmpass.Text == "")
                    {
                        lblmesg.Text = "Please Enter Confirm Password";
                        return;
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
            }
        }

        protected void btnforget_Click(object sender, EventArgs e)
        {
            try
            {
                try
                {
                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }
                    if (txtformob.Text != "")
                    {


                        LoopOTP:
                        var chars1 = "1234567890";
                        var stringChars1 = new char[6];
                        var random1 = new Random();
                        for (int i = 0; i < stringChars1.Length; i++)
                        {
                            stringChars1[i] = chars1[random1.Next(chars1.Length)];
                        }
                        var s1 = new String(stringChars1);


                        SqlCommand cmd23 = new SqlCommand("select top(1) id from CustomerMaster where OTP=@OTP", con);
                        cmd23.Parameters.AddWithValue("@OTP", s1);
                        SqlDataAdapter da23 = new SqlDataAdapter(cmd23);
                        DataTable dt23 = new DataTable();
                        da23.Fill(dt23);


                        if (dt23.Rows.Count > 0)
                        {
                            goto LoopOTP;
                        }

                        SqlCommand cmd = new SqlCommand("select  *,name as name from CustomerMaster   where mobileno=@mobileno and isaccountverify='1'", con);

                        cmd.Parameters.AddWithValue("@mobileno", txtformob.Text);
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt2 = new DataTable();
                        da.Fill(dt2);
                        if (dt2.Rows.Count > 0)
                        {
                            Session["id"] = dt2.Rows[0]["id"].ToString();
                            SqlCommand cmd12 = new SqlCommand("Update CustomerMaster set OTP=@otp where id=@uid", con);
                            cmd12.Parameters.AddWithValue("@otp", s1);
                            cmd12.Parameters.AddWithValue("@uid", Session["id"].ToString());
                            cmd12.ExecuteNonQuery();
                            // HttpWebRequest myReq1 = (HttpWebRequest)WebRequest.Create("http://sms.mobileadz.in/api/push.json?apikey=5e56f95decd26&sender=CGNLMN&mobileno=" + txtmob.Text.Trim() + "&text=%20Dear%20Customer,%0a%0a" + s1 + "%20is%20your%20one%20time%20password%20(OTP).%20Please%20enter%20the%20OTP%20to%20complete%20your%20registration%0a%0aThank%20you%0aTeam%20Embassy");
                            HttpWebRequest myReq1 = (HttpWebRequest)WebRequest.Create("http://sms.mobileadz.in/api/push.json?apikey=5e56f95decd26&sender=CGNLMN&mobileno=" + txtformob.Text.Trim() + "&text=Your OTP for booking is " + s1 + "");
                            HttpWebResponse myResp1 = (HttpWebResponse)myReq1.GetResponse();
                            System.IO.StreamReader respStreamReader1 = new System.IO.StreamReader(myResp1.GetResponseStream());
                            string responseString1 = respStreamReader1.ReadToEnd();
                            respStreamReader1.Close();
                            myResp1.Close();
                            //pnlotp.Visible = true;
                            //Button1.Visible = true;
                            //btnregister.Visible = false;
                            lblforcmpass.Visible = true;
                            lblforpass.Visible = true;
                            lblforotp.Visible = true;
                            btnforgot.Visible = false;
                            btnforcon.Visible = true;
                            timerresendotp.Enabled = true;
                        }
                        else
                        {
                            lblmesg.Text = "Account not registered";
                        }





                    }
                    else
                    {
                        lblmesg.Text = "Please Entet mobile No.";

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
                    Session["id"] = null;
                    //lblmesg.Text = "";

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
            }

        }

        protected void lnkbook_Click(object sender, EventArgs e)
        {
            if (Session["id"] != null)
            {
                string strid = "Booking/" + Session["id"].ToString();
                //iframeid.Attributes.Add("src", "inventorytemp.aspx?uid=" + Session["id"].ToString());
            }
            else
            {
                //index page redirect
            }
        }

        protected void lnklogout_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
            pnlfor.Visible = false;
            lblmesg.Text = "";
            lbllogin.Text = "Login";
            pnlotp.Visible = false;
            Button1.Visible = false;

            pnlregi.Visible = false;
            btnregister.Visible = false;
            btnlogin.Visible = true;
            pnllogin.Visible = true;

            lnklogin.CommandArgument = "0";
            lnklogin.Text = "Don't have an account? Register ";


            lnkforget.Visible = true;
            txtname.Text = "";
            txtemailid.Text = "";
            txtotp.Text = "";
            txtmob.Text = "";
            txtloginpass.Text = "";
            txtloginname.Text = "";
            btnresendotp.Visible = false;


            //Response.Redirect(Request.RawUrl);


        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}