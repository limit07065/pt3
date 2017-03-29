<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="Deposit.aspx.cs" Inherits="WebApplication2.Deposit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Deposit</title>
</asp:Content>
<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder1" runat="server">
  <asp:SqlDataSource ID="sqlAccount" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [account] WHERE ([owner] = @owner)">
        <SelectParameters>
            <asp:SessionParameter Name="owner" SessionField="id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div class="row">
        <div class="col s6 offset-s3">
            <form>
            <ul class="collection with-header">
                <li class="collection-header teal lighten-2">
                    <h4>
                        Deposit</h4>
                </li>
                <li>
                    <div class="row">
                        <div class="col s3 input-field offset-s1">
                            <label for="ddlAccount">
                                Choose an account:
                            </label>
                        </div>
                        <div class="input-field col s6  ">
                            <asp:DropDownList ID="ddlAccount" runat="server" DataSourceID="sqlAccount" DataTextField="id"
                                DataValueField="id">
                            </asp:DropDownList>
                        </div>
                        <div class="input-field col s9 offset-s1">
                            <asp:TextBox ID="tbAmount" runat="server">
                            </asp:TextBox>
                            <label for="tbAmount">
                                Amount to deposit</label>
                            <asp:CustomValidator ID="CustomValidator1" runat="server" OnServerValidate="AmountValidate"
                                ControlToValidate="tbAmount" ErrorMessage="Invalid input" ForeColor="Red" Display="Dynamic">
                            </asp:CustomValidator>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <asp:LinkButton ID="LinkButton1" runat="server" class="waves-effect waves-light btn"
                                OnClick="LinkButton1_Click">Submit</asp:LinkButton>
                        </div>
                    </div>
                </li>
            </ul>
            </form>
        </div>
    </div>
</asp:Content>
