<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="Withdraw.aspx.cs" Inherits="WebApplication2.Withdraw" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Withdraw</title>
</asp:Content>
<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col s6 offset-s3">
            <form>
            <ul class="collection with-header">
                <li class="collection-header teal lighten-2">
                    <h4>
                        Withdraw
                    </h4>
                </li>
                <li>
                    <div class="row">
                        <div class="col s10 hoverable" style="margin: 10px">
                            <h4>
                                <span>Current amount in account: </span>
                                <%= String.Format(new System.Globalization.CultureInfo("ms-MY"), "{0:C}", Convert.ToDouble(Session["amount"]))%></h4>
                        </div>
                        <div class="input-field col s12">
                            <asp:textbox id="tbAmount" runat="server">
                            </asp:textbox>
                            <label for="first_name">
                                Amount to withdraw
                            </label>
                            <asp:customvalidator id="CustomValidator1" runat="server" onservervalidate="AmountValidate"
                                controltovalidate="tbAmount" errormessage="Invalid input" forecolor="Red" display="Dynamic">
                            </asp:customvalidator>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <asp:linkbutton id="LinkButton1" runat="server" class="waves-effect waves-light btn"
                                onclick="LinkButton1_Click">Submit</asp:linkbutton>
                        </div>
                    </div>
                </li>
            </ul>
            </form>
        </div>
    </div>
</asp:content>
