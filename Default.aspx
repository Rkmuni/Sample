<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
   <%--<style type="text/css">
        .table {
          
            column-gap:0px;
            grid-row-sizing:0px;
            
                 border:0px;
            border-left: 0px solid red;
            border-top: 0px solid red;
            border-collapse: collapse;
        }

            .table td {
                border-right: 0px solid red;
                border-bottom: 0px solid red;
                margin: 0;
                padding: 0;
            }
       .auto-style1 {
           height: 31px;
       }
    </style>--%>
            <script type="text/javascript" >

                $(document).ready(function () {
                    var emailElement = $("#<%=txtEmail.ClientID%>");
                   var errElement = $("#<%=lblError.ClientID%>");
                   emailElement.blur(function () {
                       if (emailElement.val() != "")
                           $.ajax({
                               contentType: "txt/Html;charset=utf-8",
                               data: "email=" + emailElement.val(),
                               url: "CheckEmailRegister.aspx",
                               dataType: "html",
                               success: function (data) {   

                                   errElement.html(data);
                                   if (errElement.html() != "") {

                                       emailElement.focus();
                                       $("<%=imgGetStarted.ClientID%>").prop("disabled", true);
                                   }
                                   else {
                                       $("<%=txtPassword.ClientID%>").focus();
                                       $("<%=imgGetStarted.ClientID%>").prop("disabled", false);
                                   }
                               }

                           });
               
            });
               });
          </script>
    <asp:ValidationSummary ID="vs1" runat="server" ForeColor="Red" ValidationGroup="Register" /> 
    <table style="width:950px" cellspacing="0px" cellpadding="0px" margin="0px">
        <tr style="height:25px"><td></td> <td></td>
        </tr>
         <tr cellspacing="0px" cellpadding="0px" margin="0px"> 
            <td width="50%" style="text-align:center" cellspacing="0px" cellpadding="0px" margin="0px">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/UserImages/bd_homepage_girl_beach1.jpg" Width="310px" Height="200px" title="Free Event Reminders Service" />
            </td>
         <td background="/EventReminders/UserImages/login.jpg" style="height:300px;">
            <table width="100%" border="0" height="300px">
                <tr height="66px"><td width="80px"></td><td></td></tr>
                <tr height="20px">
                    <td width="100px"></td>
                    <td width="390px"><b style="font-size:11px;font-family:Tahoma">Your email address will be your login:</b></td>
                </tr>
                 <tr height="20px">
                     <td width="100px"></td>
                     <td width="390px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b style="font-size:11px;font-family:Tahoma;text-align:center">Email:</b>
                     <asp:TextBox  id="txtEmail" runat="server" size="36" ></asp:TextBox>
                          <asp:RequiredFieldValidator ID="rfv6" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please enter Email-Id" Display="None" ValidationGroup="Register"></asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="rev1" runat="server" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Entered EmailId is not in correct format" Display="None" ValidationGroup="Register"></asp:RegularExpressionValidator>
                     </td>
                 </tr>
                <tr height="16px">
                    <td width="100px"></td>
                    <td width="390px" style="text-align:center">
                        <asp:Label ID="lblError" runat="server" Font-Size="10px" ForeColor="Red" Font-Names="Tahoma"></asp:Label></td>
                </tr>
                <tr height="11px">
                    <td width="100px"></td>
                    <td width="390px"><b style="font-size:11px;font-family:Tahoma">Please select a password:</b></td>
                </tr>
                 <tr height="20px">
                     <td width="100px"></td>
                     <td width="390px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b style="font-size:11px;font-family:Tahoma;text-align:center">Password:</b>&nbsp;
                         <asp:TextBox  ID="txtPassword" TextMode="Password" runat="server"  size="36" ></asp:TextBox>
                         <asp:RequiredFieldValidator ID="rfv4" runat="server" ControlToValidate="txtPassword" ValidationGroup="Register" ErrorMessage="Please Enter Password" Display="None"></asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="rev2" runat="server" ErrorMessage="password sould be 6-15 characters" ValidationGroup="Register" ControlToValidate="txtPassword" ValidationExpression="\w{6,15}" Display="None" ></asp:RegularExpressionValidator>
                     </td>
                 </tr>
                <tr height="20px">
                    <td width="100px"></td><td width="390px"><b style="font-size:11px;font-family:Tahoma;text-align:center">Password (Again):</b>&nbsp;
                        <asp:TextBox ID="txtPassword2" runat="server" TextMode="Password"  size="36" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv5" runat="server" ControlToValidate="txtPassword2" ValidationGroup="Register" ErrorMessage="please Enter Confirm Password" Display="None" ></asp:RequiredFieldValidator> 
                        <asp:RegularExpressionValidator ID="rfv3" runat="server" ErrorMessage="cnfm password sould be 6-15 characters" ValidationGroup="Register" ControlToValidate="txtPassword2" ValidationExpression="\w{6,15}" Display="None" ></asp:RegularExpressionValidator>
                <asp:CompareValidator ID="cv1" runat="server" ErrorMessage="Confirm password must be same as password" ValidationGroup="Register" ControlToValidate="txtPassword2" ControlToCompare="txtPassword" Type="String" Display="None" Operator="Equal"></asp:CompareValidator>
                    </td>
                </tr>
                <tr height="40px">
                    <td width="100px"></td><td width="390px" align="right">
                        <asp:ImageButton ID="imgGetStarted" ImageUrl="~/UserImages/getstarted.gif" runat="server" ValidationGroup="Register"  alt="Get your FREE reminder service now!" OnClick="imgGetStarted_Click1" PostBackUrl="~/Registration.aspx" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                </tr>
         <tr height="20px">
             <td width="100px"></td>
             <td width="390px" align="right">
              <b style="font-size:11px;font-family:Tahoma;text-align:center" align="right"> Already a member?&nbsp;&nbsp; <a href="Login.aspx" rel='nofollow'>Log-In</a></b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
         </tr>
                 <tr>
                    <td></td>
                    <td></td>
                </tr>
            </table>
         </td>
    </tr>
    </table>
       <%-- <tr cellspacing="0px" cellpadding="0px" margin="0px"> 
            <td width="50%" style="text-align:center" cellspacing="0px" cellpadding="0px" margin="0px">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/UserImages/bd_homepage_girl_beach1.jpg" Width="310" Height="200" title="Free Event Reminders Service" />
            </td>
            <td width="50%" style="text-align:center">
	          <table>
		        <tr>
		            <td  colspan="4" align="bottom" >
		                <asp:Image ID="Image2" runat="server" ImageUrl="~/UserImages/formheader2.gif"  width="463px" height="40px" alt="" border="0" style="margin:0px;margin-bottom:0px" />
		            </td>
		        </tr>
		        <tr  >
	    	        <td rowspan="6" align="top" >
                        <asp:Image ID="Image3" runat="server" ImageUrl="~/UserImages/formleft2.gif" display="block" width="4px" height="207px" style="margin:0px;margin-top:0px;margin-bottom:0px" alt="" border="0" />
	    	        </td>
		            <td colspan="2" >
                        <asp:Image ID="Image4" runat="server" ImageUrl="~/UserImages/dotclear.gif" width="45" height="22" alt="" border="0" />
                        <font face="Verdana" size="1">
                        <asp:Image ID="Image5" runat="server" ImageUrl="~/UserImages/one.gif" width="17" height="15" alt="" border="0" vspace="0" />
                        <asp:Image ID="Image6" runat="server" ImageUrl="~/UserImages/dotclear.gif" width="10" height="1" alt="" border="0" />
                        <b>Your email address will be your login:</b></font>
                        <img src="/EventReminders/UserImages/dotclear.gif" width="53" height="1" alt="" border="0" /><br/>
                     </td>
    		         <td rowspan="6" align="right" cellspacing="0" cellpadding="0" margin="0" padding="0">
                        <asp:Image ID="Image7" runat="server" ImageUrl="~/UserImages/formright2.gif" width="4px" height="207px" alt="" border="0" style="margin-bottom:0px;margin-top:0px" />
    		         </td>
		        </tr>
		        <tr  >
		            <td>
                        <asp:Image ID="Image8" runat="server" ImageUrl="~/UserImages/dotclear.gif" width="72" height="1" alt="" border="0" />
                        <font face="Verdana" size="1">Email</font>
		            </td>
		            <td>
                        <asp:TextBox  id="txtEmail" runat="server" size="36" AutoPostBack="true"></asp:TextBox>
		            </td>
                </tr>  
                  <tr>
                      
                    <td colspan="2">
                        <asp:Label ID="lblError" runat="server" Font-Size="10px" ForeColor="Red" Font-Names="Tahoma"></asp:Label>
                    </td>                  
                  </tr>
                  
		        <tr  >
		            <td colspan="2" class="auto-style1">
                        <asp:Image ID="Image10" runat="server" ImageUrl="~/UserImages/dotclear.gif" width="45" height="22" alt="" border="0" />
                        <font face="Verdana" size="1">
                        <asp:Image ID="Image11" runat="server" ImageUrl="~/UserImages/two.gif" width="17" height="15" alt="" border="0" vspace="0" />
                        <asp:Image ID="Image12" runat="server" ImageUrl="~/UserImages/dotclear.gif" width="10" height="1" alt="" border="0" />
                        <b>Please select a password:</b></font>
                        <img src="/EventReminders/UserImages/dotclear.gif" width="53" height="1" alt="" border="0" /><br/>
                     </td>
		        </tr>
		        <tr  >
		            <td><img src="/EventReminders/UserImages/dotclear.gif" width="72" height="1" alt="" border="0"/>
                        <font face="Verdana" size="1">Password:</font>
		            </td>
		            <td>
                        <asp:TextBox  ID="txtPassword" TextMode="Password" runat="server"  size="36" ></asp:TextBox>
		                <br/>
		            </td>
		        </tr>
		        <tr   >
		            <td>
                        <img src="/EventReminders/UserImages/dotclear.gif" width="72" height="1" alt="" border="0"/>
                        <font face="Verdana" size="1">Password (again)</font>
		            </td>
		            <td>
                        <asp:TextBox ID="txtPassword2" runat="server" TextMode="Password"  size="36" ></asp:TextBox>
		            </td>
		        </tr>
		        <tr  >
		            <td colspan=2>
		                <table cellpadding="0" cellspacing="0" border="0" width="100%">
			                <tr>
				                <td>
				                    <br/><img src="/EventReminders/UserImages/dotclear.gif" width="65" height="1" alt="" border="0"/>
				                </td>
				                <td>
				                </td>
				                <td valign="bottom">
				                    <asp:ImageButton ID="imgGetStarted" ImageUrl="~/UserImages/getstarted.gif" runat="server"  alt="Get your FREE reminder service now!" PostBackUrl="~/Registration.aspx" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				                </td>
			                    </tr>
			                 <tr>
				                <td align="right" colspan="3">Already a member? <a href="Login.aspx" rel='nofollow'>Log-In</a>
                                    <asp:Image ID="Image9" runat="server" ImageUrl="~/UserImages/dotclear.gif" width="30" height="1" />
				                </td>
                             </tr>
		                 </table>
		            </td>
		        </tr>
                  
		<tr style="padding:0px;margin:0px">
		    <td colspan="4" align="top">
                <img src="/EventReminders/UserImages/formbottom2.gif" alt="" border="0" style="height: 4px; width: 463px;margin-top:0px" />
		    </td>
		</tr>
                  </table>
		    </td>--%>
		
       
</asp:Content>