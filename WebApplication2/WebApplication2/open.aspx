<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="open.aspx.cs" Inherits="WebApplication2.open" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col s6 offset-s3">
            <form>
            <ul class="collection with-header">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT * FROM [account_type]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="sqlAccounts" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT * FROM [account] WHERE ([owner] = @owner)">
                    <SelectParameters>
                        <asp:SessionParameter Name="owner" SessionField="id" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <li class="collection-header teal lighten-2">
                    <h4>
                        Open an Account</h4>
                </li>
                <li>
                    <div class="row">
                        <div class="col input-field s3 offset-s1">
                            <label id="Label1" for="account_type">
                                Account Type.</label>
                        </div>
                        <div class="col input-field s6 ">
                            <asp:DropDownList ID="account_type" runat="server" DataSourceID="SqlDataSource1"
                                DataTextField="description" DataValueField="id">
                            </asp:DropDownList>
                            <asp:CustomValidator ID="CustomValidator1" runat="server" OnServerValidate="accountValidate"
                                ControlToValidate="account_type" ErrorMessage="One Person can only have one account of each type." ForeColor="Red" Display="Dynamic">
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
    <script>
        $(document).ready(function () {
            $('select').material_select();
        });
    </script>
</asp:Content>
