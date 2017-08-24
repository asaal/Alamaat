<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <br />
   
    <fieldset>
                    <legend>Login</legend>
                    <table>
                        <tr>
                           <td style="width:150px;"><asp:Label ID="Label1" runat="server" AssociatedControlID="UserName">User name</asp:Label></td>
                           <td><asp:TextBox runat="server" ID="UserName" Width="200px" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName" CssClass="field-validation-error" ErrorMessage="The user name field is required." />
                           </td>
                        </tr>
                        <tr>
                           <td><asp:Label ID="Label2" runat="server" AssociatedControlID="Password">Password</asp:Label></td>
                            <td><asp:TextBox runat="server" ID="Password" TextMode="Password" Width="200px" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Password" CssClass="field-validation-error" ErrorMessage="The password field is required." /></td>
                        </tr>
                        <tr>
                            <td colspan="2"><asp:CheckBox runat="server" ID="RememberMe" />
                            <asp:Label ID="Label3" runat="server" AssociatedControlID="RememberMe" CssClass="checkbox">Remember me?</asp:Label></td>
                        </tr>
                        <tr><td colspan="3"><asp:Label runat="server" ID="lblError" ForeColor="Red" /></td></tr>
                        <tr><td><asp:Button ID="Button1" runat="server" OnClick="LoginClick" Text="Log in"  /></td></tr>

                         </table>
                </fieldset>
    <br /><br />
</asp:Content>

