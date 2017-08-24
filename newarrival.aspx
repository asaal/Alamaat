<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="newarrival.aspx.cs" Inherits="newarrival" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <br />
      <div style="text-align:center; width:100%">
         <table cellpadding="0" cellspacing="6" width="100%">
             <tr>
                 <td>
                     <telerik:RadDataPager ID="RadDataPager2"  runat="server" PagedControlID="RadListView1"
                                    PageSize="9">
                         
                                    <Fields>
                                       
                                        <telerik:RadDataPagerButtonField FieldType="FirstPrev" />
                                        <telerik:RadDataPagerButtonField FieldType="Numeric" PageButtonCount="5" />
                                        <telerik:RadDataPagerButtonField FieldType="NextLast" />
                                        <telerik:RadDataPagerPageSizeField PageSizeComboWidth="60" PageSizeText="Page size: "  />
                                      
                                    </Fields>
                                </telerik:RadDataPager>
                            
                
                 </td>
             </tr>
       
    </table>

    <telerik:RadListView ID="RadListView1"  runat="server" AllowPaging="true" PageSize="12" DataSourceID="asd_main">
          
          <ItemTemplate>
              
              <div style="vertical-align:top; text-align:center; margin-bottom:15px;  width:250px;float:left; border-color:transparent" >
                <a  href='<%# "Details.aspx?page=newarrival&ID=" + Eval("id")%>' >  
                    <asp:Image runat="server" Width="133px" Height="200px"  src='<%# "ShowImage2.ashx?id=" + DataBinder.Eval(Container.DataItem, "fileid")  %>' ID="Img1"/>
                </a>    
              <br />
              
                   <a  href='<%# "Details.aspx?page=newarrival&ID=" + Eval("id")%>' >  
                    <h5><asp:Label ID="Label8"  runat="server"  Text='<%# Eval("productname") %>' /></h5></a>
                    <asp:Label ID="Label2"  Text="Price: Rs. "  runat="server"    />
                    <asp:Label ID="Label3" Text='<%#Eval("originalprice") %>'  runat="server"   /><br />
                    <asp:Label ID="Label4"  Text="Discount:"  runat="server"  />
                    <asp:Label ID="Label5" Text='<%#Eval("discount") %>'  runat="server"  />
                    <asp:Label ID="Label1"  Text="%"  runat="server"   /><br />
                    <asp:Label ID="Label6"  Text="Sale Price: Rs."  runat="server"   />
                    <asp:Label ID="Label7" Text='<%#Eval("price") %>'  runat="server" Font-Bold="true" /><br /><br />
                    <asp:Button visible="false"  ID="btnON" BorderColor="Black" BorderWidth="1px"   runat="server" Text="Product Details" Font-Bold="true" Width="125px" Height="28px"  CommandName="ON"  CommandArgument='<%#Eval("id") %>'  />
                    <asp:Button   ID="Button1" BackColor="Gray" BorderColor="Transparent" BorderWidth="1px"   runat="server" Text="Add to Cart" Font-Bold="true" ForeColor="White" Width="125px" Height="28px"  CommandName="ON" OnCommand="AddtoCart"  CommandArgument='<%#Eval("id") %>'  />
              </div>
          </ItemTemplate>            
    </telerik:RadListView>
        </div>
    <%-- <telerik:RadGrid runat="server" ID="RadGrid2"  AllowPaging="True" CssClass="RadGrid" ShowHeader="false"
              HeaderStyle-ForeColor="White" HeaderStyle-Font-Size="Larger" DataSourceID="asd_main" 
              HeaderStyle-Font-Bold="true"  HeaderStyle-BackColor="#8eb936" 
              AllowSorting="True" AutoGenerateColumns="False" Width="99.8%" 
            PageSize="5" CellSpacing="0" GridLines="None"    >
                    <HeaderStyle BackColor="#8EB936" Font-Bold="True" Font-Size="Larger" 
                        ForeColor="White" />
                    <PagerStyle Mode="NumericPages" AlwaysVisible="true" />
                    <GroupHeaderItemStyle BackColor="#FF6D00" BorderColor="White" 
                        BorderStyle="Solid" BorderWidth="2px" Font-Bold="True" HorizontalAlign="Left" 
                        VerticalAlign="Middle" />
                    <MasterTableView DataKeyNames="id" DataSourceID="asd_main" Width="99.8%">
                        <CommandItemSettings ExportToPdfText="Export to PDF" />
                        <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                        </RowIndicatorColumn>
                        <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
                        </ExpandCollapseColumn>
                        <Columns>
                            <telerik:GridTemplateColumn HeaderStyle-HorizontalAlign="Center" 
                                HeaderStyle-VerticalAlign="Middle" HeaderText="ID" UniqueName="ID" 
                                Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblId" runat="server" Text='<%# Eval("id") %>' />
                                </ItemTemplate>
                                <HeaderStyle Width="10%" />
                            </telerik:GridTemplateColumn>
                          
                            <telerik:GridTemplateColumn HeaderStyle-HorizontalAlign="Center" 
                                HeaderStyle-VerticalAlign="Middle" HeaderText="Login " SortExpression="Name" 
                                UniqueName="Name">
                                <ItemTemplate>
                                   <table>
                                        <tr>
                                            <td style="vertical-align:top; text-align:left;  width:250px;float:left; border-color:transparent" >
                                               
                                               <a  href='<%# "ShowImage2.ashx?ID=" + Eval("fileid")%>' data-gal="prettyVideo[prettyVideo]" >  
                                               <asp:Image runat="server"   src='<%# "ShowImage2.ashx?id=" + DataBinder.Eval(Container.DataItem, "fileid")  %>' ID="Img1" Width="75%" Height="75%"/>
                                                   </a>
                                                   
                                             </td>
                                            <td style="float:left; text-align:left;border-color:transparent;vertical-align:top">
                                                 <h3><asp:Label ID="Label1"  runat="server"  Text='<%# Eval("productname") %>' /></h3>
                                                 <asp:Label ID="Label2"  Text="Price: Rs. "  runat="server" Font-Bold="true"  />
                                                 <asp:Label ID="Label3" Text='<%#Eval("price") %>'  runat="server"  /><br /><br />
                                                 <asp:Button visible="false"  ID="btnON" BorderColor="Black" BorderWidth="1px"   runat="server" Text="Product Details" Font-Bold="true" Width="125px" Height="28px"  CommandName="ON"  CommandArgument='<%#Eval("id") %>'  />
                                                 <asp:Button   ID="Button1" BorderColor="Black" BorderWidth="1px"   runat="server" Text="Item Details" Font-Bold="true" Width="125px" Height="28px"  CommandName="ON" OnCommand="ItemDetails"  CommandArgument='<%#Eval("id") %>'  />
                                               

                                            </td>
                                        </tr>
                                       </table>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </telerik:GridTemplateColumn>
                          
                        </Columns>
                        <EditFormSettings>
                            <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                            </EditColumn>
                        </EditFormSettings>
                        <PagerStyle AlwaysVisible="True" />
                    </MasterTableView>

                    <FilterMenu EnableImageSprites="False"></FilterMenu>

                    <HeaderContextMenu CssClass="GridContextMenu GridContextMenu_Default"></HeaderContextMenu>
                </telerik:RadGrid>--%><br />
    <asp:SqlDataSource ID="asd_main" runat="server" 
          ConnectionString="<%$ ConnectionStrings:alamaatConnectionString %>" 
          SelectCommand="SELECT * FROM alamaat_products where category='3D489DD4-1129-3241-8735-59228AC0CF16' order by productname" />
</asp:Content>

