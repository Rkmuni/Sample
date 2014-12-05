<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ControlPanel.aspx.cs" Inherits="Admin_ControlPanel" Theme="AdminTheme" MasterPageFile="~/Admin/MasterPageControlPanel.master" %>
<asp:Content ID="Content1"  runat="server" ContentPlaceHolderID="ControlPanelContentPlaceHolder">
       <%-- <link href="~/Styles/jQueryThemes/black-tie/theme.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="~/Styles/jQueryThemes/black-tie/jquery-ui.css" type="text/css" />
    <link rel="stylesheet" href="~/Styles/jQueryThemes/black-tie/jquery-ui.min.css" type="text/css" />--%>
    <link rel="stylesheet" href="../Styles/jQueryThemes/le-frog/jquery-ui.css" type="text/css" />
    <link rel="stylesheet" href="../Styles/jQueryThemes/le-frog/jquery-ui.min.css" type="text/css" />
    <link rel="stylesheet" href="../Styles/jQueryThemes/le-frog/theme.css" type="text/css" />

   <script type="text/javascript">
       $(document).ready(function () {
           $("#divLastAccessedTimeDialog").dialog({
               width: 400,
               modal: true,
               show: {
                   effect: "bounce",
                   duration: 2000
               },
               hide: {
                   effect: "explode",
                   duration: 2000
               }
           });
       });
    </script>
   
    <div id="divLastAccessedTimeDialog" title="Admin Last Accessed Date&Time">
        <asp:Label ID="lblLastVisitedTime" runat="server" ></asp:Label>
    </div>
    <table style="width:100%;height:250px">
        <tr>
            <td>
                <table style="width:100%;height:100%;border:5px solid green;border-radius:20px;box-shadow:green 5px 5px">
                    <tr>
                        <td valign="middle">
                            <table style="width:100%">
                                <tr>
                                    <td>
                                        <div class="divBox">
                                            <a href="ChangePassword.aspx">Change Password</a>
                                        </div>
                                        <div class="divBox">
                                            <a href="ManageCountry.aspx">Manage Country</a>
                                        </div>
                                        <div class="divBox">
                                            <a href="ManageState.aspx">Manage State</a>
                                        </div>
                                        <div class="divBox">
                                            <a href="ManageCity.aspx">Manage City</a>
                                        </div>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="divBox">
                                            <a href="ManageHintQuestion.aspx">Manage Hint Question</a>
                                        </div>
                                        <div class="divBox">
                                            <a href="ManageRelationship.aspx">Manage Relationship</a>
                                        </div>
                                        <div class="divBox">
                                            <a href="ManageReligion.aspx">Manage Religion</a>
                                        </div>
                                        <div class="divBox">
                                            <a href="#" ></a>
                                        </div>
                                        
                                    </td>
                                </tr>
                                
                            </table>
                        </td>
                    </tr>
                </table>

            </td>
        </tr>
    </table>

    
   
    
</asp:Content>