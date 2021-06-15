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
using System.Text;
using System.Security.Cryptography;
using System.Linq;
//using System.Linq.Enumerable.Contains;

namespace bramhacorp
{
    public partial class newinventory : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["temp.Properties.Settings.tempConnectionString"].ConnectionString);
        public string getSeat;
        protected void Page_Load(object sender, EventArgs e)
        {

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myfunedd", "$(\".select2_multiple\").select2({allowClear:true});$(\".select2_single\").select2({}); $('[rel=\"tooltip\"]').tooltip();if (typeof $.fn.tagsInput !== 'undefined') {  $('#tags_1').tagsInput({   width: 'auto'  }); $('#txtamenities').tagsInput({   width: 'auto'  });  }", true);

            if (!IsPostBack)
            {
                Session["paymenttransaction"] = "0";
                timerbooking.Enabled = false;
                //lblcolor.Value = "#b8282e, #424b57, #b8282e, #424b57, #b8282e, #424b57, #b8282e, #424b57";
                //lbllabel.Value = "10, 20, 50, 100, 533, 500, 0, jPOT";
                Session["unitdetails"] = "";
                Session["step1"] = "";
                Session["costsheet"] = "";
                Session["step2"] = "";
                Session["paymentschedule"] = "";
                Session["step3"] = "";
                Session["bookingform"] = "";
                Session["step4"] = "";
                Session["payment"] = "";
                Session["step5"] = "";
                Session["regfees"] = "";
                Session["customerid"] = "1";

                //   Calendar1.EndDate = DateTime.Now.Date; 
                if (Request.QueryString["uid"] != null)
                {



                    ddcountrycode.SelectedValue = "91";
                    Session["customerid"] = Request.QueryString["uid"].ToString();
                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }
                    SqlCommand cmd343 = new SqlCommand("select * from customerbookingunit where customerid=@customerid", con);
                    cmd343.Parameters.AddWithValue("@customerid", Session["customerid"].ToString());
                    SqlDataAdapter da343 = new SqlDataAdapter(cmd343);
                    DataTable dt343 = new DataTable();
                    da343.Fill(dt343);

                    //if (dt343.Rows.Count > 0)
                    //{
                    //    SqlCommand cmd342 = new SqlCommand("update customerbooking set unitdeatails=null where customerid=@customerid", con);
                    //    cmd342.Parameters.AddWithValue("@customerid", Session["customerid"].ToString());
                    //    cmd342.ExecuteNonQuery();

                    //}
                    if (dt343.Rows.Count > 0)
                    {
                        SqlCommand cmd342 = new SqlCommand("delete from customerbookingunit where customerid=@customerid", con);
                        cmd342.Parameters.AddWithValue("@customerid", Session["customerid"].ToString());
                        cmd342.ExecuteNonQuery();

                    }

                    if (Session["customerid"].ToString() != "<%= stringuid %>" && Session["customerid"].ToString() != "")
                    {
                        Session["nextvalue"] = "0";
                        if (Session["dtbrochures"] != null)
                        {
                            Session["dtbrochures"] = null;
                        }
                        Session["unitdetails"] = "Select Unit";
                        Session["step1"] = "STEP 1";
                        Session["costsheet"] = "Cost Sheet";
                        Session["step2"] = "STEP 2";
                        Session["paymentschedule"] = "Schedule";
                        Session["step3"] = "STEP 3";
                        Session["bookingform"] = "Form";
                        Session["step4"] = "STEP 4";
                        Session["payment"] = "Payment";
                        Session["step5"] = "STEP 5";
                        Session["regfees"] = "0";
                        Session["projectid"] = "1";
                        Session["stepid"] = "1";
                        divbody.Attributes["style"] = "background:#fffcf5";

                        try
                        {
                            if (con.State != ConnectionState.Open)
                            {
                                con.Open();
                            }
                            SqlCommand cmd2xb = new SqlCommand("select name,mobileno,emailid from customermaster where id=@customerid", con);
                            cmd2xb.Parameters.AddWithValue("@customerid", Session["customerid"].ToString());

                            SqlDataAdapter da2xb = new SqlDataAdapter(cmd2xb);
                            DataTable dt2xb = new DataTable();
                            da2xb.Fill(dt2xb);
                            if (dt2xb.Rows.Count > 0)
                            {
                                txtemail.Text = dt2xb.Rows[0]["emailid"].ToString();
                                Session["columbiaemail"] = dt2xb.Rows[0]["emailid"].ToString();
                                txtmobileno.Text = dt2xb.Rows[0]["mobileno"].ToString();
                                string fullName = dt2xb.Rows[0]["name"].ToString();
                                var names = fullName.Split(' ');
                                lblapplicant.Text = "Applicant 1";

                                if (names.Length == 1)
                                {
                                    txtfirstname.Text = names[0];

                                }
                                else if (names.Length == 2)
                                {
                                    txtfirstname.Text = names[0];
                                    txtlastname.Text = names[1];
                                }
                                else if (names.Length > 2)
                                {
                                    txtfirstname.Text = names[0];
                                    txtmiddlename.Text = names[1];
                                    txtlastname.Text = names[2];
                                }
                            }
                            //lnkaddbooking.CommandArgument = "0";
                            //SqlCommand cmd2x = new SqlCommand("select id,towername from propertylisttower where propid=@propertyid", con);
                            //cmd2x.Parameters.AddWithValue("@propertyid", Session["projectid"].ToString());
                            //SqlDataAdapter da2x = new SqlDataAdapter(cmd2x);
                            //DataTable dt2x = new DataTable();
                            //da2x.Fill(dt2x);
                            //ddtower.DataSource = dt2x;
                            //ddtower.DataTextField = "towername";
                            //ddtower.DataValueField = "id";
                            //ddtower.DataBind();
                            //ddtower.Items.Insert(0, new ListItem("Select Tower", "0"));
                            //if (ddtower.Items.Count > 0)
                            //{
                            //    displayrecords(ddtower.SelectedValue);
                            //}


                            SqlCommand cmd2x1 = new SqlCommand("select id,name from salutationMaster where isactive!='0' ", con);
                            //cmd2x1.Parameters.AddWithValue("@compcode", Session["compcode"].ToString());
                            SqlDataAdapter da2x1 = new SqlDataAdapter(cmd2x1);
                            DataTable dt2x1 = new DataTable();
                            da2x1.Fill(dt2x1);
                            ddsalutation.DataSource = dt2x1;
                            ddsalutation.DataTextField = "name";
                            ddsalutation.DataValueField = "id";
                            ddsalutation.DataBind();
                            if (con.State != ConnectionState.Open)
                            {
                                con.Open();
                            }

                            SqlCommand cmd2x1j = new SqlCommand("select  t.name as terms from paymentscheduleterms as t left outer join propertylist as p on p.paymentid=t.paymentid where p.id=@propertyid", con);
                            cmd2x1j.Parameters.AddWithValue("@propertyid", Session["projectid"].ToString());
                            SqlDataAdapter da2x1j = new SqlDataAdapter(cmd2x1j);
                            DataTable dt2x1j = new DataTable();
                            da2x1j.Fill(dt2x1j);
                            rptterms.DataSource = dt2x1j;
                            rptterms.DataBind();

                            SqlCommand cmd2x1jh = new SqlCommand("select  t.name as terms from paymentscheduleterms as t left outer join propertylist as p on p.termsid=t.paymentid where p.id=@propertyid", con);
                            cmd2x1jh.Parameters.AddWithValue("@propertyid", Session["projectid"].ToString());
                            SqlDataAdapter da2x1jh = new SqlDataAdapter(cmd2x1jh);
                            DataTable dt2x1jh = new DataTable();
                            da2x1jh.Fill(dt2x1jh);
                            rptconfirmterms.DataSource = dt2x1jh;
                            rptconfirmterms.DataBind();

                            SqlCommand cmd424 = new SqlCommand("Select top(1) * from customersteps where customerid=@customerid and isbookingdone!=1  order by id desc", con);
                            cmd424.Parameters.AddWithValue("@customerid", Session["customerid"].ToString());
                            SqlDataAdapter da24 = new SqlDataAdapter(cmd424);
                            DataTable dt24 = new DataTable();
                            da24.Fill(dt24);
                            if (dt24.Rows.Count > 0)
                            {
                                Session["stepid"] = dt24.Rows[0]["stepid"].ToString();
                            }
                            else
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

                                SqlCommand cmd2 = new SqlCommand("select top(1) id from customersteps where stepid=@stepsid ", con);
                                cmd2.Parameters.AddWithValue("@stepsid", s);
                                //cmd2.Parameters.AddWithValue("@compcode", Session["compcode"].ToString()); 
                                SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
                                DataTable dt2 = new DataTable();
                                da2.Fill(dt2);
                                if (dt2.Rows.Count > 0)
                                {
                                    goto Loop;
                                }
                                else
                                {
                                    if (con.State != ConnectionState.Open)
                                    {
                                        con.Open();
                                    }
                                    //insert
                                    SqlCommand cmd = new SqlCommand("Insert into customersteps(entrydate, customerid, stepid, unitid, isstep1, isstep2, isstep3, isstep4, isstep5,isBookingdone, schemeid)values(@entrydate,@customerid,@stepid,@unitid,@isstep1,@isstep2,@isstep3,@isstep4,@isstep5,@isBookingdone,@schemeid)", con);
                                    cmd.Parameters.AddWithValue("@entrydate", encryptdecrypt.indiandate());
                                    cmd.Parameters.AddWithValue("@customerid", Session["customerid"].ToString());
                                    cmd.Parameters.AddWithValue("@stepid", s);
                                    cmd.Parameters.AddWithValue("@unitid", 0);
                                    cmd.Parameters.AddWithValue("@isstep1", 0);
                                    cmd.Parameters.AddWithValue("@isstep2", 0);
                                    cmd.Parameters.AddWithValue("@isstep3", 0);
                                    cmd.Parameters.AddWithValue("@isstep4", 0);
                                    cmd.Parameters.AddWithValue("@isstep5", 0);
                                    cmd.Parameters.AddWithValue("@isBookingdone", 0);
                                    cmd.Parameters.AddWithValue("@schemeid", 0);

                                    int k = cmd.ExecuteNonQuery();
                                    if (k > 0)
                                    {
                                        Session["stepid"] = s;
                                    }
                                }
                            }
                            lnkaddbooking.CommandArgument = "0";
                            LinkButton11.Visible = false;

                            pnlunit.Visible = true;


                            //if (Session["startDate"] != null && Session["endDate"] != null)
                            //{

                            //}
                            //else
                            //{
                            //    Session["startDate"] = DateTime.Now;
                            //    Session["endDate"] = DateTime.Now.AddMinutes(15);
                            //    //timerbooking.Enabled = true;
                            //}



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
                            fillbooking();
                            filldbooking();
                        }
                    }
                }
                else
                {
                    Response.Redirect("index.aspx", false);
                }

            }

        }
        protected void ddtower_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddtower.Items.Count > 0)
            {
                displayrecords(ddtower.SelectedValue);
            }

        }
        protected void ddunit_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (ddunit.Items.Count > 0)
            {
                displayrecords1(ddunit.SelectedValue);
            }
        }
        protected void ddunitvalue_SelectedIndexChanged(object sender, EventArgs e)
        {
           
                if (ddunitvalue.Items.Count > 0)
                {
                    Session["unitcount"] = ddunitvalue.SelectedValue;
                    //unitcount1(sender,e);
                    // displayrecords1();
                    lblmsg.Visible = false;

                }
           

        }
        protected void unitcount(String towerid)
        {
            //Session["unitcount"] = ddunitvalue.SelectedValue;
        }
        protected void unitcount1(String towerid)
        {

        }


        protected void displayrecords1(String towerid)
        {
            try
            {
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                if (ddunit.SelectedValue == "1")
                {
                    SqlCommand cmd2x = new SqlCommand("select distinct pt.id, towername from propertylisttower as pt left outer join propertylistconfig as pc on pt.id = pc.towerid where pc.unittype = 1 and propid=@propertyid", con);
                    cmd2x.Parameters.AddWithValue("@propertyid", Session["projectid"].ToString());
                    SqlDataAdapter da2x = new SqlDataAdapter(cmd2x);
                    DataTable dt2x = new DataTable();
                    da2x.Fill(dt2x);
                    ddtower.DataSource = dt2x;
                    ddtower.DataTextField = "towername";
                    ddtower.DataValueField = "id";
                    ddtower.DataBind();
                    ddtower.Items.Insert(0, new ListItem("Select Tower", "0"));
                    if (ddtower.Items.Count > 0)
                    {
                        displayrecords(ddtower.SelectedValue);
                    }
                }
                else if (ddunit.SelectedValue == "2")
                {
                    SqlCommand cmd2x = new SqlCommand("select distinct pt.id, towername from propertylisttower as pt left outer join propertylistconfig as pc on pt.id = pc.towerid where pc.unittype = 2 and propid=@propertyid", con);
                    cmd2x.Parameters.AddWithValue("@propertyid", Session["projectid"].ToString());
                    SqlDataAdapter da2x = new SqlDataAdapter(cmd2x);
                    DataTable dt2x = new DataTable();
                    da2x.Fill(dt2x);
                    ddtower.DataSource = dt2x;
                    ddtower.DataTextField = "towername";
                    ddtower.DataValueField = "id";
                    ddtower.DataBind();
                    ddtower.Items.Insert(0, new ListItem("Select Tower", "0"));
                    if (ddtower.Items.Count > 0)
                    {
                        displayrecords(ddtower.SelectedValue);
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

        protected void displayrecords(String towerid)
        {
            try
            {
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                if (!string.IsNullOrEmpty(towerid))
                {

                    SqlCommand cmd2x = new SqlCommand("select distinct f.id,f.name as floorname from propertylistconfig as c left outer join floormaster as f on f.id=c.floorid where  c.towerid=@towerid order by f.id desc", con);
                    cmd2x.Parameters.AddWithValue("@towerid", towerid);
                    SqlDataAdapter da2x = new SqlDataAdapter(cmd2x);
                    DataTable dt2x = new DataTable();
                    da2x.Fill(dt2x);
                    rptfloor.DataSource = dt2x;
                    rptfloor.DataBind();
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
        protected void rptfloor_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            try
            {
                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    if (ddtower.Items.Count > 0)
                    {

                        Label lblid = (Label)e.Item.FindControl("lblid");
                        Repeater rptunit = (Repeater)e.Item.FindControl("rptunit");
                        SqlCommand cmd424s = new SqlCommand("select  pc.id as unitid,case when c.colorcode!='' or c.colorcode!=null then c.colorcode else '#000000' end as statuscolor,case when pc.statusid=2 then 'soldback' when pc.statusid=4 then 'soldback'  when pc.statusid=5 then 'soldback' when pc.statusid=3 then 'holdback' else '' end as statusback,pc.priority from  propertylistconfig as pc left outer join propertyconfigmaster as c on c.id=pc.configid where pc.towerid=@towerid and floorid=@floorid order by pc.priority asc", con);

                        cmd424s.Parameters.AddWithValue("@towerid", ddtower.SelectedValue);
                        cmd424s.Parameters.AddWithValue("@floorid", lblid.Text);
                        SqlDataAdapter da24s = new SqlDataAdapter(cmd424s);
                        DataTable dt24s = new DataTable();
                        da24s.Fill(dt24s);
                        rptunit.DataSource = dt24s;
                        rptunit.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                //if (tempERROR == 0)
                //{
                //    tempERROR++;
                //    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "mynoti13", "demo.showNotification('bottom','right','notifications_active','Oops.. Sorry. Try Again Later.')", true);
                //}
            }
        }
        protected void btnfloor_Clicked(object sender, EventArgs e)
        {
            LinkButton lnkcardclick = (LinkButton)sender;

            pnlunit.Visible = false;


        }
        protected void btnclear_Clicked(object sender, EventArgs e)
        {
            pnlunit.Visible = true;
            pnlcostsheet.Visible = false;
            pnlcostsheetinside.Visible = false;
            pnlschedule.Visible = false;
            pnlscheduleinside.Visible = false;
            pnlbookingforminside.Visible = false;
            pnlbookingform.Visible = false;
            pnlpay.Visible = false;
            pnlstep1.Visible = true;
            pnlstep2.Visible = false;
            pnlstep3.Visible = false;
            pnlstep4.Visible = false;
            pnlstep5.Visible = false;
            pnlconfirmdoc.Visible = false;
            //divrightbooking.Attributes["style"] = "display:none;";
            divapply.Attributes["style"] = "display:none;";
            divright.Attributes["style"] = "display:none;";
            divbottom.Attributes["style"] = "display:none;";


        }
        protected void btnstep1_Clicked(object sender, EventArgs e)
        {
            if (Session["paymenttransaction"].ToString() != "1")
            {
                pnlunit.Visible = true;
                pnlcostsheet.Visible = false;
                pnlschedule.Visible = false;
                pnlbookingform.Visible = false;
                pnlpay.Visible = false;
                pnlstep1.Visible = true;
                pnlstep2.Visible = false;
                pnlstep3.Visible = false;
                pnlstep4.Visible = false;
                pnlstep5.Visible = false;
                pnlconfirmdoc.Visible = false;


                //divrightbooking.Attributes["style"] = "display:none;";
                divapply.Attributes["style"] = "display:none;";
                divright.Attributes["style"] = "display:none;";
                divbottom.Attributes["style"] = "display:none;";
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "scrolltopevent", " $('html, body').animate({ scrollTop: $(\"body\").offset().top }, 500);", true);
            }

        }
        protected void btnstep2_Clicked(object sender, EventArgs e)
        {
            if (Session["paymenttransaction"].ToString() != "1")
            {
                pnlunit.Visible = false;
                pnlcostsheet.Visible = true;
                pnlschedule.Visible = false;
                pnlbookingform.Visible = false;
                pnlpay.Visible = false;
                pnlstep1.Visible = false;
                pnlstep2.Visible = true;
                pnlstep3.Visible = false;
                pnlstep4.Visible = false;
                pnlstep5.Visible = false;
                pnlconfirmdoc.Visible = false;
                //timerbooking.Enabled = true;
                //divrightbooking.Attributes["style"] = "display:none;";
                divapply.Attributes["style"] = "display:none;";
                divright.Attributes["style"] = "display:none;";
                divbottom.Attributes["style"] = "display:none;";
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "scrolltopevent", " $('html, body').animate({ scrollTop: $(\"body\").offset().top }, 500);", true);
            }


        }
        protected void btnstep3_Clicked(object sender, EventArgs e)
        {
            if (Session["paymenttransaction"].ToString() != "1")
            {
                pnlunit.Visible = false;
                pnlcostsheet.Visible = false;
                pnlschedule.Visible = true;
                pnlbookingform.Visible = false;
                pnlpay.Visible = false;
                pnlstep1.Visible = false;
                pnlstep2.Visible = false;
                pnlstep3.Visible = true;
                pnlstep4.Visible = false;
                pnlconfirmdoc.Visible = false;
                pnlstep5.Visible = false;
                // divrightbooking.Attributes["style"] = "display:none;";
                divapply.Attributes["style"] = "display:none;";
                divright.Attributes["style"] = "display:none;";
                divbottom.Attributes["style"] = "display:none;";
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "scrolltopevent", " $('html, body').animate({ scrollTop: $(\"body\").offset().top }, 500);", true);
            }
        }
        protected void btnstep4_Clicked(object sender, EventArgs e)
        {
            if (Session["paymenttransaction"].ToString() != "1")
            {
                pnlunit.Visible = false;
                pnlcostsheet.Visible = false;
                pnlschedule.Visible = false;
                pnlbookingform.Visible = true;
                pnlpay.Visible = false;
                pnlstep1.Visible = false;
                pnlstep2.Visible = false;
                pnlstep3.Visible = false;
                pnlstep4.Visible = true;
                pnlstep5.Visible = false;
                pnlconfirmdoc.Visible = false;
                // divrightbooking.Attributes["style"] = "display:none;";
                divapply.Attributes["style"] = "display:none;";
                divright.Attributes["style"] = "display:none;";
                divbottom.Attributes["style"] = "display:none;";
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "scrolltopevent", " $('html, body').animate({ scrollTop: $(\"body\").offset().top }, 500);", true);
            }
        }
        protected void btnstep5_Clicked(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "scrolltopevent", " $('html, body').animate({ scrollTop: $(\"body\").offset().top }, 500);", true);

        }
        protected void lnkcancelright_Clicked(object sender, EventArgs e)
        {
            divright.Attributes["style"] = "display:none;";

        }
        protected void lnkcancelbottom_Clicked(object sender, EventArgs e)
        {
            divbottom.Attributes["style"] = "display:none;";

        }
        //protected void btnunitbottom_Clicked(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        if (con.State != ConnectionState.Open)
        //        {
        //            con.Open();
        //        }
        //        //if (ddunitvalue.SelectedValue != "0")
        //        //{
        //            LinkButton lnkcardclick = (LinkButton)sender;
        //            //ScriptManager.RegisterStartupScript(this, GetType(), "popoverscript", "$('#" + lnkcardclick.ClientID + "').popover({ html: true, content: $('#displaypop'), container: 'body', trigger: 'focus', placement: 'left'});", true);
        //            //ScriptManager.RegisterStartupScript(this, GetType(), "show", "$('#" + lnkcardclick.ClientID + "').popover('show');", true);


        //            var rptitem = (RepeaterItem)lnkcardclick.NamingContainer;
        //            Panel popupid = (Panel)rptitem.FindControl("pnlpopup");
        //            Label lblpopunit = (Label)rptitem.FindControl("lblpopunit");
        //            Label lblpoparea = (Label)rptitem.FindControl("lblpoparea");
        //            Label lblpopcarpet = (Label)rptitem.FindControl("lblpopcarpet");
        //            Label lblpopunittype = (Label)rptitem.FindControl("lblpopunittype");


        //            LinkButton lnkbtn = (LinkButton)rptitem.FindControl("btnunit");

        //            Label lblpopbase = (Label)rptitem.FindControl("lblpopbase");
        //            Label lblpopfacing = (Label)rptitem.FindControl("lblpopfacing");



        //            foreach (RepeaterItem item in rptfloor.Items)
        //            {
        //                var rptunit = (Repeater)item.FindControl("rptunit");
        //                foreach (RepeaterItem item1 in rptunit.Items)
        //                {
        //                    Panel pnlid = (Panel)item1.FindControl("pnlpopup");
        //                    LinkButton lnkbtnid = (LinkButton)item1.FindControl("btnunit");
        //                    if (rptitem != item1 && popupid != pnlid)
        //                    {
        //                        pnlid.Visible = false;


        //                                //lnkbtnid.Attributes["style"] = "border-color: " + lnkbtnid.CommandName + " !important ";
        //                    }
        //                }
        //            }

        //            // #424b57

        //            SqlCommand cmd424s = new SqlCommand("select c.id as towerid,pc.configname as unit, c.name as config,pc.carpetarea,f.printname as floorname,isnull(pc.drybalcony,0) as drybalcony,pc.enclosedbalcony,REPLACE(CONVERT(VARCHAR, CONVERT(MONEY, pc.agreementvalue), 1), '.00', '') as agreementvalue, (pc.configname + ' - ' + c.name) as unitname,pc.statusid,pc.builduparea,REPLACE(CONVERT(VARCHAR, CONVERT(MONEY, pc.totalprice), 1), '.00', '') as totalprice,pc.statusid,pc.carpetarea from  propertylistconfig as pc left outer join propertyunitmaster as c on c.id=pc.unittype left outer join floormaster as f on f.id=pc.floorid  where pc.id=@unitid  ", con);
        //            cmd424s.Parameters.AddWithValue("@unitid", lnkcardclick.CommandArgument);
        //            SqlDataAdapter da24s = new SqlDataAdapter(cmd424s);
        //            // DataSet ds = new DataSet();
        //            DataTable dt24s = new DataTable();
        //            //da24s.Fill(ds);
        //            da24s.Fill(dt24s);

        //            SqlCommand cmd341 = new SqlCommand("select unitdeatails from customerbookingunit where customerid=@customerid", con);
        //            cmd341.Parameters.AddWithValue("@customerid", Session["customerid"].ToString());
        //            SqlDataAdapter da341 = new SqlDataAdapter(cmd341);
        //            DataTable dt341 = new DataTable();
        //            da341.Fill(dt341);

        //            if (dt341.Rows.Count == 0)
        //            {
        //                SqlCommand cmd233 = new SqlCommand("insert into customerbookingunit (unitdeatails,customerid) values (@unitdeatails,@customerid)", con);
        //                cmd233.Parameters.AddWithValue("@unitdeatails", lnkcardclick.CommandArgument);
        //                cmd233.Parameters.AddWithValue("@customerid", Session["customerid"].ToString());
        //                cmd233.ExecuteNonQuery();
        //                lnkbtn.Attributes["style"] = "border:none;background : #8A8A8A  !important ";
        //            }
        //            else
        //            {

        //            if (dt341.Rows[0]["unitdeatails"].ToString() == lnkcardclick.CommandArgument)
        //            {
        //                SqlCommand cmd2343 = new SqlCommand("delete unitdeatails from customerbookingunit where  unitdeatails=" + lnkcardclick.CommandArgument + "and customerid=@customerid ", con);
        //                cmd2343.Parameters.AddWithValue("@customerid", Session["customerid"].ToString());
        //                cmd2343.ExecuteNonQuery();
        //                lnkbtn.Attributes["style"] = "border:#8A8A8A !important ;background : #fff  !important ";
        //            }
        //            else
        //            {
        //                //SqlCommand cmd2345 = new SqlCommand("select count(*) from customerbookingunit where customerid=@customerid", con);
        //                //cmd2345.Parameters.AddWithValue("@customerid", Session["customerid"].ToString());
        //                ////SqlDataAdapter da234d = new SqlDataAdapter(cmd234d);
        //                ////DataTable dt234d = new DataTable();
        //                ////da234d.Fill(dt234d);
        //                //int count4 = (int)cmd2345.ExecuteScalar();

        //                //int num4 = count4;
        //                //Session["idcountf"] = num4;
        //                //lnkbtn.Attributes["style"] = "border:none;background : #8A8A8A  !important ";

        //                //int value12 = Convert.ToInt32(Session["idcountf"].ToString());
        //                //int value22 = Convert.ToInt32(Session["unitcount"].ToString());

        //                //if (value12 <= value22)
        //                //{
        //                SqlCommand cmd233s2 = new SqlCommand("insert into customerbookingunit (unitdeatails,customerid) values (@unitdeatails,@customerid)", con);
        //                cmd233s2.Parameters.AddWithValue("@unitdeatails", lnkcardclick.CommandArgument);
        //                cmd233s2.Parameters.AddWithValue("@customerid", Session["customerid"].ToString());
        //                cmd233s2.ExecuteNonQuery();
        //                lnkbtn.Attributes["style"] = "border:none;background : #8B7500  !important ";

        //                SqlCommand cmd234s = new SqlCommand("select unitdeatails from customerbookingunit where customerid=@customerid", con);
        //                cmd234s.Parameters.AddWithValue("@customerid", Session["customerid"].ToString());
        //                //cmd234s.Parameters.AddWithValue("@unitdetails");
        //                SqlDataAdapter da234s = new SqlDataAdapter(cmd234s);
        //                DataTable dt234s = new DataTable();
        //                da234s.Fill(dt234s);
        //                lblunitinfo.Visible = true;

        //                lblunitinfo.Text = dt234s.Rows[0]["unitdeatails"].ToString() + ',' ;







        //                //SqlCommand cmd234d = new SqlCommand("select count(*) from customerbookingunit where customerid=@customerid", con);
        //                //cmd234d.Parameters.AddWithValue("@customerid", Session["customerid"].ToString());
        //                ////SqlDataAdapter da234d = new SqlDataAdapter(cmd234d);
        //                ////DataTable dt234d = new DataTable();
        //                ////da234d.Fill(dt234d);
        //                //int count = (int)cmd234d.ExecuteScalar();

        //                //int num = count;
        //                //Session["idcount"] = num;
        //                ////lnkbtn.Attributes["style"] = "border:none;background : #424b57  !important ";

        //                //int value1 = Convert.ToInt32(Session["idcount"].ToString());
        //                //int value2 = Convert.ToInt32(Session["unitcount"].ToString());

        //                //if (value1 > value2)
        //                //{
        //                //    SqlCommand cmd2343 = new SqlCommand("delete top (1) from customerbookingunit where customerid=@customerid", con);
        //                //    cmd2343.Parameters.AddWithValue("@customerid", Session["customerid"].ToString());
        //                //    cmd2343.ExecuteNonQuery();
        //                //    lnkbtn.Attributes["style"] = "border:#8A8A8A !important ;background : #fff  !important ";
        //                //    //lnkbtn.Attributes["style"] = "border:none;background : #8B7500  !important ";


        //                //    //lnkbtnid.Attributes["style"] = "border-color: " + lnkbtnid.CommandName + " !important ";
        //                //}
        //                //else
        //                //{

        //                //}
        //            }



        //        }



        //            //SqlCommand cmd234d1 = new SqlCommand("select count(*) from customerbookingunit where customerid=@customerid", con);
        //            //cmd234d1.Parameters.AddWithValue("@customerid", Session["customerid"].ToString());
        //            ////SqlDataAdapter da234d1 = new SqlDataAdapter(cmd234d1);
        //            ////DataTable dt234d1 = new DataTable();
        //            ////da234d1.Fill(dt234d1);
        //            //int count2 = (int)cmd234d1.ExecuteScalar();

        //            //int finalnum = count2;
        //            //Session["idcount3"] = finalnum;

        //            //if(Session["idcount3"].ToString() == Session["unitcount"].ToString())

        //            //{
        //            //    LinkButton15.Visible = true;
        //            //}
        //            //else
        //            //{
        //            //    LinkButton15.Visible = false;
        //            //}
        //            if (dt24s.Rows.Count > 0)
        //            {
        //                if (dt24s.Rows[0]["statusid"].ToString() == "2" || dt24s.Rows[0]["statusid"].ToString() == "3" || dt24s.Rows[0]["statusid"].ToString() == "4" || dt24s.Rows[0]["statusid"].ToString() == "5")
        //                {
        //                }
        //                else
        //                {


        //                    if (popupid.Visible == true)
        //                    {
        //                        popupid.Visible = false;
        //                        lnkbtn.Attributes["style"] = "border-color: " + lnkbtn.CommandName + " !important ";

        //                    }
        //                    else
        //                    {
        //                        popupid.Visible = true;
        //                        //lnkbtn.Attributes["style"] = "border:none;background : #424b57" + lnkbtn.CommandName +   "!important ";

        //                    }
        //                    lblpoparea.Text = dt24s.Rows[0]["builduparea"].ToString();
        //                    lblpopunit.Text = dt24s.Rows[0]["unit"].ToString();
        //                    lblpopcarpet.Text = dt24s.Rows[0]["carpetarea"].ToString();
        //                    lblpopunittype.Text = dt24s.Rows[0]["config"].ToString();
        //                    Session["unittype"] = dt24s.Rows[0]["towerid"].ToString();

        //                    lblrightunit.Text = dt24s.Rows[0]["unit"].ToString() + " - " + dt24s.Rows[0]["config"].ToString();
        //                    lblbuildingtype.Text = dt24s.Rows[0]["config"].ToString() + " - " + dt24s.Rows[0]["floorname"].ToString();
        //                    lblunit.Text = lblpopunit.Text;



        //                    //lblbottomarea.Text = dt24s.Rows[0]["carpetarea"].ToString();
        //                    //lblbottomprice.Text = dt24s.Rows[0]["totalprice"].ToString();
        //                    //lblbottomunit.Text = dt24s.Rows[0]["unitname"].ToString();
        //                    //lblbottomarea.Text = String.Format("{0:0.00}", (float.Parse(dt24s.Rows[0]["carpetarea"].ToString()) + float.Parse(dt24s.Rows[0]["drybalcony"].ToString())));
        //                    // lblbottomfacing.Text = dt24s.Rows[0]["facing"].ToString();



        //                    //lblpopfacing.Text = dt24s.Rows[0]["facing"].ToString();
        //                    //lblpopunit.Text = dt24s.Rows[0]["unit"].ToString();
        //                    //lblrightagreement.Text = dt24s.Rows[0]["agreementvalue"].ToString();
        //                    //lblrightbalcony.Text = dt24s.Rows[0]["drybalcony"].ToString();
        //                    //lblrightcarpet.Text = dt24s.Rows[0]["carpetarea"].ToString();
        //                    lblrightconfig.Text = ddtower.SelectedItem.Text;
        //                    //lblrightenclosed.Text = dt24s.Rows[0]["enclosedbalcony"].ToString();
        //                    //lblrightprice.Text = dt24s.Rows[0]["totalprice"].ToString();
        //                    lblrightunit.Text = dt24s.Rows[0]["unit"].ToString() + " - " + dt24s.Rows[0]["config"].ToString();

        //                    lnkbottombook.CommandArgument = lnkcardclick.CommandArgument;


        //                    //lnkcardclick.CommandArgument = int array[];

        //                    //txtseatnumber.Text = (Convert.ToInt32(txtseatnumber.Text) + 1).ToString();

        //                    //ViewState["count"] = Convert.ToInt32(ViewState["count"]) + 1;
        //                    //Label1.Text = ViewState["count"].ToString();

        //                    //lnkbottombook.CommandName = dt24s.Rows[0]["configid"].ToString();


        //                }

        //                if (dt24s.Rows[0]["statusid"].ToString() == "1")
        //                {
        //                    lnkrightbook.Visible = true;
        //                }
        //                else
        //                {
        //                    lnkrightbook.Visible = false;
        //                }
        //                divbottom.Attributes["style"] = "display:block;";
        //                //lnkbtn.Attributes["style"] = "background-color: blue" + lnkbtn.CommandName + " !important ";
        //                // }

        //                //
        //            }



        //        //}
        //        //else
        //        //{
        //        //    //ddunitvalue.CssClass = "form-control select2_single border101 width135 marginleftauto colorred";
        //        //    lblmsg.Visible = true;
        //        //    lblmsg.Text = "Please select Number of units";
        //        //}
        //    }
        //    catch (Exception ex)
        //    {
        //    }
        //    finally
        //    {
        //        if (con.State == ConnectionState.Open)
        //        {
        //            con.Close();
        //        }
        //    }
        //}

        //protected void btnunitbottom_Clicked(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        if (con.State != ConnectionState.Open)
        //        {
        //            con.Open();
        //        }
        //        if (ddunitvalue.SelectedValue != "0")
        //        {
        //            LinkButton lnkcardclick = (LinkButton)sender;
        //            //ScriptManager.RegisterStartupScript(this, GetType(), "popoverscript", "$('#" + lnkcardclick.ClientID + "').popover({ html: true, content: $('#displaypop'), container: 'body', trigger: 'focus', placement: 'left'});", true);
        //            //ScriptManager.RegisterStartupScript(this, GetType(), "show", "$('#" + lnkcardclick.ClientID + "').popover('show');", true);


        //            var rptitem = (RepeaterItem)lnkcardclick.NamingContainer;
        //            Panel popupid = (Panel)rptitem.FindControl("pnlpopup");
        //            Label lblpopunit = (Label)rptitem.FindControl("lblpopunit");
        //            Label lblpoparea = (Label)rptitem.FindControl("lblpoparea");
        //            Label lblpopcarpet = (Label)rptitem.FindControl("lblpopcarpet");
        //            Label lblpopunittype = (Label)rptitem.FindControl("lblpopunittype");


        //            LinkButton lnkbtn = (LinkButton)rptitem.FindControl("btnunit");

        //            Label lblpopbase = (Label)rptitem.FindControl("lblpopbase");
        //            Label lblpopfacing = (Label)rptitem.FindControl("lblpopfacing");



        //            foreach (RepeaterItem item in rptfloor.Items)
        //            {
        //                var rptunit = (Repeater)item.FindControl("rptunit");
        //                foreach (RepeaterItem item1 in rptunit.Items)
        //                {
        //                    Panel pnlid = (Panel)item1.FindControl("pnlpopup");
        //                    LinkButton lnkbtnid = (LinkButton)item1.FindControl("btnunit");
        //                    if (rptitem != item1 && popupid != pnlid)
        //                    {
        //                        pnlid.Visible = false;
        //                        //lnkbtnid.Attributes["style"] = "border-color: " + lnkbtnid.CommandName + " !important ";
        //                    }
        //                }
        //            }

        //            // #424b57

        //            SqlCommand cmd424s = new SqlCommand("select c.id as towerid,pc.configname as unit, c.name as config,pc.carpetarea,f.printname as floorname,isnull(pc.drybalcony,0) as drybalcony,pc.enclosedbalcony,REPLACE(CONVERT(VARCHAR, CONVERT(MONEY, pc.agreementvalue), 1), '.00', '') as agreementvalue, (pc.configname + ' - ' + c.name) as unitname,pc.statusid,pc.builduparea,REPLACE(CONVERT(VARCHAR, CONVERT(MONEY, pc.totalprice), 1), '.00', '') as totalprice,pc.statusid,pc.carpetarea from  propertylistconfig as pc left outer join propertyunitmaster as c on c.id=pc.unittype left outer join floormaster as f on f.id=pc.floorid  where pc.id=@unitid  ", con);
        //            cmd424s.Parameters.AddWithValue("@unitid", lnkcardclick.CommandArgument);
        //            SqlDataAdapter da24s = new SqlDataAdapter(cmd424s);
        //            // DataSet ds = new DataSet();
        //            DataTable dt24s = new DataTable();
        //            //da24s.Fill(ds);
        //            da24s.Fill(dt24s);

        //            SqlCommand cmd341 = new SqlCommand("select unitdeatails from customerbooking where customerid=@customerid", con);
        //            cmd341.Parameters.AddWithValue("@customerid", Session["customerid"].ToString());
        //            SqlDataAdapter da341 = new SqlDataAdapter(cmd341);
        //            DataTable dt341 = new DataTable();
        //            da341.Fill(dt341);

        //            if (dt341.Rows.Count == 0)
        //            {
        //                SqlCommand cmd233 = new SqlCommand("insert into customerbooking (unitdeatails,customerid) values (@unitdeatails,@customerid)", con);
        //                cmd233.Parameters.AddWithValue("@unitdeatails", lnkcardclick.CommandArgument);
        //                cmd233.Parameters.AddWithValue("@customerid", Session["customerid"].ToString());
        //                cmd233.ExecuteNonQuery();

        //            }
        //            else
        //            {


        //                string unit = dt341.Rows[0]["unitdeatails"].ToString();
        //                //string [] unitid= dt341.Rows[0]["unit"].ToString();

        //                if (unit == "")
        //                {
        //                    SqlCommand cmd233 = new SqlCommand("update customerbooking set unitdeatails=@unitdeatails where customerid=@customerid", con);
        //                    cmd233.Parameters.AddWithValue("@unitdeatails", lnkcardclick.CommandArgument);
        //                    cmd233.Parameters.AddWithValue("@customerid", Session["customerid"].ToString());
        //                    cmd233.ExecuteNonQuery();

        //                }
        //                else
        //                {


        //                    if (dt341.Rows[0]["unitdeatails"].ToString() == lnkcardclick.CommandArgument)
        //                    {
        //                        //
        //                    }
        //                    else
        //                    {
        //                        int value1 = Convert.ToInt32(Session["unitid"].ToString());
        //                        int value2 = Convert.ToInt32(Session["unitcount"].ToString());

        //                        if (value1 < value2)
        //                        {
        //                            SqlCommand cmd233 = new SqlCommand("update customerbooking set unitdeatails=@unitdeatails where customerid=@customerid", con);
        //                            cmd233.Parameters.AddWithValue("@unitdeatails", dt341.Rows[0]["unitdeatails"].ToString() + "," + lnkcardclick.CommandArgument);
        //                            cmd233.Parameters.AddWithValue("@customerid", Session["customerid"].ToString());
        //                            cmd233.ExecuteNonQuery();
        //                            lnkbtn.Attributes["style"] = "border:none;background : #424b57  !important ";
        //                        }
        //                        else
        //                        {
        //                            //SqlCommand cmd233 = new SqlCommand("update customerbooking set unitdeatails=@unitdeatails where customerid=@customerid", con);
        //                            //cmd233.Parameters.AddWithValue("@unitdeatails", dt341.Rows[0]["unitdeatails"].ToString() + "," + lnkcardclick.CommandArgument);
        //                            //cmd233.Parameters.AddWithValue("@customerid", Session["customerid"].ToString());
        //                            //cmd233.ExecuteNonQuery();
        //                            popupid.Visible = false;
        //                            lnkbtn.Attributes["style"] = "border-color: " + lnkbtn.CommandName + " !important ";

        //                            //lnkbtn.Attributes["style"] = "border-color: #000000;background :none !important ";
        //                        }

        //                    }
        //                }

        //                SqlCommand cmd234 = new SqlCommand("select * from customerbooking where customerid=@customerid", con);

        //                cmd234.Parameters.AddWithValue("@customerid", Session["customerid"].ToString());
        //                SqlDataAdapter da234 = new SqlDataAdapter(cmd234);
        //                DataTable dt234 = new DataTable();
        //                da341.Fill(dt234);
        //                string[] unitid = dt234.Rows[0]["unitdeatails"].ToString().Split(',');
        //                Session["unitid"] = unitid.Length;
        //                int countone = Convert.ToInt32(Session["unitid"].ToString());
        //                int valuecount = Convert.ToInt32(ddunitvalue.SelectedValue);
        //                //new changes
        //                //if ( countone > valuecount)
        //                //{
        //                //        unitid = unitid.Take(unitid.Length - 1).ToArray();
        //                //        Session["currentvalue"] = unitid.Length;


        //                //        SqlCommand cmd2341 = new SqlCommand("select * from customerbooking where customerid=@customerid", con);
        //                //        cmd234.Parameters.AddWithValue("@customerid", Session["customerid"].ToString());
        //                //        SqlDataAdapter da2341 = new SqlDataAdapter(cmd2341);
        //                //        DataTable dt2341 = new DataTable();
        //                //        da341.Fill(dt2341);



        //                //    }
        //                if (valuecount == countone)
        //                {
        //                    LinkButton15.Visible = true;
        //                }
        //                else
        //                {

        //                    //unitid = unitid.Take(unitid.Length - 1).ToArray();
        //                    LinkButton15.Visible = false;
        //                }
        //            }

        //            //string[] unitid = dt341.Rows[0]["unitdeatails"].ToString().Split(',');
        //            //Session["unitid"] = unitid.Length;



        //            //int rows = ds.Tables[0].Rows.Count;
        //            //int i = 0;
        //            //while (i < rows)
        //            //{
        //            //    string status;
        //            //    status = ds.Tables[0].Rows[i]["unitid"].ToString();
        //            //    {
        //            //        if (status != "0")
        //            //        {
        //            //            lnkbtn.Attributes["style"] = "background:#ffc107" + lnkcardclick.CommandArgument + " !important ";
        //            //        }
        //            //    }
        //            //}

        //            if (dt24s.Rows.Count > 0)
        //            {
        //                if (dt24s.Rows[0]["statusid"].ToString() == "2" || dt24s.Rows[0]["statusid"].ToString() == "3" || dt24s.Rows[0]["statusid"].ToString() == "4" || dt24s.Rows[0]["statusid"].ToString() == "5")
        //                {
        //                }
        //                else
        //                {

        //                    if (popupid.Visible == true)
        //                    {
        //                        popupid.Visible = false;
        //                        lnkbtn.Attributes["style"] = "border-color: " + lnkbtn.CommandName + " !important ";

        //                    }
        //                    else
        //                    {
        //                        popupid.Visible = true;
        //                        lnkbtn.Attributes["style"] = "border:none;background : #424b57  !important ";

        //                    }
        //                    lblpoparea.Text = dt24s.Rows[0]["builduparea"].ToString();
        //                    lblpopunit.Text = dt24s.Rows[0]["unit"].ToString();
        //                    lblpopcarpet.Text = dt24s.Rows[0]["carpetarea"].ToString();
        //                    lblpopunittype.Text = dt24s.Rows[0]["config"].ToString();
        //                    Session["unittype"] = dt24s.Rows[0]["towerid"].ToString();

        //                    lblrightunit.Text = dt24s.Rows[0]["unit"].ToString() + " - " + dt24s.Rows[0]["config"].ToString();
        //                    lblbuildingtype.Text = dt24s.Rows[0]["config"].ToString() + " - " + dt24s.Rows[0]["floorname"].ToString();
        //                    lblunit.Text = lblpopunit.Text;



        //                    //lblbottomarea.Text = dt24s.Rows[0]["carpetarea"].ToString();
        //                    //lblbottomprice.Text = dt24s.Rows[0]["totalprice"].ToString();
        //                    //lblbottomunit.Text = dt24s.Rows[0]["unitname"].ToString();
        //                    //lblbottomarea.Text = String.Format("{0:0.00}", (float.Parse(dt24s.Rows[0]["carpetarea"].ToString()) + float.Parse(dt24s.Rows[0]["drybalcony"].ToString())));
        //                    // lblbottomfacing.Text = dt24s.Rows[0]["facing"].ToString();



        //                    //lblpopfacing.Text = dt24s.Rows[0]["facing"].ToString();
        //                    //lblpopunit.Text = dt24s.Rows[0]["unit"].ToString();
        //                    //lblrightagreement.Text = dt24s.Rows[0]["agreementvalue"].ToString();
        //                    //lblrightbalcony.Text = dt24s.Rows[0]["drybalcony"].ToString();
        //                    //lblrightcarpet.Text = dt24s.Rows[0]["carpetarea"].ToString();
        //                    lblrightconfig.Text = ddtower.SelectedItem.Text;
        //                    //lblrightenclosed.Text = dt24s.Rows[0]["enclosedbalcony"].ToString();
        //                    //lblrightprice.Text = dt24s.Rows[0]["totalprice"].ToString();
        //                    lblrightunit.Text = dt24s.Rows[0]["unit"].ToString() + " - " + dt24s.Rows[0]["config"].ToString();

        //                    lnkbottombook.CommandArgument = lnkcardclick.CommandArgument;


        //                    //lnkcardclick.CommandArgument = int array[];

        //                    //txtseatnumber.Text = (Convert.ToInt32(txtseatnumber.Text) + 1).ToString();

        //                    //ViewState["count"] = Convert.ToInt32(ViewState["count"]) + 1;
        //                    //Label1.Text = ViewState["count"].ToString();

        //                    //lnkbottombook.CommandName = dt24s.Rows[0]["configid"].ToString();


        //                }

        //                if (dt24s.Rows[0]["statusid"].ToString() == "1")
        //                {
        //                    lnkrightbook.Visible = true;
        //                }
        //                else
        //                {
        //                    lnkrightbook.Visible = false;
        //                }
        //                divbottom.Attributes["style"] = "display:block;";
        //                //lnkbtn.Attributes["style"] = "background-color: blue" + lnkbtn.CommandName + " !important ";
        //                // }

        //                //
        //            }



        //        }
        //        else
        //        {
        //            lblmsg.Visible = true;
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //    }
        //    finally
        //    {
        //        if (con.State == ConnectionState.Open)
        //        {
        //            con.Close();
        //        }
        //    }
        //}

        protected void btnunitbottom_Clicked(object sender, EventArgs e)
        {
            try
            {
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                if (ddunitvalue.SelectedValue != "0")
                {
                    LinkButton lnkcardclick = (LinkButton)sender;
                    //ScriptManager.RegisterStartupScript(this, GetType(), "popoverscript", "$('#" + lnkcardclick.ClientID + "').popover({ html: true, content: $('#displaypop'), container: 'body', trigger: 'focus', placement: 'left'});", true);
                    //ScriptManager.RegisterStartupScript(this, GetType(), "show", "$('#" + lnkcardclick.ClientID + "').popover('show');", true);


                    var rptitem = (RepeaterItem)lnkcardclick.NamingContainer;
                    Panel popupid = (Panel)rptitem.FindControl("pnlpopup");
                    Label lblpopunit = (Label)rptitem.FindControl("lblpopunit");
                    Label lblpoparea = (Label)rptitem.FindControl("lblpoparea");
                    Label lblpopcarpet = (Label)rptitem.FindControl("lblpopcarpet");
                    Label lblpopunittype = (Label)rptitem.FindControl("lblpopunittype");


                    LinkButton lnkbtn = (LinkButton)rptitem.FindControl("btnunit");

                    Label lblpopbase = (Label)rptitem.FindControl("lblpopbase");
                    Label lblpopfacing = (Label)rptitem.FindControl("lblpopfacing");



                    foreach (RepeaterItem item in rptfloor.Items)
                    {
                        var rptunit = (Repeater)item.FindControl("rptunit");
                        foreach (RepeaterItem item1 in rptunit.Items)
                        {
                            Panel pnlid = (Panel)item1.FindControl("pnlpopup");
                            LinkButton lnkbtnid = (LinkButton)item1.FindControl("btnunit");
                            if (rptitem != item1 && popupid != pnlid)
                            {
                                pnlid.Visible = false;
                                //lnkbtnid.Attributes["style"] = "border-color: " + lnkbtnid.CommandName + " !important ";
                            }
                        }
                    }

                    // #424b57

                    SqlCommand cmd424s = new SqlCommand("select c.id as towerid,pc.configname as unit, c.name as config,pc.carpetarea,f.printname as floorname,isnull(pc.drybalcony,0) as drybalcony,pc.enclosedbalcony,REPLACE(CONVERT(VARCHAR, CONVERT(MONEY, pc.agreementvalue), 1), '.00', '') as agreementvalue, (pc.configname + ' - ' + c.name) as unitname,pc.statusid,pc.builduparea,REPLACE(CONVERT(VARCHAR, CONVERT(MONEY, pc.totalprice), 1), '.00', '') as totalprice,pc.statusid,pc.carpetarea from  propertylistconfig as pc left outer join propertyunitmaster as c on c.id=pc.unittype left outer join floormaster as f on f.id=pc.floorid  where pc.id=@unitid  ", con);
                    cmd424s.Parameters.AddWithValue("@unitid", lnkcardclick.CommandArgument);
                    SqlDataAdapter da24s = new SqlDataAdapter(cmd424s);
                    // DataSet ds = new DataSet();
                    DataTable dt24s = new DataTable();
                    //da24s.Fill(ds);
                    da24s.Fill(dt24s);

                    SqlCommand cmd341 = new SqlCommand("select unitdeatails from customerbooking where customerid=@customerid", con);
                    cmd341.Parameters.AddWithValue("@customerid", Session["customerid"].ToString());
                    SqlDataAdapter da341 = new SqlDataAdapter(cmd341);
                    DataTable dt341 = new DataTable();
                    da341.Fill(dt341);

                    if (dt341.Rows.Count == 0)
                    {
                        SqlCommand cmd233 = new SqlCommand("insert into customerbooking (unitdeatails,customerid) values (@unitdeatails,@customerid)", con);
                        cmd233.Parameters.AddWithValue("@unitdeatails", lnkcardclick.CommandArgument);
                        cmd233.Parameters.AddWithValue("@customerid", Session["customerid"].ToString());
                        cmd233.ExecuteNonQuery();
                        lnkbtn.Attributes["style"] = "border:none;background : #424b57  !important ";

                    }
                    else
                    {


                        string unit = dt341.Rows[0]["unitdeatails"].ToString();
                        //string [] unitid= dt341.Rows[0]["unit"].ToString();

                        if (unit == "")
                        {
                            SqlCommand cmd233 = new SqlCommand("update customerbooking set unitdeatails=@unitdeatails where customerid=@customerid", con);
                            cmd233.Parameters.AddWithValue("@unitdeatails", lnkcardclick.CommandArgument);
                            cmd233.Parameters.AddWithValue("@customerid", Session["customerid"].ToString());
                            cmd233.ExecuteNonQuery();
                            lnkbtn.Attributes["style"] = "border:none;background : #424b57  !important ";
                        }
                        else
                        {


                            if (dt341.Rows[0]["unitdeatails"].ToString() == lnkcardclick.CommandArgument)
                            {
                                //
                            }
                            else
                            {
                                int value1 = Convert.ToInt32(Session["unitid"].ToString());
                                int value2 = Convert.ToInt32(Session["unitcount"].ToString());

                                if (value1 < value2)
                                {
                                    SqlCommand cmd233 = new SqlCommand("update customerbooking set unitdeatails=@unitdeatails where customerid=@customerid", con);
                                    cmd233.Parameters.AddWithValue("@unitdeatails", dt341.Rows[0]["unitdeatails"].ToString() + "," + lnkcardclick.CommandArgument);
                                    cmd233.Parameters.AddWithValue("@customerid", Session["customerid"].ToString());
                                    cmd233.ExecuteNonQuery();
                                    lnkbtn.Attributes["style"] = "border:none;background : #424b57  !important ";
                                }
                                else
                                {
                                    //SqlCommand cmd233 = new SqlCommand("update customerbooking set unitdeatails=@unitdeatails where customerid=@customerid", con);
                                    //cmd233.Parameters.AddWithValue("@unitdeatails", dt341.Rows[0]["unitdeatails"].ToString() + "," + lnkcardclick.CommandArgument);
                                    //cmd233.Parameters.AddWithValue("@customerid", Session["customerid"].ToString());
                                    //cmd233.ExecuteNonQuery();
                                    popupid.Visible = false;
                                    lnkbtn.Attributes["style"] = "border-color: " + lnkbtn.CommandName + " !important ";
                                }

                            }
                        }

                        SqlCommand cmd234 = new SqlCommand("select * from customerbooking where customerid=@customerid", con);

                        cmd234.Parameters.AddWithValue("@customerid", Session["customerid"].ToString());
                        SqlDataAdapter da234 = new SqlDataAdapter(cmd234);
                        DataTable dt234 = new DataTable();
                        da341.Fill(dt234);
                        string[] unitid = dt234.Rows[0]["unitdeatails"].ToString().Split(',');
                        Session["unitid"] = unitid.Length;
                        int countone = Convert.ToInt32(Session["unitid"].ToString());
                        int valuecount = Convert.ToInt32(ddunitvalue.SelectedValue);
                        
                        //new changes
                        //if ( countone > valuecount)
                        //{
                        //        unitid = unitid.Take(unitid.Length - 1).ToArray();
                        //        Session["currentvalue"] = unitid.Length;


                        //        SqlCommand cmd2341 = new SqlCommand("select * from customerbooking where customerid=@customerid", con);
                        //        cmd234.Parameters.AddWithValue("@customerid", Session["customerid"].ToString());
                        //        SqlDataAdapter da2341 = new SqlDataAdapter(cmd2341);
                        //        DataTable dt2341 = new DataTable();
                        //        da341.Fill(dt2341);



                        //    }
                        if (valuecount == countone)
                        {
                            LinkButton15.Visible = true;
                        }
                        else
                        {

                            //unitid = unitid.Take(unitid.Length - 1).ToArray();
                            LinkButton15.Visible = false;
                        }
                    }

                    //string[] unitid = dt341.Rows[0]["unitdeatails"].ToString().Split(',');
                    //Session["unitid"] = unitid.Length;



                    //int rows = ds.Tables[0].Rows.Count;
                    //int i = 0;
                    //while (i < rows)
                    //{
                    //    string status;
                    //    status = ds.Tables[0].Rows[i]["unitid"].ToString();
                    //    {
                    //        if (status != "0")
                    //        {
                    //            lnkbtn.Attributes["style"] = "background:#ffc107" + lnkcardclick.CommandArgument + " !important ";
                    //        }
                    //    }
                    //}

                    if (dt24s.Rows.Count > 0)
                    {
                        if (dt24s.Rows[0]["statusid"].ToString() == "2" || dt24s.Rows[0]["statusid"].ToString() == "3" || dt24s.Rows[0]["statusid"].ToString() == "4" || dt24s.Rows[0]["statusid"].ToString() == "5")
                        {
                        }
                        else
                        {

                            if (popupid.Visible == true)
                            {
                                popupid.Visible = false;
                                lnkbtn.Attributes["style"] = "border-color: " + lnkbtn.CommandName + " !important ";

                            }
                            else
                            {
                                popupid.Visible = true;
                                //lnkbtn.Attributes["style"] = "border:none;background : #424b57  !important ";

                            }
                            lblpoparea.Text = dt24s.Rows[0]["builduparea"].ToString();
                            lblpopunit.Text = dt24s.Rows[0]["unit"].ToString();
                            lblpopcarpet.Text = dt24s.Rows[0]["carpetarea"].ToString();
                            lblpopunittype.Text = dt24s.Rows[0]["config"].ToString();
                            Session["unittype"] = dt24s.Rows[0]["towerid"].ToString();

                            lblrightunit.Text = dt24s.Rows[0]["unit"].ToString() + " - " + dt24s.Rows[0]["config"].ToString();
                            lblbuildingtype.Text = dt24s.Rows[0]["config"].ToString() + " - " + dt24s.Rows[0]["floorname"].ToString();
                            lblunit.Text = lblpopunit.Text;



                            //lblbottomarea.Text = dt24s.Rows[0]["carpetarea"].ToString();
                            //lblbottomprice.Text = dt24s.Rows[0]["totalprice"].ToString();
                            //lblbottomunit.Text = dt24s.Rows[0]["unitname"].ToString();
                            //lblbottomarea.Text = String.Format("{0:0.00}", (float.Parse(dt24s.Rows[0]["carpetarea"].ToString()) + float.Parse(dt24s.Rows[0]["drybalcony"].ToString())));
                            // lblbottomfacing.Text = dt24s.Rows[0]["facing"].ToString();



                            //lblpopfacing.Text = dt24s.Rows[0]["facing"].ToString();
                            //lblpopunit.Text = dt24s.Rows[0]["unit"].ToString();
                            //lblrightagreement.Text = dt24s.Rows[0]["agreementvalue"].ToString();
                            //lblrightbalcony.Text = dt24s.Rows[0]["drybalcony"].ToString();
                            //lblrightcarpet.Text = dt24s.Rows[0]["carpetarea"].ToString();
                            lblrightconfig.Text = ddtower.SelectedItem.Text;
                            //lblrightenclosed.Text = dt24s.Rows[0]["enclosedbalcony"].ToString();
                            //lblrightprice.Text = dt24s.Rows[0]["totalprice"].ToString();
                            lblrightunit.Text = dt24s.Rows[0]["unit"].ToString() + " - " + dt24s.Rows[0]["config"].ToString();

                            lnkbottombook.CommandArgument = lnkcardclick.CommandArgument;


                            //lnkcardclick.CommandArgument = int array[];

                            //txtseatnumber.Text = (Convert.ToInt32(txtseatnumber.Text) + 1).ToString();

                            //ViewState["count"] = Convert.ToInt32(ViewState["count"]) + 1;
                            //Label1.Text = ViewState["count"].ToString();

                            //lnkbottombook.CommandName = dt24s.Rows[0]["configid"].ToString();


                        }

                        if (dt24s.Rows[0]["statusid"].ToString() == "1")
                        {
                            lnkrightbook.Visible = true;
                        }
                        else
                        {
                            lnkrightbook.Visible = false;
                        }
                        divbottom.Attributes["style"] = "display:block;";
                        //lnkbtn.Attributes["style"] = "background-color: blue" + lnkbtn.CommandName + " !important ";
                        // }

                        //
                    }



                }
                else
                {
                    lblmsg.Visible = true;
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



        protected void btnunitright_Clicked(object sender, EventArgs e)
        {

            try
            {
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }

                lnkrightbook.CommandArgument = lnkbottombook.CommandArgument;
                lnkrightbook.CommandName = lnkbottombook.CommandName;

                LinkButton lnkcardclick = (LinkButton)sender;
                SqlCommand cmd424s = new SqlCommand("select 'images/'+ ISNULL(CAST(p.uniquefilename AS VARCHAR(500)),'') + ISNULL(CAST(p.fileextension AS VARCHAR(500)),'')  as userimageurl from configwisephotos as p left outer join configwise as c on c.id=p.configwiseid where c.propid=@projectid and c.configid=@configid", con);
                cmd424s.Parameters.AddWithValue("@configid", lnkrightbook.CommandName);
                cmd424s.Parameters.AddWithValue("@projectid", Session["projectid"].ToString());
                SqlDataAdapter da24s = new SqlDataAdapter(cmd424s);
                DataTable dt24s = new DataTable();
                da24s.Fill(dt24s);
                rptimg.DataSource = dt24s;
                rptimg.DataBind();

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

            divbottom.Attributes["style"] = "display:none;";
            //divright.Attributes["style"] = "display:block;";
            btnunit_Clicked(sender, e);

        }

        protected void btnnextcostsheet_Clicked(object sender, EventArgs e)
        {

            try
            {
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                //int number;
                //ddunitvalue.SelectedValue = number;

                SqlCommand cmd2341 = new SqlCommand("select * from customerbooking where customerid=@customerid", con);

                cmd2341.Parameters.AddWithValue("@customerid", Session["customerid"].ToString());
                SqlDataAdapter da2341 = new SqlDataAdapter(cmd2341);
                DataTable dt2341 = new DataTable();
                da2341.Fill(dt2341);
                string[] unitid3 = dt2341.Rows[0]["unitdeatails"].ToString().Split(',');
                Session["unitid3"] = unitid3.Length;
                //int countone = Convert.ToInt32(Session["unitid"].ToString());
                Array.Sort(unitid3);
                foreach (string i in unitid3)
                {
                    Console.WriteLine(i);

                }

                lnkrightbook.CommandArgument = lnkbottombook.CommandArgument;
                lnkrightbook.CommandName = lnkbottombook.CommandName;

                LinkButton lnkcardclick = (LinkButton)sender;
                SqlCommand cmd424s = new SqlCommand("select 'images/'+ ISNULL(CAST(p.uniquefilename AS VARCHAR(500)),'') + ISNULL(CAST(p.fileextension AS VARCHAR(500)),'')  as userimageurl from configwisephotos as p left outer join configwise as c on c.id=p.configwiseid where c.propid=@projectid and c.configid=@configid", con);
                cmd424s.Parameters.AddWithValue("@configid", lnkrightbook.CommandName);
                cmd424s.Parameters.AddWithValue("@projectid", Session["projectid"].ToString());
                SqlDataAdapter da24s = new SqlDataAdapter(cmd424s);
                DataTable dt24s = new DataTable();
                da24s.Fill(dt24s);
                rptimg.DataSource = dt24s;
                rptimg.DataBind();

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

            divbottom.Attributes["style"] = "display:none;";
            //divright.Attributes["style"] = "display:block;";
            btnunit_Clicked(sender, e);

        }


        protected void btnunit_Clicked(object sender, EventArgs e)
        {
            try
            {
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("update customersteps set unitid=@unitid, isstep1=@isstep1,step1date=@step1date where stepid=@stepid", con);
                cmd.Parameters.AddWithValue("@step1date", encryptdecrypt.indiandate());
                cmd.Parameters.AddWithValue("@stepid", Session["stepid"].ToString());
                cmd.Parameters.AddWithValue("@unitid", lnkrightbook.CommandArgument);
                cmd.Parameters.AddWithValue("@isstep1", 1);
                int k = cmd.ExecuteNonQuery();

                SqlCommand cmd2xb = new SqlCommand("select bankid from propertylisttower where id=@customerid", con);
                cmd2xb.Parameters.AddWithValue("@customerid", ddtower.SelectedValue);
                SqlDataAdapter da2xb = new SqlDataAdapter(cmd2xb);
                DataTable dt2xb = new DataTable();
                da2xb.Fill(dt2xb);
                if (dt2xb.Rows.Count > 0)
                {
                    Session["bankuid"] = dt2xb.Rows[0]["bankid"].ToString();
                }
                SqlCommand cmd424s = new SqlCommand("select * from propertylistconfig where id=@id", con);
                cmd424s.Parameters.AddWithValue("@id", lnkrightbook.CommandArgument);
                SqlDataAdapter da24s = new SqlDataAdapter(cmd424s);
                DataTable dt24s = new DataTable();
                da24s.Fill(dt24s);
                if (dt24s.Rows.Count > 0)
                {
                    //lblunit.Text = lblpopunit.Text;
                    lblbuiltup.Text = dt24s.Rows[0]["builduparea"].ToString();
                    lblcarpetarea.Text = dt24s.Rows[0]["carpetarea"].ToString();
                    lblrate.Text = dt24s.Rows[0]["pricesqft"].ToString();
                    lbldevelopment.Text = String.Format("{0:n0}", ((float.Parse(dt24s.Rows[0]["developmentcharges"].ToString()))));
                    lblregistartion.Text = String.Format("{0:n0}", ((float.Parse(dt24s.Rows[0]["regfees"].ToString()))));
                    lbllegalfess.Text = String.Format("{0:n0}", ((float.Parse(dt24s.Rows[0]["legalfees"].ToString()))));

                }
                if (Session["projectid"].ToString() == "1")
                {
                    string qry = "select a.cgst,a.sgst,lessvalue from propertylist a where a.id=@propid  ";
                    string lessvalue = "0";
                    cmd = new SqlCommand(qry, con);
                    cmd.Parameters.AddWithValue("@propid", Session["projectid"].ToString());
                    cmd.Parameters.AddWithValue("@configid", lnkbottombook.CommandName);
                    //cmd.Parameters.AddWithValue("@compcode", Session["compcode"].ToString());
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        dr.Read();
                        //lblgstper.Text = (Convert.ToDouble(dr["cgst"].ToString()) + Convert.ToDouble(dr["sgst"].ToString())).ToString();
                        dr.Close();
                    }
                    else
                    {
                        dr.Close();
                        lblgstper.Text = "0";
                    }
                    // sdfsd
                    qry = "select configname as unitname,a.drybalcony,a.totalprice,a.final,a.builduparea,a.saleblearea as salablearea,a.pricesqft, b.name as floorname," +
                        "(Cast(a.carpetarea as varchar) + ' ' + a.carpetunit) as carpetunit,a.carpetarea,carpetunit as cunit," +
                        " (Cast(a.drybalcony as varchar) + ' ' + a.carpetunit) as balconyunit, totalprice as basicprice,'' as commonareachrge," +
                        "a.carparking as carparking,'' as netconsider,'' as lessland,taxableamount as taxableamt,gst as gstamt,stampduty as stampdutyamt," +
                        "regfees as regfees,'' as totaltax,'' as finaltotal,'' as totalpayment,othercharge,maintenancecharge " +
                        "from PropertylistConfig a, floormaster b where a.floorid = b.id and a.id=@unitid";
                    cmd = new SqlCommand(qry, con);
                    cmd.Parameters.AddWithValue("@unitid", lnkrightbook.CommandArgument);
                    dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        dr.Read();

                        string carpetarea = "0", pricesqft = "0", final = "0", builduparea = "0", developmentcharges = "0";
                        string maintainancecal;
                        carpetarea = dr["carpetarea"].ToString();
                        pricesqft = dr["pricesqft"].ToString();
                        builduparea = dr["builduparea"].ToString();
                        lblcost.Text = String.Format("{0:n0}", ((float.Parse(pricesqft) * (float.Parse(builduparea)))));
                        developmentcharges = lbldevelopment.Text;
                        lblnetcost.Text = String.Format("{0:n0}", ((float.Parse(developmentcharges) + (float.Parse(lblcost.Text)))));
                        lblstampduty.Text = String.Format("{0:n0}", (float.Parse(lblcost.Text) * 6 / 100));
                        lblgst.Text = String.Format("{0:n0}", (float.Parse(developmentcharges) * 18 / 100) + (float.Parse(lblnetcost.Text) * 12 / 100));
                        lblpayreg.Text = String.Format("{0:n0}", ((float.Parse(lblstampduty.Text) + (float.Parse(lblregistartion.Text)) + (float.Parse(lblgst.Text)) + (float.Parse(lbllegalfess.Text)))));
                        maintainancecal = String.Format("{0:n0}", ((float.Parse(lblbuiltup.Text) * 1.5 * 24)));
                        lblmaintainance.Text = String.Format("{0:n0}", ((float.Parse(maintainancecal)) + (float.Parse(maintainancecal) * 18 / 100)));
                        lbltotalvalue.Text = String.Format("{0:n0}", ((float.Parse(lblnetcost.Text) + (float.Parse(lblpayreg.Text)) + (float.Parse(lblmaintainance.Text)))));
                        // basiccost = dr["totalprice"].ToString();
                        //amenitiescharge = dr["amenitiescharge"].ToString();

                        //otherchar = dr["othercharge"].ToString();
                        //clubcharge = dr["clubcharge"].ToString();
                        string p1 = lbltotalvalue.Text;
                        final = p1;
                        //   lblbasicvalue.Text = String.Format("{0:n0}", ((float.Parse(pricesqft) * (float.Parse(saleable)))));
                        //  lblcommonarea.Text = String.Format("{0:n0}", (float.Parse(otherchar) + (float.Parse(saleable) * 550)));
                        // lblparking.Text = String.Format("{0:n0}", (float.Parse(dr["carparking"].ToString())));
                        //lblparking.Text = String.Format("{0:n0}", 0);
                        //lblnetvalue.Text = String.Format("{0:n0}", ((float.Parse(lblbasicvalue.Text) + (float.Parse(lblcommonarea.Text)) + (float.Parse(lblparking.Text)))));
                        //lblless.Text = String.Format("{0:n0}", (float.Parse(saleable) * 433));
                        //lblAgreement.Text = String.Format("{0:n0}", (float.Parse(lblnetvalue.Text) - float.Parse(lblless.Text)));
                        //
                        //lbltaxable.Text = String.Format("{0:n0}", (((float.Parse(lbltaxable.Text) * 2) / 3)));
                        //lblgst.Text = String.Format("{0:n0}", (float.Parse(lbltaxable.Text) * float.Parse(lblgstper.Text) / 100));
                        //lblstampduty.Text = String.Format("{0:n0}", (float.Parse(lblAgreement.Text) * 6 / 100));
                        //lblregfees.Text = String.Format("{0:n0}", (float.Parse(dr["regfees"].ToString())));
                        //lbltax.Text = String.Format("{0:n0}", ((float.Parse(lblgst.Text) + (float.Parse(lblstampduty.Text)) + (float.Parse(lblregfees.Text)))));
                        //lblfinal.Text = String.Format("{0:n0}", (float.Parse(lblnetvalue.Text) + float.Parse(lblgst.Text) + float.Parse(lblstampduty.Text) + float.Parse(lblregfees.Text)));
                        //lblunit.Text = "0";
                        //lblfloorno.Text = "0";
                        //lblcarpet.Text = String.Format("{0:0.00}", ((float.Parse(carpetarea))));
                        //lblbasiccost.Text = String.Format("{0:n0}", (float.Parse(basiccost)));
                        //lblpowernall.Text = String.Format("{0:n0}", (float.Parse(otherchar)));
                        //lblamenities.Text = String.Format("{0:n0}", (float.Parse(amenitiescharge)));
                        //lblclub.Text = String.Format("{0:n0}", (float.Parse(clubcharge)));
                        //  lblapartment.Text = String.Format("{0:n0}", (float.Parse(final)));
                        lblapartment.Text = final;
                        //lblbalcony.Text = dr["balconyunit"].ToString();
                        //lblstampdutyper.Text = "6";
                        //lblpayment.Text = lblnetvalue.Text;
                        dr.Close();

                        if (Session["unittype"].ToString() == "1")
                        {
                            SqlCommand cmd2x1j = new SqlCommand("select  t.name as terms from paymentscheduleterms as t left outer join propertylist as p on p.id=t.paymentid where p.id=@propertyid and unittype=1", con);
                            cmd2x1j.Parameters.AddWithValue("@propertyid", Session["projectid"].ToString());
                            SqlDataAdapter da2x1j = new SqlDataAdapter(cmd2x1j);
                            DataTable dt2x1j = new DataTable();
                            da2x1j.Fill(dt2x1j);
                            rptterms.DataSource = dt2x1j;
                            rptterms.DataBind();

                            lbllumwallcharge.Text = "Rs 300 Per Sqft";


                        }
                        else if (Session["unittype"].ToString() == "2")
                        {
                            SqlCommand cmd2x1j = new SqlCommand("select  t.name as terms from paymentscheduleterms as t left outer join propertylist as p on p.id=t.paymentid where p.id=@propertyid and unittype=2", con);
                            cmd2x1j.Parameters.AddWithValue("@propertyid", Session["projectid"].ToString());
                            SqlDataAdapter da2x1j = new SqlDataAdapter(cmd2x1j);
                            DataTable dt2x1j = new DataTable();
                            da2x1j.Fill(dt2x1j);
                            rptterms.DataSource = dt2x1j;
                            rptterms.DataBind();
                            lbllumwallcharge.Text = "-";
                        }

                    }
                    else
                    {
                        dr.Close();
                        lblunit.Text = "0";
                        //lblfloorno.Text = "0";
                        //lblcarpet.Text = "0";
                        //lblbalcony.Text = "0";
                        //lblbasicvalue.Text = "0";
                        //lblcommonarea.Text = "0";
                        //lblparking.Text = "0";
                        lblnetvalue.Text = "0";
                        lblless.Text = "0";
                        lbltaxable.Text = "0";
                        //lblgst.Text = "0";
                        lblgstper.Text = "0";
                        //lblstampduty.Text = "0";
                        lblstampdutyper.Text = "0";
                        lblregfees.Text = "0";
                        lbltax.Text = "0";
                        lblfinal.Text = "0";
                        lblpayment.Text = "0";
                    }
                }

                divright.Attributes["style"] = "display:none;";
                //LinkButton lnkcardclick = (LinkButton)sender;
                Session["unitdetails"] = lblunit.Text;
                lblcunit.Text = lblrightconfig.Text + " - " + lblbottomunit.Text;
                Session["regfees"] = "1,00,000";
                Session["step1"] = "Unit Details";
                divstep1.CssClass = "borderleft lineheight20 displayinline step101 bottomborder";
                divstep1a.CssClass = "borderleft lineheight20 displayinline step101 bottomborder";
                divstep1b.CssClass = "borderleft lineheight20 displayinline step101 bottomborder";
                pnlunit.Visible = false;
                pnlcostsheet.Visible = true;
                //timerbooking.Enabled = true; 
                pnlcostsheetinside.Visible = true;
                //divcostsheetinside.Attributes["style"] = "display:block;";
                pnlbookingform.Visible = false;
                pnlpay.Visible = false;
                pnlstep1.Visible = false;
                pnlstep2.Visible = true;
                pnlstep3.Visible = false;
                pnlstep4.Visible = false;
                pnlstep5.Visible = false;
                pnlconfirmdoc.Visible = false;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "scrolltopevent", " $('html, body').animate({ scrollTop: $(\"body\").offset().top }, 500);", true);

                //  ScriptManager.RegisterStartupScript(Page, Page.GetType(), "scriptfortimer", "end = new Date('" + encryptdecrypt.indiandate().AddSeconds(10) + "'); timer = setInterval(showRemaining, 1000);", true);

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
        protected void btnoffer_Clicked(object sender, EventArgs e)
        {
            try
            {
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("update customersteps set unitid=@unitid, isstep2=@isstep1,step2date=@step1date where stepid=@stepid", con);
                cmd.Parameters.AddWithValue("@step1date", encryptdecrypt.indiandate());
                cmd.Parameters.AddWithValue("@stepid", Session["stepid"].ToString());
                cmd.Parameters.AddWithValue("@unitid", lnkrightbook.CommandArgument);
                cmd.Parameters.AddWithValue("@isstep1", 1);
                int k = cmd.ExecuteNonQuery();
                string qry = "";
                if (Session["projectid"].ToString() == "1" && Session["unittype"].ToString() == "1")
                {
                    qry = "select b.name as schedule,milestoneper as per,'' as amount,milestonepertwo as perone,'' as amount1,milestoneperthree as pertwo,'' as amount2  from paymentschedulemaster a, paymentschedulemilestone b where a.id=b.paymentid and paymentid=1";
                }
                else if (Session["projectid"].ToString() == "1" && Session["unittype"].ToString() == "2")
                {
                    qry = "select b.name as schedule,milestoneper as per,'' as amount,milestonepertwo as perone,'' as amount1,milestoneperthree as pertwo,'' as amount2 from paymentschedulemaster a, paymentschedulemilestone b where a.id=b.paymentid and paymentid=2";
                }
                //else if (Session["projectid"].ToString() == "1")
                //{
                //    qry = "select b.name as schedule,milestoneper as per,'' as amount,'' as gst,'' as total from paymentschedulemaster a, paymentschedulemilestone b where a.id=b.paymentid and a.id=6";
                //}
                cmd = new SqlCommand(qry, con);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                if (lblapartment.Text != "")
                {
                    if (Session["unittype"].ToString() == "1")
                    {
                        pnlshedpaymentschedule.Visible = true;
                        pnlrccpaymentschedule.Visible = false;
                        string wallcharges = "0";
                        lblwallcharge.Text = wallcharges;
                        lblone.Text = String.Format("{0:n0}", ((float.Parse(lblcost.Text) * 25 / 100)));
                        lbltwo.Text = String.Format("{0:n0}", ((float.Parse(lblone.Text) * 12 / 100)));

                        lblregone.Text = String.Format("{0:n0}", ((float.Parse(lblstampduty.Text) + float.Parse(lblregistartion.Text) + float.Parse(lbllegalfess.Text))));
                        lblplintone.Text = String.Format("{0:n0}", ((float.Parse(lblcost.Text) * 25 / 100)));
                        lblplinttwo.Text = String.Format("{0:n0}", ((float.Parse(lblplintone.Text) * 12 / 100)));
                        lblArrivalone.Text = String.Format("{0:n0}", ((float.Parse(lblcost.Text) * 20 / 100)));
                        lblArrivaltwo.Text = String.Format("{0:n0}", ((float.Parse(lblArrivalone.Text) * 12 / 100)));

                        lblpebone.Text = String.Format("{0:n0}", ((float.Parse(lblcost.Text) * 20 / 100)));
                        lblpebtwo.Text = String.Format("{0:n0}", ((float.Parse(lblpebone.Text) * 12 / 100)));

                        lblpossesionone.Text = String.Format("{0:n0}", (((float.Parse(lblcost.Text) * 10 / 100)) + (float.Parse(lbldevelopment.Text)) + (float.Parse(lblmaintainance.Text)) + (float.Parse(lblwallcharge.Text))));
                        lblpossesiontwo.Text = String.Format("{0:n0}", ((float.Parse(lblcost.Text) * 10 / 100) + (float.Parse(lbldevelopment.Text) * 18 / 100)));
                        lbltotalone.Text = String.Format("{0:n0}", ((float.Parse(lblone.Text)) + (float.Parse(lblregone.Text)) + (float.Parse(lblplintone.Text)) + (float.Parse(lblArrivalone.Text)) + (float.Parse(lblpebone.Text)) + (float.Parse(lblpossesionone.Text))));
                        lbltotaltwo.Text = String.Format("{0:n0}", ((float.Parse(lbltwo.Text)) + (float.Parse(lblregtwo.Text)) + (float.Parse(lblplinttwo.Text)) + (float.Parse(lblArrivaltwo.Text)) + (float.Parse(lblpebtwo.Text)) + (float.Parse(lblpossesiontwo.Text))));
                    }
                    else if (Session["unittype"].ToString() == "2")
                    {
                        pnlshedpaymentschedule.Visible = false;
                        pnlrccpaymentschedule.Visible = true;

                        lblbookrccone.Text = String.Format("{0:n0}", ((float.Parse(lblcost.Text) * 25 / 100)));
                        lblbookrcctwo.Text = String.Format("{0:n0}", ((float.Parse(lblbookrccone.Text) * 12 / 100)));

                        lblplintrccone.Text = String.Format("{0:n0}", ((float.Parse(lblcost.Text) * 25 / 100)));
                        lblplintrcctwo.Text = String.Format("{0:n0}", ((float.Parse(lblplintrccone.Text) * 12 / 100)));

                        lblregrccone.Text = String.Format("{0:n0}", ((float.Parse(lblstampduty.Text) + float.Parse(lblregistartion.Text) + float.Parse(lbllegalfess.Text))));
                        lblrccsslabone.Text = String.Format("{0:n0}", ((float.Parse(lblcost.Text) * 15 / 100)));
                        lblrccsslabtwo.Text = String.Format("{0:n0}", ((float.Parse(lblrccsslabone.Text) * 12 / 100)));

                        lblrccsslabthree.Text = String.Format("{0:n0}", ((float.Parse(lblcost.Text) * 15 / 100)));
                        lblrccslabfour.Text = String.Format("{0:n0}", ((float.Parse(lblrccsslabthree.Text) * 12 / 100)));

                        lblrccsslabfive.Text = String.Format("{0:n0}", ((float.Parse(lblcost.Text) * 15 / 100)));
                        lblrccsslabsix.Text = String.Format("{0:n0}", ((float.Parse(lblrccsslabfive.Text) * 12 / 100)));

                        lblrccpossesionone.Text = String.Format("{0:n0}", (((float.Parse(lblcost.Text) * 5 / 100)) + (float.Parse(lbldevelopment.Text)) + (float.Parse(lblmaintainance.Text))));
                        lblrccpossesiontwo.Text = String.Format("{0:n0}", ((float.Parse(lblcost.Text) * 5 / 100) + (float.Parse(lbldevelopment.Text) * 18 / 100)));

                        lblrcctotalone.Text = String.Format("{0:n0}", ((float.Parse(lblbookrccone.Text)) + (float.Parse(lblplintrccone.Text)) + (float.Parse(lblregrccone.Text)) + (float.Parse(lblrccsslabone.Text)) + (float.Parse(lblrccsslabthree.Text)) + (float.Parse(lblrccpossesionone.Text)) + (float.Parse(lblrccsslabfive.Text))));
                        lblrcctotaltwo.Text = String.Format("{0:n0}", ((float.Parse(lblbookrcctwo.Text)) + (float.Parse(lblplintrcctwo.Text)) + (float.Parse(lblregrcctwo.Text)) + (float.Parse(lblrccslabfour.Text)) + (float.Parse(lblrccpossesiontwo.Text)) + (float.Parse(lblrccsslabsix.Text)) + (float.Parse(lblrccpossesiontwo.Text))));





                    }
                }
                //rptschedule.DataSource = dt;
                //rptschedule.DataBind();
                lblamount.Text = "1,00,000";
                //lbl1.Text = String.Format("{0:n0}", (((float.Parse(lblapartment.Text) * 10 / 100)) - 100000));
                Session["costsheet"] = "Agreed";
                Session["step2"] = "Cost Sheet";
                divstep2.CssClass = "borderleft lineheight20 displayinline step101 bottomborder";
                divstep2a.CssClass = "borderleft lineheight20 displayinline step101 bottomborder";
                divstep2b.CssClass = "borderleft lineheight20 displayinline step101 bottomborder";
                pnlunit.Visible = false;
                pnlcostsheet.Visible = false;
                pnlschedule.Visible = true;
                pnlscheduleinside.Visible = true;

                pnlbookingform.Visible = false;
                pnlpay.Visible = false;
                pnlstep1.Visible = false;
                pnlstep2.Visible = false;
                pnlstep3.Visible = true;
                pnlstep4.Visible = false;
                pnlstep5.Visible = false;
                pnlconfirmdoc.Visible = false;

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "scrolltopevent", " $('html, body').animate({ scrollTop: $(\"body\").offset().top }, 500);", true);

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
        protected void btnschedule_Clicked(object sender, EventArgs e)
        {
            try
            {
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("update customersteps set isstep3=@isstep1,step3date=@step1date where stepid=@stepid", con);
                cmd.Parameters.AddWithValue("@step1date", encryptdecrypt.indiandate());
                cmd.Parameters.AddWithValue("@stepid", Session["stepid"].ToString());
                cmd.Parameters.AddWithValue("@isstep1", 1);
                int k = cmd.ExecuteNonQuery();
                Session["paymentschedule"] = "Agreed";
                Session["step3"] = "Schedule";
                divstep3.CssClass = "borderleft lineheight20 displayinline step101 bottomborder";
                divstep3a.CssClass = "borderleft lineheight20 displayinline step101 bottomborder";
                divstep3b.CssClass = "borderleft lineheight20 displayinline step101 bottomborder";
                pnlunit.Visible = false;
                pnlcostsheet.Visible = false;
                pnlschedule.Visible = false;
                pnlbookingform.Visible = true;
                pnlbookingforminside.Visible = true;
                pnlpay.Visible = false;
                pnlstep1.Visible = false;
                pnlstep2.Visible = false;
                pnlstep3.Visible = false;
                pnlstep4.Visible = true;
                pnlstep5.Visible = false;
                pnlconfirmdoc.Visible = false;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "scrolltopevent", " $('html, body').animate({ scrollTop: $(\"body\").offset().top }, 500);", true);

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
        protected void lnkcancelfilter_Clicked(object sender, EventArgs e)
        {
            divapply.Attributes["style"] = "display:none;";
        }
        protected void lnkfilterbtn_Clicked(object sender, EventArgs e)
        {
        }
        protected void btnopenoffer_Clicked(object sender, EventArgs e)
        {
            try
            {
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                SqlCommand cmd424s = new SqlCommand("select  id,name as coupon,coupontitle as smalldescription,percentage from couponmaster  where propertyid=@propertyid", con);
                cmd424s.Parameters.AddWithValue("@propertyid", Session["projectid"].ToString());
                SqlDataAdapter da24s = new SqlDataAdapter(cmd424s);
                DataTable dt24s = new DataTable();
                da24s.Fill(dt24s);
                rptoffer.DataSource = dt24s;
                rptoffer.DataBind();
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
            divapply.Attributes["style"] = "display:block;";
        }
        protected void btnapplycoupon_Clicked(object sender, EventArgs e)
        { }
        protected void btncancelcoupon_Clicked(object sender, EventArgs e)
        { }

        protected void btndiscount_Clicked(object sender, EventArgs e)
        {
            LinkButton lnkcardclick = (LinkButton)sender;


        }
        protected void lnkform_Clicked(object sender, EventArgs e)
        {


        }
        protected void lnknext_Clicked(object sender, EventArgs e)
        {


        }
        protected void lnkpayment_Clicked(object sender, EventArgs e)
        {
            //try
            //{
            //    MailMessage mail = new MailMessage();
            //    string htmlBody1 = "<!doctype html><html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\"xmlns:o=\"urn:schemas-microsoft-com:office:office\"> <head> <meta charset=\"UTF-8\"> <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"> <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\"> <title>Cognilements Account Verification</title> <link href=\"https://fonts.googleapis.com/css2?family=Ubuntu&display=swap\" rel=\"stylesheet\"> <style type=\"text/css\"> body{font-family: \"ubuntu\", sans-serif; font-weight: 300; line-height: 1.5em; letter-spacing: 0.3px;}.fontclass{font-family: \"ubuntu\", sans-serif; font-weight: 300; line-height: 1.5em; letter-spacing: 0.3px;}</style> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"templateContainer\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; max-width: 600px; border: 0\" width=\"100%\"> <tr> <td id=\"templatePreheader\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; background-color: #6a798d; border-top: 0; border-bottom: 0; padding-top: 16px; padding-bottom: 8px\" valign=\"top\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnTextBlock\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody class=\"mcnTextBlockOuter\"> <tr> <td class=\"mcnTextBlockInner\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%\" valign=\"top\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnTextContentContainer\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody> <tr> <td class=\"mcnTextContent\" style='mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; word-break: break-word; color: white; font-family: \"Ubuntu\",sans-serif; font-size: 24px; line-height: 150%; text-align: left; padding-top: 9px; padding-right: 18px; padding-bottom: 9px; padding-left: 18px;' valign=\"top\"> <a class=\"fontclass\" href=\"http://www.Cognilements.Prop3d.in\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; color: white; font-weight: 700;letter-spacing: 2px; text-decoration: none\" target=\"_blank\" title=\"Cognilements\"> Cognilements </a> </td></tr></tbody> </table> </td></tr></tbody> </table> </td></tr><tr> <td id=\"templateHeader\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; background-color: #6a798d; border-top: 0; border-bottom: 0; padding-top: 16px; padding-bottom: 0\" valign=\"top\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnImageBlock\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody class=\"mcnImageBlockOuter\"> <tr> <td class=\"mcnImageBlockInner\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding: 0px\" valign=\"top\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnImageContentContainer\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody> <tr> <td class=\"mcnImageContent\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-right: 0px; padding-left: 0px; padding-top: 0; padding-bottom: 0; text-align: center;\" valign=\"top\"> <a class=\"\" href=\"http://www.Cognilements.Prop3d.in\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; color: #6a798d; font-weight: normal; text-decoration: none\" target=\"_blank\" title=\"\"><a class=\"\" href=\"http://www.Cognilements.Prop3d.in\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; color: #6a798d; font-weight: normal; text-decoration: none\" target=\"_blank\" title=\"\"> <img align=\"center\" alt=\"Forgot your password?\" class=\"mcnImage\" src=\"https://static.lingoapp.com/assets/images/email/il-password-reset@2x.png\" style=\"-ms-interpolation-mode: bicubic; border: 0; height: auto; outline: none; text-decoration: none; vertical-align: bottom; max-width: 1200px; padding-bottom: 0; display: inline !important; vertical-align: bottom;\" width=\"600\"></img> </a></a> </td></tr></tbody> </table> </td></tr></tbody> </table> </td></tr><tr> <td id=\"templateBody\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; background-color: #6a798d; border-top: 0; border-bottom: 0; padding-top: 0; padding-bottom: 0\" valign=\"top\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnTextBlock\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody class=\"mcnTextBlockOuter\"> <tr> <td class=\"mcnTextBlockInner\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%\" valign=\"top\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnTextContentContainer\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody> <tr> <td class=\"mcnTextContent\" style='mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; word-break: break-word; color: White; font-family: \"Ubuntu\",sans-serif; font-size: 16px; line-height: 150%; text-align: center; padding-top: 9px; padding-right: 18px; padding-bottom: 9px; padding-left: 18px;' valign=\"top\"> <h1 class=\"null\" style='color: White; font-family: \"Ubuntu\",sans-serif; font-size: 32px; font-style: normal; font-weight: bold; line-height: 125%; letter-spacing: 2px; text-align: center; display: block; margin: 0; padding: 0'> <span style=\"text-transform: uppercase\">Welcome To Cognilements</span></h1> <h2 class=\"null\" style='color: White; font-family: \"Ubuntu\",sans-serif; font-size: 24px; font-style: normal; font-weight: bold; line-height: 125%; letter-spacing: 1px; text-align: center; display: block; margin: 0; padding: 0'> <span style=\"text-transform: uppercase\">We're happy you're here</span></h2> </td></tr></tbody> </table> </td></tr></tbody> </table> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnTextBlock\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody class=\"mcnTextBlockOuter\"> <tr> <td class=\"mcnTextBlockInner\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%\" valign=\"top\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnTextContentContainer\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody> <tr> <td class=\"mcnTextContent\" style='mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; word-break: break-word; color: White; font-family: \"Ubuntu\",sans-serif; font-size: 16px; line-height: 150%; text-align: center; padding-top: 9px; padding-right: 18px; padding-bottom: 9px; padding-left: 18px;' valign=\"top\">It's time to confirm your Account. Please verify your Account with below One Time Passcode <br><br/> </td></tr></tbody> </table> </td></tr></tbody> </table> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnButtonBlock\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody class=\"mcnButtonBlockOuter\"> <tr> <td align=\"center\" class=\"mcnButtonBlockInner\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 18px; padding-right: 18px; padding-bottom: 18px; padding-left: 18px;\" valign=\"top\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnButtonBlock\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody class=\"mcnButtonBlockOuter\"> <tr> <td align=\"center\" class=\"mcnButtonBlockInner\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 0; padding-right: 18px; padding-bottom: 18px; padding-left: 18px;\" valign=\"top\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnButtonContentContainer\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; border-collapse: separate !important; border-radius: 48px; background-color: white;\"> <tbody> <tr> <td align=\"center\" class=\"mcnButtonContent\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; font-family: 'Ubuntu',sans-serif; font-size: 16px; padding-top: 24px; padding-right: 48px; padding-bottom: 24px; padding-left: 48px;\" valign=\"middle\"> <a class=\"mcnButton \" href=\"http://www.Cognilements.Prop3d.in\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; display: block; color: #6a798d; font-weight: normal; text-decoration: none; font-weight: normal; letter-spacing: 10px;font-size:30px; line-height: 100%; text-align: center; text-decoration: none; font-weight: 600; text-transform: uppercase;\" title=\"One Time Password to Verify Account\">  48652  </a> </td></tr></tbody> </table> </td></tr></tbody> </table> </td></tr></tbody> </table> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnImageBlock\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody class=\"mcnImageBlockOuter\"> <tr> <td class=\"mcnImageBlockInner\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding: 0px\" valign=\"top\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnImageContentContainer\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody> <tr> <td class=\"mcnImageContent\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-right: 0px; padding-left: 0px; padding-top: 0; padding-bottom: 0; text-align: center;\" valign=\"top\"> </td></tr></tbody> </table> </td></tr></tbody> </table> </td></tr></table> </td></tr></table> </center> </body></html>";
            //    AlternateView htmlView1 = AlternateView.CreateAlternateViewFromString(htmlBody1, null, "text/html");
            //    mail.IsBodyHtml = true;
            //    mail.AlternateViews.Add(htmlView1);
            //    mail.Subject = "Verify Your Details";
            //    mail.From = new MailAddress("oracular.india@gmail.com");
            //    mail.To.Add("samudra@cognilements.com");
            //    mail.IsBodyHtml = true;
            //    SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
            //    smtp.EnableSsl = true;
            //    NetworkCredential netCre = new NetworkCredential("oracular.india@gmail.com", "Oracular@7772");
            //    smtp.Credentials = netCre;

            //    try
            //    {
            //        smtp.Send(mail);
            //    }
            //    catch (Exception ex)
            //    {
            //    }






            //    HttpWebRequest myReq1 = (HttpWebRequest)WebRequest.Create("http://msg.galaxydev.in/api/push.json?apikey=5e995c86904d7&route=transactional&sender=ORACRA&mobileno=9930560586&text=Your OTP for booking is 48652");
            //    HttpWebResponse myResp1 = (HttpWebResponse)myReq1.GetResponse();
            //    System.IO.StreamReader respStreamReader1 = new System.IO.StreamReader(myResp1.GetResponseStream());
            //    string responseString1 = respStreamReader1.ReadToEnd();
            //    respStreamReader1.Close();
            //    myResp1.Close();

            //    pnlotp.Visible = false;
            //    pnlpayment.Visible = false;
            //}
            //catch (Exception ex)
            //{


            //}
            //finally
            //{
            //    pnlpayment.Visible = false;
            //    pnlotp.Visible = true;
            //}


        }
        protected void lnkotp_Clicked(object sender, EventArgs e)
        {
            //try
            //{

            //    HttpWebRequest myReq1 = (HttpWebRequest)WebRequest.Create("http://msg.galaxydev.in/api/push.json?apikey=5e995c86904d7&route=transactional&sender=ORACRA&mobileno=9930560586&text=Dear Amrik,%0a%0aGreetings from Bramhacorp, Thanks for selecting Flat " + lblflatdetails.Text + " and agreeing to pay a booking amount of Rs. 50,000 against a property value of Rs 75.66 Lacs while availing a discount of 3% from the discount coupon code of COGNI03.%0a%0aOur CRM representative will call you soon for completing the rest of the formalities.%0a%0aHappy Home Buying !!!%0a%0aBest Regards%0aBramhacorp Sales Team");
            //    HttpWebResponse myResp1 = (HttpWebResponse)myReq1.GetResponse();
            //    System.IO.StreamReader respStreamReader1 = new System.IO.StreamReader(myResp1.GetResponseStream());
            //    string responseString1 = respStreamReader1.ReadToEnd();
            //    respStreamReader1.Close();
            //    myResp1.Close();

            //    pnlotp.Visible = false;
            //    pnlpayment.Visible = false;
            //}
            //catch (Exception ex)
            //{


            //}
            //finally
            //{
            //    pnlpayment.Visible = false;
            //    pnlotp.Visible = true;
            //    Response.Redirect("http://matchbox.prop3d.in/MatchBox-Booking-Print/T2d1UmFHVXBJWTBaQ3psTzExb0FoUT09");

            //}
        }
        protected void lnkcancelbooking_Clicked(object sender, EventArgs e)
        {
            //  divrightbooking.Attributes["style"] = "display:none;";

        }

        protected void btnopenbooking_Clicked(object sender, EventArgs e)
        {
            // divrightbooking.Attributes["style"] = "display:block;";
            pnladdbookingdisplay.Visible = true;
            pnlbookingformdisplay.Visible = true;

        }

        protected void lnkaddnewbooking_Clicked(object sender, EventArgs e)
        {
            //
            try
            {
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                int kke = 0, kke1 = 0;
                DateTime resultdate1, result2;
                string s = txtdob.Text.Replace('-', '/');
                DateTime fromDateValue;
                var formats = new[] { "dd/MM/yyyy", "yyyy/MM/dd", "yyyy/MM/dd", "dd/MM/yy" };
                if (DateTime.TryParseExact(s, formats, CultureInfo.InvariantCulture, DateTimeStyles.None, out result2) != true)
                {

                    kke1 = 1;
                }
                //if (DateTime.TryParseExact(txtdob.Text, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None, out result2) != true)
                //{
                //    kke1 = 1;

                //}


                if (lnkaddbooking.CommandArgument == "0")
                {
                    if (txtmobileno.Text.Length == 10 && txtpancard.Text.Length == 10 && txtfirstname.Text != "" && txtaadhaar.Text.Length == 12 && txtaadhaar.Text != "" && txtlastname.Text != "" && txtmobileno.Text != "" && kke1 != 1 && txtemail.Text != "" && txtpancard.Text != "" && txtnationality.Text != "")
                    {
                        SqlCommand cmdf = new SqlCommand("Insert into customerbooking (entrydate,salutationid,name,Mobileno,emailid,dob,addressline1,addressline2,city,state,aadharno,panno,stepid,firstname,middlename,lastname,nationality,title1) values  (@entrydate,@salutationid,@name,@Mobileno,@emailid,@dob,@addressline1,@addressline2,@city,@state,@aadharno,@panno,@stepid,@firstname,@middlename,@lastname,@nationality,@title1)", con);
                        //cmdf.Parameters.AddWithValue("@salutationid", "0");
                        cmdf.Parameters.AddWithValue("@Entrydate", encryptdecrypt.indiandate());
                        cmdf.Parameters.AddWithValue("@stepid", Session["stepid"].ToString());
                        cmdf.Parameters.AddWithValue("@salutationid", ddsalutation.SelectedValue.ToString());
                        cmdf.Parameters.AddWithValue("@name", txtfirstname.Text.Trim() + " " + txtmiddlename.Text + " " + txtlastname.Text.Trim());
                        cmdf.Parameters.AddWithValue("@mobileno", txtmobileno.Text);
                        cmdf.Parameters.AddWithValue("@emailid", txtemail.Text);
                        cmdf.Parameters.AddWithValue("@addressline1", "");
                        cmdf.Parameters.AddWithValue("@addressline2", "");
                        if (txtdob.Text != "")
                        {

                            DateTime dte = Convert.ToDateTime(s, CultureInfo.CurrentCulture);
                            //DateTime.ParseExact(s, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                            cmdf.Parameters.AddWithValue("@DOB", dte);
                        }
                        else
                        {
                            cmdf.Parameters.AddWithValue("@DOB", DBNull.Value);
                        }


                        cmdf.Parameters.AddWithValue("@city", txtcity.Text);
                        cmdf.Parameters.AddWithValue("@state", "");
                        cmdf.Parameters.AddWithValue("@aadharno", txtaadhaar.Text);
                        cmdf.Parameters.AddWithValue("@panno", txtpancard.Text);

                        cmdf.Parameters.AddWithValue("@title1", "");
                        cmdf.Parameters.AddWithValue("@nationality", txtnationality.Text);
                        cmdf.Parameters.AddWithValue("@firstname", txtfirstname.Text);
                        cmdf.Parameters.AddWithValue("@middlename", txtmiddlename.Text);
                        cmdf.Parameters.AddWithValue("@lastname", txtlastname.Text);
                        int kf = cmdf.ExecuteNonQuery();

                        txtfirstname.Style.Remove("border-color");
                        txtmobileno.Style.Remove("border-color");
                        txtemail.Style.Remove("border-color");
                        txtlastname.Style.Remove("border-color");
                        txtpancard.Style.Remove("border-color");
                        txtmiddlename.Style.Remove("border-color");
                        txtdob.Style.Remove("border-color");
                        txtnationality.Style.Remove("border-color");
                        txtaadhaar.Style.Remove("border-color");

                        txtnationality.Text = "";

                        txtemail.Text = "";
                        txtfirstname.Text = "";
                        txtmiddlename.Text = "";
                        txtlastname.Text = "";
                        txtpancard.Text = "";
                        txtaadhaar.Text = "";
                        txtnationality.Text = "";
                        txtmobileno.Text = "";
                        txtdob.Text = "";
                        fillbooking();
                        filldbooking();
                        //divrightbooking.Attributes["style"] = "display:none;";
                        LinkButton11.Visible = true;
                        pnlbookingformdisplay.Visible = false;
                        pnladdbookingdisplay.Visible = false;
                        pnladdbookingbtn.Visible = true;
                        fillbooking();
                        filldbooking();
                    }
                    else
                    {
                        if (txtfirstname.Text == "")
                        {
                            txtfirstname.Style.Add("border-color", "red");

                        }
                        else
                        {
                            txtfirstname.Style.Remove("border-color");

                        }
                        if (txtlastname.Text == "")
                        {
                            txtlastname.Style.Add("border-color", "red");

                        }
                        else
                        {
                            txtlastname.Style.Remove("border-color");

                        }

                        if (txtmobileno.Text == "" || txtmobileno.Text.Length != 10)
                        {
                            txtmobileno.Style.Add("border-color", "red");

                        }
                        else
                        {
                            txtmobileno.Style.Remove("border-color");

                        }

                        if (txtaadhaar.Text == "" || txtaadhaar.Text.Length != 12)
                        {
                            txtaadhaar.Style.Add("border-color", "red");

                        }
                        else
                        {
                            txtaadhaar.Style.Remove("border-color");

                        }


                        if (txtemail.Text == "")
                        {
                            txtemail.Style.Add("border-color", "red");

                        }
                        else
                        {
                            txtemail.Style.Remove("border-color");

                        }

                        if (txtdob.Text == "")
                        {
                            txtdob.Style.Add("border-color", "red");

                        }
                        else
                        {
                            txtdob.Style.Remove("border-color");

                        }

                        if (txtpancard.Text == "" || txtpancard.Text.Length != 10)
                        {
                            txtpancard.Style.Add("border-color", "red");

                        }
                        else
                        {
                            txtpancard.Style.Remove("border-color");

                        }
                        if (txtnationality.Text == "")
                        {
                            txtnationality.Style.Add("border-color", "red");

                        }
                        else
                        {
                            txtnationality.Style.Remove("border-color");

                        }




                    }
                }
                else
                {

                    if (txtmobileno.Text.Length == 10 && txtpancard.Text.Length == 10 && txtfirstname.Text != "" && txtaadhaar.Text.Length == 12 && txtaadhaar.Text != "" && txtlastname.Text != "" && txtmobileno.Text != "" && kke1 != 1 && txtemail.Text != "" && txtpancard.Text != "" && txtnationality.Text != "")
                    {
                        SqlCommand cmdf = new SqlCommand("Update customerbooking set  entrydate=@entrydate,salutationid=@salutationid,name=@name,Mobileno=@Mobileno,emailid=@emailid,dob=@dob,addressline1=@addressline1,addressline2=@addressline2,city=@city,state=@state,aadharno=@aadharno,panno=@panno,stepid=@stepid,firstname=@firstname,middlename=@middlename,lastname=@lastname,nationality=@nationality,title1=@title1  where id=@id", con);

                        cmdf.Parameters.AddWithValue("@Entrydate", encryptdecrypt.indiandate());
                        cmdf.Parameters.AddWithValue("@stepid", Session["stepid"].ToString());
                        cmdf.Parameters.AddWithValue("@salutationid", ddsalutation.SelectedValue.ToString());
                        cmdf.Parameters.AddWithValue("@name", txtfirstname.Text.Trim() + " " + txtmiddlename.Text + " " + txtlastname.Text.Trim());
                        cmdf.Parameters.AddWithValue("@mobileno", txtmobileno.Text);
                        cmdf.Parameters.AddWithValue("@emailid", txtemail.Text);
                        cmdf.Parameters.AddWithValue("@addressline1", "");
                        cmdf.Parameters.AddWithValue("@addressline2", "");
                        if (txtdob.Text != "")
                        {
                            DateTime dte = Convert.ToDateTime(s, CultureInfo.CurrentCulture);
                            cmdf.Parameters.AddWithValue("@DOB", dte);
                        }
                        else
                        {
                            cmdf.Parameters.AddWithValue("@DOB", DBNull.Value);
                        }


                        cmdf.Parameters.AddWithValue("@city", txtcity.Text);
                        cmdf.Parameters.AddWithValue("@state", "");
                        cmdf.Parameters.AddWithValue("@aadharno", txtaadhaar.Text);
                        cmdf.Parameters.AddWithValue("@panno", txtpancard.Text);

                        cmdf.Parameters.AddWithValue("@title1", "");
                        cmdf.Parameters.AddWithValue("@nationality", txtnationality.Text);
                        cmdf.Parameters.AddWithValue("@firstname", txtfirstname.Text);
                        cmdf.Parameters.AddWithValue("@middlename", txtmiddlename.Text);
                        cmdf.Parameters.AddWithValue("@lastname", txtlastname.Text);
                        cmdf.Parameters.AddWithValue("@id", lnkaddbooking.CommandArgument.ToString());


                        int kf = cmdf.ExecuteNonQuery();
                        lnkaddbooking.Text = "Add";
                        lnkaddbooking.CommandArgument = "0";

                        txtfirstname.Style.Remove("border-color");
                        txtmobileno.Style.Remove("border-color");
                        txtemail.Style.Remove("border-color");
                        txtlastname.Style.Remove("border-color");
                        txtpancard.Style.Remove("border-color");
                        txtmiddlename.Style.Remove("border-color");
                        txtdob.Style.Remove("border-color");
                        txtnationality.Style.Remove("border-color");


                        txtnationality.Text = "";
                        txtemail.Text = "";
                        txtfirstname.Text = "";
                        txtmiddlename.Text = "";
                        txtlastname.Text = "";
                        txtpancard.Text = "";
                        txtnationality.Text = "";
                        txtmobileno.Text = "";
                        txtdob.Text = "";
                        txtaadhaar.Text = "";
                        pnlbookingformdisplay.Visible = false;
                        pnladdbookingdisplay.Visible = false;
                        pnladdbookingbtn.Visible = true;
                        fillbooking();
                        filldbooking();
                    }
                    else
                    {
                        if (txtaadhaar.Text == "" || txtaadhaar.Text.Length != 12)
                        {
                            txtaadhaar.Style.Add("border-color", "red");

                        }
                        else
                        {
                            txtaadhaar.Style.Remove("border-color");

                        }
                        if (txtfirstname.Text == "")
                        {
                            txtfirstname.Style.Add("border-color", "red");

                        }
                        else
                        {
                            txtfirstname.Style.Remove("border-color");

                        }
                        if (txtlastname.Text == "")
                        {
                            txtlastname.Style.Add("border-color", "red");

                        }
                        else
                        {
                            txtlastname.Style.Remove("border-color");

                        }

                        if (txtmobileno.Text == "" || txtmobileno.Text.Length != 10)
                        {
                            txtmobileno.Style.Add("border-color", "red");

                        }
                        else
                        {
                            txtmobileno.Style.Remove("border-color");

                        }

                        if (txtemail.Text == "")
                        {
                            txtemail.Style.Add("border-color", "red");

                        }
                        else
                        {
                            txtemail.Style.Remove("border-color");

                        }

                        if (txtdob.Text == "")
                        {
                            txtdob.Style.Add("border-color", "red");

                        }
                        else
                        {
                            txtdob.Style.Remove("border-color");

                        }

                        if (txtpancard.Text == "" || txtpancard.Text.Length != 10)
                        {
                            txtpancard.Style.Add("border-color", "red");

                        }
                        else
                        {
                            txtpancard.Style.Remove("border-color");

                        }
                        if (txtnationality.Text == "")
                        {
                            txtnationality.Style.Add("border-color", "red");

                        }
                        else
                        {
                            txtnationality.Style.Remove("border-color");

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

            }

        }
        protected void fillbooking()
        {
            try
            {
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select ROW_NUMBER() OVER (ORDER BY  a.id ) AS srno,  a.id,(b.name + ' ' +  a.name) as fname,mobileno,emailid from customerbooking a, salutationmaster b where a.salutationid=b.id and stepid='" + Session["stepid"].ToString() + "'", con);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                rptbooking.DataSource = dt;
                rptbooking.DataBind();
                if (dt.Rows.Count > 0)
                {
                    LinkButton11.Visible = true;
                    Session["nextvalue"] = "1";
                    lblapplicant.Text = "Applicant " + (int.Parse(dt.Rows[dt.Rows.Count - 1]["srno"].ToString()) + 1).ToString();
                    pnlbookingformdisplay.Visible = false;
                    pnladdbookingdisplay.Visible = false;
                    pnladdbookingbtn.Visible = true;
                    txtemail.Text = "";
                    txtmobileno.Text = "";


                    txtfirstname.Text = "";


                    txtlastname.Text = "";

                    txtmiddlename.Text = "";

                }
                else
                {
                    Session["nextvalue"] = "0";
                    lblapplicant.Text = "Applicant 1";
                    pnlbookingformdisplay.Visible = true;
                    pnladdbookingdisplay.Visible = true;
                    pnladdbookingbtn.Visible = false;
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

        protected void filldbooking()
        {
            try
            {
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                lblcunit.Text = lblrightconfig.Text + " - " + lblbottomunit.Text;
                SqlCommand cmd = new SqlCommand("select ROW_NUMBER() OVER (ORDER BY  a.id ) AS srno,  a.id, a.name as fname,mobileno,emailid,convert(varchar,dob,103) as dob1 ,*,b.name as sname from customerbooking a, salutationmaster b where a.salutationid=b.id and  stepid='" + Session["stepid"].ToString() + "'", con);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                rptdbooking.DataSource = dt;
                rptdbooking.DataBind();

                cmd = new SqlCommand("select * from customersteps where stepid='" + Session["stepid"].ToString() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    dr.Read();
                    txtarea.Text = dr["area"].ToString();
                    txtbuilding.Text = dr["buildno"].ToString();
                    txtcity.Text = dr["city"].ToString();
                    txtlandmark.Text = dr["landmark"].ToString();
                    txtpincode.Text = dr["pincode"].ToString();
                    txtstate.Text = dr["state"].ToString();
                    txtarea1.Text = dr["area1"].ToString();
                    txtbuilding1.Text = dr["buildno1"].ToString();
                    txtcity1.Text = dr["city1"].ToString();
                    txtlandmark1.Text = dr["landmark1"].ToString();
                    txtpincode1.Text = dr["pincode1"].ToString();
                    txtstate1.Text = dr["state1"].ToString();


                    if (dr["isenduse"].ToString() == "1")
                    {
                        rdenduse.Checked = true;
                    }
                    else
                    {
                        rdinvestment.Checked = false;
                        //lbldenduse.Text = "&nbsp  ";
                    }

                    if (dr["isinvestment"].ToString() == "1")
                    {
                        rdinvestment.Checked = true;
                    }
                    else
                    {
                        rdenduse.Checked = false;
                    }
                    if (dr["isloan"].ToString() == "1")
                    {
                        rdyes.Checked = true;
                    }
                    else
                    {
                        rdno.Checked = false;
                    }
                    if (dr["remarkloan"].ToString() != "" && dr["remarkloan"].ToString() != null)
                    {
                        divloan.Visible = true;
                        txtloanspecify.Text = dr["remarkloan"].ToString();
                    }
                    else
                    {
                        divloan.Visible = false;
                        txtloanspecify.Text = "";
                    }

                    if (dr["ishoarding"].ToString() == "1")
                    {
                        rdhoarding.Checked = true;
                    }
                    else
                    {
                        rdhoarding.Checked = false;
                    }

                    if (dr["isemail"].ToString() == "1")
                    {
                        rdemail.Checked = true;
                    }
                    else
                    {
                        rdemail.Checked = false;
                    }
                    if (dr["isweb"].ToString() == "1")
                    {
                        rdweb.Checked = true;
                    }
                    else
                    {
                        rdweb.Checked = false;
                    }
                    if (dr["isbroker"].ToString() == "1")
                    {
                        rdbroker.Checked = true;
                    }
                    else
                    {
                        rdbroker.Checked = false;
                    }
                    if (dr["isacq"].ToString() == "1")
                    {
                        rdacq.Checked = true;
                    }
                    else
                    {
                        rdacq.Checked = false;
                    }
                    if (dr["isother"].ToString() == "1")
                    {
                        rdother.Checked = true;
                    }
                    else
                    {
                        rdother.Checked = false;
                    }
                    if (dr["remarkbroker"].ToString() != "" && dr["remarkbroker"].ToString() != null)
                    {
                        divadv.Visible = true;
                        txtadvspecify.Text = dr["remarkbroker"].ToString();
                    }
                    else
                    {
                        divadv.Visible = false;
                        txtadvspecify.Text = "";
                    }
                    if (dr["iscmobile"].ToString() == "1")
                    {
                        rdmobile.Checked = true;
                    }
                    else
                    {
                        rdmobile.Checked = false;
                    }
                    if (dr["isctele"].ToString() == "1")
                    {
                        rdtele.Checked = true;
                    }
                    else
                    {
                        rdtele.Checked = false;
                    }
                    if (dr["iscletter"].ToString() == "1")
                    {
                        rdltr.Checked = true;
                    }
                    else
                    {
                        rdltr.Checked = false;
                    }
                    if (dr["iscemail"].ToString() == "1")
                    {
                        rdemails.Checked = true;
                    }
                    else
                    {
                        rdemails.Checked = false;
                    }





                    lbldarea.Text = dr["area"].ToString();
                    lbldbuilding.Text = dr["buildno"].ToString();
                    lbldcity.Text = dr["city"].ToString(); ;
                    lbldlandmark.Text = dr["landmark"].ToString();
                    lbldpincode.Text = dr["pincode"].ToString(); ;
                    lbldstate.Text = dr["state"].ToString();
                    lbldarea1.Text = dr["area1"].ToString();
                    lbldbuilding1.Text = dr["buildno1"].ToString();
                    lbldcity1.Text = dr["city1"].ToString(); ;
                    lbldlandmark1.Text = dr["landmark1"].ToString();
                    lbldpincode1.Text = dr["pincode1"].ToString(); ;
                    lbldstate1.Text = dr["state1"].ToString();

                    if (dr["isenduse"].ToString() == "1")
                    {
                        lbldenduse.Text = "End Use";
                    }
                    else
                    {
                        //lbldenduse.Text = "&nbsp  ";
                    }

                    if (dr["isinvestment"].ToString() == "1")
                    {
                        lbldenduse.Text = "Investment";
                    }
                    if (dr["isloan"].ToString() == "1")
                    {
                        lbldloan.Text = "Yes";
                    }
                    else
                    {
                        lbldloan.Text = "No";
                    }
                    if (dr["remarkloan"].ToString() != "" && dr["remarkloan"].ToString() != null)
                    {
                        divdremarkloan.Visible = true;
                        lbldremarkloan.Text = dr["remarkloan"].ToString();
                    }
                    else
                    {
                        divdremarkloan.Visible = false;
                    }
                    lbldremarkbooking.Text = dr["remark"].ToString();
                    if (dr["ishoarding"].ToString() == "1")
                    {
                        lbldadv.Text = "Hoarding";
                    }

                    if (dr["isemail"].ToString() == "1")
                    {
                        lbldadv.Text = "Emails";
                    }
                    if (dr["isweb"].ToString() == "1")
                    {
                        lbldadv.Text = "Website";
                    }
                    if (dr["isbroker"].ToString() == "1")
                    {
                        lbldadv.Text = "Broker";
                    }
                    if (dr["isacq"].ToString() == "1")
                    {
                        lbldadv.Text = "Acquaintance";
                    }
                    if (dr["isother"].ToString() == "1")
                    {
                        lbldadv.Text = "Other";
                    }
                    if (dr["remarkbroker"].ToString() != "" && dr["remarkbroker"].ToString() != null)
                    {
                        divdremarkadv.Visible = true;
                        lbldremarkadv.Text = dr["remarkbroker"].ToString();
                    }
                    else
                    {
                        divdremarkadv.Visible = false;
                    }
                    if (dr["iscmobile"].ToString() == "1")
                    {
                        lbldcon.Text = "Mobile";
                    }
                    if (dr["isctele"].ToString() == "1")
                    {
                        lbldcon.Text = "Telephone";
                    }
                    if (dr["iscletter"].ToString() == "1")
                    {
                        lbldcon.Text = "Letters";
                    }
                    if (dr["iscemail"].ToString() == "1")
                    {
                        lbldcon.Text = "Email";
                    }

                    dr.Close();
                }
                else
                {
                    dr.Close();
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
        protected void btnedit_Clicked(object sender, EventArgs e)
        {
            try
            {
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                LinkButton lnkcardclick = (LinkButton)sender;
                SqlCommand cmd = new SqlCommand("select *,convert(varchar,dob,110) as dob1 From customerbooking where id=@id", con);
                cmd.Parameters.AddWithValue("@id", lnkcardclick.CommandArgument.ToString());
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt24 = new DataTable();
                adp.Fill(dt24);
                if (dt24.Rows.Count > 0)
                {
                    DateTime date11;
                    //  lbltemp.Text = dt24.Rows[0]["dob1"].ToString();
                    //  string s = dt24.Rows[0]["dob1"].ToString().Replace('-', '/');
                    // lbltemp.Text = lbltemp.Text + " and" + dt24.Rows[0]["dob1"].ToString();
                    string s = dt24.Rows[0]["dob1"].ToString().Replace('-', '/');
                    string[] stringspilts = s.Split('/');
                    if (stringspilts.Length == 3)
                    {
                        DateTime dttd = GetDate(int.Parse(stringspilts[1]), int.Parse(stringspilts[0]), int.Parse(stringspilts[2]));
                        string str1 = CultureInfo.CurrentCulture.DateTimeFormat.ShortDatePattern;
                        txtdob.Text = String.Format("{0:yyyy-MM-dd}", dttd);
                    }
                    lblapplicant.Text = "Edit Details";

                    //for (int i = 0; i < stringspilts.Length; i++)
                    //{
                    //    Label lbltemp = (Label)Page.FindControl("lblt"+(i+1));
                    //    lbltemp.Text =stringspilts[i];
                    //}
                    //var formats = new[] { "M/d/yyyy", "MM/dd/yyyy","dd/MM/yyyy", "yyyy/MM/dd", "yyyy/MM/dd", "dd/MM/yy" , "M-d-yyyy", "MM-dd-yyyy", "dd-MM-yyyy", "yyyy-MM-dd", "yyyy-MM-dd", "dd-MM-yy" };
                    //if (DateTime.TryParseExact(s, formats, CultureInfo.InvariantCulture, DateTimeStyles.None, out date11) == true)
                    //{

                    //    DateTime dttd = GetDate(date11.Day, date11.Month, date11.Year);
                    //    string str1 = CultureInfo.CurrentCulture.DateTimeFormat.ShortDatePattern;
                    //    txtdob.Text = String.Format("{0:" + str1 + "}", dttd);
                    //}
                    //else
                    //{ 
                    //txtdob.Text = dt24.Rows[0]["dob1"].ToString();
                    //}
                    txtemail.Text = dt24.Rows[0]["emailid"].ToString();
                    // Session["columbiaemail"]= dt24.Rows[0]["emailid"].ToString();
                    txtmobileno.Text = dt24.Rows[0]["Mobileno"].ToString();
                    txtfirstname.Text = dt24.Rows[0]["firstname"].ToString(); ;
                    txtmiddlename.Text = dt24.Rows[0]["middlename"].ToString(); ;
                    txtlastname.Text = dt24.Rows[0]["lastname"].ToString(); ;
                    txtnationality.Text = dt24.Rows[0]["nationality"].ToString(); ;
                    //txttitle.Text = dr["title1"].ToString(); ;
                    txtpancard.Text = dt24.Rows[0]["panno"].ToString();
                    txtaadhaar.Text = dt24.Rows[0]["aadharno"].ToString();
                    ddsalutation.SelectedValue = dt24.Rows[0]["salutationid"].ToString();
                    pnlbookingformdisplay.Visible = true;
                    pnladdbookingdisplay.Visible = true;
                    pnladdbookingbtn.Visible = false;

                }
                else
                {

                    txtnationality.Text = "";
                    //txttitle.Text = "";
                    txtemail.Text = "";
                    txtfirstname.Text = "";
                    txtmiddlename.Text = "";
                    txtlastname.Text = "";
                    txtpancard.Text = "";
                    txtaadhaar.Text = "";
                    txtnationality.Text = "";
                    txtmobileno.Text = "";
                    txtdob.Text = "";

                }
                lnkaddbooking.CommandArgument = lnkcardclick.CommandArgument;

                lnkaddbooking.Text = "Update";
                // divrightbooking.Attributes["style"] = "display:block;";
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

        public static DateTime GetDate(int dd, int MM, int yyyy)
        {
            //This will give you month name array dynamically  
            string[] monthNames = System.Globalization.CultureInfo.CurrentCulture.DateTimeFormat.MonthGenitiveNames;
            //Date String dd-MM-yyyy(you can arrange in any formate of fixed formate also it givies you system date formate output)  
            string DateString = dd + monthNames[MM - 1] + yyyy;
            //It Take a dynamically system date pattern  
            string SystemDateFormate = CultureInfo.CurrentCulture.DateTimeFormat.ShortDatePattern;
            //Converting DateString into system date formate   
            string InputDate = Convert.ToDateTime(DateString).ToString(SystemDateFormate);
            //system date formate output  
            DateTime ResultedDate = DateTime.Parse(InputDate);
            return ResultedDate;
        }
        protected void btnpaymentredirect_Clicked(object sender, EventArgs e)
        {
            try
            {
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                if (chkterms.Checked)
                {
                    SqlCommand cmd = new SqlCommand("update customersteps set STATUS=@STATUS,ORIGINALSTATUS=@ORIGINALSTATUS,TRANSACTIONAMOUNT=@TRANSACTIONAMOUNT,isstep4=@isstep1,step4date=@step1date where stepid=@stepid", con);
                    cmd.Parameters.AddWithValue("@step1date", encryptdecrypt.indiandate());
                    cmd.Parameters.AddWithValue("@stepid", Session["stepid"].ToString());
                    cmd.Parameters.AddWithValue("@isstep1", 1);
                    cmd.Parameters.AddWithValue("@STATUS", "PENDING");
                    cmd.Parameters.AddWithValue("@ORIGINALSTATUS", "PENDING");
                    cmd.Parameters.AddWithValue("@TRANSACTIONAMOUNT", "1");
                    int k = cmd.ExecuteNonQuery();
                    Session["bookingform"] = "Submitted";
                    Session["step4"] = "Form";
                    Session["paymenttransaction"] = "1";
                    divstep4.CssClass = "borderleft lineheight20 displayinline step101 bottomborder";
                    divstep4a.CssClass = "borderleft lineheight20 displayinline step101 bottomborder";
                    divstep4b.CssClass = "borderleft lineheight20 displayinline step101 bottomborder";
                    ////divstep5.CssClass = "borderleft lineheight20 displayinline step101 bottomborder";
                    ////divstep5a.CssClass = "borderleft lineheight20 displayinline step101 bottomborder";
                    ////divstep5b.CssClass = "borderleft lineheight20 displayinline step101 bottomborder";
                    pnlunit.Visible = false;
                    pnlcostsheet.Visible = false;
                    pnlbookingform.Visible = false;
                    pnlpay.Visible = false;
                    pnlstep1.Visible = false;
                    pnlstep2.Visible = false;
                    pnlstep3.Visible = false;
                    pnlstep4.Visible = false;
                    pnlbookingform.Visible = false;
                    pnlpay.Visible = true;
                    lblheader.Text = "Thank you for booking! We will contact you soon !!!";
                    lblpaymentmsg.Text = "";
                    pnlsuccess.Visible = false;
                    pnlfailed.Visible = false;
                    pnlthanks.Visible = false;
                    pnlconfirmdoc.Visible = false;
                    //ScriptManager.RegisterStartupScript(Page, typeof(Page), "OpenWindow", "var Mleft = (screen.width/2)-(760/2);var Mtop = (screen.height/2)-(700/2);window.open( 'booking.aspx', null, 'height=700,width=760,status=yes,toolbar=no,scrollbars=yes,menubar=no,location=no,top=\'+Mtop+\', left=\'+Mleft+\'' );", true);
                    //string hash = "";
                    //hash += "BRAMHACORL" + "|";
                    //hash += Session["stepid"].ToString() + "|";
                    //hash += "NA" + "|";
                    //hash += "50000.0" + "|"; //set price
                    //hash += "NA" + "|";
                    //hash += "NA" + "|";
                    //hash += "NA" + "|";
                    //hash += "INR" + "|";
                    //hash += "NA" + "|";
                    //hash += "R" + "|";
                    //hash += "bramhacorl" + "|";
                    //hash += "NA" + "|";
                    //hash += "NA" + "|";
                    //hash += "F" + "|";
                    //if (txtemail.Text != "")
                    //{
                    //    hash += txtemail.Text + "|"; //set email
                    //}
                    //else
                    //{
                    //    hash += "NA" + "|"; //set email
                    //}
                    //if (txtmobileno.Text != "")
                    //{
                    //    hash += txtmobileno.Text + "|"; //set mobile
                    //}
                    //else
                    //{
                    //    hash += "NA" + "|"; //set emmobileail
                    //}
                    //hash += "NA" + "|";
                    //hash += Session["bankuid"].ToString() + "|";
                    //hash += "NA" + "|";
                    //hash += "NA" + "|";
                    //hash += "NA" + "|";
                    //hash += "NA" + "|";
                    //hash += "NA" + "|";
                    //hash += "NA"; 

                    //string checksumkeyvalue = GetHMACSHA256(hash, "5CyFI2gFot1EWrH611ghHMrUfbWfb2pJ");
                    //hash += "|" + checksumkeyvalue.ToUpper();
                    //Session["hashcheckkey"] = hash;
                    //timerdiv.Attributes["style"] = "display:none;";
                    //// ScriptManager.RegisterStartupScript(Page, typeof(Page), "OpenWindow", "var Mleft = (screen.width/2)-(760/2);var Mtop = (screen.height/2)-(700/2);window.open( 'checkout.aspx', null, 'height=700,width=760,status=yes,toolbar=no,scrollbars=yes,menubar=no,location=no,top=\'+Mtop+\', left=\'+Mleft+\'' );", true);

                    ////ScriptManager.RegisterStartupScript(Page, typeof(Page), "OpenWindow", "var Mleft = (screen.width/2)-(760/2);var Mtop = (screen.height/2)-(700/2);window.open( 'checkout.aspx', null, 'height=700,width=760,status=yes,toolbar=no,scrollbars=yes,menubar=no,location=no,top=\'+Mtop+\', left=\'+Mleft+\'' );", true);
                    //string strmail = "";
                    //cmd = new SqlCommand("select ROW_NUMBER() OVER (ORDER BY  a.id ) AS srno,  a.id, a.name as fname,mobileno,emailid,convert(varchar,dob,103) as dob1 ,* from customerbooking a where stepid='" + Session["stepid"].ToString() + "'", con);
                    //SqlDataAdapter adp = new SqlDataAdapter(cmd);
                    //DataTable dt = new DataTable();
                    //adp.Fill(dt);
                    //for (int i = 0; i < dt.Rows.Count; i++)
                    //{
                    //    if (strmail == "")
                    //    {
                    //        strmail = "<div   style=\"padding: 5px 20px 5px 5px; background: #424b57; border-radius: 0px 0px 90px 0px; color: white; display: inline-block; float: left; font-size: 13px;margin-top:10px\"> PERSONAL DETAILS FOR APPLICANT " + dt.Rows[i]["srno"].ToString() + " </div> <br/><div   style=\"text-align: left;margin-top:10px;\"> Title : <b>" + dt.Rows[i]["title1"].ToString() + "</b> <br/> First Name : <b>" + dt.Rows[i]["firstname"].ToString() + " </b>  <br/> Middle Name : <b>" + dt.Rows[i]["middlename"].ToString() + "</b><br/> Last Name : <b>" + dt.Rows[i]["lastname"].ToString() + " </b><br/> Mobile No. : <b>" + dt.Rows[i]["mobileno"].ToString() + " </b><br/> EmailID : " + dt.Rows[i]["emailid"].ToString() + " </b><br/> DOB : <b>" + dt.Rows[i]["DOB1"].ToString() + "</b><br/> Pancard No. : <b>" + dt.Rows[i]["panno"].ToString() + "</b><br/> Aadhaar No. : <b>" + dt.Rows[i]["aadharno"].ToString() + "</b><br/> Nationality : <b>" + dt.Rows[i]["nationality"].ToString() + "</b><br/> </div>";
                    //    }
                    //    else
                    //    {
                    //        strmail = strmail + "<div   style=\"padding: 5px 20px 5px 5px; background: #424b57; border-radius: 0px 0px 90px 0px; color: white; display: inline-block; float: left; font-size: 13px;margin-top:10px;\"> PERSONAL DETAILS FOR APPLICANT " + dt.Rows[i]["srno"].ToString() + " </div> <br/><div   style=\"text-align: left;margin-top:10px;\"> Title : <b>" + dt.Rows[i]["title1"].ToString() + "</b> <br/> First Name : <b>" + dt.Rows[i]["firstname"].ToString() + " </b>  <br/> Middle Name : <b>" + dt.Rows[i]["middlename"].ToString() + "</b><br/> Last Name : <b>" + dt.Rows[i]["lastname"].ToString() + " </b><br/> Mobile No. : <b>" + dt.Rows[i]["mobileno"].ToString() + " </b><br/> EmailID : " + dt.Rows[i]["emailid"].ToString() + " </b><br/> DOB : <b>" + dt.Rows[i]["DOB1"].ToString() + "</b><br/> Pancard No. : <b>" + dt.Rows[i]["panno"].ToString() + "</b><br/> Aadhaar No. : <b>" + dt.Rows[i]["aadharno"].ToString() + "</b><br/>  Nationality : <b>" + dt.Rows[i]["nationality"].ToString() + "</b><br/> </div>";
                    //    }
                    //}
                    string enduse = "";
                    string loan = "";
                    string loanremark = "";
                    string adv = "";
                    string advremark = "";
                    string dcon = "";
                    string buildno = "";
                    string area = "";
                    string landmark = "";
                    string city = "";
                    string state = "";
                    string pincode = "";
                    string buildno1 = "";
                    string area1 = "";
                    string landmark1 = "";
                    string city1 = "";
                    string state1 = "";
                    string pincode1 = "";
                    cmd = new SqlCommand("select * from customersteps where stepid='" + Session["stepid"].ToString() + "'", con);
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {

                        lblchkterms.Style.Remove("color");
                        dr.Read();
                        area = dr["area"].ToString();
                        buildno = dr["buildno"].ToString();
                        city = dr["city"].ToString(); ;
                        landmark = dr["landmark"].ToString();
                        pincode = dr["pincode"].ToString(); ;
                        state = dr["state"].ToString();
                        state1 = dr["area1"].ToString();
                        buildno1 = dr["buildno1"].ToString();
                        city1 = dr["city1"].ToString(); ;
                        landmark1 = dr["landmark1"].ToString();
                        pincode1 = dr["pincode1"].ToString(); ;
                        state1 = dr["state1"].ToString();
                        if (dr["isenduse"].ToString() == "1")
                        {
                            enduse = "End Use";
                        }
                        else
                        {
                            //lbldenduse.Text = "&nbsp  ";
                        }
                        if (dr["isinvestment"].ToString() == "1")
                        {
                            enduse = "Investment";
                        }
                        if (dr["isloan"].ToString() == "1")
                        {
                            loan = "Yes";
                        }
                        else
                        {
                            loan = "No";
                        }
                        if (dr["remarkloan"].ToString() != "" && dr["remarkloan"].ToString() != null)
                        {
                            loanremark = dr["remarkloan"].ToString();
                        }
                        else
                        {
                            loanremark = "";
                        }
                        if (dr["ishoarding"].ToString() == "1")
                        {
                            adv = "Hoarding";
                        }
                        if (dr["isemail"].ToString() == "1")
                        {
                            adv = "Emails";
                        }
                        if (dr["isweb"].ToString() == "1")
                        {
                            adv = "Website";
                        }
                        if (dr["isbroker"].ToString() == "1")
                        {
                            adv = "Broker";
                        }
                        if (dr["isacq"].ToString() == "1")
                        {
                            adv = "Acquaintance";
                        }
                        if (dr["isother"].ToString() == "1")
                        {
                            adv = "Other";
                        }
                        if (dr["remarkbroker"].ToString() != "" && dr["remarkbroker"].ToString() != null)
                        {
                            advremark = dr["remarkbroker"].ToString();
                        }
                        else
                        {
                            advremark = "";
                        }
                        if (dr["iscmobile"].ToString() == "1")
                        {
                            dcon = "Mobile";
                        }
                        if (dr["isctele"].ToString() == "1")
                        {
                            dcon = "Telephone";
                        }
                        if (dr["iscletter"].ToString() == "1")
                        {
                            dcon = "Letters";
                        }
                        if (dr["iscemail"].ToString() == "1")
                        {
                            dcon = "Email";
                        }
                        dr.Close();
                    }
                    else
                    {
                        dr.Close();
                    }



                    MailMessage mail = new MailMessage();
                    string htmlBody1 = "<!DOCTYPE html> <html> <head> <title>Booking</title> </head> <body> <div style=\"display: block; height: 100%; width: 100%;\"> <div class=\"lefts102 fontsize14 fontweight600 headercolor101 margintop20\"> <span class=\"displayinline backwhite heading101\"><b>Confirm EOI Details</b></span> </div> <div> <div style=\"padding: 0px 10px 10px 10px !important;\" class=\"margintop20\"> <div class=\"displayblock width600 textaligncenter marginleftauto  padding30 border101 costpadding\"> <div class=\"headercolor101 fontsize13 displayblock textalignleft\" style=\"padding: 5px 5px; background: #f9f9f9; border-radius: 0px 0px 90px 0px;\"> Project Name : <b>Bhui world</b>  &nbsp; &nbsp; <div style=\"display: inline-block\"> Unit No : <b> " + Session["unitdetails"].ToString() + " </b> </div> </div> <br />  <br/> <div  style=\"padding: 5px 20px 5px 5px; background: #f9f9f9; border-radius: 0px 0px 90px 0px; display: inline-block; float: left; font-size: 13px; text-transform: uppercase;\"> Communication Address </div> <br /> <div style=\"text-align: left;margin-top:10px;\"> Building/Flat No. : <b>" + buildno + "</b> <br /> Landmark : <b>" + landmark + " </b> <br /> Area : <b>" + area + " </b> <br /> City : <b>" + city + " </b> <br /> State : <b>" + state + " </b> <br /> Pincode : <b>" + pincode + " </b> </div> <br /> <div  style=\"padding: 5px 20px 5px 5px; background: #f9f9f9; border-radius: 0px 0px 90px 0px; display: inline-block; float: left; font-size: 13px; text-transform: uppercase;\"> Permanent Address </div> <br /><div style=\"text-align: left;margin-top:10px;\"> Building/Flat No. : <b>" + buildno1 + "</b> <br /> Landmark : <b>" + landmark1 + " </b> <br /> Area : <b>" + area1 + " </b> <br /> City : <b>" + city1 + " </b> <br /> State : <b>" + state1 + " </b> <br /> Pincode : <b>" + pincode1 + " </b> <br /> </div> <br /> <div   style=\"padding: 5px 20px 5px 5px; background: #424b57; border-radius: 0px 0px 90px 0px; color: white; display: inline-block; float: left; font-size: 13px;\"> OTHER INFORMATION </div> <br /> <div style=\"text-align: left;margin-top:10px;\"> Purchasing property for : <b>" + enduse + " </b> <br /> Will you be availing loan? : <b>" + loan + " </b> <br /> Remark : <b>" + loanremark + " </b> <br /> How did you hear about us? : <b>" + adv + " </b> <br /> Remark : <b>" + advremark + " </b> <br /> How would you like to be contacted? : <b>" + dcon + " </b> <br /> </div> </div> </div> </div></div> </body> </html>";
                    AlternateView htmlView1 = AlternateView.CreateAlternateViewFromString(htmlBody1, null, "text/html");
                    mail.IsBodyHtml = true;
                    mail.AlternateViews.Add(htmlView1);
                    mail.Subject = "New Booking";
                    mail.From = new MailAddress("bhumiworld2021@gmail.com");
                    mail.To.Add(Session["columbiaemail"].ToString());
                    mail.IsBodyHtml = true;
                    SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                    smtp.EnableSsl = true;
                    NetworkCredential netCre = new NetworkCredential("bhumiworld2021@gmail.com", "bhumi@2021");
                    smtp.Credentials = netCre;






                    //   MailMessage mail = new MailMessage();
                    //   string htmlBody1 = "<!DOCTYPE html> <html> <head> <title>Booking</title> </head> <body> <div style=\"display: block; height: 100%; width: 100%;\"> <div class=\"lefts102 fontsize14 fontweight600 headercolor101 margintop20\"> <span class=\"displayinline backwhite heading101\"><b>Confirm EOI Details</b></span> </div> <div> <div style=\"padding: 0px 10px 10px 10px !important;\" class=\"margintop20\"> <div class=\"displayblock width600 textaligncenter marginleftauto  padding30 border101 costpadding\"> <div class=\"headercolor101 fontsize13 displayblock textalignleft\" style=\"padding: 5px 5px; background: #f9f9f9; border-radius: 0px 0px 90px 0px;\"> Project Name : <b>The Virtuoso</b>  &nbsp; &nbsp; <div style=\"display: inline-block\"> Unit No : <b> " + Session["unitdetails"].ToString() + " </b> </div> </div> <br />  <br/> <div  style=\"padding: 5px 20px 5px 5px; background: #f9f9f9; border-radius: 0px 0px 90px 0px; display: inline-block; float: left; font-size: 13px; text-transform: uppercase;\"> Communication Address </div> <br /> <div style=\"text-align: left;margin-top:10px;\"> Building/Flat No. : <b>" + buildno + "</b> <br /> Landmark : <b>" + landmark + " </b> <br /> Area : <b>" + area + " </b> <br /> City : <b>" + city + " </b> <br /> State : <b>" + state + " </b> <br /> Pincode : <b>" + pincode + " </b> </div> <br /> <div  style=\"padding: 5px 20px 5px 5px; background: #f9f9f9; border-radius: 0px 0px 90px 0px; display: inline-block; float: left; font-size: 13px; text-transform: uppercase;\"> Permanent Address </div> <br /><div style=\"text-align: left;margin-top:10px;\"> Building/Flat No. : <b>" + buildno1 + "</b> <br /> Landmark : <b>" + landmark1 + " </b> <br /> Area : <b>" + area1 + " </b> <br /> City : <b>" + city1 + " </b> <br /> State : <b>" + state1 + " </b> <br /> Pincode : <b>" + pincode1 + " </b> <br /> </div> <br /> <div   style=\"padding: 5px 20px 5px 5px; background: #424b57; border-radius: 0px 0px 90px 0px; color: white; display: inline-block; float: left; font-size: 13px;\"> OTHER INFORMATION </div> <br /> <div style=\"text-align: left;margin-top:10px;\"> Purchasing property for : <b>" + enduse + " </b> <br /> Will you be availing loan? : <b>" + loan + " </b> <br /> Remark : <b>" + loanremark + " </b> <br /> How did you hear about us? : <b>" + adv + " </b> <br /> Remark : <b>" + advremark + " </b> <br /> How would you like to be contacted? : <b>" + dcon + " </b> <br /> </div> </div> </div> </div></div> </body> </html>";
                    //   AlternateView htmlView1 = AlternateView.CreateAlternateViewFromString(htmlBody1, null, "text/html");
                    //   mail.IsBodyHtml = true;
                    //   mail.AlternateViews.Add(htmlView1);
                    //   mail.Subject = "New Booking";
                    //   mail.From = new MailAddress("columbiaavnir20@gmail.com");
                    //   mail.To.Add(Session["columbiaemail"].ToString());
                    //// mail.To.Add(encryptdecrypt.Decrypt(Session["executiveemailid"].ToString()));
                    //   mail.IsBodyHtml = true;
                    //   SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                    //   smtp.EnableSsl = true;
                    //   NetworkCredential netCre = new NetworkCredential("columbiaavnir20@gmail.com", "avnir@123");
                    //   smtp.Credentials = netCre;
                    try
                    {
                        smtp.Send(mail);
                    }
                    catch (Exception ex)
                    {
                    }

                    timerbooking.Enabled = true;
                    //  Response.Redirect("checkout.aspx", false);

                }
                else
                {
                    lblchkterms.Style.Add("color", "red");
                }
            }
            catch (Exception er)
            {
            }
            finally
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
                filldbooking();
            }
        }
        public string GetHMACSHA256(string text, string key)
        {
            UTF8Encoding encoder = new UTF8Encoding();
            byte[] hashValue;
            byte[] keybyt = encoder.GetBytes(key);
            byte[] message = encoder.GetBytes(text);
            HMACSHA256 hashString = new HMACSHA256(keybyt);
            string hex = "";
            hashValue = hashString.ComputeHash(message);
            foreach (byte x in hashValue)
            {
                hex += String.Format("{0:x2}", x);
            }
            return hex;
        }


        protected void btnbuyer_Clicked(object sender, EventArgs e)
        {
            pnlother.Visible = false;
            pnlbuyer.Visible = true;
            pnllocation.Visible = false;
        }

        protected void btnlocation_Clicked(object sender, EventArgs e)
        {
            if (Session["nextvalue"].ToString() != "1")
            {
                return;
            }
            pnllocation.Visible = true;
            pnlbuyer.Visible = false;
            pnlother.Visible = false;
            lnkbuyer.CssClass = "bookingbtn101 borderleft lineheight20 displayinline step101 bottomborder";
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "scrolltopevent", " $('html, body').animate({ scrollTop: $(\"body\").offset().top }, 500);", true);


        }
        protected void btnother_Clicked(object sender, EventArgs e)
        {
            if (txtbuilding.Text != "" && txtarea.Text != "" && txtpincode.Text.Length == 6 && txtpincode1.Text.Length == 6 && txtpincode.Text != "" && txtbuilding1.Text != "" && txtarea1.Text != "" && txtcity1.Text != "" && txtcity.Text != "" && txtstate.Text != "" && txtstate1.Text != "" && txtpincode1.Text != "")
            {

                try
                {
                    if (Session["nextvalue"].ToString() != "1")
                    {
                        return;
                    }

                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("update customersteps set unitid=@unitid, isstep4=@isstep1,step4date=@step1date,buildno=@buildno,landmark=@landmark,area=@area,pincode=@pincode,buildno1=@buildno1,landmark1=@landmark1,area1=@area1,city1=@city1,state1=@state1,city=@city,state=@state,pincode1=@pincode1,isenduse=@isenduse,isinvestment=@isinvestment,isloan=@isloan,remarkloan=@remarkloan,ishoarding=@ishoarding,isemail=@isemail,isweb=@isweb,isbroker=@isbroker,remarkbroker=@remarkbroker,isacq=@isacq,isother=@isother,iscmobile=@iscmobile,isctele=@isctele,iscemail=@iscemail,iscletter=@iscletter,remark=@remark  where stepid=@stepid", con);
                    cmd.Parameters.AddWithValue("@step1date", encryptdecrypt.indiandate());
                    cmd.Parameters.AddWithValue("@stepid", Session["stepid"].ToString());
                    cmd.Parameters.AddWithValue("@unitid", lnkrightbook.CommandArgument);
                    cmd.Parameters.AddWithValue("@isstep1", 0);
                    cmd.Parameters.AddWithValue("@remark", txtaddremark.Text);

                    cmd.Parameters.AddWithValue("@buildno", txtbuilding.Text);
                    cmd.Parameters.AddWithValue("@landmark", txtlandmark.Text);
                    cmd.Parameters.AddWithValue("@area", txtarea.Text);
                    cmd.Parameters.AddWithValue("@pincode", txtpincode.Text);
                    cmd.Parameters.AddWithValue("@buildno1", txtbuilding1.Text);
                    cmd.Parameters.AddWithValue("@landmark1", txtlandmark1.Text);
                    cmd.Parameters.AddWithValue("@area1", txtarea1.Text);
                    cmd.Parameters.AddWithValue("@city1", txtcity1.Text);
                    cmd.Parameters.AddWithValue("@city", txtcity.Text);
                    cmd.Parameters.AddWithValue("@state", txtstate.Text);
                    cmd.Parameters.AddWithValue("@state1", txtstate1.Text);
                    cmd.Parameters.AddWithValue("@pincode1", txtpincode1.Text);
                    if (rdenduse.Checked)
                    {
                        cmd.Parameters.AddWithValue("@isenduse", "1");
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@isenduse", "0");
                    }
                    if (rdinvestment.Checked)
                    {
                        cmd.Parameters.AddWithValue("@isinvestment", "1");
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@isinvestment", "0");
                    }
                    if (rdyes.Checked)
                    {
                        cmd.Parameters.AddWithValue("@remarkloan", txtloanspecify.Text);
                        cmd.Parameters.AddWithValue("@isloan", "1");
                    }
                    else if (rdno.Checked)
                    {
                        cmd.Parameters.AddWithValue("@isloan", "0");
                        cmd.Parameters.AddWithValue("@remarkloan", "");
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@isloan", "0");
                        cmd.Parameters.AddWithValue("@remarkloan", "");
                    }


                    if (rdhoarding.Checked)
                    {
                        cmd.Parameters.AddWithValue("@ishoarding", "1");
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@ishoarding", "0");
                    }
                    if (rdemail.Checked)
                    {
                        cmd.Parameters.AddWithValue("@isemail", "1");
                    }
                    else
                    { cmd.Parameters.AddWithValue("@isemail", "0"); }

                    if (rdweb.Checked)
                    {
                        cmd.Parameters.AddWithValue("@isweb", "1");
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@isweb", "0");
                    }
                    if (rdbroker.Checked)
                    {
                        cmd.Parameters.AddWithValue("@isbroker", "1");

                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@isbroker", "0");

                    }
                    if (rdother.Checked)
                    {
                        cmd.Parameters.AddWithValue("@remarkbroker", txtadvspecify.Text);
                    }
                    else if (rdbroker.Checked)
                    {
                        cmd.Parameters.AddWithValue("@remarkbroker", txtadvspecify.Text);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@remarkbroker", "");
                    }

                    if (rdacq.Checked)
                    {
                        cmd.Parameters.AddWithValue("@isacq", "1");
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@isacq", "0");
                    }
                    if (rdother.Checked)
                    {
                        cmd.Parameters.AddWithValue("@isother", "1");

                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@isother", "0");

                    }


                    if (rdmobile.Checked)
                    {
                        cmd.Parameters.AddWithValue("@iscmobile", "1");
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@iscmobile", "0");
                    }

                    if (rdtele.Checked)
                    {
                        cmd.Parameters.AddWithValue("@isctele", "1");
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@isctele", "0");
                    }

                    if (rdemails.Checked)
                    {
                        cmd.Parameters.AddWithValue("@iscemail", "1");
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@iscemail", "0");
                    }

                    if (rdltr.Checked)
                    {
                        cmd.Parameters.AddWithValue("@iscletter", "1");
                    }
                    else
                    { cmd.Parameters.AddWithValue("@iscletter", "0"); }

                    int k = cmd.ExecuteNonQuery();
                    txtbuilding.Style.Remove("border-color");
                    txtarea.Style.Remove("border-color");
                    txtpincode.Style.Remove("border-color");
                    txtpincode1.Style.Remove("border-color");
                    txtarea1.Style.Remove("border-color");
                    txtbuilding1.Style.Remove("border-color");
                    txtcity1.Style.Remove("border-color");
                    txtcity.Style.Remove("border-color");
                    txtstate.Style.Remove("border-color");
                    txtstate1.Style.Remove("border-color");

                }

                catch (Exception er)
                {

                }
                finally
                {
                    if (con.State == ConnectionState.Open)
                    {
                        con.Close();
                    }

                }
                pnllocation.Visible = false;
                pnlbuyer.Visible = false;
                pnlother.Visible = true;
                // lnkother.CssClass = "bookingbtn101 borderleft lineheight20 displayinline step101 bottomborder";
                lnklocation.CssClass = "bookingbtn102 borderleft lineheight20 displayinline step101 bottomborder";
            }
            else
            {

                if (txtbuilding.Text == "")
                {
                    txtbuilding.Style.Add("border-color", "red");

                }
                else
                {
                    txtbuilding.Style.Remove("border-color");

                }
                if (txtbuilding1.Text == "")
                {
                    txtbuilding1.Style.Add("border-color", "red");

                }
                else
                {
                    txtbuilding1.Style.Remove("border-color");

                }
                if (txtarea1.Text == "")
                {
                    txtarea1.Style.Add("border-color", "red");

                }
                else
                {
                    txtarea1.Style.Remove("border-color");

                }
                if (txtcity1.Text == "")
                {
                    txtcity1.Style.Add("border-color", "red");

                }
                else
                {
                    txtcity1.Style.Remove("border-color");

                }
                if (txtcity.Text == "")
                {
                    txtcity.Style.Add("border-color", "red");

                }
                else
                {
                    txtcity.Style.Remove("border-color");

                }
                if (txtstate.Text == "")
                {
                    txtstate.Style.Add("border-color", "red");

                }
                else
                {
                    txtstate.Style.Remove("border-color");

                }
                if (txtstate1.Text == "")
                {
                    txtstate1.Style.Add("border-color", "red");

                }
                else
                {
                    txtstate1.Style.Remove("border-color");

                }

                if (txtarea.Text == "")
                {
                    txtarea.Style.Add("border-color", "red");

                }
                else
                {
                    txtarea.Style.Remove("border-color");

                }

                if (txtpincode.Text == "" || txtpincode.Text.Length != 6)
                {
                    txtpincode.Style.Add("border-color", "red");

                }
                else
                {
                    txtpincode.Style.Remove("border-color");

                }
                if (txtpincode1.Text == "" || txtpincode1.Text.Length != 6)
                {
                    txtpincode1.Style.Add("border-color", "red");

                }
                else
                {
                    txtpincode1.Style.Remove("border-color");

                }
            }

        }

        protected void RadioButton8_CheckedChanged(object sender, EventArgs e)
        {
            try
            {

            }
            catch (Exception er)
            {
            }
        }

        protected void lnkbookingdele_Click(object sender, EventArgs e)
        {
            try
            {
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                LinkButton lnkcardclick = (LinkButton)sender;
                SqlCommand cmd = new SqlCommand("Delete From customerbooking where id=@id", con);
                cmd.Parameters.AddWithValue("@id", lnkcardclick.CommandArgument.ToString());
                cmd.ExecuteNonQuery();
                fillbooking();

            }
            catch (Exception er)
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

        protected void rdyes_CheckedChanged(object sender, EventArgs e)
        {
            if (rdyes.Checked)
            {
                divloan.Visible = true;
            }
            else
            {
                divloan.Visible = false;
            }
        }

        protected void rdother_CheckedChanged(object sender, EventArgs e)
        {
            if (rdother.Checked)
            {
                divadv.Visible = true;
                Label17.Text = "Please Specify";

                return;
            }
            else
            {
                divadv.Visible = false;
            }

            if (rdbroker.Checked)
            {
                divadv.Visible = true;
                Label17.Text = "Please Specify Broker Name";
            }
            else
            {
                divadv.Visible = false;
            }

        }

        protected void lnkprev_Click(object sender, EventArgs e)
        {
            pnllocation.Visible = false;
            pnlbuyer.Visible = true;
            pnlother.Visible = false;
        }

        protected void lnkconti_Click(object sender, EventArgs e)
        {
            //int kbroker=0;
            //if (rdbroker.Checked && txtadvspecify.Text!="")
            //  {

            //      kbroker = 1;
            //  }
            //else

            if (txtbuilding.Text != "" && txtarea.Text != "" && txtpincode.Text.Length == 6 && txtpincode1.Text.Length == 6 && txtpincode.Text != "" && txtbuilding1.Text != "" && txtarea1.Text != "" && txtcity1.Text != "" && txtcity.Text != "" && txtstate.Text != "" && txtstate1.Text != "" && txtpincode1.Text != "" && (rdenduse.Checked || rdinvestment.Checked) && (rdyes.Checked || rdno.Checked) && ((rdhoarding.Checked || rdemail.Checked || rdweb.Checked || rdacq.Checked || rdother.Checked) || (rdbroker.Checked && txtadvspecify.Text != "")) && (rdmobile.Checked || rdtele.Checked || rdltr.Checked || rdemails.Checked))
            {
                try
                {
                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("update customersteps set unitid=@unitid, isstep4=@isstep1,step4date=@step1date,buildno=@buildno,landmark=@landmark,area=@area,pincode=@pincode,buildno1=@buildno1,landmark1=@landmark1,area1=@area1,city1=@city1,state1=@state1,city=@city,state=@state,pincode1=@pincode1,isenduse=@isenduse,isinvestment=@isinvestment,isloan=@isloan,remarkloan=@remarkloan,ishoarding=@ishoarding,isemail=@isemail,isweb=@isweb,isbroker=@isbroker,remarkbroker=@remarkbroker,isacq=@isacq,isother=@isother,iscmobile=@iscmobile,isctele=@isctele,iscemail=@iscemail,iscletter=@iscletter,remark=@remark  where stepid=@stepid", con);
                    cmd.Parameters.AddWithValue("@step1date", encryptdecrypt.indiandate());
                    cmd.Parameters.AddWithValue("@stepid", Session["stepid"].ToString());
                    cmd.Parameters.AddWithValue("@unitid", lnkrightbook.CommandArgument);
                    cmd.Parameters.AddWithValue("@isstep1", 0);
                    cmd.Parameters.AddWithValue("@remark", txtaddremark.Text);

                    cmd.Parameters.AddWithValue("@buildno", txtbuilding.Text);
                    cmd.Parameters.AddWithValue("@landmark", txtlandmark.Text);
                    cmd.Parameters.AddWithValue("@area", txtarea.Text);
                    cmd.Parameters.AddWithValue("@pincode", txtpincode.Text);
                    cmd.Parameters.AddWithValue("@buildno1", txtbuilding1.Text);
                    cmd.Parameters.AddWithValue("@landmark1", txtlandmark1.Text);
                    cmd.Parameters.AddWithValue("@area1", txtarea1.Text);
                    cmd.Parameters.AddWithValue("@city1", txtcity1.Text);
                    cmd.Parameters.AddWithValue("@city", txtcity.Text);
                    cmd.Parameters.AddWithValue("@state1", txtstate1.Text);
                    cmd.Parameters.AddWithValue("@state", txtstate.Text);
                    cmd.Parameters.AddWithValue("@pincode1", txtpincode1.Text);
                    if (rdenduse.Checked)
                    {
                        cmd.Parameters.AddWithValue("@isenduse", "1");
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@isenduse", "0");
                    }
                    if (rdinvestment.Checked)
                    {
                        cmd.Parameters.AddWithValue("@isinvestment", "1");
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@isinvestment", "0");
                    }
                    if (rdyes.Checked)
                    {
                        cmd.Parameters.AddWithValue("@isloan", "1");

                        cmd.Parameters.AddWithValue("@remarkloan", txtloanspecify.Text);
                    }
                    else if (rdno.Checked)
                    {
                        cmd.Parameters.AddWithValue("@isloan", "0");

                        cmd.Parameters.AddWithValue("@remarkloan", "");
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@isloan", "0");

                        cmd.Parameters.AddWithValue("@remarkloan", "");
                    }

                    if (rdhoarding.Checked)
                    {
                        cmd.Parameters.AddWithValue("@ishoarding", "1");
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@ishoarding", "0");
                    }
                    if (rdemail.Checked)
                    {
                        cmd.Parameters.AddWithValue("@isemail", "1");
                    }
                    else
                    { cmd.Parameters.AddWithValue("@isemail", "0"); }

                    if (rdweb.Checked)
                    {
                        cmd.Parameters.AddWithValue("@isweb", "1");
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@isweb", "0");
                    }
                    if (rdbroker.Checked)
                    {
                        cmd.Parameters.AddWithValue("@isbroker", "1");

                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@isbroker", "0");
                    }

                    if (rdacq.Checked)
                    {
                        cmd.Parameters.AddWithValue("@isacq", "1");
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@isacq", "0");
                    }
                    if (rdother.Checked)
                    {


                        cmd.Parameters.AddWithValue("@isother", "1");
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@isother", "0");

                    }
                    if (rdother.Checked)
                    {
                        cmd.Parameters.AddWithValue("@remarkbroker", txtadvspecify.Text);
                    }
                    else if (rdbroker.Checked)
                    {
                        cmd.Parameters.AddWithValue("@remarkbroker", txtadvspecify.Text);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@remarkbroker", "");
                    }


                    if (rdmobile.Checked)
                    {
                        cmd.Parameters.AddWithValue("@iscmobile", "1");
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@iscmobile", "0");
                    }

                    if (rdtele.Checked)
                    {
                        cmd.Parameters.AddWithValue("@isctele", "1");
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@isctele", "0");
                    }

                    if (rdemails.Checked)
                    {
                        cmd.Parameters.AddWithValue("@iscemail", "1");
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@iscemail", "0");
                    }

                    if (rdltr.Checked)
                    {
                        cmd.Parameters.AddWithValue("@iscletter", "1");
                    }
                    else
                    { cmd.Parameters.AddWithValue("@iscletter", "0"); }

                    int k = cmd.ExecuteNonQuery();

                    //divstep5.CssClass = "borderleft lineheight20 displayinline step101 bottomborder";
                    //divstep5a.CssClass = "borderleft lineheight20 displayinline step101 bottomborder";
                    //divstep5b.CssClass = "borderleft lineheight20 displayinline step101 bottomborder";

                    pnlunit.Visible = false;
                    pnlcostsheet.Visible = false;
                    pnlbookingform.Visible = false;
                    pnlpay.Visible = false;
                    pnlstep1.Visible = false;
                    pnlstep2.Visible = false;
                    pnlstep3.Visible = false;
                    pnlstep4.Visible = false;
                    pnlbookingform.Visible = false;
                    pnlpay.Visible = false;
                    pnlconfirmdoc.Visible = true;
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "scrolltopevent", " $('html, body').animate({ scrollTop: $(\"body\").offset().top }, 500);", true);
                    txtbuilding.Style.Remove("border-color");
                    txtarea.Style.Remove("border-color");
                    txtpincode.Style.Remove("border-color");
                    txtpincode1.Style.Remove("border-color");
                    txtarea1.Style.Remove("border-color");
                    txtbuilding1.Style.Remove("border-color");
                    txtcity1.Style.Remove("border-color");
                    txtcity.Style.Remove("border-color");
                    txtstate.Style.Remove("border-color");
                    txtstate1.Style.Remove("border-color");
                    Label17.Style.Remove("color");
                    Label11.Style.Remove("color");
                    Label12.Style.Remove("color");
                    Label13.Style.Remove("color");
                    Label15.Style.Remove("color");


                    //ScriptManager.RegisterStartupScript(Page, typeof(Page), "OpenWindow", "var Mleft = (screen.width/2)-(760/2);var Mtop = (screen.height/2)-(700/2);window.open( 'booking.aspx', null, 'height=700,width=760,status=yes,toolbar=no,scrollbars=yes,menubar=no,location=no,top=\'+Mtop+\', left=\'+Mleft+\'' );", true);
                }
                catch (Exception er)
                {

                }
                finally
                {
                    if (con.State == ConnectionState.Open)
                    {
                        con.Close();
                    }
                    filldbooking();
                }

            }
            else
            {
                if (rdenduse.Checked || rdinvestment.Checked)
                {
                    Label11.Style.Remove("color");

                }
                else
                {
                    Label11.Style.Add("color", "red");

                }
                if (rdyes.Checked || rdno.Checked)
                {
                    Label12.Style.Remove("color");

                }
                else
                {
                    Label12.Style.Add("color", "red");

                }
                if (((rdhoarding.Checked || rdemail.Checked || rdweb.Checked || rdacq.Checked || rdother.Checked) || (rdbroker.Checked && txtadvspecify.Text != "")))
                {
                    Label13.Style.Remove("color");
                    if (rdbroker.Checked && txtadvspecify.Text == "")
                    {
                        Label17.Style.Add("color", "red");


                    }
                }
                else
                {
                    Label13.Style.Add("color", "red");


                }
                if (rdmobile.Checked || rdtele.Checked || rdltr.Checked || rdemails.Checked)
                {
                    Label15.Style.Remove("color");

                }
                else
                {
                    Label15.Style.Add("color", "red");

                }



                if (txtbuilding.Text == "")
                {
                    txtbuilding.Style.Add("border-color", "red");

                }
                else
                {
                    txtbuilding.Style.Remove("border-color");

                }
                if (txtbuilding1.Text == "")
                {
                    txtbuilding1.Style.Add("border-color", "red");

                }
                else
                {
                    txtbuilding1.Style.Remove("border-color");

                }
                if (txtarea1.Text == "")
                {
                    txtarea1.Style.Add("border-color", "red");

                }
                else
                {
                    txtarea1.Style.Remove("border-color");

                }
                if (txtcity1.Text == "")
                {
                    txtcity1.Style.Add("border-color", "red");

                }
                else
                {
                    txtcity1.Style.Remove("border-color");

                }
                if (txtcity.Text == "")
                {
                    txtcity.Style.Add("border-color", "red");

                }
                else
                {
                    txtcity.Style.Remove("border-color");

                }
                if (txtstate.Text == "")
                {
                    txtstate.Style.Add("border-color", "red");

                }
                else
                {
                    txtstate.Style.Remove("border-color");

                }
                if (txtstate1.Text == "")
                {
                    txtstate1.Style.Add("border-color", "red");

                }
                else
                {
                    txtstate1.Style.Remove("border-color");

                }

                if (txtarea.Text == "")
                {
                    txtarea.Style.Add("border-color", "red");

                }
                else
                {
                    txtarea.Style.Remove("border-color");

                }

                if (txtpincode.Text == "" || txtpincode.Text.Length != 6)
                {
                    txtpincode.Style.Add("border-color", "red");

                }
                else
                {
                    txtpincode.Style.Remove("border-color");

                }
                if (txtpincode1.Text == "" || txtpincode1.Text.Length != 6)
                {
                    txtpincode1.Style.Add("border-color", "red");

                }
                else
                {
                    txtpincode1.Style.Remove("border-color");

                }
            }
        }

        protected void lnkpre1_Click(object sender, EventArgs e)
        {
            pnllocation.Visible = true;
            pnlbuyer.Visible = false;
            pnlother.Visible = false;
            lnkbuyer.CssClass = "bookingbtn101 borderleft lineheight20 displayinline step101 bottomborder";
        }

        protected void timerbooking_Tick(object sender, EventArgs e)
        {
            //Session["startDate"] = DateTime.Now;
            //if (Session["endDate"]==null)
            //{
            //    Session["endDate"] = DateTime.Now.AddMinutes(15);
            //}
            ////Session["endDate"] = DateTime.Now.AddMinutes(15);
            //string timediff = CalculateTimeDifference(Convert.ToDateTime(Session["startDate"]), Convert.ToDateTime(Session["endDate"]));
            //lblunittimer.Text = timediff;
            //lblschedule.Text = timediff;
            //lblbookingform.Text = timediff;
            //lblpay.Text = timediff;
            //lblconf.Text = timediff;
            //lblunittimer.Text = CalculateTimeDifference(Convert.ToDateTime(Session["startDate"]), Convert.ToDateTime(Session["endDate"]));
        }

        //public string CalculateTimeDifference(DateTime startDate, DateTime endDate)
        //{
        //    int days = 0; int hours = 0; int mins = 0; int secs = 0;
        //    string final = string.Empty;
        //    if (endDate > startDate)
        //    {
        //        //days = (endDate - startDate).Days;
        //        //hours = (endDate - startDate).Hours;
        //        mins = (endDate - startDate).Minutes;
        //        secs = (endDate - startDate).Seconds;
        //        //final = string.Format("{0} days {1} hours {2} mins {3} secs", days, hours, mins, secs);
        //        final = string.Format("{0}:{1}", mins, secs);
        //        //Session["startDate"] = Convert.ToDateTime(Session["startDate"]).AddMinutes(-mins).AddSeconds(-secs);
        //        // Session["endDate"]=
        //        if (final == "00:00")
        //        {
        //            
        //            Session["startDate"] = null;
        //            Session["endDate"] = null;
        //            Response.Redirect("index.aspx", false);
        //        }
        //    }
        //    else
        //    {

        //    }
        //    return final;
        //}


        protected void btn1click(object sender, EventArgs e)
        {





        }

        protected void btn2click(object sender, EventArgs e)
        {

        }
        protected void btn3click(object sender, EventArgs e)
        {

        }
        protected void btn4click(object sender, EventArgs e)
        {

        }
        protected void btn5click(object sender, EventArgs e)
        {

        }
        protected void btn6click(object sender, EventArgs e)
        {

        }

        protected void btnpreviouswingclicked(object sender, EventArgs e)
        {


        }
        protected void lnkconfigselectclicked(object sender, EventArgs e)
        {
            //LinkButton lnkcardclick = (LinkButton)sender;

            displayrecords(ddtower.SelectedValue);
            pnlunitdetails.Visible = true;
            divbody.Attributes["style"] = "background:#fff";

        }

        protected void btnopenspin_Clicked(object sender, EventArgs e)
        {
            try
            {
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
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
            divspin.Attributes["style"] = "display:block;";
            //     ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myfuneddd", "myfunction();", true);
        }
        protected void btnspin_Clicked(object sender, EventArgs e)
        {
            //canvacolor.Value = "['#b8282e', '#424b57', '#b8282e', '#424b57', '#b8282e', '#424b57', '#b8282e', '#424b57'];";
            //canvalabel.Value = "['10', '200', '50', '100', '5', '500', '0', 'jPOT'];"; 
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myfuneddd", "myfunction();", true);
        }
        protected void lnkprebook_Click(object sender, EventArgs e)
        {
            try
            {
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }

                pnlunit.Visible = false;
                pnlcostsheet.Visible = false;
                pnlschedule.Visible = false;
                pnlbookingform.Visible = true;
                pnlbookingforminside.Visible = true;
                pnlpay.Visible = false;
                pnlstep1.Visible = false;
                pnlstep2.Visible = false;
                pnlstep3.Visible = false;
                pnlstep4.Visible = true;
                pnlstep5.Visible = false;
                pnlconfirmdoc.Visible = false;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "scrolltopevent", " $('html, body').animate({ scrollTop: $(\"body\").offset().top }, 500);", true);

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
        protected void lnktimertick_Click(object sender, EventArgs e)
        {

            try
            {
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                if (Session["stepid"] != null)
                {
                    SqlCommand cmd424kh = new SqlCommand("Select  isnull(isbookingdone,0) as isbookingdone   from customersteps   where (isnull(isbookingdone,0)>0) and   stepid=@id", con);
                    cmd424kh.Parameters.AddWithValue("@id", Session["stepid"].ToString());
                    SqlDataAdapter da24kh = new SqlDataAdapter(cmd424kh);
                    DataTable dt24kh = new DataTable();
                    da24kh.Fill(dt24kh);
                    if (dt24kh.Rows.Count > 0)
                    {
                        if (dt24kh.Rows[0]["isbookingdone"].ToString() == "1")
                        {
                            lblheader.Text = "Congratulations";
                            lblpaymentmsg.Text = "You have successfully blocked your Unit in The Virtuoso project. Our team will get in touch with you shortly.";
                            Session["payment"] = "Successful";
                            pnlfailed.Visible = false;
                            pnlsuccess.Visible = true;
                            pnlthanks.Visible = true;
                            timerbooking.Enabled = false;
                        }
                        else if (dt24kh.Rows[0]["isbookingdone"].ToString() == "2")
                        {
                            Session["payment"] = "Failed";
                            pnlsuccess.Visible = false;
                            pnlfailed.Visible = true;
                            lblheader.Text = "Payment";
                            lblpaymentmsg.Text = "Transaction failed. Please try again.";
                            timerbooking.Enabled = false;

                        }
                    }
                    divstep1.CssClass = "borderleft lineheight20 displayinline step101 bottomborder";
                    divstep1a.CssClass = "borderleft lineheight20 displayinline step101 bottomborder";
                    divstep1b.CssClass = "borderleft lineheight20 displayinline step101 bottomborder";
                    divstep2.CssClass = "borderleft lineheight20 displayinline step101 bottomborder";
                    divstep2a.CssClass = "borderleft lineheight20 displayinline step101 bottomborder";
                    divstep2b.CssClass = "borderleft lineheight20 displayinline step101 bottomborder";
                    divstep3.CssClass = "borderleft lineheight20 displayinline step101 bottomborder";
                    divstep3a.CssClass = "borderleft lineheight20 displayinline step101 bottomborder";
                    divstep3b.CssClass = "borderleft lineheight20 displayinline step101 bottomborder";
                    divstep4.CssClass = "borderleft lineheight20 displayinline step101 bottomborder";
                    divstep4a.CssClass = "borderleft lineheight20 displayinline step101 bottomborder";
                    divstep4b.CssClass = "borderleft lineheight20 displayinline step101 bottomborder";
                    divstep5.CssClass = "borderleft lineheight20 displayinline step101 bottomborder";
                    divstep5a.CssClass = "borderleft lineheight20 displayinline step101 bottomborder";
                    divstep5b.CssClass = "borderleft lineheight20 displayinline step101 bottomborder";

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
    }
}