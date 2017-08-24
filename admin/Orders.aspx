<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="Orders.aspx.cs" Inherits="admin_Orders" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>   
          
            <telerik:RadGrid runat="server" ID="OrdersGrid" DataSourceID="asd_main" ShowFooter="true" OnUpdateCommand="UpdateOrder"

                                AllowSorting="true" EnableLinqExpressions="false">

                                <MasterTableView ShowHeader="true" AutoGenerateColumns="False" AllowPaging="true"

                                    DataKeyNames="id" PageSize="7" HierarchyLoadMode="ServerOnDemand">

                                    <DetailTables>

                                        <telerik:GridTableView AutoGenerateColumns="false" DataKeyNames="id" DataSourceID="SqlDataSource1"
                                            
                                            Width="100%">

                                            <ParentTableRelation>

                                                <telerik:GridRelationFields DetailKeyField="order_id" MasterKeyField="order_id"></telerik:GridRelationFields>

                                            </ParentTableRelation>

                                            <Columns>

                                                <telerik:GridBoundColumn SortExpression="name" ReadOnly="true" HeaderText="Product name" HeaderButtonType="TextButton"

                                                    DataField="name" UniqueName="name">

                                                </telerik:GridBoundColumn>

                                                <telerik:GridNumericColumn ReadOnly="true" SortExpression="price" HeaderText="Unit Price" HeaderButtonType="TextButton"

                                                    DataField="price" DataFormatString="{0:N2}" Aggregate="Avg" FooterAggregateFormatString="Average price: {0:C}">

                                                </telerik:GridNumericColumn>

                                                <telerik:GridNumericColumn ReadOnly="true" SortExpression="quantity" HeaderText="Quantity" HeaderButtonType="TextButton"

                                                    DataField="quantity" Aggregate="Max" FooterAggregateFormatString="Max quantity: {0}">

                                                </telerik:GridNumericColumn>

                                                <telerik:GridNumericColumn ReadOnly="true" SortExpression="discount" HeaderText="Discount" HeaderButtonType="TextButton"

                                                    DataField="discount" DataFormatString="{0:P}">

                                                </telerik:GridNumericColumn>

                                                <%--<telerik:GridCalculatedColumn UniqueName="total" DataFields="UnitPrice,Quantity,Discount"

                                                    Expression="IIf({2} = 0,{0}*{1}, {0}*{1}*{2})" HeaderText="Total" DataType="System.Double"

                                                    Aggregate="Sum" DataFormatString="{0:C}" FooterAggregateFormatString="Total cost: {0:C}">

                                                </telerik:GridCalculatedColumn>--%>
                                                

                                            </Columns>

                                            <SortExpressions>

                                                <telerik:GridSortExpression FieldName="Quantity" SortOrder="Descending"></telerik:GridSortExpression>

                                            </SortExpressions>

                                        </telerik:GridTableView>

                                    </DetailTables>

                                    <Columns>

                                        <telerik:GridBoundColumn ReadOnly="true" SortExpression="order_number" HeaderText="Order#" HeaderButtonType="TextButton"

                                            DataField="order_number" UniqueName="ordernumber">

                                        </telerik:GridBoundColumn>
                                       
                                       <%--  <telerik:GridBoundColumn SortExpression="orderstatus" HeaderText="Status" HeaderButtonType="TextButton"

                                            DataField="orderstatus" UniqueName="orderstatus" Aggregate="Count" FooterAggregateFormatString="Orders count: {0}">

                                        </telerik:GridBoundColumn>
                                        <telerik:GridTemplateColumn  HeaderText="Status"   >
                                            <ItemTemplate>
                                                <table>
                                                    <tr><td>
                                                        <asp:DropDownList runat="server" ID="lblName" Text='<%# Eval("orderstatus") %>' >
                                                            <asp:ListItem Text="Pending" Value="Pending" />
                                                             <asp:ListItem Text="Processing" Value="Processing" />
                                                             <asp:ListItem Text="Delivered" Value="Delivered" />
                                                             <asp:ListItem Text="Completed" Value="Completed" />
                                                         </asp:DropDownList><br />
                                                        <asp:Button   ID="btnEdit" BorderColor="Black" BorderWidth="1px"   runat="server" Text="Save & Email" Width="90px" Height="28px"  CommandName="email" OnCommand="EditClick"  CommandArgument='<%#Eval("id") %>'  /><br />
                                                        <asp:Button   ID="Button1" BorderColor="Black" BorderWidth="1px"   runat="server" Text="Save"  Width="90px" Height="28px"     CommandArgument='<%#Eval("id") %>'  />
                                                   </td></tr>
                                               </table>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>                                            
                                         </telerik:GridTemplateColumn>--%>

                                        <telerik:GridDateTimeColumn ReadOnly="true"  SortExpression="created" HeaderText="Order date" HeaderButtonType="TextButton"

                                            DataField="created" UniqueName="created" DataFormatString="{0:MM/dd/yyyy}"

                                            Aggregate="Last" FooterAggregateFormatString="Last order dates: {0:d}">

                                        </telerik:GridDateTimeColumn>
                                        <telerik:GridTemplateColumn UniqueName="Status" HeaderText="Order Status" DataField="order_id" ItemStyle-Width="240px">

                                          <ItemTemplate>

                                               <%#DataBinder.Eval(Container.DataItem, "orderstatus")%>

                                          </ItemTemplate>

                                          <EditItemTemplate>

                                              <telerik:RadComboBox ID="ComboStatus"     DataTextField="orderstatus" DataValueField="order_id" runat="server" >
                                                  <Items>
                                                      <telerik:RadComboBoxItem Value="Processing" Text="Processing" />
                                                      <telerik:RadComboBoxItem Value="Pending" Text="Pending" />
                                                      <telerik:RadComboBoxItem Value="Delivered" Text="Delivered" />
                                                  </Items>
                                              <%-- <asp:ListItem Text="Processing" Value="Processing" />
                                               <asp:ListItem Text="Pending" Value="Pending" />
                                               <asp:ListItem Text="Delivered" Value="Delivered" />--%>

                                          </telerik:RadComboBox>

                                          </EditItemTemplate>

                                     </telerik:GridTemplateColumn>
                                     <telerik:GridTemplateColumn Visible="false" HeaderText="Email Customer">
                                         <ItemTemplate>
                                           
                                         </ItemTemplate>
                                         <EditItemTemplate>
                                             <asp:CheckBox ID="chkEmail"  runat="server" />
                                          </EditItemTemplate>
                                    </telerik:GridTemplateColumn>

                                        <telerik:GridBoundColumn ReadOnly="true" UniqueName="total" DataField="Total" HeaderText="Order Total"

                                            SortExpression="total" DataFormatString="{0:N2}">

                                        </telerik:GridBoundColumn>

                                        <telerik:GridEditCommandColumn FooterText="" UniqueName="EditCommandColumn"
                                            HeaderText="Edit" HeaderStyle-Width="100px" UpdateText="Update">
                                          </telerik:GridEditCommandColumn>
                                        
                                    </Columns>

                                </MasterTableView>

                            </telerik:RadGrid>



         <%-- <telerik:RadGrid runat="server" ID="RadGrid2"  AllowPaging="True" 
              HeaderStyle-ForeColor="White" HeaderStyle-Font-Size="Larger" DataSourceID="asd_main" 
              HeaderStyle-Font-Bold="true"  HeaderStyle-BackColor="#8eb936" 
              AllowSorting="True" AutoGenerateColumns="False" Width="99.8%" 
            PageSize="10" CellSpacing="0" GridLines="None"    >
                    <HeaderStyle  Font-Bold="True" Font-Size="Larger" 
                        ForeColor="Black" />
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
                             <telerik:GridTemplateColumn HeaderText="Motor Template" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" UniqueName="MotorTemplate" SortExpression="MotorTemplate">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblName" Text='<%# Eval("MotorTemplate") %>' />
                                </ItemTemplate>
                      
                            <HeaderStyle  Width="20%" HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                      
                            </telerik:GridTemplateColumn>
                             <telerik:GridTemplateColumn  HeaderText="Order#"   HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" UniqueName="Color" SortExpression="ColorName">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblName" Text='<%# Eval("order_number") %>' />
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>                                            
                             </telerik:GridTemplateColumn>
                             <telerik:GridTemplateColumn  HeaderText="Shipment Type"   HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" UniqueName="Color" SortExpression="ColorName">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblName" Text='<%# Eval("shipment") %>' />
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>                                            
                             </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn  HeaderText="Status"   HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" UniqueName="Color" SortExpression="ColorName">
                                <ItemTemplate>
                                    <table>
                                        <tr><td>
                                            <asp:Label runat="server" ID="lblName" Text='<%# Eval("orderstatus") %>' /><br />
                                            <asp:Button   ID="btnEdit" BorderColor="Black" BorderWidth="1px"   runat="server" Text="Edit" Font-Bold="true" Width="100px" Height="28px"  CommandName="ON" OnCommand="EditClick"  CommandArgument='<%#Eval("id") %>'  /><br />
                                            <asp:Button   ID="Button1" BorderColor="Black" BorderWidth="1px"   runat="server" Text="Delete" Font-Bold="true" Width="100px" Height="28px"  CommandName="ON"   CommandArgument='<%#Eval("id") %>'  />
                                       </td></tr>
                                   </table>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>                                            
                             </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderStyle-HorizontalAlign="Center" 
                                HeaderStyle-VerticalAlign="Middle" HeaderText="Shipping Address " SortExpression="Name" 
                                UniqueName="Name">
                                <ItemTemplate>
                                   <table>
                                        <tr>
                                            <td style="float:left; text-align:left;border-color:transparent;vertical-align:top">
                                                 <h3><asp:Label ID="Label1"  runat="server"  Text='<%# Eval("shipfirstname") %>' />
                                                 <asp:Label ID="Label5" Text='<%#Eval("shiplastname") %>'  runat="server"  /></h3>
                                                 <asp:Label ID="Label7" Text='<%#Eval("shipaddress") %>'  runat="server"  /><br />
                                                 <asp:Label ID="Label2" Text='<%#Eval("shipcity") %>'  runat="server"  />,
                                                 <asp:Label ID="Label3" Text='<%#Eval("shipcountry") %>'  runat="server"  /><br />
                                                 <asp:Label ID="Label4" Text='<%#Eval("shipphone") %>'  runat="server"  /><br />
                                                 <asp:Label ID="Label6" Text='<%#Eval("shipemail") %>'  runat="server"  /><br />
                                            </td>
                                        </tr>
                                       </table>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderStyle-HorizontalAlign="Center" 
                                HeaderStyle-VerticalAlign="Middle" HeaderText="Billing Address " SortExpression="Name" 
                                UniqueName="Name">
                                <ItemTemplate>
                                   <table>
                                        <tr>
                                            <td style="float:left; text-align:left;border-color:transparent;vertical-align:top">
                                                 <h3><asp:Label ID="Label1"  runat="server"  Text='<%# Eval("billfirstname") %>' />
                                                 <asp:Label ID="Label5" Text='<%#Eval("billlastname") %>'  runat="server"  /></h3>
                                                 <asp:Label ID="Label7" Text='<%#Eval("billaddress") %>'  runat="server"  /><br />
                                                 <asp:Label ID="Label2" Text='<%#Eval("billcity") %>'  runat="server"  />,
                                                 <asp:Label ID="Label3" Text='<%#Eval("billcountry") %>'  runat="server"  /><br />
                                                 <asp:Label ID="Label4" Text='<%#Eval("billphone") %>'  runat="server"  /><br />
                                                <asp:Label ID="Label6" Text='<%#Eval("billemail") %>'  runat="server"  /><br />
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
                </telerik:RadGrid><br /> --%>  
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:SqlDataSource ID="asd_main" runat="server" 
        ConnectionString="<%$ ConnectionStrings:alamaatConnectionString %>" 
        SelectCommand="SELECT * FROM alamaat_Orders order by created desc" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:alamaatConnectionString %>" 
        SelectCommand="SELECT * FROM Order_products" />

    
</asp:Content>



