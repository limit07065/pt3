<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="Details.aspx.cs" Inherits="WebApplication2.Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Details </title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="sqlAccount" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT * FROM [account] WHERE ([owner] = @owner)">
        <SelectParameters>
            <asp:SessionParameter Name="owner" SessionField="id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlSelected" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT * FROM [transaction] WHERE ([recipient] = @recipient) OR ([source] = @recipient)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlAccount" Name="recipient" PropertyName="SelectedValue"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div class="row">
        <div class="col s10 offset-s1">
            <ul class="collection with-header">
                <li class="collection-header">
                    <h4>
                        Details</h4>
                </li>
                <li class="collection-item"><b>Account Number: </b>
                    <asp:Label ID="lblAccNo" runat="server"></asp:Label>
                </li>
                <li class="collection-item"><b>Full name: </b>
                    <asp:Label ID="lblFullName" runat="server"></asp:Label>
                </li>
                <li class="collection-item"><b>NRIC: </b>
                    <asp:Label ID="lblNRIC" runat="server"></asp:Label>
                </li>
                <li class="collection-item"><b>Reg Date: </b>
                    <asp:Label ID="lblRegDate" runat="server"></asp:Label>
                </li>
                <li class="collection-item"><b>Phone No: </b>
                    <asp:Label ID="lblPhoneNo" runat="server"></asp:Label>
                </li>
            </ul>
        </div>
    </div>
    <div class="row">
        <div class="col s10 offset-s1">
            <ul class="collection with-header">
                <% if (ddlAccount.Items.Count==0){ %>
                <li class="collection-header">
                No Account
                </li>
                <% } else { %>
                <li class="collection-header">
                    <div class="row">
                        <div class="col s3 input-field offset-s1">
                            <label for="ddlAccount">
                                Choose an account:
                            </label>
                        </div>
                        <div class="col s8 input-field ">
                            <asp:DropDownList ID="ddlAccount" runat="server" DataSourceID="sqlAccount" DataTextField="id"
                                DataValueField="id" AutoPostBack="true">
                            </asp:DropDownList>
                        </div>
                    </div>
                </li>
                <li>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id"
                        DataSourceID="sqlSelected" OnRowDataBound="GridView1_RowDataBound">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="Transaction ID" InsertVisible="False"
                                ReadOnly="True" SortExpression="id" />
                            <asp:TemplateField HeaderText="Description">
                                <ItemTemplate>
                                    <asp:Label ID="lblDescription" runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Credit">
                                <ItemTemplate>
                                    <asp:Label ID="lblCredit" runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Debit">
                                <ItemTemplate>
                                    <asp:Label ID="lblDebit" runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Balance">
                                <ItemTemplate>
                                    <asp:Label ID="lblBalance" runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                        </Columns>
                    </asp:GridView>
                </li>
                <% } %>
            </ul>
        </div>
    </div>
</asp:Content>
