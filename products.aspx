<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="products.aspx.cs" Inherits="products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
   <div style="margin-left:15px; margin-top:15px">
    <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="newarrival.aspx">New Arrival</a>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="Cds.aspx">DVDs/CDs</a>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="tasbeeh.aspx">Tasbeehs</a>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="book.aspx">Books</a></h4>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <a href="newarrival.aspx">
           <asp:Image ID="Image1" runat="server" ImageUrl="~/images/p3.png" width="175" Height="225" /></a>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       
       <a href="Cds.aspx"><asp:Image ID="Image2" runat="server" ImageUrl="~/images/p2.jpg" width="175" Height="225" /></a>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <a href="tasbeeh.aspx"> <asp:Image ID="Image3" runat="server" ImageUrl="~/images/aa.jpg" width="175" Height="225" /></a>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <a href="book.aspx"> <asp:Image runat="server" ImageUrl="~/images/p.jpg" width="175" Height="225"/></a>
    <br />
    <br />
    </div>
</asp:Content>

