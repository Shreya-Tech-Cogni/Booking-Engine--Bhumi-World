using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace bramhacorp
{
    public partial class checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["hashcheckkey"] != null)
            {
                hdkey.Value = Session["hashcheckkey"].ToString();
                 

            }
            else
            {
                Response.Redirect("index.aspx",false);
            }
            
        }
    }
}