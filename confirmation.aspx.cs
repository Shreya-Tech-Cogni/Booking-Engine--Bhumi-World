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
namespace bramhacorp
{
    public partial class confirmation : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["temp.Properties.Settings.tempConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                try
                {
                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }
                    string _paymentResp = Request.Form["msg"];
                    Session["unitdetails"] = "";
                    Session["step1"] = "Unit Details";
                    Session["costsheet"] = "Agreed";
                    Session["step2"] = "Cost Sheet";
                    Session["paymentschedule"] = "Agreed";
                    Session["step3"] = "Schedule";
                    Session["bookingform"] = "Submitted";
                    Session["step4"] = "Form";
                    Session["payment"] = "Failed";
                    Session["step5"] = "Payment";
                    Session["regfees"] = "50,000";
                    if (_paymentResp != "")
                    {

                        string[] arrResponse = _paymentResp.Split('|'); //PG
                        string hash = "";
                        lblheader.Text = "Congratulations";
                        lblpaymentmsg.Text = "You have successfully blocked your Unit in THE COLLECTION project. Our team will get in touch with you shortly.";
                        string merchantId = arrResponse[0];
                        string _customerId = arrResponse[1];
                        string txnReferenceNo = arrResponse[2];
                        string bankReferenceNo = arrResponse[3];
                        string txnAmount = Convert.ToDecimal(arrResponse[4]).ToString();
                        string bankId = arrResponse[5];
                        string bankMerchantId = arrResponse[6];
                        string txnType = arrResponse[7];
                        string currency = arrResponse[8];
                        string itemCode = arrResponse[9];
                        string securityType = arrResponse[10];
                        string securityId = arrResponse[11];
                        string securityPassword = arrResponse[12];
                        string txnDate = arrResponse[13]; //dd-mm-yyyy
                        string authStatus = arrResponse[14];
                        string settlementType = arrResponse[15];
                        string additionalInfo1 = arrResponse[16];
                        string additionalInfo2 = arrResponse[17];
                        string additionalInfo3 = arrResponse[18];
                        string additionalInfo4 = arrResponse[19];
                        string additionalInfo5 = arrResponse[20];
                        string additionalInfo6 = arrResponse[21];
                        string additionalInfo7 = arrResponse[22];
                        string errorStatus = arrResponse[23];
                        string _errorDescription = arrResponse[24];


                        hash += arrResponse[0] + "|";
                        hash += arrResponse[1] + "|";
                        hash += arrResponse[2] + "|";
                        hash += arrResponse[3] + "|";
                        hash += arrResponse[4] + "|";
                        hash += arrResponse[5] + "|";
                        hash += arrResponse[6] + "|";
                        hash += arrResponse[7] + "|";
                        hash += arrResponse[8] + "|";
                        hash += arrResponse[9] + "|";
                        hash += arrResponse[10] + "|";
                        hash += arrResponse[11] + "|";
                        hash += arrResponse[12] + "|";
                        hash += arrResponse[13] + "|";
                        hash += arrResponse[14] + "|";
                        hash += arrResponse[15] + "|";
                        hash += arrResponse[16] + "|";
                        hash += arrResponse[17] + "|";
                        hash += arrResponse[18] + "|";
                        hash += arrResponse[19] + "|";
                        hash += arrResponse[20] + "|";
                        hash += arrResponse[21] + "|";
                        hash += arrResponse[22] + "|";
                        hash += arrResponse[23] + "|";
                        hash += arrResponse[24];
                        string checksumvalue = arrResponse[25];
                        string checksumkeyvalue = GetHMACSHA256(hash, "5CyFI2gFot1EWrH611ghHMrUfbWfb2pJ");
                        if (checksumkeyvalue.ToUpper() == checksumvalue.ToUpper())
                        {

                            SqlCommand cmd424 = new SqlCommand("Select isnull(g.mobileno,0) as executivemobileno,c.emailid,c.name,isnull(c.mobileno,0) as mobileno,s.customerid,s.unitid,c.executiveid,g.emailid as executiveemailid from customersteps as s left outer join customermaster as c on c.id=s.customerid left outer join galaxyaccount as g on g.id=c.executiveid where  s.stepid=@id", con);
                            cmd424.Parameters.AddWithValue("@id", _customerId);
                            SqlDataAdapter da24 = new SqlDataAdapter(cmd424);
                            DataTable dt24 = new DataTable();
                            da24.Fill(dt24);
                            if (dt24.Rows.Count > 0)
                            {
                                if (authStatus == "0300")
                                {

                                    Session["payment"] = "Successful";

                                    pnlfailed.Visible = false;
                                    pnlsuccess.Visible = true;
                                    SqlCommand cmd424k = new SqlCommand("Select c.configname,p.name as config,t.towername   from propertylistconfig as c left outer join propertyconfigmaster as p on p.id=c.configid left outer join propertylisttower as t on t.id=c.towerid where  c.id=@id", con);
                                    cmd424k.Parameters.AddWithValue("@id", dt24.Rows[0]["unitid"].ToString());
                                    SqlDataAdapter da24k = new SqlDataAdapter(cmd424k);
                                    DataTable dt24k = new DataTable();
                                    da24k.Fill(dt24k);
                                    if (dt24k.Rows.Count > 0)
                                    {
                                        Session["unitdetails"] = dt24k.Rows[0]["configname"].ToString() + " - " + dt24k.Rows[0]["config"].ToString();

                                    }
                                    SqlCommand cmd = new SqlCommand("update customersteps set authstatus=@authstatus,errordescription=@errordescription,isbookingdone=1,bookingdate=@date,STATUS=@STATUS,ORIGINALSTATUS=@ORIGINALSTATUS,TRANSACTIONAMOUNT=@TRANSACTIONAMOUNT,isstep5=@isstep2,setp5date=@step1date,transactionid=@transactionid where stepid=@stepid and isnull(isbookingdone,0)=0", con);
                                    cmd.Parameters.AddWithValue("@step1date", encryptdecrypt.indiandate());
                                    cmd.Parameters.AddWithValue("@authstatus", authStatus);
                                    cmd.Parameters.AddWithValue("@transactionid", txnReferenceNo);
                                    cmd.Parameters.AddWithValue("@errordescription", _errorDescription);
                                    cmd.Parameters.AddWithValue("@date", encryptdecrypt.indiandate());
                                    cmd.Parameters.AddWithValue("@stepid", _customerId);
                                    cmd.Parameters.AddWithValue("@isstep2", 1);
                                    cmd.Parameters.AddWithValue("@STATUS", "PAID");
                                    cmd.Parameters.AddWithValue("@ORIGINALSTATUS", "PAID");
                                    cmd.Parameters.AddWithValue("@TRANSACTIONAMOUNT", txnAmount);
                                    int k = cmd.ExecuteNonQuery();

                                    if (k > 0)
                                    {

                                        SqlCommand cmd1 = new SqlCommand("update propertylistconfig set executiveid=@executiveid,transactiondate=@transactiondate,custname=@custname,custmobileno=@custmobileno,transactionid=@transactionid,bankreferenceid=@bankreferenceid, statusid=@STATUS ,customerid=@customerid,statusdate=@statusdate where id=@stepid", con);
                                        cmd1.Parameters.AddWithValue("@statusdate", encryptdecrypt.indiandate());
                                        cmd1.Parameters.AddWithValue("@customerid", dt24.Rows[0]["customerid"].ToString());
                                        cmd1.Parameters.AddWithValue("@stepid", dt24.Rows[0]["unitid"].ToString());
                                        cmd1.Parameters.AddWithValue("@custname", dt24.Rows[0]["name"].ToString());
                                        cmd1.Parameters.AddWithValue("@custmobileno", dt24.Rows[0]["mobileno"].ToString());
                                        cmd1.Parameters.AddWithValue("@transactionid", txnReferenceNo);
                                        cmd1.Parameters.AddWithValue("@bankreferenceid", bankReferenceNo);
                                        cmd1.Parameters.AddWithValue("@transactiondate", txnDate);
                                        cmd1.Parameters.AddWithValue("@executiveid", dt24.Rows[0]["executiveid"].ToString());
                                        cmd1.Parameters.AddWithValue("@STATUS", "3");
                                        int k1 = cmd1.ExecuteNonQuery();




                                        if (dt24.Rows[0]["emailid"].ToString() != "")
                                        {
                                            string mailid = dt24.Rows[0]["emailid"].ToString();
                                            MailMessage mail = new MailMessage();
                                            string htmlBody1 = "<!doctype html><html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\"xmlns:o=\"urn:schemas-microsoft-com:office:office\"><head> <meta charset=\"UTF-8\"> <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"> <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\"> <title>Bramhacorp</title> </head> <body> <center> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"templateContainer\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; max-width: 600px; border: 0\" width=\"100%\"> <tr> <td id=\"templatePreheader\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; background-color: #eeeeff; border-top: 0; border-bottom: 0; padding-top: 16px; padding-bottom: 8px\" valign=\"top\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnTextBlock\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody class=\"mcnTextBlockOuter\"> <tr> <td class=\"mcnTextBlockInner\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%\" valign=\"top\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnTextContentContainer\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody> <tr> <td class=\"mcnTextContent\" style='mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; word-break: break-word; color: white; font-family: \"Asap\", Helvetica, sans-serif; font-size: 24px; line-height: 150%; text-align: left; padding-top: 9px; padding-right: 18px; padding-bottom: 9px; padding-left: 18px;' valign=\"top\"> <a href=\"https://www.bramhacorp.in/\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; color: white; font-weight: 700; text-decoration: none\" target=\"_blank\" title=\"Bramhacorp\"> <img src=\"http://engage.bramhacorp.in/thecollection/images/favicon.png\" style=\" width: 35px; margin-top: 8px;\"/> </a> </td><td class=\"mcnTextContent\" style='mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; word-break: break-word; color: white; font-family: \"Asap\", Helvetica, sans-serif; font-size: 24px; line-height: 150%; text-align: right; padding-top: 9px; padding-right: 18px; padding-bottom: 9px; padding-left: 18px;' valign=\"top\"> <a href=\"https://www.bramhacorp.in/\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; color: white; font-weight: 700; text-decoration: none\" target=\"_blank\" title=\"Bramhacorp\"> <img src=\"http://engage.bramhacorp.in/thecollection/images/avnirlogo.png\" style=\"width: 170px; margin-top: 10px; margin-right: -15px;\"/> </a> </td></tr></tbody> </table> </td></tr></tbody> </table> </td></tr><tr> <td id=\"templateHeader\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; background-color: #f7f7ff; border-top: 0; border-bottom: 0; padding-top: 16px; padding-bottom: 0\" valign=\"top\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnImageBlock\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody class=\"mcnImageBlockOuter\"> <tr> <td class=\"mcnImageBlockInner\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding: 0px\" valign=\"top\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnImageContentContainer\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody> <tr> <td class=\"mcnImageContent\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-right: 0px; padding-left: 0px; padding-top: 0; padding-bottom: 0; text-align: center;\" valign=\"top\"> <a class=\"\" href=\"https://www.bramhacorp.in/\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; color: #eeeeff; font-weight: normal; text-decoration: none\" target=\"_blank\" title=\"\"><a class=\"\" href=\"https://www.bramhacorp.in/\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; color: #eeeeff; font-weight: normal; text-decoration: none\" target=\"_blank\" title=\"\"> <img align=\"center\" class=\"mcnImage\" src=\"http://engage.bramhacorp.in/thecollection/images/paid1.png\" style=\"-ms-interpolation-mode: bicubic; border: 0; height: auto; outline: none; text-decoration: none; vertical-align: bottom; max-width: 1200px; padding-bottom: 0; display: inline !important; vertical-align: bottom;\" width=\"600\"></img> </a></a> </td></tr></tbody> </table> </td></tr></tbody> </table> </td></tr><tr> <td id=\"templateBody\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; background-color: #f7f7ff; border-top: 0; border-bottom: 0; padding-top: 0; padding-bottom: 0\" valign=\"top\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnTextBlock\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody class=\"mcnTextBlockOuter\"> <tr> <td class=\"mcnTextBlockInner\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%\" valign=\"top\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnTextContentContainer\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody> <tr> <td class=\"mcnTextContent\" style='mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; word-break: break-word; color: #2a2a2a; font-family: \"Asap\", Helvetica, sans-serif; font-size: 16px; line-height: 150%; text-align: left; padding-top: 30px; padding-right: 45px; padding-bottom: 9px; padding-left: 45px;' valign=\"top\"> <h1 class=\"null\" style='color: #2a2a2a; font-family: \"Asap\", Helvetica, sans-serif; font-size: 22px; font-style: normal; font-weight: bold; line-height: 35px; letter-spacing: 1px; text-align: left; display: block; margin: 0; padding: 0'> <span>Congratulations!</span></h1> <h2 class=\"null\" style='color: #2a2a2a; font-family: \"Asap\", Helvetica, sans-serif; font-size: 13px; font-style: normal; font-weight: bold; line-height: 25px; letter-spacing: 1px; text-align: left; display: block; margin: 0; padding: 0'> <span>You have successfully blocked your Unit in THE COLLECTION project</span></h2> </td></tr></tbody> </table> </td></tr></tbody> </table> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnTextBlock\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody class=\"mcnTextBlockOuter\"> <tr> <td class=\"mcnTextBlockInner\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%\" valign=\"top\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnTextContentContainer\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody> <tr> <td class=\"mcnTextContent\" style='mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; word-break: break-word; color: #2a2a2a; font-family: \"Asap\", Helvetica, sans-serif; font-size: 13px; line-height: 175%; text-align: left; padding-top: 9px; padding-right: 45px; padding-bottom: 9px; padding-left: 45px;' valign=\"top\"> We have received EOI amount INR 50,000/- for unit " + Session["unitdetails"].ToString() + " with transaction ID " + txnReferenceNo + " successfully.<br></br> Our team will get in touch with you shortly<br></br> <span style=\"display:block;\">Team</span> <span style=\" font-weight: 700;\"> BramhaCorp Ltd.</span> <br></br> </td></tr></tbody> </table> </td></tr></tbody> </table> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnButtonBlock\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody class=\"mcnButtonBlockOuter\"> <tr> <td align=\"center\" class=\"mcnButtonBlockInner\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 18px; padding-right: 18px; padding-bottom: 18px; padding-left: 18px;\" valign=\"top\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnButtonBlock\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody class=\"mcnButtonBlockOuter\"> <tr> <td align=\"center\" class=\"mcnButtonBlockInner\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 0; padding-right: 18px; padding-bottom: 18px; padding-left: 18px;\" valign=\"top\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnButtonContentContainer\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; border-collapse: separate !important; border-radius: 48px; background-color: #031644;\"> <tbody> <tr> <td align=\"center\" class=\"mcnButtonContent\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; font-family: 'Asap', Helvetica, sans-serif; font-size: 16px; padding-top: 24px; padding-right: 48px; padding-bottom: 24px; padding-left: 48px;\" valign=\"middle\"> <a class=\"mcnButton \" href=\"https://www.bramhacorp.in/contact-us\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; display: block; color: #eeeeff; font-weight: normal; text-decoration: none; font-weight: normal; letter-spacing: 1px; line-height: 100%; text-align: center; text-decoration: none; color: #FFFFFF; text-transform: uppercase;\" target=\"_blank\" title=\"Click if any queries\">Any queries?</a> </td></tr></tbody> </table> </td></tr></tbody> </table> </td></tr></tbody> </table> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnImageBlock\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody class=\"mcnImageBlockOuter\"> <tr> <td class=\"mcnImageBlockInner\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding: 0px\" valign=\"top\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mcnImageContentContainer\" style=\"border-collapse: collapse; mso-table-lspace: 0; mso-table-rspace: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; min-width: 100%;\" width=\"100%\"> <tbody> <tr> <td class=\"mcnImageContent\" style=\"mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-right: 0px; padding-left: 0px; padding-top: 0; padding-bottom: 0; text-align: center;\" valign=\"top\"> </td></tr></tbody> </table> </td></tr></tbody> </table> </td></tr></table> </center> </body></html>";
                                            AlternateView htmlView1 = AlternateView.CreateAlternateViewFromString(htmlBody1, null, "text/html");
                                            mail.IsBodyHtml = true;
                                            mail.AlternateViews.Add(htmlView1);
                                            mail.Subject = "Congratulations..!!! From Bramhacorp Team";
                                            mail.From = new MailAddress("bramhavr@gmail.com");
                                            mail.To.Add(mailid);
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
                                        if (dt24.Rows[0]["mobileno"].ToString().Length == 10)
                                        {
                                            HttpWebRequest myReq1 = (HttpWebRequest)WebRequest.Create("http://msg.galaxydev.in/api/push.json?apikey=5e995c86904d7&route=transactional&sender=ORACRA&mobileno=" + dt24.Rows[0]["mobileno"].ToString() + "&text=Congratulations!!!%0a%0aYou%20have%20successfully%20blocked%20your%20Unit%20in%20The Collection%20by%20paying%20EOI%20amount%20INR%2050,000/-%0aTransaction%20ID%20" + txnReferenceNo + "%0a%0aThank%20you%0aTeam%20BramhaCorp");
                                            HttpWebResponse myResp1 = (HttpWebResponse)myReq1.GetResponse();
                                            System.IO.StreamReader respStreamReader1 = new System.IO.StreamReader(myResp1.GetResponseStream());
                                            string responseString1 = respStreamReader1.ReadToEnd();
                                            respStreamReader1.Close();
                                            myResp1.Close();
                                        }
                                        if (dt24.Rows[0]["executivemobileno"].ToString().Length == 10)
                                        {
                                            HttpWebRequest myReq1 = (HttpWebRequest)WebRequest.Create("http://msg.galaxydev.in/api/push.json?apikey=5e995c86904d7&route=transactional&sender=ORACRA&mobileno=" + dt24.Rows[0]["executivemobileno"].ToString() + "&text=Your client " + dt24.Rows[0]["name"].ToString() + " with mobileno " + dt24.Rows[0]["mobileno"].ToString() + " paid 50,000/- for Unit " + Session["unitdetails"].ToString() + " - " + dt24.Rows[0]["towername"].ToString() + " with transactionID " + txnReferenceNo + " for The Collection");
                                            HttpWebResponse myResp1 = (HttpWebResponse)myReq1.GetResponse();
                                            System.IO.StreamReader respStreamReader1 = new System.IO.StreamReader(myResp1.GetResponseStream());
                                            string responseString1 = respStreamReader1.ReadToEnd();
                                            respStreamReader1.Close();
                                            myResp1.Close();
                                        }

                                    }
                                }
                                else
                                {
                                    SqlCommand cmd = new SqlCommand("update customersteps set authstatus=@authstatus,errordescription=@errordescription,isbookingdone=2,bookingdate=@date,STATUS=@STATUS,ORIGINALSTATUS=@ORIGINALSTATUS,TRANSACTIONAMOUNT=@TRANSACTIONAMOUNT,isstep5=@isstep2,setp5date=@step1date where stepid=@stepid", con);
                                    cmd.Parameters.AddWithValue("@step1date", encryptdecrypt.indiandate());
                                    cmd.Parameters.AddWithValue("@date", encryptdecrypt.indiandate());
                                    cmd.Parameters.AddWithValue("@stepid", _customerId);
                                    cmd.Parameters.AddWithValue("@isstep2", 1);
                                    cmd.Parameters.AddWithValue("@STATUS", "Failed");
                                    cmd.Parameters.AddWithValue("@ORIGINALSTATUS", "Failed");
                                    cmd.Parameters.AddWithValue("@authstatus", authStatus);
                                    cmd.Parameters.AddWithValue("@errordescription", _errorDescription);
                                    cmd.Parameters.AddWithValue("@TRANSACTIONAMOUNT", "50000");
                                    int k = cmd.ExecuteNonQuery();
                                    Session["payment"] = "Failed";
                                    pnlsuccess.Visible = false;
                                    pnlfailed.Visible = true;
                                    lblheader.Text = "Payment";
                                    lblpaymentmsg.Text = "Transaction failed. Please try again.";

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
                        else
                        {
                            Session["payment"] = "Failed";
                            pnlsuccess.Visible = false;
                            pnlfailed.Visible = true;
                            lblpaymentmsg.Text = "Transaction failed. Please try again.";
                        }

                    }
                    else
                    {
                        //  Response.Redirect("index.aspx", false);
                        //payment failed
                    }
                }
                catch (Exception ex)
                {
                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }
                    SqlCommand cmd2 = new SqlCommand("Insert into errorlisttable(adminid,entrytime,empid,errormsg,formname,functionname) values (@adminid,@entrytime,@empid,@errormsg,@formname,@functionname)", con);
                    cmd2.Parameters.AddWithValue("@adminid", '1');
                    cmd2.Parameters.AddWithValue("@entrytime", encryptdecrypt.indiandate());
                    cmd2.Parameters.AddWithValue("@empid", 1);
                    cmd2.Parameters.AddWithValue("@errormsg", ex.Message);
                    cmd2.Parameters.AddWithValue("@formname", "index.aspx");
                    cmd2.Parameters.AddWithValue("@functionname", "verify_click");
                    int k2 = cmd2.ExecuteNonQuery();

                }
                finally
                {

                    if (con.State == ConnectionState.Open)
                    {
                        con.Close();
                    }
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "scrolltopevent", "window.top.close();", true);

                }
            }

        }
        protected void btnclose_Clicked(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(typeof(Page), "closePage", "window.close();", true);
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

    }
}