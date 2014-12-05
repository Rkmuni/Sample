<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Admin_Login" MasterPageFile="~/Admin/MasterPage.master" Title="Event-Reminders: Welcome to Admin Login" Theme="AdminTheme" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=txtUserName.ClientID%>").focus();
        });
    </script>
    <table style="width:100%;height:300px">
            <tr>
             <td align ="center">
                 <table style="width:55%;border:2px solid green;border-radius:10px;box-shadow:#2394ce 10px 5px">
                    <tr>
                        <td colspan="4" style="text-align:center" class="labelStyle">Admin Login</td>
                    </tr>
                    <tr>
                        <td style="width: 10px"></td>
                        <td colspan="3">
                          <asp:Label ID="lblError" runat="server" ForeColor="Red" CssClass="labelStyle"/>
                        </td>
                    </tr>
                    <tr>
                       <td rowspan="2">
                          <asp:Image ID="img1" Height="99px" Width="163px" runat="server" ImageUrl="~/Images/Login.jpg" ImageAlign="Right" />
                       </td>
                       <td  style="text-align:right; width: 13%;" class="labelStyle">User Name</td>
                       <td>:</td>
                       <td>
                          <asp:TextBox ID="txtUserName" runat="server"/>
                          <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="txtUserName" ErrorMessage="Please Enter User Name" Display="None" />
                          <ajax:ValidatorCalloutExtender ID="vce1" runat="server" TargetControlID="rfv1" Width="220" WarningIconImageUrl="~/Images/Warning_Icon.jpg" PopupPosition="Right" HighlightCssClass="highlightError">
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
                    <td style="text-align:right;width:13%" class="labelStyle">Password</td>
                    <td>:</td>
                    <td>
                       <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="rfv2" runat="server" ControlToValidate="txtPassword" ErrorMessage="Please Enter Password" Display="None" ></asp:RequiredFieldValidator>
                       <ajax:ValidatorCalloutExtender ID="vce2" runat="server" TargetControlID="rfv2" Width="220" WarningIconImageUrl="~/Images/Warning_Icon.jpg" PopupPosition="Right" HighlightCssClass="highlightError">
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
                <td></td>
                <td style="width: 13%"></td>
                <td></td>
            <td align="left">
                
                <asp:ImageButton ID="imgLogin" Height="25" Width="100" runat="server"  ImageUrl="~/Images/Login-Button.png" OnClick="imgLogin_Click" />
                     </td>
                </tr>
            </table>
                 </td>
                </tr>
          </table>      
    </asp:Content> 