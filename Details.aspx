<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Details.aspx.cs" Inherits="Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <br />
    <div style="text-align:right"><a id="btnback" runat="server"><< Back to Previous Page</a></div>
    <table style="background-color:white; width:100%; margin-left:5px;font-family:Arial;">
       
        <tr>
            
            <td rowspan="9" style="width:310px;margin-left:5px;">
                <asp:HiddenField ID="lblid" runat="server" />
                <a   runat="server" id="imglink"  data-gal="prettyVideo[prettyVideo]" >
                    <asp:Image runat="server"  Width="300px" Height="400px"  ID="thumbimage"/>
                </a>
            </td>
            <td style="text-align:center; padding-top:15px;" colspan="2">
                <asp:Label runat="server" ID="lblName" Font-Bold="true" Font-Size="18"  />
            </td>
        </tr>
         <tr><td>&nbsp;</td></tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lblprice" Font-Bold="true" />
            </td>
            <td style="text-align:right">
                <asp:Label runat="server" ID="Label1"  Text="Availability: In Stock" Font-Bold="true" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <hr />
            </td>
        </tr>
         <tr><td>&nbsp;</td></tr>
        <tr>
            <td><asp:Label runat="server" Text="Product Description:" Font-Bold="true" /></td>
        </tr>
        <tr><td>&nbsp;</td></tr>
        <tr>
            <td colspan="2" style="text-align:justify">
                <asp:Label ID="lblDesc" runat="server" Text="" />
            </td>
        </tr>
         <tr>
            <td>
                <asp:Button   ID="btncart" BorderColor="Black" BorderWidth="1px"   runat="server" Text="Add to Cart" Font-Bold="true" Width="125px" Height="28px"  OnCommand="AddtoCart"  />
               <%-- <asp:Button   ID="btncart" BorderColor="Black" BorderWidth="1px"   runat="server" Text="Back" Font-Bold="true" Width="125px" Height="28px" OnClick="Back"  />--%>
            </td>
        </tr>
        <tr>
            <td colspan="2">     
                <asp:DataList ID="DataList1" RepeatColumns="4" Width="250"  runat="server" DataKeyField="id" >
                    <ItemTemplate>
                        <div class="extra-wrap">
                            <div>
                                <%--<asp:Image runat="server"  Width="40" Height="40" src='<%# "ShowImage.ashx?ID=" + DataBinder.Eval(Container.DataItem, "ID")  %>' ID="Img1"/>--%>
                                <a  href='<%# "../ShowThumb.ashx?ID=" + Eval("id")%>' data-gal="prettyVideo[prettyVideo]" >
                                    <asp:Image runat="server"  Width="170" Height="120" src='<%# "../ShowThumb.ashx?ID=" + Eval("id")%>' ID="Image1"/></a>
                                </a>&nbsp;&nbsp;&nbsp;
                            </div>
                        </div>
                    </ItemTemplate>
                 </asp:DataList>
           </td>
        </tr>
    </table>
    <br />
</asp:Content>

