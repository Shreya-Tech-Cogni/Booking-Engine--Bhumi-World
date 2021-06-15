using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace bramhacorp
{
    public partial class reviewbooking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbltotalsale.Text = "The total sale consideration for the apartment is Rs." + 750 + ",made up of the following";
        }
    }
}