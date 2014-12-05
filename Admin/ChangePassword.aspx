<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" MasterPageFile="~/Admin/MasterPageControlPanel.master" Theme="AdminTheme" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlPanelContentPlaceHolder">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
              <ContentTemplate>
     <table style="width:100%;background-color:#f5eaa9;border:2px solid lightgray;border-color:gray;border-radius:20px;box-shadow:green 2px 5px">
       <tr><td>
        
           <table style="width:100%;height:250px">
         <tr>
                <td colspan="3">
                    Change Password
                </td>
            </tr>
               <tr>
                   <td colspan="3" style="text-align:center">
                       <asp:Label ID="lblPwdStatus" runat="server"></asp:Label>
                   </td>
               </tr>
            <tr>
                <th style="text-align:right;width:48%">Old Password</th>
                <th style="width:2%">:</th>
                <td><asp:TextBox ID="txtOldPassword" runat="server" TextMode="Password" AutoPostBack="true" OnTextChanged="txtOldPassword_TextChanged" ValidationGroup="ChangePwd"></asp:TextBox>
                    
                    <asp:Label ID="lblStatus" runat="server" ForeColor="Red"></asp:Label>
                    
              
                    <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="txtOldPassword" ErrorMessage="Please enter old pasword" Display="None" SetFocusOnError="true" ValidationGroup="ChangePwd" ForeColor="Red"></asp:RequiredFieldValidator>
                    <ajax:ValidatorCalloutExtender ID="vce1" runat="server" Width="250" TargetControlID="rfv1" WarningIconImageUrl="~/Images/Warning_Icon.jpg" PopupPosition="Right" HighlightCssClass="highlightError">
                        <Animations>
                            <OnShow>
                                <Sequence>
                                    <HideAction Visible="true" />
                                    <FadeIn Duration="1" MinimumOpacity="0" MaximumOpacity="1">

                                    </FadeIn>
                                </Sequence>
                            </OnShow>
                            <OnHide>
                                <Sequence>
                                    <HideAction Visible="false" />
                                    <FadeOut Duration="1" MinimumOpacity="0" MaximumOpacity="1">

                                    </FadeOut>
                                </Sequence>
                            </OnHide>
                        </Animations>
                    </ajax:ValidatorCalloutExtender>
                </td>
            </tr>
            <tr>
                <th style="text-align:right">New Password</th>
                <th>:</th>
                <td>
                    <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" ValidationGroup="ChangePwd"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv2" runat="server" ControlToValidate="txtNewPassword" ErrorMessage="Please enter New pasword" ValidationGroup="ChangePwd" Display="None" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                    <ajax:ValidatorCalloutExtender ID="vce2" runat="server" Width="250" TargetControlID="rfv2" WarningIconImageUrl="~/Images/Warning_Icon.jpg" PopupPosition="Right" HighlightCssClass="highlightError">
                        <Animations>
                            <OnShow>
                                <Sequence>
                                    <HideAction Visible="true" />
                                    <FadeIn Duration="1" MinimumOpacity="0" MaximumOpacity="1">

                                    </FadeIn>
                                </Sequence>
                            </OnShow>
                            <OnHide>
                                <Sequence>
                                    <HideAction Visible="false" />
                                    <FadeOut Duration="1" MinimumOpacity="0" MaximumOpacity="1">

                                    </FadeOut>
                                </Sequence>
                            </OnHide>
                        </Animations>
                    </ajax:ValidatorCalloutExtender>
                    <asp:CompareValidator ID="cv1" runat="server" ControlToValidate="txtNewPassword" ControlToCompare="txtOldPassword" Type="String" Operator="NotEqual" ErrorMessage="New password should not be same as old" ForeColor="Red" Display="None" SetFocusOnError="true" ValidationGroup="ChangePwd"></asp:CompareValidator>
                    <ajax:ValidatorCalloutExtender ID="vce4" runat="server" Width="250" TargetControlID="cv1" WarningIconImageUrl="~/Images/Warning_Icon.jpg" PopupPosition="Right" HighlightCssClass="highlightError">
                        <Animations>
                            <OnShow>
                                <Sequence>
                                    <HideAction Visible="true" />
                                    <FadeIn Duration="1" MinimumOpacity="0" MaximumOpacity="1">

                                    </FadeIn>
                                </Sequence>
                            </OnShow>
                            <OnHide>
                                <Sequence>
                                    <HideAction Visible="false" />
                                    <FadeOut Duration="1" MinimumOpacity="0" MaximumOpacity="1">

                                    </FadeOut>
                                </Sequence>
                            </OnHide>
                        </Animations>
                    </ajax:ValidatorCalloutExtender>
                    <asp:RegularExpressionValidator ID="rev1" runat="server" ControlToValidate="txtNewPassword" ValidationExpression="\w{6,15}" ValidationGroup="ChangePwd" ErrorMessage="password should be between 6-15 characters only" Display="None" ForeColor="Red" SetFocusOnError="true"></asp:RegularExpressionValidator>
                <ajax:ValidatorCalloutExtender ID="vce6" runat="server" Width="250" TargetControlID="rev1" WarningIconImageUrl="~/Images/Warning_Icon.jpg" PopupPosition="Right" HighlightCssClass="highlightError">
                        <Animations>
                            <OnShow>
                                <Sequence>
                                    <HideAction Visible="true" />
                                    <FadeIn Duration="1" MinimumOpacity="0" MaximumOpacity="1">

                                    </FadeIn>
                                </Sequence>
                            </OnShow>
                            <OnHide>
                                <Sequence>
                                    <HideAction Visible="false" />
                                    <FadeOut Duration="1" MinimumOpacity="0" MaximumOpacity="1">

                                    </FadeOut>
                                </Sequence>
                            </OnHide>
                        </Animations>
                    </ajax:ValidatorCalloutExtender>
                </td>
            </tr>
             <tr>
                <th style="text-align:right">Confirm Password</th>
                <th>:</th>
                <td>
                    <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" ValidationGroup="ChangePwd"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv3" runat="server" ControlToValidate="txtConfirmPassword" ErrorMessage="Please enter Confirm pasword" Display="None" SetFocusOnError="true" ForeColor="Red" ValidationGroup="ChangePwd"></asp:RequiredFieldValidator>
                    <ajax:ValidatorCalloutExtender ID="vce3" runat="server" Width="250" TargetControlID="rfv3" WarningIconImageUrl="~/Images/Warning_Icon.jpg" PopupPosition="Right" HighlightCssClass="highlightError">
                        <Animations>
                            <OnShow>
                                <Sequence>
                                    <HideAction Visible="true" />
                                    <FadeIn Duration="1" MinimumOpacity="0" MaximumOpacity="1">

                                    </FadeIn>
                                </Sequence>
                            </OnShow>
                            <OnHide>
                                <Sequence>
                                    <HideAction Visible="false" />
                                    <FadeOut Duration="1" MinimumOpacity="0" MaximumOpacity="1">

                                    </FadeOut>
                                </Sequence>
                            </OnHide>
                        </Animations>
                    </ajax:ValidatorCalloutExtender>
                     <asp:CompareValidator ID="cv2" runat="server" ControlToValidate="txtConfirmPassword" ControlToCompare="txtNewPassword" Type="String" Operator="Equal" ErrorMessage="Confirm password should be same as New" ForeColor="Red"  ValidationGroup="ChangePwd" Display="None" SetFocusOnError="true"></asp:CompareValidator>
                    <ajax:ValidatorCalloutExtender ID="vce5" runat="server" Width="250" TargetControlID="cv2" WarningIconImageUrl="~/Images/Warning_Icon.jpg" PopupPosition="Right" HighlightCssClass="highlightError">
                        <Animations>
                            <OnShow>
                                <Sequence>
                                    <HideAction Visible="true" />
                                    <FadeIn Duration="1" MinimumOpacity="0" MaximumOpacity="1">

                                    </FadeIn>
                                </Sequence>
                            </OnShow>
                            <OnHide>
                                <Sequence>
                                    <HideAction Visible="false" />
                                    <FadeOut Duration="1" MinimumOpacity="0" MaximumOpacity="1">

                                    </FadeOut>
                                </Sequence>
                            </OnHide>
                        </Animations>
                    </ajax:ValidatorCalloutExtender>
                </td>
            </tr>
            <tr>
                <td colspan="2"></td>
                <td>
                    <asp:Button ID="btnChangePassword" runat="server" Text="Change Password" OnClick="btnChangePassword_Click" ValidationGroup="ChangePwd" />
                </td>
            </tr>
        </table>
   
    </td>
    </tr>
         </table>      
                   </ContentTemplate>
    <Triggers>
                  <asp:AsyncPostBackTrigger ControlID="txtOldPassword" EventName="TextChanged"/>
              </Triggers>
              </asp:UpdatePanel>
</asp:Content>