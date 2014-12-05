<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageState.aspx.cs" Inherits="Admin_ManageState" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="ControlPanelContentPlaceHolder">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

    <table style="width:100%;height:262px;background-color:#f5eaa9;border:2px solid lightgray;border-color:gray;border-radius:20px;box-shadow:green 2px 5px">
    <tr>
        <td style="margin:10px;vertical-align:top">
            <table style="width:100%">
                <tr>
                    <td colspan="3"><b>Manage State</b></td>
                </tr>
                <tr>
                    <td style="width:15%"><b>Country Name</b></td>
                    <td style="width:2%">:</td>
                    <td><asp:DropDownList ID="ddlCountryName" runat="server" OnSelectedIndexChanged="ddlCountryName_SelectedIndexChanged" AutoPostBack="true" ></asp:DropDownList></td>
                 </tr>
                <tr>
                    <td><b>State Name</b></td>
                    <td>:</td>
                    <td><asp:TextBox ID="txtStateName" runat="server" ></asp:TextBox>&nbsp;
                      <asp:ImageButton ImageUrl="~/Images/search-button.png" Height="25" style="vertical-align:bottom" Width="100" ID="imgBtnSearch" runat="server" Text="Search" CausesValidation="false" OnClick="imgBtnSearch_Click" /> </td>
                </tr>
               
                <tr>
                    <td colspan="2">
                        &nbsp;</td>
                    <td align="right">
                        <asp:Button ID="imgBtnAddState" runat="server" Text="Add State" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:GridView ID="grvState" runat="server" AutoGenerateColumns="False" RowStyle-Height="12" Width="100%" DataKeyNames="StateId" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" AllowSorting="True" AllowPaging ="True" GridLines="Vertical" OnSorting="grvState_Sorting" OnPageIndexChanging="grvState_PageIndexChanging" PageSize="3">
                            <AlternatingRowStyle BackColor="#DCDCDC" />
                            <Columns>
                                <asp:TemplateField ItemStyle-Width="10%" >
                                    <ItemTemplate>
                                        <asp:Button Width="80" ID="imgBtnEdit" runat="server" Text="Edit" OnClick="imgBtnEdit_Click" CausesValidation="false" />
                                    </ItemTemplate>

<ItemStyle Width="10%"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                  
                                    <ItemTemplate>
                                        <asp:Button Width="80" ID="imgBtnDelete" runat="server" CausesValidation="false" OnClick="imgBtnDelete_Click" Text="Delete" />
                                    </ItemTemplate>
                                 </asp:TemplateField>
                                <asp:BoundField DataField="StateName" HeaderText="State Name" SortExpression="StateName" ItemStyle-Width="40%" >
<ItemStyle Width="40%"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="CountryName" HeaderText="Country Name" SortExpression="CountryName" ItemStyle-Width="40%">
<ItemStyle Width="40%"></ItemStyle>
                                    </asp:BoundField>

                                <asp:CheckBoxField DataField="IsActive" HeaderText="Is Active" ItemStyle-Width="10%" >

<ItemStyle Width="10%"></ItemStyle>
                                </asp:CheckBoxField>

                            </Columns>
                            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#0000A9" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#000065" />
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
    
