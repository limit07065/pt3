using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication2
{
    public partial class Deposit : System.Web.UI.Page
    {
        protected static string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["full_name"] == null)
                Response.Redirect("/Home.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {

                string query = "INSERT INTO [transaction] ([type],[recipient],[amount],[recipient_balance],[date]) VALUES (@type,@recipient,@amount,@recipient_balance, @date)";

                sqlAccount.SelectParameters.Add("sid",ddlAccount.SelectedValue);
                sqlAccount.SelectCommand = "SELECT * FROM account WHERE [id] = @sid";
                DataView dv = (DataView)sqlAccount.Select(DataSourceSelectArguments.Empty);
                DataRowView drv = dv[0];
                int accountID = Convert.ToInt32(drv["id"]);
                double balance = Convert.ToDouble(drv["balance"]);
                double amount = Convert.ToDouble(tbAmount.Text);
                balance += amount;
                using (SqlConnection con = new SqlConnection(ConnectionString))
                {
                    con.Open();

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@type", "1");                    
                    cmd.Parameters.AddWithValue("@recipient", accountID);
                    cmd.Parameters.AddWithValue("@amount", tbAmount.Text);
                    cmd.Parameters.AddWithValue("@recipient_balance", balance.ToString());
                    cmd.Parameters.AddWithValue("@date", DateTime.Now);
                    cmd.ExecuteNonQuery();
                    
                }

                using (SqlConnection con = new SqlConnection(ConnectionString))
                {
                    con.Open();
                    string query2 = "UPDATE [account] SET [balance] = @balance WHERE [id]= @id";
                    SqlCommand cmd2 = new SqlCommand(query2, con);
                    cmd2.Parameters.AddWithValue("@balance", balance);
                    cmd2.Parameters.AddWithValue("@id", accountID);
                    cmd2.ExecuteNonQuery();
                }

                Response.Redirect("/Result.aspx");

                

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