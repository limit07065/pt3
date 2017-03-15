using System;
using System.Collections.Generic;
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
            if (!IsValidEmail(Login1.UserName))
            {
                Login1.InstructionText = "Enter a valid e-mail address.";
                Login1.InstructionTextStyle.ForeColor = System.Drawing.Color.RosyBrown;
                e.Cancel = true;
            }
            else
            {
                Login1.InstructionText = String.Empty;
            }
        }

        protected void OnLoginError(object sender, EventArgs e)
        {
            Login1.HelpPageText = "Help with logging in...";
            Login1.PasswordRecoveryText = "Forgot your password?";
        }

    }
}