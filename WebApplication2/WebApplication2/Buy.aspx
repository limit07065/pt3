<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="Buy.aspx.cs" Inherits="WebApplication2.Buy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Buy Online </title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col s6 offset-s3">
            <form>
            <ul class="collection with-header">
                <li class="collection-header teal lighten-2">
                    <h4>
                        Transfer</h4>
                </li>
                <li>
                    <div class="row">
                        <div class="col">
                            <!-- Dropdown Trigger -->
                            <a class='dropdown-button btn input-field' href='#' data-activates='dropdown1'>Select
                                Transfer Type</a>
                            <!-- Dropdown Structure -->
                            <ul id='dropdown1' class='dropdown-content'>
                                <li><a href="#!">Innerbank Transfer</a></li>
                                <li class="divider"></li>
                                <li><a href="#!">Interbank Transfer</a></li>
                                <li><a href="#!">Interbank Transfer Fast</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="input-field col s12">
                                <input id="Text1" type="text" class="validate">
                                <label for="first_name">
                                    Recipient Account Number</label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="input-field col s12">
                                <input id="amount" type="text" class="validate">
                                <label for="first_name">
                                    Amount</label>
                            </div>
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
