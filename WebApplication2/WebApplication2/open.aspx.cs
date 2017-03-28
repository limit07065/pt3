using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class open : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["full_name"] == null)
                Response.Redirect("/Home.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}