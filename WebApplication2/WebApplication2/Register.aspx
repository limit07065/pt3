<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="Register.aspx.cs" Inherits="WebApplication2.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Register</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        DeleteCommand="DELETE FROM [customer] WHERE [id] = @id" InsertCommand="INSERT INTO [customer] ([full_name], [nric], [username], [password], [registration_date], [phone], [email]) VALUES (@full_name, @nric, @username, @password, @registration_date, @phone, @email)"
        SelectCommand="SELECT * FROM [customer]" 
        UpdateCommand="UPDATE [customer] SET [full_name] = @full_name, [nric] = @nric, [username] = @username, [password] = @password, [registration_date] = @registration_date, [phone] = @phone, [email] = @email WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="full_name" Type="String" />            
            <asp:Parameter Name="nric" Type="String" />
            <asp:Parameter Name="username" Type="String" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="registration_date" Type="DateTime" />
            <asp:Parameter Name="phone" Type="String" />
            <asp:Parameter Name="email" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="full_name" Type="String" />
            <asp:Parameter Name="nric" Type="String" />
            <asp:Parameter Name="username" Type="String" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="registration_date" Type="DateTime" />
            <asp:Parameter Name="phone" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <div class="row">
        <div class="col s6 offset-s3">
            <form>
            <ul class="collection with-header">
                <li class="collection-header teal lighten-2">
                    <h4>
                        Register</h4>
                </li>
                <li>
                    <div class="container-fluid">
                        <div class="input-field col s12">
                            <asp:TextBox ID="full_name" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="This is required."
                                ControlToValidate="full_name" ForeColor="red"></asp:RequiredFieldValidator>
                            <label for="full_name">
                                Full Name</label>
                            <label for="full_name">
                            <asp:CustomValidator ID="CustomValidator1" OnServerValidate="FullnameValidate" ControlToValidate="full_name"
                                runat="server" ErrorMessage="Name cannot contain numbers" ForeColor="Red" 
                                Display="Dynamic"></asp:CustomValidator>
                            </label>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="input-field col s12">
                            <asp:TextBox ID="nric" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="This is required."
                                ControlToValidate="nric" ForeColor="red"></asp:RequiredFieldValidator>                           
                            <label for="nric">
                                NRIC</label>
                            <label for="nric">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="nric"
                                ValidationExpression="\d{12}" Display="Static" EnableClientScript="false" ErrorMessage="NRIC must be 12 numeric digits"
                                runat="server" ForeColor="Red" />
                            </label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <asp:TextBox ID="username" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="This is required."
                                ControlToValidate="username" ForeColor="red"></asp:RequiredFieldValidator>
                            <label for="username">
                                Login ID</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="This is required."
                                ControlToValidate="password" ForeColor="red"></asp:RequiredFieldValidator>
                            <label for="password">
                                Password</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <asp:TextBox ID="cpassword" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="This is required."
                                ControlToValidate="cpassword" ForeColor="red"></asp:RequiredFieldValidator>
                            <label for="cpassword">
                                Confirm Password</label>
                            <label for="cpassword">
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="cpassword"
                                CssClass="" ControlToCompare="password" 
                                ErrorMessage="Password Does Not Match" ToolTip="Password must be the same" 
                                ForeColor="Red" />
                            </label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <asp:TextBox ID="email" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="This is required."
                                ControlToValidate="email" ForeColor="red"></asp:RequiredFieldValidator>
                            <label for="email">
                                Email</label>
                       
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="email"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" runat="server"
                                ErrorMessage="Invalid email format" ForeColor="Red"></asp:RegularExpressionValidator>
                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <asp:TextBox ID="phone" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="This is required."
                                ControlToValidate="phone" ForeColor="red"></asp:RequiredFieldValidator>
                            <label for="phone">
                                Phone</label>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="phone"
                                ValidationExpression="^\d{10,11}$" runat="server"
                                ErrorMessage="Invalid phone number (Enter without '-')" ForeColor="Red"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="row">
                        <p class="col">
                            <input type="checkbox" name='tac' id="tac" required="true" />
                            <label for="tac">
                                I agree to all terms and conditions.</label>
                            <br />
                            <span id="error-tac" style="color: Red; font-weight: 500; visibility: hidden">Please
                                agree to our terms and condition</span>
                        </p>
                    </div>
                    <div class="row">
                        <div class="col">
                            <asp:linkbutton ID="btnSubmit" runat="server" Text="Submit" CssClass="waves-effect waves-light btn" OnClick="btnSubmit_Click" />
                        </div>
                    </div>
                </li>
            </ul>
            </form>
        </div>
    </div>
</asp:Content>
