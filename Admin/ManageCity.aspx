<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageCity.aspx.cs" Inherits="Admin_ManageCity" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="ControlPanelContentPlaceHolder">
 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
     <ContentTemplate>
    
      <table style="width:100%;height:262px;background-color:#f5eaa9;border:2px solid lightgray;border-color:gray;border-radius:20px;box-shadow:green 2px 5px">
    <tr>
        <td style="margin:10px;vertical-align:top">
            <table style="width:100%">
                <tr>
                    <td colspan="3" style="text-align:center"><b>Manage City</b></td>
                </tr>
                <tr>
                    <td style="width:15%; height: 26px;"><b>Country Name</b></td>
                    <td style="width:2%; height: 26px;">:</td>
                     
                    <td style="height: 26px">

                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>

                        <asp:DropDownList ID="ddlCountryName" runat="server" OnSelectedIndexChanged="ddlCountryName_SelectedIndexChanged" AutoPostBack="true" ></asp:DropDownList>
                        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel3">
                            <ProgressTemplate>
                                <img src="../Images/ajax-loader.gif" style="width:10%;height:5%" alt="Progress Image" />
                                <br />
                                <b>Please Wait ...</b>
                            </ProgressTemplate>
                        </asp:UpdateProgress>

                                
                            </ContentTemplate>
                        </asp:UpdatePanel>

                       
                    </td>
                 </tr>
                <tr>
                    <td><b>State Name</b></td>
                    <td>:</td>
                    <td><asp:DropDownList ID="ddlStateName" runat="server" OnSelectedIndexChanged="ddlStateName_SelectedIndexChanged" AutoPostBack="true" ></asp:DropDownList></td>
                 </tr>
                
                <tr>
                    <td><b>City Name</b></td>
                    <td>:</td>
                    <td><asp:TextBox ID="txtCityName" runat="server" ></asp:TextBox>
                        <asp:ImageButton ImageUrl="~/Images/search-button.png" Height="25" style="vertical-align:bottom" Width="100" ID="imgBtnSearch" runat="server" Text="Search" OnClick="imgBtnSearch_Click" CausesValidation="false"  />
                    </td>
                </tr>
               
                <tr>
                    <td colspan="2">
                        &nbsp;</td>
                    <td align="right">
                        <asp:Button ID="imgBtnAddCity" runat="server" Text="Add City" OnClick="imgBtnAddCity_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:GridView ID="grvCity" runat="server" AutoGenerateColumns="False" Width="100%" DataKeyNames="CityId" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" AllowSorting="True" AllowPaging ="True" OnSorting="grvCity_Sorting" OnPageIndexChanging="grvCity_PageIndexChanging" GridLines="Vertical" PageSize="2" OnSelectedIndexChanged="grvCity_SelectedIndexChanged">
                            <AlternatingRowStyle BackColor="#DCDCDC" />
                            <Columns>
                                <asp:TemplateField ItemStyle-Width="10%" >
                                    <ItemTemplate>
                                        <asp:Button Width="80" ID="imgBtnEdit" runat="server" Text="Edit" OnClick="imgBtnEdit_Click" CausesValidation="false" />
                                    </ItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="10%">
                                  
                                    <ItemTemplate>
                                        <asp:Button Width="80" ID="imgBtnDelete"  runat="server" CausesValidation="false" Text="Delete" OnClick="imgBtnDelete_Click" />
                                    </ItemTemplate>
                                 </asp:TemplateField>
                                <asp:BoundField DataField="CityName" HeaderText="City Name" SortExpression="CityName" ItemStyle-Width="20%" >
                                    </asp:BoundField>
                                <asp:BoundField DataField="StateName" HeaderText="State Name" SortExpression="StateName" ItemStyle-Width="20%" >
                                </asp:BoundField>
                                <asp:BoundField DataField="CountryName" HeaderText="Country Name" SortExpression="CountryName" ItemStyle-Width="20%">
                                    </asp:BoundField>

                                <asp:CheckBoxField DataField="IsActive" HeaderText="Is Active" ItemStyle-Width="20%" >

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
   
             
  
           <asp:Panel ID="panelAdd" runat="server" BackColor="LightCyan" style="border-radius:10px" Width="800" BorderWidth="2" BorderColor="Green" BorderStyle="Solid">
        <asp:Panel ID="panelAddTitle" runat="server" style="border-radius:10px" Width="100%" HorizontalAlign="Center" BackColor="Blue" ForeColor="white">
           <b>Add City Details</b>
        </asp:Panel>
        

              
       <table style="width:100%">
            <tr>
                <td colspan="3" align="center">
                    <asp:Label ID="lblError" ForeColor="Green" Font-Bold="true" runat="server"></asp:Label>
                </td>
            </tr>
          
            <tr>
                <th>Country Name</th>
                <th>:</th>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                    <asp:DropDownList ID="ddlAddCountryName" runat="server"  OnSelectedIndexChanged="ddlAddCountryName_SelectedIndexChanged" ValidationGroup="AddCity" AutoPostBack="true"></asp:DropDownList>
                     
                    <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel2">
                            <ProgressTemplate>
                                <img src="../Images/HelpResource.jpg" width="200" height="25" alt="Progress Image" />
                                
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                    <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="ddlAddCountryName" ErrorMessage="Please Select Country Name" InitialValue="0" ValidationGroup="AddCity" SetFocusOnError="true"  Display="None" >
                       
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
                <td>
                    <asp:DropDownList ID="ddlAddState" runat="server" ValidationGroup="AddCity"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfv2" runat="server" ControlToValidate="ddlAddState" ErrorMessage="Please Select State Name" InitialValue="0" SetFocusOnError="true" ValidationGroup="AddCity" Display="None" >
                        
                    </asp:RequiredFieldValidator>
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
                <th>City Name</th>
                <th>:</th>
                <td><asp:TextBox ID="txtAddCity" runat="server" AutoPostBack="true" ValidationGroup="AddCity" OnTextChanged="txtAddCity_TextChanged"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="rfv3" runat="server" ControlToValidate="txtAddCity" ErrorMessage="Please Enter City Name" SetFocusOnError="true" ValidationGroup="AddCity" Display="None" >
                        
                    </asp:RequiredFieldValidator>
                    <ajax:ValidatorCalloutExtender ID="vce3" runat="server" TargetControlID="rfv3" Width="220" WarningIconImageUrl="~/Images/Warning_Icon.jpg" PopupPosition="Right" HighlightCssClass="highlightError">
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
                    <asp:CheckBox ID="chkAddIsActive" AutoPostBack="true" runat="server" OnCheckedChanged="chkAddIsActive_CheckedChanged" />
                </td>
            </tr>
                        
            <tr>
                <td colspan="2"></td>
                <td><asp:Button ID="btnSave" runat="server" Text="Save" ValidationGroup="AddCity" OnClick="btnSave_Click"/>&nbsp
               <asp:Button ID="btnCancel" runat="server" Text="Cancel" CausesValidation="false" />
                </td>
            </tr>
        </table>

       </asp:Panel>
       
 
        <ajax:ModalPopupExtender ID="mpe1" runat="server" TargetControlID="imgBtnAddCity" PopupControlID="panelAdd" PopupDragHandleControlID="panelAddTitle" CancelControlID="btnCancel" DropShadow="true" RepositionMode="RepositionOnWindowResizeAndScroll">
    </ajax:ModalPopupExtender>
          
    
     
    <asp:Panel ID="PanelEdit" runat="server" Width="700" BorderWidth="2" BorderStyle="Solid" BorderColor="Blue" BackColor="WhiteSmoke" ForeColor="Blue">
        <asp:Panel ID="PanelEditTitle" runat="server" Width="100%" HorizontalAlign="Center" BackColor="Blue" ForeColor="Beige" >
            <b>Edit City Details</b>
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
                 
                <td><asp:UpdatePanel ID="UpdatePanel4" runat="server">
                        <ContentTemplate>
                    <asp:DropDownList ID="ddlEditCountryName" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlEditCountryName_SelectedIndexChanged"></asp:DropDownList> 
                     <asp:UpdateProgress ID="UpdateProgress3" runat="server" AssociatedUpdatePanelID="UpdatePanel4">
                            <ProgressTemplate>
                                <img src="../Images/HelpResource.jpg" width="200" height="25" alt="Progress Image" />
                                
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <th>State Name</th>
                <th>:</th>
                <td><asp:DropDownList ID="ddlEditStateName" runat="server"></asp:DropDownList> </td>
            </tr>
            <tr>
                <th>City Name</th>
                <th>:</th>
                <td>
                    <asp:TextBox ID="txtEditCityName" runat="server" ValidationGroup="EditCity" ></asp:TextBox>
                     <asp:RequiredFieldValidator ID="rfv4" runat="server" ControlToValidate="txtEditCityName" ErrorMessage="Please Enter City Name" SetFocusOnError="true" ValidationGroup="EditCity" Display="None" ForeColor="red" >
                        
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
                <td><asp:CheckBox ID="chkEditIsActive" runat="server" /></td>
            </tr>
            <tr>
            <td colspan="2"></td>
            <td><asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click"  ValidationGroup="EditCity" />&nbsp
                <asp:Button ID="btnClose" runat="server" Text="Close" CausesValidation="false" />
            </td>
            </tr>
        </table>
    </asp:Panel>
               
    <ajax:ModalPopupExtender ID="mpe2" runat="server" TargetControlID="btnDummy" PopupControlID="panelEdit" PopupDragHandleControlID="panelEditTitle" CancelControlID="btnClose" DropShadow="true" RepositionMode="RepositionOnWindowResizeAndScroll">
         </ajax:ModalPopupExtender>
    <asp:Button ID="btnDummy" runat="server" style="display:none"/>
    <asp:Panel ID="panelDelete" runat="server" Width="500" BorderWidth="2" BorderStyle="Solid" ForeColor="OrangeRed" BackColor="#dbdbdb">
        <asp:Panel ID="panelDeleteTitle" runat="server" Width="100%" HorizontalAlign="Center" BackColor="Blue" ForeColor="White" ><b>Delete City Details</b>
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
                    <asp:Button ID="btnYes" runat="server"  CausesValidation="false" Text="Yes" OnClick="btnYes_Click" ValidationGroup="EditCity" />&nbsp &nbsp
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