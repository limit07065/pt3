﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="Deposit.aspx.cs" Inherits="WebApplication2.Deposit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Deposit</title>
</asp:Content>
<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder1" runat="server">
  <asp:SqlDataSource ID="sqlAccount" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [account] WHERE ([id] = @owner)">
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
                        <div class="col s10 hoverable" style="margin: 10px">
                            <h4>
                                <span>Choose an account: </span>
                                </h4>
                        </div>
                       <!-- <div class="input-field col s12">-->
                            <asp:DropDownList ID="ddlAccount" runat="server" 
                                DataSourceID="sqlAccount" DataTextField="id" DataValueField="id">
                            </asp:DropDownList>
                        <!--</div>-->
                        <div class="input-field col s12">
                            <asp:textbox id="tbAmount" runat="server">
                            </asp:textbox>
                            <label for="first_name">
                                Amount to deposit</label>
                            <asp:customvalidator id="CustomValidator1" runat="server" onservervalidate="AmountValidate"
                                controltovalidate="tbAmount" errormessage="Invalid input" forecolor="Red" display="Dynamic">
                            </asp:customvalidator>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <asp:linkbutton id="LinkButton1" runat="server" class="waves-effect waves-light btn"
                                onclick="LinkButton1_Click">Submit</asp:linkbutton>
                        </div>
                    </div>
                </li>
            </ul>
            </form>
        </div>
    </div>
</asp:content>