<asp:Panel ID="panelAdd" runat="server" style="border-radius:10px" Width="500" BorderWidth="2" BorderColor="Green" BorderStyle="Solid" BackColor="#f7eeb0">
        <asp:Panel ID="panelAddTitle" runat="server" style="border-radius:10px" Width="100%" HorizontalAlign="Center" BackColor="Blue" ForeColor="white">
           <b>Add State Details</b>
        </asp:Panel>
      
        <table style="width:100%">
            <tr>
                <td colspan="3">
                    <asp:Label ID="lblError" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <th>Country Name</th>
                <th>:</th>
                <td>
                    <asp:DropDownList ID="ddlAddCountryName" runat="server" CausesValidation="false" ValidationGroup="AddState"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="ddlAddCountryName" ErrorMessage="Please Select State" InitialValue="0" ValidationGroup="AddState" Display="None" >
                       
                    </asp:RequiredFieldValidator>
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
                <th>State Name</th>
                <th>:</th>
                <td><asp:TextBox ID="txtAddState" runat="server" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv4" runat="server" ControlToValidate="txtAddState" ErrorMessage="Please Enter State Name" ValidationGroup="AddState" Display="None" >
                       
                    </asp:RequiredFieldValidator>
                     <ajax:ValidatorCalloutExtender ID="vce4" runat="server" TargetControlID="rfv4" Width="220" WarningIconImageUrl="~/Images/Warning_Icon.jpg" PopupPosition="Right" HighlightCssClass="highlightError">
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
                <th>Is Active</th>
                <th>:</th>
                <td>
                    <asp:CheckBox ID="chkAddIsActive"  runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="2"></td>
                <td><asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" ValidationGroup="AddState"/>&nbsp
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CausesValidation="false" />
                </td>
            </tr>
        </table>
               
    </asp:Panel>
    <ajax:ModalPopupExtender ID="mpe1" runat="server" TargetControlID="imgBtnAddState" PopupControlID="panelAdd" PopupDragHandleControlID="panelAddTitle" CancelControlID="btnCancel" DropShadow="true" RepositionMode="RepositionOnWindowResizeAndScroll">

    </ajax:ModalPopupExtender>


    <asp:Panel ID="PanelEdit" runat="server" Width="500" BorderWidth="2" BorderStyle="Solid" BorderColor="Blue" BackColor="Wheat">
        <asp:Panel ID="PanelEditTitle" runat="server" Width="100%" HorizontalAlign="Center" BackColor="Blue" ForeColor="Beige" >
            <b>Edit State Details</b>
        </asp:Panel>
        <table style="width:100%">
            <tr>
                <td colspan="3">
                    <asp:Label ID="lblEditError" runat="server" ></asp:Label>
                </td>
            </tr>
            <tr>
                <th>Country Name</th>
                <th>:</th>
                <td><asp:DropDownList ID="ddlEditCountryName" runat="server" ValidationGroup="EditState"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfv2" runat="server" ControlToValidate="ddlEditCountryName" ErrorMessage="Please Select State" Display="None" InitialValue="0"  ValidationGroup="EditState">
                        
                    </asp:RequiredFieldValidator>
                    <ajax:ValidatorCalloutExtender ID="vce2" runat="server" TargetControlID="rfv2" Width="250" WarningIconImageUrl="~/Images/Warning_Icon.jpg" PopupPosition="Right" HighlightCssClass="highlightError">
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
                <th>State Name</th>
                <th>:</th>
                <td>
                    <asp:TextBox ID="txtEditStateName" runat="server" ValidationGroup="EditState" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv3" runat="server" ControlToValidate="txtEditStateName" ErrorMessage="Please Enter State Name" Display="None" ValidationGroup="EditState">
                        
                    </asp:RequiredFieldValidator>
                    <ajax:ValidatorCalloutExtender ID="vce3" runat="server" TargetControlID="rfv3" Width="250" WarningIconImageUrl="~/Images/Warning_Icon.jpg" PopupPosition="Right" HighlightCssClass="highlightError">
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
                <th>Is Active</th>
                <th>:</th>
                <td><asp:CheckBox ID="chkEditIsActive" runat="server" /></td>
            </tr>
            <tr>
            <td colspan="2"></td>
            <td><asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" ValidationGroup="EditState"/>&nbsp
                <asp:Button ID="btnClose" runat="server" Text="Close" CausesValidation="false" />
            </td>
            </tr>
        </table>
    </asp:Panel>
    <ajax:ModalPopupExtender ID="mpe2" runat="server" TargetControlID="btnDummy" PopupControlID="panelEdit" PopupDragHandleControlID="panelEditTitle" CancelControlID="btnClose" DropShadow="true" RepositionMode="RepositionOnWindowResizeAndScroll">
         </ajax:ModalPopupExtender>
    <asp:Button ID="btnDummy" runat="server" style="display:none"/>
   
    
     <asp:Panel ID="panelDelete" runat="server" Width="500" BorderWidth="2" BorderStyle="Solid" BorderColor="Blue" BackColor="Wheat">
        <asp:Panel ID="panelDeleteTitle" runat="server" Width="100%" HorizontalAlign="Center" BackColor="Blue" ForeColor="white" ><b>Delete State Details</b>
        </asp:Panel>
        <table width="100%">
            <tr>
                <td colspan="3" style="text-align:center">
                    <asp:Label ID="lblDeleteError" runat="server" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <br />
                    <asp:Button ID="btnYes" runat="server"  CausesValidation="false" Text="Yes" OnClick="btnYes_Click" />&nbsp &nbsp
                    <asp:Button ID="btnNo" runat="server" CausesValidation="false" Text="No" />
                </td>
            </tr>
        </table>
    </asp:Panel>
   
    <ajax:ModalPopupExtender ID="mpe3" runat="server" TargetControlID="btnDummy" PopupControlID="panelDelete" PopupDragHandleControlID="panelDeleteTitle" CancelControlID="btnNo" DropShadow="true" RepositionMode="RepositionOnWindowResizeAndScroll">
       
    </ajax:ModalPopupExtender>
    <ajax:ConfirmButtonExtender ID="cbe1" runat="server" TargetControlID="btnDummy" DisplayModalPopupID="mpe3"></ajax:ConfirmButtonExtender>
    

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>