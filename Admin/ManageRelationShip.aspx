<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageRelationShip.aspx.cs" Inherits="Admin_ManageRelationShip" %>


<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlPanelContentPlaceHolder">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

    <table style="width:100%;height:268px;background-color:#f5eaa9;border:2px solid lightgray;border-color:gray;border-radius:20px;box-shadow:green 2px 5px">
    <tr>
        <td style="margin:10px;vertical-align:top">
            <table style="width:60%">
                <tr>
                    <td colspan="3"><b>Manage RelationShip</b></td>
                </tr>
                <tr>
                    <td style="width:20%;text-align:left"><b>RelationShip</b></td>
                    <td style="width:2%">:</td>
                    <td style="width:20px"><asp:TextBox ID="txtSearchRelationShip" runat="server" ></asp:TextBox>&nbsp;
                    <asp:ImageButton ImageUrl="~/Images/search-button.png" Height="25" style="vertical-align:bottom" Width="100" ID="imgBtnSearch" runat="server" Text="Search" OnClick="imgBtnSearch_Click" CausesValidation="false"  />
                        </td>
                 </tr>
               
                <tr>
                    <td colspan="2">
                        &nbsp;</td>
                    <td align="right">
                        <asp:Button ID="imgBtnAdd" runat="server" Text="Add RelationShip" OnClick="imgBtnAdd_Click"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:GridView ID="grvRelationShip" runat="server" AutoGenerateColumns="False" HeaderStyle-Height="9px" RowStyle-Height="12px" Width="100%" Height="100" DataKeyNames="RelationShipId" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" AllowSorting="true" AllowPaging ="true" OnSorting="grvRelationShip_Sorting" OnPageIndexChanging="grvRelationShip_PageIndexChanging" GridLines="Both" PageSize="3">
                            <Columns>
                                <asp:TemplateField HeaderText="Edit" ItemStyle-Width="10%" >
                                    <ItemTemplate>
                                        <asp:Button Width="80" ID="imgBtnEdit"  runat="server" Text="Edit" OnClick="imgBtnEdit_Click" CausesValidation="false"/>
                                    </ItemTemplate>

<ItemStyle Width="10%"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Delete" ItemStyle-Width="10%">
                                  
                                    <ItemTemplate>
                                        <asp:Button Width="80" ID="imgBtnDelete" runat="server" CausesValidation="false" Text="Delete" OnClick="imgBtnDelete_Click"/>
                                    </ItemTemplate>
                                 </asp:TemplateField>
                                <asp:BoundField DataField="RelationShip" HeaderText="RelationShip" SortExpression="RelationShip" ItemStyle-Width="60%" >
<ItemStyle Width="60%"></ItemStyle>
                                </asp:BoundField>
                                <asp:CheckBoxField DataField="IsActive" HeaderText="Is Active" ItemStyle-Width="10%" >

