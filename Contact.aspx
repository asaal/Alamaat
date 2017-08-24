<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <%--<hgroup class="title">
        <h1><%: Title %>.</h1>
        <h2>Your contact page.</h2>
    </hgroup>

    <section class="contact">
        <header>
            <h3>Phone:</h3>
        </header>
        <p>
            <span class="label">Main:</span>
            <span>425.555.0100</span>
        </p>
        <p>
            <span class="label">After Hours:</span>
            <span>425.555.0199</span>
        </p>
    </section>

    <section class="contact">
        <header>
            <h3>Email:</h3>
        </header>
        <p>
            <span class="label">Support:</span>
            <span><a href="mailto:Support@example.com">Support@example.com</a></span>
        </p>
        <p>
            <span class="label">Marketing:</span>
            <span><a href="mailto:Marketing@example.com">Marketing@example.com</a></span>
        </p>
        <p>
            <span class="label">General:</span>
            <span><a href="mailto:General@example.com">General@example.com</a></span>
        </p>
    </section>

    <section class="contact">
        <header>
            <h3>Address:</h3>
        </header>
        <p>
            One Microsoft Way<br />
            Redmond, WA 98052-6399
        </p
    </section>--%>
     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>   <br />
            <h3>Contact</h3>
            <table>
                <tr><td>Full Name*:</td><td><asp:TextBox ID="tbname" runat="server" Width="300" Height="20" />
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="tbname"
                     CssClass="field-validation-error" ForeColor="Red" ValidationGroup="RegValidatioan" Text="*Required"  />
                    </td></tr>
                <tr><td>Email*:</td><td><asp:TextBox ID="tbemail" runat="server" Width="300" Height="20" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbemail"
                                        CssClass="field-validation-error" ForeColor="Red" ValidationGroup="RegValidatioan" Text="*Required"  />
                    </td></tr>
                <tr><td>Subject*:</td><td><asp:TextBox ID="tbsubject" runat="server" Width="300" Height="20" />
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbsubject"
                                          CssClass="field-validation-error" ForeColor="Red" ValidationGroup="RegValidatioan" Text="*Required"  />
                    </td></tr>
                <tr><td>Message*:</td><td><asp:TextBox ID="tbmsg" runat="server" Width="300" Height="150" TextMode="MultiLine" />
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbmsg"
                                          CssClass="field-validation-error" ForeColor="Red" ValidationGroup="RegValidatioan" Text="*Required"  />
                    </td></tr>
                <tr><td><asp:CheckBox ID="chkcopy" Text="Send copy to yourself" runat="server" /></td></tr>
                <tr><td></td><td><asp:Button runat="server" Text="Submit" Width="75" Height="25" ValidationGroup="RegValidatioan" OnClick="SendEmail"  /></td></tr>
                <tr><td colspan="2"><asp:Label runat="server" ID="lblout" /></td></tr>
            </table><br /><br />
      </ContentTemplate>
            </asp:UpdatePanel>
</asp:Content>  