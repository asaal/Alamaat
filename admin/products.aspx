<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="products.aspx.cs" Inherits="admin_products" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>   
     <table cellpadding="3" style="width:100%">
         <%-- Insert Fields --%>    
       <tr>
       <td align="left" colspan="3"><b>Insert New Record</b></td>
           <td><asp:Button ID="btnSubmit" runat="server" Text="Share"  /> </td>
      </tr>
      <tr>
            <td>Name <asp:HiddenField ID="ProductId" runat="server" /></td>
            <td><asp:TextBox ID="tbname" runat="server" width="200px" BorderColor="Black" Font-Size="14px" Height="15px" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1"  ControlToValidate="tbname" runat="server" ErrorMessage="*Required" ToolTip="*required." ForeColor="Red" ValidationGroup="product" />
            </td>
            <td>Main Image</td>
            <td style="vertical-align:top">
              <asp:AsyncFileUpload ID="imgupload" CompleteBackColor="White" BackColor="white" BorderWidth="0px" Width="350px" Height="5px"   runat="server" ClientIDMode="AutoID"  />
            </td>
          </tr>
       <tr>
            <td>Price</td>
            <td><asp:TextBox ID="tbprice" runat="server" Width="200px"  BorderColor="Black"  Font-Size="14px" Height="15px" OnTextChanged="Calculateprice" AutoPostBack="true" />
             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="tbprice" runat="server" Display="Dynamic" ErrorMessage="*Required" ToolTip="*required." ForeColor="Red" ValidationGroup="product" />
            <%-- <asp:RegularExpressionValidator ID="vldNumber" ControlToValidate="tbprice"
                    Display="Dynamic" ForeColor="Red" ErrorMessage="*Only Integer" ValidationExpression="(^([0-9]*\d*\d{1}?\d*)$)" Runat="server"/>--%>



            </td>
            <td></td><td><asp:Button ID="SubmitButton" Text ="Upload" runat="server" Width="200" OnClick="ImageUpload" /></td>
       </tr>
          <tr>
            <td>Discount</td>
            <td><asp:TextBox ID="tbdiscount" Text="0" runat="server" Width="200px" BorderColor="Black"  Font-Size="14px" Height="15px" OnTextChanged="Calculateprice" AutoPostBack="true" />
             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="tbdiscount" runat="server" Display="Dynamic" ErrorMessage="*Required" ToolTip="*required." ForeColor="Red" ValidationGroup="product" />
                 <%--<asp:comparevalidator id="CompareValidator2" runat="server" ControlToValidate="tbdiscount" ForeColor="Red" Display="Dynamic"
                    operator="DataTypeCheck" type="Integer" >*Only Integer</asp:comparevalidator>
                <asp:RegularExpressionValidator ID="REV" ControlToValidate="tbdiscount"
                    Display="Dynamic" ForeColor="Red" ErrorMessage="*Only Integer" ValidationExpression="(^([0-9]*\d*\d{1}?\d*)$)" Runat="server"/>--%>

            </td>
              <td colspan="2" rowspan="4" style="text-align:center">
                <asp:HiddenField ID="ImgId" runat="server" /><asp:Label runat="server" Text="" ID="lblimg" />
            <asp:Image ID="Img" runat="server" Width="25%" Height="25%"  /></td>
           </tr>
            
       </tr>
          <tr>
            <td>Sale Price</td>
            <td><asp:TextBox ID="tbSaleprice" BackColor="LightGray" runat="server" Width="200px" BorderColor="Black" ReadOnly="true"  Font-Size="14px" Height="15px"  />
            </td>
       </tr>
       <tr>
        <td>Category</td>
        <td><asp:DropDownList ID="ComboCategory" runat="server" Width="210px" Height="25px" DataSourceID="sds_type" DataTextField="name" DataValueField="id"  >                           
           </asp:DropDownList>
        </td>
            
        <tr><td>Details</td><td><asp:TextBox ID="tbdetails" runat="server" Width="200px" Height="80px" TextMode="MultiLine" BorderColor="Black" Font-Size="14px"  /></td></tr>
         <tr><td colspan="4"><asp:Label runat="server" ID="lbloutput" /></td></tr>
        <tr>
            <td>Thumb</td><td style="vertical-align:top">
              <asp:AsyncFileUpload ID="ThumbUpload" CompleteBackColor="White" BackColor="white" BorderWidth="0px" Width="350px" Height="5px"   runat="server" ClientIDMode="AutoID"  />
                <br />
                          </td>
            </tr>
           <tr><td></td> <td><asp:Button ID="btnSubmit2" Text ="Upload Thumb" runat="server" Width="200" OnClick="Upload" /></td>
          </tr>
        <tr><td>&nbsp;</td></tr>
       <tr>          
           <asp:DataList ID="DataList1" RepeatColumns="4" Width="250"  runat="server" DataKeyField="id" >
            <ItemTemplate>
                <div class="extra-wrap">
                    <div>
                        <%--<asp:Image runat="server"  Width="40" Height="40" src='<%# "ShowImage.ashx?ID=" + DataBinder.Eval(Container.DataItem, "ID")  %>' ID="Img1"/>--%>
                        <a  href='<%# "../ShowThumb.ashx?ID=" + Eval("id")%>' data-gal="prettyVideo[prettyVideo]" >
                            <asp:Image runat="server"  Width="170" Height="120" src='<%# "../ShowThumb.ashx?ID=" + Eval("id")%>' ID="Image1"/></a>
                        </a>
                        <a>
                            <asp:Button Text="Remove" runat="server" Width="75" Height="25" OnCommand="RemoveThumbnails"  CommandArgument='<%#Eval("id") %>'   />
                         </a>
                    </div>
                </div>
            </ItemTemplate>
          </asp:DataList>
                
       </tr>
          <tr><td></td><td><asp:Button ID="btn_insert" runat="server" Text="Save" OnClick="Saved_Product"  Width="150px" ValidationGroup="product"  /></td>        
      </tr>   
      


           </table>
    
     <telerik:RadGrid runat="server" ID="RadGrid2"  AllowPaging="True" 
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
                        <GroupByExpressions>
                            <telerik:GridGroupByExpression>
                                <SelectFields>
                                    <telerik:GridGroupByField FieldAlias="PCategory" FieldName="PCategory" 
                                        HeaderText="Category" HeaderValueSeparator=": " />
                                </SelectFields>
                                <GroupByFields>
                                    <telerik:GridGroupByField FieldName="category" SortOrder="Descending" />
                                </GroupByFields>
                            </telerik:GridGroupByExpression>
                        </GroupByExpressions>
                        <Columns>
                            <telerik:GridTemplateColumn HeaderStyle-HorizontalAlign="Center" 
                                HeaderStyle-VerticalAlign="Middle" HeaderText="ID" UniqueName="ID" 
                                Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblId" runat="server" Text='<%# Eval("id") %>' />
                                </ItemTemplate>
                                <HeaderStyle Width="10%" />
                            </telerik:GridTemplateColumn>
                            <%-- <telerik:GridTemplateColumn HeaderText="Motor Template" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" UniqueName="MotorTemplate" SortExpression="MotorTemplate">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblName" Text='<%# Eval("MotorTemplate") %>' />
                                </ItemTemplate>
                      
                            <HeaderStyle  Width="20%" HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                      
                            </telerik:GridTemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderStyle-HorizontalAlign="Center" 
                                HeaderStyle-VerticalAlign="Middle" HeaderText="Name " SortExpression="Name" 
                                UniqueName="Name">
                                <ItemTemplate>
                                   <table>
                                        <tr>
                                            <td style="vertical-align:top; text-align:left;  width:250px;float:left; border-color:transparent" >
                                                <%-- <asp:Image ID="Image1" ImageUrl="~/images/slider/book1.jpg" runat="server" Width="250" Height="250"  /> --%>
                                               <a  href='<%# "ShowImage.ashx?ID=" + Eval("id")%>' data-gal="prettyVideo[prettyVideo]" >
                                                    <asp:Image runat="server"   src='<%# "../ShowImage2.ashx?id=" + DataBinder.Eval(Container.DataItem, "fileid")  %>' ID="Img1" Width="100" Height="150"/>
                                                 </a>  
                                             </td>
                                            <td style="float:left; text-align:left;border-color:transparent;vertical-align:top">
                                                 <h3><asp:Label ID="Label1"  runat="server"  Text='<%# Eval("productname") %>' /></h3>
                                                 <asp:Label ID="Label2"  Text="Price: Rs. "  runat="server" Font-Bold="true"  />
                                                 <asp:Label ID="Label3" Text='<%#Eval("originalprice") %>'  runat="server"  /><br />
                                                
                                                 <asp:Label ID="Label4"  Text="Discount:"  runat="server" Font-Bold="true"  />
                                                 <asp:Label ID="Label5" Text='<%#Eval("discount") %>'  runat="server"  /><br />

                                                 <asp:Label ID="Label6"  Text="Sale Price: Rs."  runat="server" Font-Bold="true"  />
                                                 <asp:Label ID="Label7" Text='<%#Eval("price") %>'  runat="server"  /><br /><br />

                                                 <asp:Button   ID="btnEdit" BorderColor="Black" BorderWidth="1px"   runat="server" Text="Edit" Font-Bold="true" Width="125px" Height="28px"  CommandName="ON" OnCommand="EditClick"  CommandArgument='<%#Eval("id") %>'  />
                                                 <asp:Button   ID="Button1" BorderColor="Black" BorderWidth="1px"   runat="server" Text="Delete" Font-Bold="true" Width="125px" Height="28px"  CommandName="ON" OnCommand="DeleteClick"  CommandArgument='<%#Eval("id") %>'  />
                                                 <%--<asp:Button   ID="Button1" BorderColor="Black" BorderWidth="1px"   runat="server" Text="Add to Cart" Font-Bold="true" Width="125px" Height="28px"  CommandName="ON" OnCommand="AddtoCart"  CommandArgument='<%#Eval("id") %>'  />--%>
                                                <%-- <telerik:RadButton   ID="btnOFF" OnCommand="BtnOnClick" runat="server" Text="OFF" Font-Bold="true" Width="100%"  CommandName="OFF"  CommandArgument='<%#Eval("DeviceID") %>' />--%>

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
                </telerik:RadGrid><br />
   
            </ContentTemplate>
           <Triggers>
                        <asp:PostBackTrigger ControlID="UpdatePanel1$btnSubmit2" />
               <asp:PostBackTrigger ControlID="UpdatePanel1$SubmitButton" />
                    </Triggers>
     </asp:UpdatePanel>
     <asp:SqlDataSource ID="asd_main" runat="server" 
          ConnectionString="<%$ ConnectionStrings:alamaatConnectionString %>" 
          SelectCommand="SELECT a.*,b.name as PCategory FROM [alamaat_products] a,[product_category] b where a.category = b.id order by productname" />
    <asp:SqlDataSource ID="sds_type" runat="server" 
          ConnectionString="<%$ ConnectionStrings:alamaatConnectionString %>" 
          SelectCommand="SELECT * FROM product_category" />
    <asp:SqlDataSource ID="sds_images" runat="server" 
        ConnectionString="<%$ ConnectionStrings:alamaatConnectionString %>" 
        SelectCommand="SELECT Top 8 * FROM [FileMaster]">
    </asp:SqlDataSource>	
</asp:Content>

