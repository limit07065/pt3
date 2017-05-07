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
    public partial class Barchart : System.Web.UI.Page
    {
        protected static string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string debit = String.Format("SELECT SUM([transaction].amount) AS debit " +
                           "FROM account INNER JOIN [transaction] ON account.id = [transaction].source " +
                           "WHERE (account.id = {0})", DropDownList1.SelectedValue);

            string credit = String.Format("SELECT SUM([transaction].amount) AS credit " +
                            "FROM account INNER JOIN [transaction] ON account.id = [transaction].recipient " +
                            "WHERE (account.id = {0})", DropDownList1.SelectedValue);

            string[] xName = {"Debit", "Credit"};
            double[] yValue = {0, 0};

            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(debit, con);

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    reader.Read();
                    if (reader["debit"] != typeof(DBNull))
                        yValue[0] = Convert.ToDouble(reader["debit"]);
                }

                cmd = new SqlCommand(credit, con);

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    reader.Read();
                    if(reader["credit"] != typeof(DBNull))
                        yValue[1] = Convert.ToDouble(reader["credit"]);                    
                }
            }

            Chart1.Series[0].Points.DataBindXY(xName, yValue);
        }
    }
}