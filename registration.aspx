<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="registration.aspx.cs" Inherits="registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>   
            <fieldset style="border-color:black" runat="server" id="regpanel">
            <legend>Registration Form</legend>
                <table style="margin-left:70px">
                            <tr style="height:35px;">
                               <td style="width:100px"><asp:Label ID="Label5" runat="server" AssociatedControlID="tbfirstname" Text="First Name:*" /></td>
                               <td><asp:TextBox Width="175"  TabIndex="1" runat="server"  ID="tbfirstname" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="tbfirstname"
                                    CssClass="field-validation-error" ForeColor="Red" ValidationGroup="RegValidatioan" Text="*Required"  /></td>
                                 <td style="width:30px"></td>
                                <td style="width:100px"><asp:Label ID="Label6" runat="server" AssociatedControlID="tbaddress" Text="Address 1:*" /></td>
                               
                               <td ><asp:TextBox Width="175" TabIndex="8" runat="server" ID="tbaddress" />
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="tbaddress"
                                    CssClass="field-validation-error" ForeColor="Red" ValidationGroup="RegValidatioan" Text="*Required"  />
                               </td>
                            </tr>
                             <tr style="height:35px;">
                               <td><asp:Label ID="Label15" runat="server" AssociatedControlID="tbmiddlename" Text="Middle Name:" /></td>
                               <td><asp:TextBox Width="175"  TabIndex="1" runat="server"  ID="tbmiddlename" />
                               <td style="width:30px"></td>
                               <td><asp:Label ID="Label7" runat="server" AssociatedControlID="tbaddress2">Address 2:(optional)</asp:Label></td>
                                <td><asp:TextBox Width="175" TabIndex="9" runat="server" ID="tbaddress2" /></td>
                            </tr>
                             <tr style="height:35px;">
                               <td><asp:Label ID="Label16" runat="server" AssociatedControlID="tblastname" Text="Last Name:*" /></td>
                               <td><asp:TextBox Width="175"  TabIndex="1" runat="server"  ID="tblastname" />
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="tbfirstname"
                                    CssClass="field-validation-error" ForeColor="Red" ValidationGroup="RegValidatioan" Text="*Required"  /></td>
                                <td style="width:auto"></td>
                                 <td><asp:Label ID="Label8" runat="server" AssociatedControlID="tbcity">City:*</asp:Label></td> 
                                <td><asp:TextBox Width="175" TabIndex="10" runat="server" ID="tbcity" />
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="tbcity"
                                    CssClass="field-validation-error" ForeColor="Red" ValidationGroup="RegValidatioan" Text="*Required"  />
                                </td>
                            </tr>
                            <tr style="height:35px;">
                               <td><asp:Label ID="Label1" runat="server" AssociatedControlID="UserName">User name:*</asp:Label></td>
                               <td><asp:TextBox Width="175" TabIndex="2" runat="server" ID="UserName" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName"
                                    CssClass="field-validation-error" ForeColor="red" ValidationGroup="RegValidatioan" Text="*Required" /></td>
                                 <td style="width:auto"></td>
                                 <td><asp:Label ID="Label9" runat="server" AssociatedControlID="tbprovince">Province/State:</asp:Label></td> 
                                <td><asp:TextBox Width="175" TabIndex="11" runat="server" ID="tbprovince" />
                                     <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="tbprovince"
                                    CssClass="field-validation-error" ForeColor="Red" ValidationGroup="RegValidatioan" Text="*Required"  />--%>
                                </td>
                               
                            </tr>
                            <tr style="height:35px;">
                                <td><asp:Label ID="Label3" runat="server" AssociatedControlID="Password">Password:*</asp:Label></td>
                                <td><asp:TextBox Width="175" TabIndex="3" runat="server" ID="Password" TextMode="Password" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Password"
                                    CssClass="field-validation-error" ForeColor="Red" ValidationGroup="RegValidatioan" Text="*Required"  /></td>
                                 <td style="width:auto"></td>
                              <td><asp:Label ID="Label10" runat="server" AssociatedControlID="tbcountry">Country:*</asp:Label></td> 
                                <td><asp:TextBox Width="175" TabIndex="12" runat="server" ID="tbcountry" />
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="tbcountry"
                                    CssClass="field-validation-error" ForeColor="Red" ValidationGroup="RegValidatioan" Text="*Required"  />
                                </td>
                               
                            </tr>
                            <tr style="height:35px;">
                                <td><asp:Label ID="Label4" runat="server" AssociatedControlID="ConfirmPassword">Confirm password:*</asp:Label></td>
                                <td><asp:TextBox Width="175" TabIndex="4" runat="server" ID="ConfirmPassword" TextMode="Password" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ConfirmPassword"
                                     CssClass="field-validation-error" ForeColor="Red" ValidationGroup="RegValidatioan" Display="Dynamic" Text="*Required"  />
                                     <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                                     CssClass="field-validation-error" ForeColor="Red" ValidationGroup="RegValidatioan" Display="Dynamic" Text="*Password do not match"  /></td>
                                 <td style="width:auto"></td>
                                 <td><asp:Label ID="Label12" runat="server" AssociatedControlID="tbpCode">Postal Code/Zip:</asp:Label></td> 
                                <td><asp:TextBox Width="175" TabIndex="13" runat="server" ID="tbpCode" /></td>
                            </tr>
                            <tr style="height:35px;">
                                 <td><asp:Label ID="Label2" runat="server" AssociatedControlID="Email">Email:*</asp:Label></td>
                                 <td><asp:TextBox Width="175" TabIndex="5" runat="server" ID="Email"  />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Email"
                                    CssClass="field-validation-error" ForeColor="Red" ValidationGroup="RegValidatioan" Text="*Required"  /></td>
                                 <td style="width:auto"></td>
                               <td><asp:Label ID="Label13" runat="server" AssociatedControlID="tbphone">Phone:*</asp:Label></td>
                                 <td><asp:TextBox Width="175" TabIndex="7" runat="server" ID="tbphone"  />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="tbphone"
                                    CssClass="field-validation-error" ForeColor="Red" ValidationGroup="RegValidatioan" Text="*Required"  /></td>
                            </tr>
                             <tr style="height:35px;">
                                 <td><asp:Label ID="Label11" runat="server" AssociatedControlID="tbconfirmEmail">Confirm Email:*</asp:Label></td>
                                 <td><asp:TextBox Width="175" TabIndex="6" runat="server" ID="tbconfirmEmail"  />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="tbconfirmEmail"
                                    CssClass="field-validation-error" ForeColor="Red" ValidationGroup="RegValidatioan" Text="*Required"  />
                                      <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="Email" ControlToValidate="tbconfirmEmail"
                                     CssClass="field-validation-error" ForeColor="Red" ValidationGroup="RegValidatioan" Display="Dynamic" Text="*Email do not match" />
                                 </td>
                                  <td style="width:auto"></td>
                                <td><asp:Label ID="Label17" runat="server" AssociatedControlID="tbMobilephone">Mobile Phone:</asp:Label></td>
                                 <td><asp:TextBox Width="175" TabIndex="7" runat="server" ID="tbMobilephone"  /></td>
                               
                            </tr>
                             <tr style="height:35px;">
                                 
                                 <td><asp:Label ID="Label14" runat="server" AssociatedControlID="tbphone">Date of Birth:</asp:Label></td>
                                 <td><asp:TextBox Width="175" TabIndex="14" runat="server" ID="tbbirth"  /></td>
                                  <td style="width:auto"></td>
                                   <td><asp:Label ID="Label18" runat="server" AssociatedControlID="tbphone">Fax:</asp:Label></td>
                                 <td><asp:TextBox Width="175" TabIndex="14" runat="server" ID="tbfax"  /></td>
                            </tr>
                            <tr><td colspan="4"><asp:ValidationSummary ID="VSummary" ValidationGroup="RegValidatioan" runat="server" ForeColor="Red"  /></td></tr>
                        
                            <tr><td colspan="3">
                                <asp:Button ID="btnregister" TabIndex="15" runat="server" CommandName="MoveNext" OnClick="SaveClick" Text="Register" ValidationGroup="RegValidatioan" />
                                <asp:Button ID="btnupdate" Visible="false" TabIndex="15" runat="server" CommandName="MoveNext" OnClick="UpdateClick" Text="Update" ValidationGroup="RegValidatioan" />
                                </td></tr>

                   
                            <tr><td><asp:Label runat="server" ID="lblError" Text="" ForeColor="Red" /></td></tr>
                     </table>
            </fieldset>
                <asp:Label runat="server" ID="lbloutput" Text="" />
         </ContentTemplate>
    </asp:UpdatePanel>       
    <br />
    <br />
</asp:Content>

