<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="cart.aspx.cs" Inherits="cart"  Culture="ur-pk" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
     <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <h3>Cart</h3>
               
                <asp:Wizard ID="ShippingWizard"  runat="server" CellPadding="5"  Width="95%" StartNextButtonText="Check out Now" StartNextButtonStyle-BackColor="Green" 
                     StartNextButtonStyle-Width="150px" StartNextButtonStyle-Height="30px" FinishCompleteButtonText="Confirm Purchase" StartNextButtonStyle-Font-Bold="true" StartNextButtonStyle-ForeColor="White"
                     FinishCompleteButtonStyle-BackColor="Green" FinishCompleteButtonStyle-Height="30px"  FinishCompleteButtonStyle-Width="150px" FinishCompleteButtonStyle-Font-Bold="true" FinishCompleteButtonStyle-ForeColor="White"
                     FinishPreviousButtonStyle-Width="150px" FinishPreviousButtonStyle-Height="30px" FinishPreviousButtonStyle-BackColor="Green" FinishPreviousButtonStyle-Font-Bold="true" FinishPreviousButtonStyle-ForeColor="White"
                     NavigationButtonStyle-Width="150px" NavigationButtonStyle-Height="30px" NavigationButtonStyle-BackColor="Green" NavigationButtonStyle-Font-Bold="true" NavigationButtonStyle-ForeColor="White"
                     StepNextButtonStyle-BackColor="Green" StepNextButtonStyle-ForeColor="White" StepNextButtonStyle-Font-Bold="true" 
                    OnFinishButtonClick="ConfirmPurchase" OnNextButtonClick="ShippingWizard_NextButtonClick" >
                <WizardSteps>
                        <asp:WizardStep  runat="server" Title=""  StepType="Start">          
                            <div class="container">			           
                                 <div style="text-align:right"><h6><a href="../Products.aspx">Continue Shopping</a></h6></div><br />
			                    <asp:GridView runat="server" ID="gvShoppingCart" AutoGenerateColumns="false" EmptyDataText="There is nothing in your shopping cart." GridLines="None" Width="100%" CellPadding="5" ShowFooter="true" DataKeyNames="ProductId" OnRowDataBound="gvShoppingCart_RowDataBound" OnRowCommand="gvShoppingCart_RowCommand">
				                    <HeaderStyle HorizontalAlign="Left" BackColor="#3D7169" ForeColor="#FFFFFF" />
				                    <FooterStyle HorizontalAlign="Right" BackColor="#6C6B66" ForeColor="#FFFFFF" />
				                    <AlternatingRowStyle BackColor="#F8F8F8" />
				                    <Columns>
					                    <asp:BoundField DataField="Description" HeaderText="Name" />
					                    <asp:TemplateField HeaderText="Quantity">
						                    <ItemTemplate>
							                    <asp:TextBox runat="server" ID="txtQuantity" Columns="5" Text='<%# Eval("Quantity") %>'></asp:TextBox><br />
							                    <asp:LinkButton runat="server" ID="btnRemove" Text="Remove" CommandName="Remove" CommandArgument='<%# Eval("ProductId") %>' style="font-size:12px;"></asp:LinkButton>
						                    </ItemTemplate>
					                    </asp:TemplateField>
					                    <asp:BoundField DataField="UnitPrice" HeaderText="Price Rs." ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right" DataFormatString="{0:N2}"  />
					                    <asp:BoundField DataField="TotalPrice" HeaderText="Total Rs." ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right" DataFormatString="{0:N2}" />
                    
				                    </Columns>
			                    </asp:GridView>
                                <br />
			                    <asp:Button runat="server" ID="btnUpdateCart" Text="Update Cart" OnClick="btnUpdateCart_Click" /><br /><br />
                                    <asp:Label runat="server" Id="wizardError" ForeColor="red" />
		                    </div>   
                        </asp:WizardStep>
                        <asp:WizardStep  runat="server" Title=""  StepType="Step">         
                            <asp:RadioButton ID="radioTCS" GroupName="shipping"  Text="<b>TCS</b> Shipping: Rs 69/lb. (Discount/Fee: Rs. 68.00)" runat="server" OnCheckedChanged="ChkShippingchanged" AutoPostBack="true"  />
			                <br />
                            <asp:RadioButton ID="radioDHL" GroupName="shipping"  Text="<b>DHL</b>(rates varies as per Country) Shipping Rs. 1364/kg (Discount/Fee: Rs. 1364.00)" runat="server" OnCheckedChanged="DHLChkShipping" AutoPostBack="true" /><br/>
                            <br /><br /><asp:Label ID="lblShipError" runat="server" ForeColor="Red"></asp:Label>
                        </asp:WizardStep>     
                        <asp:WizardStep  runat="server" Title=""  StepType="Finish" >
                            <table runat="server" visible="false">
                                <tr><td style="width:250px"><h3>Bill To</h3></td><td><h3>Ship To</h3></td></tr>
                                <tr><td><asp:Label runat="server" id="lblBillTo" > 

                                        </asp:Label></td><td><asp:Label runat="server" id="lblshipTo" > </asp:Label></td></tr>
                            </table>
                            <table runat="server" id="tblogin">
                                    <tr><td colspan="4"> <p>When you are already registered, please login directly here</p></td></tr>
                                    <tr><td style="width:80px;">Username:</td><td style="width:180px;"><asp:TextBox runat="server" Width="150" Height="20" ID="tbloginname" /></td>
                                    <td style="width:80px;">Password:</td><td style="width:180px;"><asp:TextBox  runat="server" Width="150" Height="20" ID="tbloginpassword" TextMode="Password" /></td>
                                    <td><asp:Button ID="Button1" runat="server" Text="Login" OnClick="loginClick" /></td>
                                    </tr>
                                    <tr><td colspan="4"><asp:Label runat="server" ID="lbllogin" Font-Bold="true" ForeColor="Red" /></td></tr>
                                    <tr><td colspan="2" style="text-align:center; padding-left:50px">
                                        <asp:LinkButton ID="LinkButton1" Text="Forget you Username?" runat="server" Width="150" Height="25" /></td>                  
                                        <td colspan="2" style="text-align:center;padding-left:50px"><asp:LinkButton ID="LinkButton2" Text="Forget your Password?" runat="server" Width="150" Height="25" /></td>
                                    </tr>
                                    <tr><td colspan="4">&nbsp;</td></tr>
                                </table>
                                <asp:Panel runat="server" ID="Panellogin" Visible="false">
                                    <asp:Label runat="server" ID="lblusername" Text=""/>
                                    <asp:Button ID="Button6" runat="server" Text="Logout" OnClick="LogoutClick" />
                                </asp:Panel>
                                <table runat="server" id="Edittable">
                                    <tr><td><h5>Bill To</h5></td><td></td><td></td><td style="width:50px"></td><td><h5>Ship To</h5></td></tr>
                                    <tr><td colspan="2"><asp:Label runat="server" id="loginInfor" > </asp:Label></td>
                                        <td colspan="2"><asp:Label runat="server" id="lblshipInfo" > </asp:Label></td>
                                    </tr>
                                    <tr runat="server" id="btnAddEdit">
                                        <td colspan="2"><asp:Button ID="Button2" runat="server" Text="Add/Edit billing address information" OnClick="Billingaddress_Click"  /></td>
                                        <td colspan="2">&nbsp;</td>
                                        <td colspan="2"><p>Only in case shipment address is different from billing address,<br />
                                                    click »Add/Edit shipment address« button below </p></td>
                                    </tr>
                                    <tr runat="server" id="btn1AddEdit"><td></td><td></td><td></td><td></td><td>
                                        <asp:Button ID="Button3" runat="server" Text="Add/Edit shipment address" OnClick="Shippingaddress_Click"  /></td></tr>
                                </table>          
                                <asp:Panel runat="server" ID="RegPanel" Visible="false">
			                        <h6>Add/Edit billing address information</h6><br />
                                   <%-- <p>Please use Register And Checkout to easily get access to your order history</p>--%>
                                    <asp:Button ID="btnbillsave" Visible="false" Font-Bold="true" runat="server" Text="Save" width="150px" ValidationGroup="registration" OnClick="EditBillclick" />
                                    <asp:Button ID="btnregister" Visible="false" Font-Bold="true" runat="server" Text="Register" width="150px" ValidationGroup="registration" OnClick="RegisterUser" />
                                    <asp:Button ID="btnbillcancel" Visible="false" Font-Bold="true" runat="server" Text="Cancel" Width="150px" OnClick="RegistrationCancel" />
                                    <asp:RadioButton ID="rdRegister" GroupName="registration" runat="server" Font-Bold="true" Text="Register and Checkout (Please use Register And Checkout to easily get access to your order history)" 
                                        AutoPostBack="true" OnCheckedChanged="rdRegisterChecked" />
                                    
                                     <br /><br />
                                     <asp:RadioButton ID="rdGuest" GroupName="registration" runat="server" Font-Bold="true" Text="Checkout as Guest" AutoPostBack="true" OnCheckedChanged="rdRegisterChecked" />
                                     <br /><asp:Button ID="rdCancel" runat="server" Text="Cancel" OnClick="RegistrationCancel" />
                                    <asp:Panel runat="server" ID="panelAccount">
                                        
                                        <%-- <asp:Button ID="Button4" runat="server" Font-Bold="true" Text="Register and Checkout" width="150px" ValidationGroup="registration" OnClick="RegisterUser" />
                                        &nbsp;&nbsp;
                                        <asp:Button ID="btnguest" Font-Bold="true" runat="server" Text="Checkout as Guest" width="150px" ValidationGroup="registration" OnClick="Guestclick" />
                                        &nbsp;&nbsp;
                                         <asp:Button ID="btngu" runat="server" Font-Bold="true" Text="Cancel" Width="150px" OnClick="RegistrationCancel" />--%>
                                        <fieldset style="border-color:black" runat="server" id="regisrationPanel" >
                                        <legend>Shopper Information</legend>
                                        <table>
                                           <%-- <tr style="height:35px;">
                                               <td style="width:150px;"><asp:Label ID="Label5" runat="server" AssociatedControlID="tbfullname">Full Name:*</asp:Label></td>
                                               <td><asp:TextBox Width="175"  TabIndex="1" runat="server" ID="tbfullname" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="tbfullname"
                                                    CssClass="field-validation-error" ForeColor="Red" ValidationGroup="registration" Text="*Required"   /></td>
                                
                                            </tr>--%>
                                            <tr style="height:35px;">
                                               <td style="width:150px;"><asp:Label ID="Label2" runat="server" AssociatedControlID="UserName">User name:*</asp:Label></td>
                                               <td><asp:TextBox Width="175" TabIndex="2" runat="server" ID="UserName" />
                                                    <asp:Label runat="server" ID="rfvusername" ForeColor="Red" />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName"
                                                    CssClass="field-validation-error" ForeColor="Red" ValidationGroup="registration" Display="Dynamic" Text="*Required"  />
                                               </td>
                                 
                                            </tr>
                                            <tr style="height:35px;">
                                                <td style="width:150px;"><asp:Label ID="Label3" runat="server" AssociatedControlID="Password">Password:*</asp:Label></td>
                                                <td><asp:TextBox Width="175" TabIndex="3" runat="server" ID="Password" TextMode="Password" />
                                                     <asp:Label runat="server" ID="rfvpassword" ForeColor="Red" />
                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Password"
                                                    CssClass="field-validation-error" ForeColor="Red" ValidationGroup="registration" Display="Dynamic" Text="*Required"  />
                                            </tr>
                                            <tr style="height:35px;">
                                                <td style="width:150px;"><asp:Label ID="Label4" runat="server" AssociatedControlID="ConfirmPassword">Confirm password:*</asp:Label></td>
                                                <td><asp:TextBox Width="175" TabIndex="4" runat="server" ID="ConfirmPassword" TextMode="Password" />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ConfirmPassword"
                                                    CssClass="field-validation-error" ForeColor="Red" ValidationGroup="registration" Display="Dynamic" Text="*Required"  />
                                                     <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                                                     CssClass="field-validation-error" ForeColor="Red" ValidationGroup="registration" Display="Dynamic" Text="*Password do not match" /></td>
                              
                                            </tr>
                                            <tr>
                                                <td colspan="4"><asp:Label runat="server" ID="lblError" ForeColor="Red" /></td>
                                            </tr>
                                            </table>
                                            </fieldset>
                                     </asp:Panel>
                                    <fieldset style="border-color:black" runat="server" id="PanelBill">
                                    <legend>Bill To</legend>
                                    <table>
                             <tr style="height:35px;">
                                <td style="width:150px;"><asp:Label ID="Label10" runat="server" AssociatedControlID="tbcompany">Company Name</asp:Label></td>
                               <td><asp:TextBox Width="175" TabIndex="8" runat="server" ID="tbcompany" />

                               </td>
                            </tr>
                             <tr style="height:35px;">
                                <td style="width:150px;"><asp:Label ID="Label11" runat="server" AssociatedControlID="tbSEmail">Email*</asp:Label></td>
                               <td><asp:TextBox Width="175" TabIndex="8" runat="server" ID="tbSEmail" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbSEmail"
                                     CssClass="field-validation-error" ForeColor="Red" ValidationGroup="registration" Display="Dynamic" Text="*Required"  />
                               </td>
                            </tr>
                             <tr style="height:35px;">
                                <td><asp:Label ID="Label12" runat="server" AssociatedControlID="tbfirstname">First Name*</asp:Label></td>
                               <td><asp:TextBox Width="175" TabIndex="8" runat="server" ID="tbfirstname" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="tbfirstname"
                                     CssClass="field-validation-error" ForeColor="Red" ValidationGroup="registration" Display="Dynamic" Text="*Required"  />
                               </td>
                            </tr>
                             <tr style="height:35px;">
                                <td><asp:Label ID="Label13" runat="server" AssociatedControlID="tbmName">Middle Name</asp:Label></td>
                               <td><asp:TextBox Width="175" TabIndex="8" runat="server" ID="tbmName" /></td>
                            </tr>
                            <tr style="height:35px;">
                                <td><asp:Label ID="Label6" runat="server" AssociatedControlID="tblastname">Last Name*</asp:Label></td>
                               <td><asp:TextBox Width="175" TabIndex="8" runat="server" ID="tblastname" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="tblastname"
                                     CssClass="field-validation-error" ForeColor="Red" ValidationGroup="registration" Display="Dynamic" Text="*Required"  />
                               </td>
                            </tr>
                            <tr style="height:35px;">
                                <td><asp:Label ID="Label7" runat="server" AssociatedControlID="tbaddress1">Address *</asp:Label></td>
                                 <td><asp:TextBox Width="175" TabIndex="9" runat="server" ID="tbaddress1" />
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="tbaddress1"
                                     CssClass="field-validation-error" ForeColor="Red" ValidationGroup="registration" Display="Dynamic" Text="*Required"  />
                                 </td>
                            </tr>
                             <tr style="height:35px;">
                                <td><asp:Label ID="Label14" runat="server" AssociatedControlID="tbcity">City *</asp:Label></td>
                                 <td><asp:TextBox Width="175" TabIndex="9" runat="server" ID="tbcity" />
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="tbcity"
                                     CssClass="field-validation-error" ForeColor="Red" ValidationGroup="registration" Display="Dynamic" Text="*Required"  />
                                 </td>
                            </tr>
                            <tr style="height:35px;">
                                <td><asp:Label ID="Label8" runat="server" AssociatedControlID="tbprovince">Province/State*</asp:Label></td> 
                                <td><asp:TextBox Width="175" TabIndex="10" runat="server" ID="tbprovince" />
                                   <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="tbprovince"
                                     CssClass="field-validation-error" ForeColor="Red" ValidationGroup="registration" Display="Dynamic" Text="*Required"  />--%>
                                </td>
                            </tr>
                             <tr style="height:35px;">
                                <td><asp:Label ID="Label15" runat="server" AssociatedControlID="tbcountry">Country*</asp:Label></td> 
                                <td><asp:TextBox Width="175" TabIndex="10" runat="server" ID="tbcountry" />
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="tbcountry"
                                     CssClass="field-validation-error" ForeColor="Red" ValidationGroup="registration" Display="Dynamic" Text="*Required"  />
                                </td>
                            </tr>
                            <tr style="height:35px;">
                                  <td><asp:Label ID="Label9" runat="server" AssociatedControlID="tbPcode">Zip/Postal Code</asp:Label></td> 
                                <td><asp:TextBox Width="175" TabIndex="11" runat="server" ID="tbPcode" /></td>
                            </tr>
                            <tr style="height:35px;">
                                  <td><asp:Label ID="Label16" runat="server" AssociatedControlID="tbphone">Phone*</asp:Label></td> 
                                <td><asp:TextBox Width="175" TabIndex="11" runat="server" ID="tbphone" />
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="tbphone"
                                     CssClass="field-validation-error" ForeColor="Red" ValidationGroup="registration" Display="Dynamic" Text="*Required"  />
                                </td>
                            </tr>
                            <tr style="height:35px;">
                                  <td><asp:Label ID="Label17" runat="server" AssociatedControlID="tbMobilephone">Mobile Phone</asp:Label></td> 
                                <td><asp:TextBox Width="175" TabIndex="11" runat="server" ID="tbMobilephone" /></td>
                            </tr>
                            <tr style="height:35px;">
                                  <td><asp:Label ID="Label18" runat="server" AssociatedControlID="tbfax">Fax</asp:Label></td> 
                                <td><asp:TextBox Width="175" TabIndex="11" runat="server" ID="tbfax" /></td>
                            </tr>
                            <tr style="height:35px;">
                                  <td colspan="2"><asp:CheckBox  runat="server" ID="chkterms" Text="I agree to the Terms of Service" /></td> 
                                
                            </tr>
                    </table>
                                </fieldset>
			                    </asp:Panel>
                                <asp:Panel runat="server" ID="ShippingPanel" Visible="false">
			                        <h6>Add/Edit Shipping address information</h6>               
                                    <asp:Button ID="Button8" runat="server" Text="Save" width="150px" ValidationGroup="shipping" OnClick="EditShippinClick" />
                                    <asp:Button ID="Button9" runat="server" Text="Cancel" Width="150px" OnClick="RegistrationCancel" />
                                    <fieldset style="border-color:black">
                                        <legend>Shipping</legend>
                                        <table>
                             <tr style="height:35px;">
                                <td style="width:150px;"><asp:Label ID="Label23" runat="server" AssociatedControlID="tbcompany">Company Name</asp:Label></td>
                               <td><asp:TextBox Width="175" TabIndex="8" runat="server" ID="tbScompany" />

                               </td>
                            </tr>
                             <tr style="height:35px;">
                                <td style="width:150px;"><asp:Label ID="Label24" runat="server" AssociatedControlID="tbSSEmail">Email*</asp:Label></td>
                               <td><asp:TextBox Width="175" TabIndex="8" runat="server" ID="tbSSEmail" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="tbSSEmail"
                                     CssClass="field-validation-error" ForeColor="Red" ValidationGroup="shipping" Display="Dynamic" Text="*Required"  />
                               </td>
                            </tr>
                             <tr style="height:35px;">
                                <td><asp:Label ID="Label25" runat="server" AssociatedControlID="tbSfirstname">First Name*</asp:Label></td>
                               <td><asp:TextBox Width="175" TabIndex="8" runat="server" ID="tbSfirstname" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="tbSfirstname"
                                     CssClass="field-validation-error" ForeColor="Red" ValidationGroup="shipping" Display="Dynamic" Text="*Required"  />
                               </td>
                            </tr>
                             <tr style="height:35px;">
                                <td><asp:Label ID="Label26" runat="server" AssociatedControlID="tbSmName">Middle Name</asp:Label></td>
                               <td><asp:TextBox Width="175" TabIndex="8" runat="server" ID="tbSmName" /></td>
                            </tr>
                            <tr style="height:35px;">
                                <td><asp:Label ID="Label27" runat="server" AssociatedControlID="tbSlastname">Last Name*</asp:Label></td>
                               <td><asp:TextBox Width="175" TabIndex="8" runat="server" ID="tbSlastname" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="tbSlastname"
                                     CssClass="field-validation-error" ForeColor="Red" ValidationGroup="shipping" Display="Dynamic" Text="*Required"  />
                               </td>
                            </tr>
                            <tr style="height:35px;">
                                <td><asp:Label ID="Label28" runat="server" AssociatedControlID="tbSaddress1">Address 1*</asp:Label></td>
                                 <td><asp:TextBox Width="175" TabIndex="9" runat="server" ID="tbSaddress1" />
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="tbSaddress1"
                                     CssClass="field-validation-error" ForeColor="Red" ValidationGroup="shipping" Display="Dynamic" Text="*Required"  />
                                 </td>
                            </tr>
                             <tr style="height:35px;">
                                <td><asp:Label ID="Label29" runat="server" AssociatedControlID="tbScity">City*</asp:Label></td>
                                 <td><asp:TextBox Width="175" TabIndex="9" runat="server" ID="tbScity" />
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="tbScity"
                                     CssClass="field-validation-error" ForeColor="Red" ValidationGroup="shipping" Display="Dynamic" Text="*Required"  />
                                 </td>
                            </tr>
                            <tr style="height:35px;">
                                <td><asp:Label ID="Label30" runat="server" AssociatedControlID="tbprovince">Province*</asp:Label></td> 
                                <td><asp:TextBox Width="175" TabIndex="10" runat="server" ID="tbSprovince" />
                                    
                                </td>
                            </tr>
                             <tr style="height:35px;">
                                <td><asp:Label ID="Label31" runat="server" AssociatedControlID="tbScountry">Country*</asp:Label></td> 
                                <td><asp:TextBox Width="175" TabIndex="10" runat="server" ID="tbScountry" />
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="tbScountry"
                                     CssClass="field-validation-error" ForeColor="Red" ValidationGroup="shipping" Display="Dynamic" Text="*Required"  />
                                </td>
                            </tr>
                            <tr style="height:35px;">
                                  <td><asp:Label ID="Label32" runat="server" AssociatedControlID="tbSPcode">Zip/Postal Code*</asp:Label></td> 
                                <td><asp:TextBox Width="175" TabIndex="11" runat="server" ID="tbSPcode" /></td>
                            </tr>
                            <tr style="height:35px;">
                                  <td><asp:Label ID="Label33" runat="server" AssociatedControlID="tbSphone">Phone*</asp:Label></td> 
                                <td><asp:TextBox Width="175" TabIndex="11" runat="server" ID="tbSphone" />
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="tbSphone"
                                     CssClass="field-validation-error" ForeColor="Red" ValidationGroup="shipping" Display="Dynamic" Text="*Required"  />
                                </td>
                            </tr>
                            <tr style="height:35px;">
                                  <td><asp:Label ID="Label34" runat="server" AssociatedControlID="tbMobilephone">Mobile Phone*</asp:Label></td> 
                                <td><asp:TextBox Width="175" TabIndex="11" runat="server" ID="tbSmpohone" /></td>
                            </tr>
                            <tr style="height:35px;">
                                  <td><asp:Label ID="Label35" runat="server" AssociatedControlID="tbfax">Fax</asp:Label></td> 
                                <td><asp:TextBox Width="175" TabIndex="11" runat="server" ID="tbSfax" /></td>
                            </tr>
                            <tr style="height:35px;">
                                  <td colspan="2"><asp:CheckBox  runat="server" ID="chkSterms" Text="I agree to the Terms of Service" /></td> 
                                
                            </tr>
                    </table>
                                    </fieldset>
			                    </asp:Panel>
			                    <br /><br />
                            <asp:GridView runat="server" ID="gvShoppingCart2" AutoGenerateColumns="false" EmptyDataText="There is nothing in your shopping cart." GridLines="None" Width="100%" CellPadding="5" ShowFooter="true" DataKeyNames="ProductId" OnRowDataBound="gvShoppingCart2_RowDataBound" OnRowCommand="gvShoppingCart_RowCommand">
				                <HeaderStyle HorizontalAlign="Left" BackColor="#3D7169" ForeColor="#FFFFFF" />
				                <FooterStyle HorizontalAlign="Right" BackColor="#6C6B66" ForeColor="#FFFFFF" />
				                <AlternatingRowStyle BackColor="#F8F8F8" />               
				                <Columns>
					                <asp:BoundField DataField="Description" HeaderText="Name" />
					                <asp:TemplateField HeaderText="Quantity">
						                <ItemTemplate>
							                <asp:TextBox runat="server" ID="txtQuantity" Columns="5" Text='<%# Eval("Quantity") %>'></asp:TextBox><br />
							                <asp:LinkButton runat="server" ID="btnRemove" Text="Remove" CommandName="Remove" CommandArgument='<%# Eval("ProductId") %>' style="font-size:12px;"></asp:LinkButton>
						                </ItemTemplate>
					                </asp:TemplateField>
					                <asp:BoundField DataField="UnitPrice" HeaderText="Price" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right" DataFormatString="{0:C}" />
					                <asp:BoundField DataField="TotalPrice" HeaderText="Total" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right" DataFormatString="{0:C}" />                 
				              </Columns>
			                </asp:GridView><br />
                            <asp:Button runat="server" ID="Button7" Text="Update Cart" OnClick="btnUpdateCart2_Click" /><br /><br />
                            <asp:Label runat="server" ID="lbloutput" ForeColor="Red" Text="" />
                        </asp:WizardStep>
                   </WizardSteps>
                </asp:Wizard>

                <asp:Panel runat="server" ID="ConfOrder" Visible="false">
                    <h6>Thank you for your order!</h6>
                    <hr />
                    <asp:Label runat="server" ID="lblorderemail" Text="Info: Message sent to" Font-Bold="true" ForeColor="Blue" />
                    <hr />
                    <table border="1">
                        <tr>
                            <td style="width:250px"><b>Shipping</b></td>
                            <td><asp:Label runat="server" ID="lblordershiptype"  Text="" /></td>
                        </tr>
                        <tr>
                            <td><b>Order Number</b></td>
                            <td><asp:Label runat="server" ID="lblordernumber"  Text="" /></td>
                        </tr>
                        <tr>
                            <td><b>Amount</b></td>
                            <td><asp:Label runat="server" ID="lblorderamount" Text="300" /></td>
                        </tr>
                    </table>
                </asp:Panel>

            </ContentTemplate>
    </asp:UpdatePanel>
    <br /><br />

   <script type="text/javascript">
       function f1()
       {
           //var a = document.getElementById('RegPanel');
           document.getElementById('<%=RegPanel.ClientID %>').style.visibility = 'Visible';
       }
       
    </script>
</asp:Content>

