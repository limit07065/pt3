<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="Transfer.aspx.cs" Inherits="WebApplication2.Transfer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Transfer </title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                <li ><a href="#!" >Innerbank Transfer</a></li>
                <li class="divider"></li>
                <li><a href="#!">Interbank Transfer</a></li>
                <li ><a href="#!">Interbank Transfer Fast</a></li>
               
            </ul>
             <div class="row">
                <div class="input-field col s12">
                    <input id="Text1" type="text" class="validate">
                    <label for="first_name">
                        Recipient Account Number</label>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <input id="amount" type="text" class="validate">
                    <label for="first_name">
                        Amount</label>
                </div>
            </div>
            </p> <a class="waves-effect waves-light btn">Submit</a>
            </form>
            </form>
        </div>
    </div>
</asp:Content>
