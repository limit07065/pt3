<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="Deposit.aspx.cs" Inherits="WebApplication2.Deposit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Deposit</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col s6 offset-s3">
            <form>
            <ul class="collection with-header">
                <li class="collection-header teal lighten-2">
                    <h4>
                        Deposit</h4>
                </li>
                <div class="row">
                    <div class="input-field col s12">
                        <input id="amount" type="text" class="validate">
                        <label for="first_name">
                            Amount</label>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <a class="waves-effect waves-light btn">Submit</a>
                    </div>
                </div>
                </li>
            </ul>
            </form>
        </div>
    </div>
</asp:Content>
