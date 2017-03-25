using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["first_name"] != null)
                {
                    lblAccNo.Text = Session["id"].ToString();
                    lblFirstName.Text = Session["first_name"].ToString();
                    lblLastName.Text = Session["last_name"].ToString();
                    lblNRIC.Text = Session["nric"].ToString();
                    lblRegDate.Text = ((DateTime)Session["reg_date"]).ToString("dd-MMM-yyyy");
                    lblPhoneNo.Text = Session["phone"].ToString();
                    lblAmount.Text = String.Format(new System.Globalization.CultureInfo("ms-MY"), "{0:C}", Convert.ToDouble(Session["amount"]));
                }
                else
                    Response.Redirect("/Home.aspx");
            }
        }
    }
}
