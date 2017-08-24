<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="Subcribe.aspx.cs" Inherits="Account_Subcribe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>   <br />
            <h3>News </h3>
            <table>
                
                <tr><td>Subject*:</td>
                    <td colspan="3"><asp:TextBox ID="tbsubject" runat="server" Width="300" Height="20" />
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbsubject"
                                          CssClass="field-validation-error" ForeColor="Red" ValidationGroup="RegValidatioan" Text="*Required"  />
                    </td></tr>
                <tr><td>Attachments</td>
                    <td colspan="3"><asp:AsyncFileUpload ID="ImageUpload" CompleteBackColor="White" BorderWidth="0px" Width="300px"  runat="server" ClientIDMode="AutoID"  />
                        <asp:Button ID="SubmitButton" runat="server" Text="Upload" Width="100" OnClick="UploadImage" />
                    </td>
                </tr>
                <tr>
                    <td><asp:Image runat="server" ID="Image1" /></td>
                    <td><asp:Image runat="server" ID="Image2" /></td>
                    <td><asp:Image runat="server" ID="Image3" /></td>
                    <td><asp:Image runat="server" ID="Image4" /></td>
                </tr>
                <tr>
                    <td><asp:Button runat="server" Text="Remove" OnClick="RemoveImage1" /></td>
                </tr>
                <tr><td>Message*:</td>
                    <td colspan="3"><asp:TextBox ID="tbmsg" runat="server" Width="300" Height="150" TextMode="MultiLine" />
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbmsg"
                                          CssClass="field-validation-error" ForeColor="Red" ValidationGroup="RegValidatioan" Text="*Required"  />
                    </td></tr>
                
                <tr><td></td><td><asp:Button ID="btnSubmit2" runat="server" Text="Submit" Width="75" Height="25" ValidationGroup="RegValidatioan" OnClick="SendEmail"  /></td></tr>
                <tr><td colspan="2"><asp:Label runat="server" ID="lblout" /></td></tr>
            </table><br /><br />
      </ContentTemplate>
        <Triggers>
                        <asp:PostBackTrigger ControlID="UpdatePanel1$btnSubmit2" />
               <asp:PostBackTrigger ControlID="UpdatePanel1$SubmitButton" />
                    </Triggers>
   </asp:UpdatePanel>
</asp:Content>

