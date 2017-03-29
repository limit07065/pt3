<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="Transfer.aspx.cs" Inherits="WebApplication2.Transfer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Transfer </title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="sqlAccount" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT * FROM [account] WHERE ([owner] = @owner)">
        <SelectParameters>
            <asp:SessionParameter Name="owner" SessionField="id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div class="row">
        <div class="col s6 offset-s3">
            <form>
            <h1 class="teal lighten-2">
                Transfer
            </h1>
            <!-- ddl-->
            <!--
           
            <a class='dropdown-button btn' href='#' data-activates='dropdown1'>Select Transfer Type</a>
            
            <ul id='dropdown1' class='dropdown-content'>
                <li><a href="#!">Intrabank Transfer</a></li>
                <!--<li class="divider"></li>
                <li><a href="#!">Interbank Transfer</a></li>
                <li ><a href="#!">Interbank Transfer Fast</a></li>
                -->
            </ul>
            <div class="row">
                <div class="col s3 input-field ">
                    <label for="ddlAccount">
                        Choose an account:
                    </label>
                </div>
                <div class="input-field col s9  ">
                    <asp:DropDownList ID="ddlAccount" runat="server" DataSourceID="sqlAccount" DataTextField="id"
                        DataValueField="id">
                    </asp:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <asp:TextBox ID="account_number" runat="server" CssClass="validate">
                    </asp:TextBox>
                    <label for="first_name">
                        Recipient Account Number</label>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <asp:TextBox ID="first_name" runat="server" CssClass="validate">
                    </asp:TextBox>
                    <label for="first_name">
                        Recipient Name</label>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <asp:TextBox ID="amount" runat="server" CssClass="validate">
                    </asp:TextBox>
                    <label for="amount">
                        Amount</label>
                </div>
            </div>
            </p>
            <asp:LinkButton ID="lbSubmit" runat="server" CssClass="waves-effect waves-light btn"
                OnClick="lbSubmit_Click">Submit</asp:LinkButton>
            </form>
            </form>
        </div>
    </div>
</asp:Content>
