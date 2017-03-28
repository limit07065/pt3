using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Page.Validate();

            if (Page.IsValid)
            {
                SqlDataSource1.InsertParameters["full_name"].DefaultValue = full_name.Text.ToUpper();                
                SqlDataSource1.InsertParameters["nric"].DefaultValue = nric.Text;
                SqlDataSource1.InsertParameters["username"].DefaultValue = username.Text;
                SqlDataSource1.InsertParameters["password"].DefaultValue = password.Text;
                SqlDataSource1.InsertParameters["registration_date"].DefaultValue = DateTime.Now.ToString();
                SqlDataSource1.InsertParameters["phone"].DefaultValue = phone.Text;
                SqlDataSource1.InsertParameters["email"].DefaultValue = email.Text;
                if (SqlDataSource1.Insert() == 1)
                {
                    Response.Redirect("/Home.aspx");
                }
            }

        }

        protected void FullnameValidate(object source, ServerValidateEventArgs args)
        {
            for (int i = 0; i < 10; i++)
            {
                if (args.Value.Contains(i.ToString()))
                {
                    args.IsValid = false;
                }

            }

            if (args.IsValid)
            {
                if (args.Value.Contains("!") ||
                    args.Value.Contains("#") ||
                    args.Value.Contains("$") ||
                    args.Value.Contains("%") ||
                    args.Value.Contains("^") ||
                    args.Value.Contains("&") ||
                    args.Value.Contains("*") ||
                    args.Value.Contains("(") ||
                    args.Value.Contains(")") ||
                    args.Value.Contains("-") ||
                    args.Value.Contains("+") ||
                    args.Value.Contains("_") ||
                    args.Value.Contains("=") ||
                    args.Value.Contains("<") ||
                    args.Value.Contains(">") ||
                    args.Value.Contains("?") ||
                    args.Value.Contains(",") ||
                    args.Value.Contains(".")
                    )
                {
                    args.IsValid = false;
                }

            }

        }


    }
}