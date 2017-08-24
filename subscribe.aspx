<%@ Page Language="C#" AutoEventWireup="true" CodeFile="subscribe.aspx.cs" Inherits="subscribe" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <h4 style="text-align:left">Subscribe to our e-mail newsletter to receive updates</h4>
        <table style="margin-left:30px">
            <tr><td><asp:Label ID="lbl_ID" runat="server" Visible="false" /></td>
            </tr>
            <tr>
                <td><asp:Label ID="lbl_Name" Text="Name" runat="server" /></td>
                <td><asp:TextBox ID="tbemail" runat="server" Width="250px"  />
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="tbemail"
                                    ForeColor="Red" ValidationGroup="registration" Text="*Required" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="validateEmail"  ForeColor="Red"   runat="server"  ErrorMessage="*Invalid email" Display="Dynamic"  ValidationGroup="registration" ControlToValidate="tbemail" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" />
                </td>


          </tr>
            <tr>
                <td><asp:Button ID="Button1" runat="server" Text="Subscribe" width="100" Height="25" OnClick="SubcriberClick" ValidationGroup="registration"  />
                    </td>

                <td><asp:Button runat="server" Text="Later" /></td>
            </tr>
            <tr>
                <td colspan="2"><asp:Label runat="server" ID="lblout" /></td>
            </tr>
            
      </table>
    </div>
    </form>
</body>
</html>
