<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="Details.aspx.cs" Inherits="WebApplication2.Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Details </title>
</asp:Content>
<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col s10 offset-s1">
            <ul class="collection with-header">
                <li class="collection-header">
                    <h4>
                        Details</h4>
                </li>
                <li class="collection-item"><b>Account Number: </b>
                    <asp:label id="lblAccNo" runat="server"></asp:label>
                </li>
                <li class="collection-item"><b>Full name: </b>
                    <asp:label id="lblFullName" runat="server"></asp:label>
                </li>
                
                <li class="collection-item"><b>NRIC: </b>
                    <asp:label id="lblNRIC" runat="server"></asp:label>
                </li>
                <li class="collection-item"><b>Reg Date: </b>
                    <asp:label id="lblRegDate" runat="server"></asp:label>
                </li>
                <li class="collection-item"><b>Phone No: </b>
                    <asp:label id="lblPhoneNo" runat="server"></asp:label>
                </li>
                <li class="collection-item"><b>Amount in account: </b>
                    <asp:label id="lblAmount" runat="server"></asp:label>
                </li>
            </ul>
        </div>
    </div>
</asp:content>
