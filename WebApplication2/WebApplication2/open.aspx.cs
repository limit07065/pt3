using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;


namespace WebApplication2
{
    public partial class open : System.Web.UI.Page
    {
        protected static string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["full_name"] == null)
                Response.Redirect("/Home.aspx");
        }
        
        protected void accountValidate(object source, ServerValidateEventArgs args)
        {
            DataView dv = (DataView)sqlAccounts.Select(DataSourceSelectArguments.Empty);
            int type = Convert.ToInt32(account_type.SelectedValue);

            foreach (DataRowView drv in dv)
            {
                DataRow dr = drv.Row;
                if (Convert.ToInt32(dr["type"]) == type)
                {
                    args.IsValid = false;
                }
            }
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string query = "INSERT INTO [account] ([owner],[type],[create_date]) VALUES (@owner,@type,@create_date)";
               
               
                using (SqlConnection con = new SqlConnection(ConnectionString))
                {
                    con.Open();

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("owner", Session["id"]);
                    cmd.Parameters.AddWithValue("type", Convert.ToInt32(account_type.SelectedValue));
                    cmd.Parameters.AddWithValue("create_date", DateTime.Now);                  
                    cmd.ExecuteNonQuery();

                }
                Response.Redirect("/Result.aspx");
            }
          
        }
    }
}