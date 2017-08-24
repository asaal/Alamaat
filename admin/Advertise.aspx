<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="Advertise.aspx.cs" Inherits="admin_Advertise" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <table>
        <tr><td>Subject</td></tr>
        <tr><td><asp:TextBox runat="server" Width="300px" ID="tbsubject" /></td></tr>
        <tr><td>Message</td></tr>
        <tr>
            <td><asp:TextBox ID="tbmessage" TextMode="MultiLine" runat="server" Width="300px" Height="100px" /></td>
        </tr>
        <tr><td><asp:Button runat="server" Text="Send" /></td></tr>
    </table>
</asp:Content>

