<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" MasterPageFile="~/MasterPage.master" %>

<%@ PreviousPageType VirtualPath="~/Default.aspx" %>
<asp:Content ID="content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <script src="Scripts/AjaxScript.js" type="text/javascript" ></script>
    
    <script src="Scripts/CheckEmailRegister.js" type="text/javascript" ></script>
    <script type="text/javascript" >
        $(document).ready(function () {
            $("#<%=txtFirstName.ClientID%>").focus();
            $("#<%=txtDateOfBirth.ClientID%>").datepicker({ changeMonth: true, changeYear: true });
            ({
                showOn: "both",
                buttonImage: "Images/Calender1.jpg",
                showToolTip: false,

            });
            $("#<%=txtDateOfBirth.ClientID%>").datepicker("option", "maxDate", new Date());
        });
    </script>
    <asp:ValidationSummary ID="vs1" runat="server" ValidationGroup="Register" ForeColor="Red" />
<table cellpadding="5" cellspacing="0" width="100%" border="0">
<tr><td style="border:solid">
    <asp:Panel ID="panel1" runat="server" >
	<table width="60%" cellspacing="0" cellpadding="3">
        <tr>
            <td>First Name</td>
            <td>:</td>
            <td><asp:TextBox ID="txtFirstName" runat="server" Width="200" ValidationGroup="Register"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfv1" runat="server" ErrorMessage="Please Enter First Name" Display="None" ValidationGroup="Register" ControlToValidate="txtFirstName"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>Middle Name</td>
            <td>:</td>
            <td><asp:TextBox ID="txtMiddleName" runat="server" Width="200"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Last Name</td>
            <td>:</td>
            <td><asp:TextBox ID="txtLastName" runat="server" Width="200" ValidationGroup="Register"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfv2" runat="server" ControlToValidate="txtLastName" Display="None" ValidationGroup="Register" ErrorMessage="Please Enter Last Name"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>Date Of Birth</td>
            <td>:</td>
            <td><asp:TextBox ID="txtDateOfBirth" runat="server" Width="100"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfv3" runat="server" ControlToValidate="txtDateOfBirth" Display="None" ErrorMessage="please select your Date of Birth" ValidationGroup="Register"></asp:RequiredFieldValidator>
                &nbsp<asp:CheckBox ID="chkAgeSecret" runat="server" Text="Age Secret" /></td>
        </tr>
        <tr>
            <td>Gender
            </td>
            <td>:</td>
            <td>
            <asp:RadioButtonList ID="rdblGender" runat="server" RepeatDirection="Horizontal" >
                <asp:ListItem Text="Male" Value="M" Selected="True" ></asp:ListItem>
                <asp:ListItem Text="Female" Value="F"></asp:ListItem>
            </asp:RadioButtonList>
                </td>
        </tr>
        <tr>
            <td>Mobile No</td>
            <td>:</td>
            <td>+91<asp:TextBox ID="txtMobileNo" runat="server" Width="175"></asp:TextBox></td>
        </tr>
        <tr>
            <td>EmailId</td>
            <td>:</td>
            <td>
               <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
                <ContentTemplate >
            <asp:TextBox ID="txtEmail"  runat="server" Width="200px" AutoPostBack="TRUE" OnTextChanged="txtEmail_TextChanged" Height="22px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfv6" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please enter Email-Id" Display="None" ValidationGroup="Register"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="rev3" runat="server" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Entered EmailId is not in correct format" Display="None" ValidationGroup="Register"></asp:RegularExpressionValidator>
                    </td>
        </tr>
    <tr>
        <td>
           
        </td>
        <td></td>
        <td><asp:Label ID="lblError" runat="server" ></asp:Label></td>
    </tr>
                    </ContentTemplate>
                   </asp:UpdatePanel>
        <tr>
            <td>Password</td>
            <td>:</td>
            <td><asp:TextBox ID="txtPassword" runat="server" TextMode="Password"  Width="200" ValidationGroup="Register"></asp:TextBox>
                <asp:RegularExpressionValidator ID="rev2" runat="server" ErrorMessage="password sould be 6-15 characters" ValidationGroup="Register" ControlToValidate="txtPassword" ValidationExpression="\w{6,15}" Display="None" ></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="rfv4" runat="server" ControlToValidate="txtPassword" ValidationGroup="Register" ErrorMessage="Please Enter Password" Display="None"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Password Again</td>
            <td>:</td>
            <td><asp:TextBox ID="txtPasswordAgain" runat="server" TextMode="Password"  Width="200"></asp:TextBox>
                <asp:RegularExpressionValidator ID="rev1" runat="server" ErrorMessage="cnfm password sould be 6-15 characters" ValidationGroup="Register" ControlToValidate="txtPasswordAgain" ValidationExpression="\w{6,15}" Display="None" ></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="rfv5" runat="server" ControlToValidate="txtPasswordAgain" ValidationGroup="Register" ErrorMessage="please Enter Confirm Password" Display="None" ></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="cv1" runat="server" ErrorMessage="Confirm password must be same as password" ValidationGroup="Register" ControlToValidate="txtPasswordAgain" ControlToCompare="txtPassword" Type="String" Display="None" Operator="Equal">

                </asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2">

            </td>
            <td style="font-size:12px">Password Should Be 6 To 15 Characters</td>
        </tr>
                <tr>
                    <td colspan="3" style="text-align:center" ><asp:Label ID="lblInfo" runat="server" ></asp:Label></td>
                </tr>
        <tr>
            <td colspan="3" style="text-align:center"><asp:Button  ID="btnGetStarted" ValidationGroup="Register" runat="server" Text="Get Started Now" Font-Bold="true" BackColor="#ffcc00" BorderStyle="Solid" BorderColor="Black" OnClick="btnGetStarted_Click"/></td>
        </tr>
        </table>
        </asp:Panel>
    </td>
    </tr>
    </table>

</asp:Content>