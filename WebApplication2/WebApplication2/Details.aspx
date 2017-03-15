<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="Details.aspx.cs" Inherits="WebApplication2.Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<title>Details </title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col s10 offset-s1">
            <ul class="collection with-header">
                <li class="collection-header">
                    <h4>
                        Details</h4>
                </li>
                First name :<asp:Label ID="first_name" runat="server" Text="Label"></asp:Label>
                NRIC :<asp:Label ID="nric" runat="server" Text="Label"></asp:Label>
                <table class="responsive bordered">
                    <thead>
                        <tr>
                            <th data-field="id">
                                Name
                            </th>
                            <th data-field="name">
                                Item Name
                            </th>
                            <th data-field="price">
                                Item Price
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                Alvin
                            </td>
                            <td>
                                Eclair
                            </td>
                            <td>
                                $0.87
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Alan
                            </td>
                            <td>
                                Jellybean
                            </td>
                            <td>
                                $3.76
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Jonathan
                            </td>
                            <td>
                                Lollipop
                            </td>
                            <td>
                                $7.00
                            </td>
                        </tr>
                    </tbody>
                </table>
            </ul>
        </div>
    </div>
</asp:Content>
