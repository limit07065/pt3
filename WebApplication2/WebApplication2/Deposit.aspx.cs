using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace WebApplication2
{
    public partial class Deposit : System.Web.UI.Page
    {
        protected static string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string query = "UPDATE account SET [amount] = @amount WHERE [id] = @id";

                Session["amount"] = Convert.ToDouble(Session["amount"]) + Convert.ToDouble(tbAmount.Text);

                using (SqlConnection con = new SqlConnection(ConnectionString))
                {
                    con.Open();

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@amount", Session["amount"].ToString());
                    cmd.Parameters.AddWithValue("@id", Session["id"].ToString());

                    cmd.ExecuteNonQuery();
                }
            }
            
        }

        protected void AmountValidate(object source, ServerValidateEventArgs args)
        {
            try
            {
                if (Convert.ToDouble(args.Value) <= 0)
                {
                    CustomValidator1.ErrorMessage = "Deposit amount must be at least 1";
                    args.IsValid = false;
                }

            }
            catch (System.FormatException e)
            {
                args.IsValid = false;
            }
        }
    }
}