<ItemStyle Width="10%"></ItemStyle>
                                </asp:CheckBoxField>

                            </Columns>
                            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                            <RowStyle BackColor="White" ForeColor="#003399" />
                            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                            <SortedAscendingCellStyle BackColor="#EDF6F6" />
                            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                            <SortedDescendingCellStyle BackColor="#D6DFDF" />
                            <SortedDescendingHeaderStyle BackColor="#002876" />
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
   

    <asp:Panel ID="panelAdd" runat="server" style="border-radius:10px" Width="700" BorderWidth="2" BorderColor="Green" BorderStyle="Solid" BackColor="WhiteSmoke">
        <asp:Panel ID="panelAddTitle" runat="server" style="border-radius:10px;cursor:move" Width="100%" HorizontalAlign="Center" BackColor="Blue" ForeColor="Beige">
          <table width="100%"><tr><td style="text-align:center;width:90%"> <b style="width:95%">Add RelationShip Details  </b></td>
           <td style="text-align:right;width:10%"> <asp:Button ID="btnClosePopup" runat="server" CausesValidation="false" Text="X" ForeColor="White" BackColor="#ff0066" Font-Bold="true" OnClick="btnClosePopup_Click"  />
            </td></tr>
          </table>

        </asp:Panel>
        <table style="width:100%">
            <tr>
                <td colspan="3">
                    <asp:Label ID="lblError" runat="server"></asp:Label>
                </td>
            </tr>
            <tr><td colspan="3">&nbsp;</td></tr>
            <tr>
                <th style="text-align:right;width:25%">RelationShip</th>
                <th>:</th>
                <td style="text-align:left;">
                    <asp:TextBox ID="txtAddRelationShip" runat="server" ValidationGroup="AddRelationShip"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="txtAddRelationShip" ErrorMessage="Please Enter RelationShip" Display="None" ValidationGroup="AddRelationShip">
                        
                    </asp:RequiredFieldValidator>
                    <ajax:ValidatorCalloutExtender ID="vce1" runat="server" TargetControlID="rfv1" Width="250" WarningIconImageUrl="~/Images/Warning_Icon.jpg" PopupPosition="Right" HighlightCssClass="highlightError">
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
            <tr><td colspan="3">&nbsp;</td></tr>
            <tr>
                <th style="text-align:right;width:25%">Is Active</th>
                <th>:</th>
                <td style="text-align:left;">
                    <asp:CheckBox ID="chkAddIsActive" runat="server"/>
                </td>
            </tr>
            <tr><td colspan="3">&nbsp;</td></tr>
            <tr>
                <td colspan="2"></td>
                <td><asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" ValidationGroup="AddRelationShip" />&nbsp
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CausesValidation="false" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <ajax:ModalPopupExtender ID="mpe1" runat="server" TargetControlID="imgBtnAdd" PopupControlID="panelAdd" PopupDragHandleControlID="panelAddTitle" CancelControlID="btnCancel" DropShadow="true" RepositionMode="RepositionOnWindowResizeAndScroll">

    </ajax:ModalPopupExtender>


    <asp:Panel ID="PanelEdit" runat="server" BackColor="WhiteSmoke" Width="800" BorderWidth="2" BorderStyle="Solid" BorderColor="Blue">
        <asp:Panel ID="PanelEditTitle" runat="server" style="border-radius:10px;cursor:move" Width="100%" HorizontalAlign="Center" BackColor="Blue" ForeColor="Beige" >
            <b>Edit RelationShip Details</b>
        </asp:Panel>
        <table style="width:100%">
            <tr>
                <td colspan="3">
                    <asp:Label ID="lblEditError" runat="server" ></asp:Label>
                </td>
            </tr>
            <tr>
                <th>RelationShip</th>
                <th>:</th>
                <td><asp:TextBox ID="txtEditRelationShip" runat="server" ValidationGroup="EditRelationShip"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv2" runat="server" ControlToValidate="txtEditRelationShip" ErrorMessage="Please Enter RelationShip" Display="None" ValidationGroup="EditRelationShip">
                        
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
                <th>Is Active</th>
                <th>:</th>
                <td><asp:CheckBox ID="chkEditIsActive" runat="server" /></td>
            </tr>
            <tr>
            <td colspan="2"></td>
            <td><asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" ValidationGroup="EditRelationShip"/>&nbsp
                <asp:Button ID="btnClose" runat="server" Text="Close" CausesValidation="false" />
            </td>
            </tr>
        </table>
    </asp:Panel>
    <ajax:ModalPopupExtender ID="mpe2" runat="server" TargetControlID="btnDummy" PopupControlID="panelEdit" PopupDragHandleControlID="panelEditTitle" CancelControlID="btnClose" DropShadow="true" RepositionMode="RepositionOnWindowResizeAndScroll">
         </ajax:ModalPopupExtender>
    <asp:Button ID="btnDummy" runat="server" style="display:none"/>
   
  
     <asp:Panel ID="panelDelete" runat="server" style="border-radius:10px" Width="500" BorderWidth="2" BorderColor="Green" BorderStyle="Solid" BackColor="WhiteSmoke">
        <asp:Panel ID="panelDeleteTitle" runat="server" style="border-radius:10px;cursor:move" Width="100%" HorizontalAlign="Center" BackColor="Blue" ForeColor="Beige"><b>Delete Country Details</b>
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