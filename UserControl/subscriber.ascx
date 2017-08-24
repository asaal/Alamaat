<%@ Control Language="C#" AutoEventWireup="true" CodeFile="subscriber.ascx.cs" Inherits="UserControl_subscriber" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>        
 <asp:TextBox ID="tbemail" runat="server" Width="200" Height="25" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="tbemail"
                                    ForeColor="Red" ValidationGroup="registration" Text="*Required" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="validateEmail"  ForeColor="Red"   runat="server"  ErrorMessage="*Invalid email" Display="Dynamic"  ValidationGroup="registration" ControlToValidate="tbemail" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" />
                <div style="float:right;margin-top:10px">
                    <asp:Button ID="Button1" runat="server" Text="Subscribe" width="100" Height="25" OnClick="SubcriberClick" ValidationGroup="registration"  />
                    
                </div>
<asp:Label ID="lblout" runat="server" Width="200" Height="25" Text=""  />
            </ContentTemplate></asp:UpdatePanel>