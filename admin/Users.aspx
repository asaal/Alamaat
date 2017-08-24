<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="Users.aspx.cs" Inherits="admin_Users" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
    <telerik:RadGrid runat="server" ID="RadGrid2"  AllowPaging="True" ClientSettings-EnablePostBackOnRowClick="true"
              HeaderStyle-ForeColor="White" HeaderStyle-Font-Size="Larger" DataSourceID="asd_main" 
              HeaderStyle-Font-Bold="true"  HeaderStyle-BackColor="#8eb936" 
              AllowSorting="True" AutoGenerateColumns="False" Width="99.8%" 
            PageSize="30" CellSpacing="0" GridLines="None"    >
                    <HeaderStyle  Font-Bold="True" Font-Size="Larger" 
                        ForeColor="Black" />
                    <PagerStyle Mode="NumericPages" AlwaysVisible="true" />
                    <GroupHeaderItemStyle  BorderColor="White" 
                        BorderStyle="Solid" BorderWidth="2px" Font-Bold="True" HorizontalAlign="Left" 
                        VerticalAlign="Middle" />
                    <MasterTableView DataKeyNames="id" DataSourceID="asd_main" Width="99.8%">
                        <CommandItemSettings ExportToPdfText="Export to PDF" />
                        <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                        </RowIndicatorColumn>
                        <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
                        </ExpandCollapseColumn>
                        <GroupByExpressions>
                            <telerik:GridGroupByExpression>
                                <SelectFields>
                                    <telerik:GridGroupByField FieldAlias="active" FieldName="active" 
                                        HeaderText="Active" HeaderValueSeparator=": " />
                                </SelectFields>
                                <GroupByFields>
                                    <telerik:GridGroupByField FieldName="active" SortOrder="Descending" />
                                </GroupByFields>
                            </telerik:GridGroupByExpression>
                        </GroupByExpressions>
                        <Columns>
                            
                             <telerik:GridTemplateColumn HeaderText="Full Name" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" >
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblName" Text='<%# Eval("firstname") %>' />
                                    <asp:Label runat="server" ID="Label2" Text=" " />
                                    <asp:Label runat="server" ID="Label1" Text='<%# Eval("lastname") %>' />
                                </ItemTemplate>
                      
                            <HeaderStyle   HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                      
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderStyle-HorizontalAlign="Center" 
                                HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" HeaderText="Email" UniqueName="Email" 
                                >
                                <ItemTemplate>
                                    <asp:Label ID="lblId" runat="server" Text='<%# Eval("email") %>' />
                                </ItemTemplate>
                                <HeaderStyle  />
                            </telerik:GridTemplateColumn>
                          <telerik:GridTemplateColumn HeaderStyle-HorizontalAlign="Center" 
                                HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" HeaderText="Registration" UniqueName="registerDate" 
                                >
                                <ItemTemplate>
                                    <asp:Label ID="lblId" runat="server" Text='<%# Eval("registerDate") %>' />
                                </ItemTemplate>
                                <HeaderStyle  />
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderStyle-HorizontalAlign="Center" 
                                HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" HeaderText="City , Country" UniqueName="city"
                                >
                                <ItemTemplate>
                                    <asp:Label ID="lblId" runat="server" Text='<%# Eval("City") %>' />
                                    <asp:Label ID="Label4" runat="server" Text=". " />
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Country") %>' />
                                </ItemTemplate>
                                <HeaderStyle  />
                            </telerik:GridTemplateColumn>
                            <%--<telerik:GridTemplateColumn HeaderStyle-HorizontalAlign="Center" 
                                HeaderStyle-VerticalAlign="Middle" HeaderText="Edit" UniqueName="Edit"
                                >
                                <ItemTemplate>
                                   <asp:ImageButton ImageUrl="~/Images/edit.png"   ID="btnEdit" BorderColor="Transparent" BackColor="Transparent" BorderWidth="1px"   runat="server" Text="Edit" Font-Bold="true" Width="32px" Height="32px"  CommandName="ON" OnCommand="EditClick"  CommandArgument='<%#Eval("id") %>'  />
                                                
                                </ItemTemplate>
                                <HeaderStyle  />
                            </telerik:GridTemplateColumn>--%>
                             <telerik:GridTemplateColumn HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HeaderText="Send" UniqueName="Send">
                                <ItemTemplate>
                                   <asp:Button ID="btnSend" BorderWidth="1px"   runat="server" Text="Send" Font-Bold="true"    CommandName="Send" OnCommand="SendClick"  CommandArgument='<%#Eval("id") %>'  />
                                                                       
                                </ItemTemplate>
                               </telerik:GridTemplateColumn>                                            
                        </Columns>
                        
                    </MasterTableView>                    
                </telerik:RadGrid>
   
            </ContentTemplate>
           
     </asp:UpdatePanel>
     <asp:SqlDataSource ID="asd_main" runat="server" 
          ConnectionString="<%$ ConnectionStrings:alamaatConnectionString %>" 
          SelectCommand="SELECT * FROM [alamaat_Users]" />
</asp:Content>

