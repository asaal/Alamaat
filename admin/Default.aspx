<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="admin_Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1><%: Title %></h1>
                
            </hgroup>
            <%--<p>
                To learn more about ASP.NET, visit <a href="http://asp.net" title="ASP.NET Website">http://asp.net</a>. 
                The page features <mark>videos, tutorials, and samples</mark> to help you get the most from 
                ASP.NET. If you have any questions about ASP.NET visit 
                <a href="http://forums.asp.net/18.aspx" title="ASP.NET Forum">our forums</a>.
            </p>--%>
            
             <section id="loginForm">
        <h4>Log in</h4>
                 <% if(Request.IsAuthenticated)
                           {%>
                          
                           <% if(HttpContext.Current.User.IsInRole("Administrator") ){ %> 
             <h3>Welcome to alamaat admin.</h3>

            <%} %>
                    
                    <%}%>
        <%else{ %>
        <asp:Login ID="Login1" runat="server" ViewStateMode="Disabled" RenderOuterTable="false">
            <LayoutTemplate>
                <p class="validation-summary-errors">
                    <asp:Literal runat="server" ID="FailureText" />
                </p>
                <fieldset>
                    <legend>Admin Login</legend>
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
                    </table>
                    <asp:Button ID="Button1" runat="server" CommandName="Login" Text="Log in"  />
                </fieldset>
            </LayoutTemplate>
        </asp:Login>
                 <%} %>
      <%--  <p>
            <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">Register</asp:HyperLink>
            if you don't have an account.
        </p>--%>
    </section>
        </div>
    </section>
</asp:Content>


