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
    public partial class Transfer : System.Web.UI.Page
    {
        protected static string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["full_name"] == null)
                Response.Redirect("/Home.aspx");
        }

        protected void lbSubmit_Click(object sender, EventArgs e)
        {
            string query1 = "SELECT account.balance, account.id FROM account INNER JOIN customer ON account.owner = customer.id WHERE account.id = @rID AND customer.full_name = @rName";
            string query2 = "INSERT INTO [transaction] ([type], [source], [recipient], [amount], [source_balance], [recipient_balance], [date]) VALUES (3, @source, @recipient, @amount, @source_balance, @recipient_balance, @date)";
            string query3 = "UPDATE account SET balance = @balance WHERE id = @id";

            
            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                con.Open();

                // Get recipient account info
                SqlCommand cmd = new SqlCommand(query1, con);
                double rBalance = 0.0;
                string rID;

                cmd.Parameters.AddWithValue("@rID", account_number.Text);
                cmd.Parameters.AddWithValue("@rName", first_name.Text.ToUpper());

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        rID = reader["id"].ToString();
                        rBalance = Convert.ToDouble(reader["balance"]);
                    }
                }

                // Insert record into transaction table
                cmd = new SqlCommand(query2, con);

                rBalance += Convert.ToDouble(amount.Text);
                Session["balance"] = Convert.ToDouble(Session["balance"]) - Convert.ToDouble(amount.Text);

                cmd.Parameters.AddWithValue("@source", ddlAccount.SelectedValue);
                cmd.Parameters.AddWithValue("@recipient", account_number.Text);
                cmd.Parameters.AddWithValue("@amount", amount.Text);
                cmd.Parameters.AddWithValue("@source_balance", Session["balance"]);
                cmd.Parameters.AddWithValue("@recipient_balance", rBalance);
                cmd.Parameters.AddWithValue("@date", System.DateTime.Now);

                cmd.ExecuteNonQuery();

                // Update column in account table
                cmd = new SqlCommand(query3, con);

                cmd.Parameters.AddWithValue("@balance", rBalance);
                cmd.Parameters.AddWithValue("@id", account_number.Text);
                cmd.ExecuteNonQuery();

                cmd = new SqlCommand(query3, con);
                cmd.Parameters.AddWithValue("@balance", Session["balance"]);
                cmd.Parameters.AddWithValue("@id", Session["id"]);
                cmd.ExecuteNonQuery();

                Response.Redirect("/Result.aspx");
            }
        }
    }
}