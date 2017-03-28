<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="Transfer.aspx.cs" Inherits="WebApplication2.Transfer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Transfer </title>
</asp:Content>
<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col s6 offset-s3">
            <form>
            <h1 class="teal lighten-2">
                Transfer
            </h1>
            <!-- Dropdown Trigger -->
            <a class='dropdown-button btn' href='#' data-activates='dropdown1'>Select Transfer Type</a>
            <!-- Dropdown Structure -->
            <ul id='dropdown1' class='dropdown-content'>
                <li><a href="#!">Intrabank Transfer</a></li>
                <!--<li class="divider"></li>
                <li><a href="#!">Interbank Transfer</a></li>
                <li ><a href="#!">Interbank Transfer Fast</a></li>-->
            </ul>
            <div class="row">
                <div class="input-field col s12">
                    <asp:textbox id="account_number" runat="server" cssclass="validate">
                    </asp:textbox>
                    <label for="first_name">
                        Recipient Account Number</label>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <asp:textbox id="first_name" runat="server" cssclass="validate">
                    </asp:textbox>
                    <label for="first_name">
                        Recipient Name</label>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <asp:textbox id="amount" runat="server" cssclass="validate">
                    </asp:textbox>
                    <label for="amount">
                        Amount</label>
                </div>
            </div>
            </p>
            <asp:linkbutton id="lbSubmit" runat="server" cssclass="waves-effect waves-light btn"
                onclick="lbSubmit_Click">Submit</asp:linkbutton>
            </form>
            </form>
        </div>
    </div>
</asp:content>
