<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="Barchart.aspx.cs" Inherits="WebApplication2.Barchart" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Account History - Barchart</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    
            <div class="row">
                <div class="col s6 offset-s3">
                    <form>
                    <ul class="collection with-header">
                        <li class="collection-header teal lighten-2">
                            <h4>
                                Account History</h4>
                        </li>
                        <li>
                            <div class="row">
                                <div class="col s3 input-field offset-s1">
                                    <label for="ddlAccount">
                                        Choose an account:
                                    </label>
                                </div>
                                <div class="row">
                                    <div class="input-field col s6  ">
                                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1"
                                            DataTextField="id" DataValueField="id" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col s9 offset-s1">
                                        <asp:Chart ID="Chart1" runat="server">
                                            <Series>
                                                <asp:Series Name="Series" ChartType="Column" ChartArea="ChartArea1">
                                                </asp:Series>
                                            </Series>
                                            <ChartAreas>
                                                <asp:ChartArea Name="ChartArea1">
                                                </asp:ChartArea>
                                            </ChartAreas>
                                        </asp:Chart>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                    </form>
                </div>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT [id] FROM [account] WHERE ([owner] = @owner)">
                <SelectParameters>
                    <asp:SessionParameter Name="owner" SessionField="id" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
      
</asp:Content>
