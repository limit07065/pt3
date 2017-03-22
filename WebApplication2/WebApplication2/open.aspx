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
                <li class="collection-header teal lighten-2">
                    <h4>
                        Open an Account</h4>
                </li>
                <li>
                    <div class="row">
                       <div class="col input-field s12">
                       <br />
                        
                            <asp:DropDownList ID="account_type" runat="server" DataSourceID="SqlDataSource1"
                                DataTextField="description" DataValueField="id">
                            </asp:DropDownList>
                            <select>
      <option value="" disabled selected>Choose your option</option>
      <option value="1">Option 1</option>
      <option value="2">Option 2</option>
      <option value="3">Option 3</option>
    </select>
                            <label ID="Label1" for="account_type"  >
                               Account Type.</label>
                            </div>
                       
                    </div>
                    <div class="row">
                        <div class="col">
                            <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="waves-effect waves-light btn"
                                OnClick="Button1_Click" />
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
