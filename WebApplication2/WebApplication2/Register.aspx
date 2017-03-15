<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="Register.aspx.cs" Inherits="WebApplication2.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Register</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col s6 offset-s3">
            <form>
            <ul class="collection with-header">
                <li class="collection-header teal lighten-2">
                    <h4>
                        Register</h4>
                </li>
                <li>
                    <div class="row">
                        <div class="input-field col s12">
                            <asp:TextBox ID="first_name" runat="server"></asp:TextBox>                            
                            <label for="first_name">
                                Full Name</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <asp:TextBox ID="nric" runat="server"></asp:TextBox>
                            <label for="password">
                                NRIC</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="login" type="text" class="validate" aria-required="true">
                            <label for="password">
                                Login ID</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="password" type="password" class="validate" aria-required="true">
                            <label for="password">
                                Password</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="email" type="email" class="validate" aria-required="true">
                            <label for="email">
                                Email</label>
                        </div>
                    </div>
                    <div class="row">
                        <p class="col">
                            <input type="checkbox" id="test5"  aria-required="true"/>
                            <label for="test5">
                                I agree to all terms and conditions.</label>
                        </p>
                    </div>
                    <div class="row">
                        <div class="col">

                            <asp:Button ID="Button1" runat="server" Text="Submit" 
                                CssClass="waves-effect waves-light btn" onclick="Button1_Click" />
                            
                        </div>
                    </div>
                    </li>
            </ul>
            </form>
            
        </div>
    </div>
</asp:Content>
