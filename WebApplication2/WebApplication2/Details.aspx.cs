using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebApplication2
{
    public partial class Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ( Session["full_name"] == null )
                Response.Redirect("/Home.aspx");

            if (!IsPostBack)
            {
                if (Session["full_name"] != null)
                {
                    lblAccNo.Text = Session["id"].ToString();
                    lblFullName.Text = Session["full_name"].ToString();
                    lblNRIC.Text = Session["nric"].ToString();
                    lblRegDate.Text = ((DateTime)Session["reg_date"]).ToString("dd-MMM-yyyy");
                    lblPhoneNo.Text = Session["phone"].ToString();
                   

                }
            }
        }


        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView rv = (DataRowView)e.Row.DataItem;

                //process description
                int type = Convert.ToInt32(rv["type"]);
                String description = "", credit = "", debit = "", balance = "";
                /*
                if (type == 1)
                { 
                        
                            description = "Cash Deposit";
                            credit = rv["amount"].ToString();
                            debit = "";
                            balance = rv["recipient_balance"].ToString();
                }*/
               switch (type)
                {
                    //deposit
                    case 1:
                        
                            description = "Cash Deposit";
                            credit = rv["amount"].ToString();
                            debit = "";
                            balance = rv["recipient_balance"].ToString();
                        
                        break;

                    //widthdraw
                    case 2:
                        
                            description = "Cash Withdrawal";
                            credit =  "";
                            debit = rv["amount"].ToString(); 
                            balance = rv["source_balance"].ToString();
                        
                        break;
                        //fund transfer
                    case 3:
                        int userAccount = Convert.ToInt32(ddlAccount.SelectedValue);

                        //fund transfer from user
                        if (Convert.ToInt32(rv["source"]) == userAccount)
                        {
                            description = "Funds to \n" + rv["recipient"].ToString();
                            credit = "";
                            debit = rv["amount"].ToString();
                            balance = rv["source_balance"].ToString();
                        }
                        else if (Convert.ToInt32(rv["recipient"]) == userAccount)
                        {
                            description = "Funds from \n" + rv["source"].ToString();
                            credit = rv["amount"].ToString();
                            debit = "";
                            balance = rv["recipient_balance"].ToString();
                        }
                        break;

                    default: break;
                }

                Label lbldescription = e.Row.FindControl("lblDescription") as Label;
                lbldescription.Text = description;

                Label lblCredit = e.Row.FindControl("lblCredit") as Label;
                lblCredit.Text = credit;

                Label lblDebit = e.Row.FindControl("lblDebit") as Label;
                lblDebit.Text = debit;

                Label lblBalance = e.Row.FindControl("lblBalance") as Label;
                lblBalance.Text = balance;              
            }
        }



    }
}
