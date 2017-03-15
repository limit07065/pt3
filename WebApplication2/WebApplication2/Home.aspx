<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="Home.aspx.cs" Inherits="WebApplication2.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col m6 offset-m3">
            <form>
            <ul class="collection with-header">
                <li class="collection-header teal lighten-2">
                    <h2>
                        Login</h2>
                </li>
                <li>
                    <div class="row">
                        <asp:Login ID="Login1" runat="server" CssClass="col m10 offset-m1" OnLoggingIn="OnLoggingIn"
                OnLoginError="OnLoginError">
                            <LayoutTemplate>
                                <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                                    <tr>
                                        <td>
                                            <table cellpadding="0">
                                               
                                                <tr >
                                                    <td align="right" >
                                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" 
                                                            Font-Size="Larger">User Name:</asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                                            ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                                            ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" Font-Size="Larger">Password:</asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                                            ControlToValidate="Password" ErrorMessage="Password is required." 
                                                            ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" colspan="2" style="color:Red;">
                                                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                                    </td>
                                                </tr>
                                                <tr>
                                                
                                                <style>
                                                  
                                                </style>
                                                    <td align="right" colspan="2">
                                                        <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" 
                                                            ValidationGroup="Login1" CssClass="waves-effect waves-light btn " />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </LayoutTemplate>
                        </asp:Login>
                    </div>
                    <div class="row">
                    </div>
                </li>
            </form>
        </div>
    </div>
    
</asp:Content>
