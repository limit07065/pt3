using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String login, pw;


        }

        protected void OnLoggingIn(object sender, System.Web.UI.WebControls.LoginCancelEventArgs e)
        {
            ArrayList accountList = (ArrayList)Session["accountList"];
            Session["user"] = null;
            for (int i = 0; i < accountList.Count; i++)
            {
                if (Login1.UserName.Equals(((User)accountList[i]).loginID))
                {
                    if (Login1.Password.Equals(((User)accountList[i]).password))
                    {
                        User user = (User)accountList[i];
                       Session["user"] = user;
                    }

                }

            }
            if (Session["user"] == null)
            {
                Login1.InstructionText = "Invalid ID or password.";
            }
            else
            {
                Response.Redirect("/Details.aspx");
            }
            
            

            
        }

        protected void OnLoginError(object sender, EventArgs e)
        {
            Login1.HelpPageText = "Help with logging in...";
            Login1.PasswordRecoveryText = "Forgot your password?";
        }

    }
}