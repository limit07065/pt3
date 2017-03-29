using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication2
{
    public partial class Home : System.Web.UI.Page
    {
        protected static string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) 
            {   // Check if logged in
                if (Session["full_name"] != null)
                    Response.Redirect("/Details.aspx");
            }
        }

        protected void OnLoggingIn(object sender, System.Web.UI.WebControls.LoginCancelEventArgs e)
        {
            string query = "SELECT customer.id, customer.full_name, customer.nric, customer.registration_date, customer.phone, account.balance FROM customer INNER JOIN account ON customer.id = account.owner WHERE customer.username = @username AND customer.password = @password";

            TextBox UserName = Login1.FindControl("UserName") as TextBox;
            TextBox Password = Login1.FindControl("Password") as TextBox;

            using(SqlConnection con = new SqlConnection(ConnectionString))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@username", UserName.Text);
                cmd.Parameters.AddWithValue("@password", Password.Text);

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Session["id"] = reader["id"];
                        Session["full_name"] = reader["full_name"];
                        Session["nric"] = reader["nric"];
                        Session["reg_date"] = reader["registration_date"];
                        Session["phone"] = reader["phone"];
                        Session["balance"] = reader["balance"];
                        Response.Redirect("/Details.aspx");
                    }
                }
            }

            // When RememberMe checkbox is checked, set session timeout to 525600 minutes (1 year), longest period available for ASP .NET
            CheckBox rmbMe = Login1.FindControl("RememberMe") as CheckBox;
            if (rmbMe.Checked)
                Session.Timeout = 525600; 

        }

        protected void OnLoginError(object sender, EventArgs e)
        {
            Login1.HelpPageText = "Help with logging in...";
            Login1.PasswordRecoveryText = "Forgot your password?";
        }

    }
}