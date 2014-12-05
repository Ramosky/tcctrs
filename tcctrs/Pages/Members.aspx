<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" Title="Members" CodeBehind="Members.aspx.cs" Inherits="tcctrs.Pages.Members" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %></h1>
    </hgroup>
    
    <asp:DataGrid ID="Grid" runat="server" PageSize="5" AllowPaging="True" DataKeyField="userId"
        AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanged="Grid_PageIndexChanged" OnCancelCommand="Grid_CancelCommand"
        OnDeleteCommand="Grid_DeleteCommand" OnEditCommand="Grid_EditCommand" OnUpdateCommand="Grid_UpdateCommand">
        <Columns>
            <asp:BoundColumn HeaderText="userId" DataField="userId" HeaderStyle-CssClass="displayNone"  ItemStyle-CssClass="displayNone" FooterStyle-CssClass="displayNone"></asp:BoundColumn> 
            <asp:BoundColumn HeaderText="FirstName" DataField="firstName"></asp:BoundColumn>
            <asp:BoundColumn HeaderText="LastName" DataField="lastName"></asp:BoundColumn>
            <asp:EditCommandColumn EditText="Edit" CancelText="Cancel" UpdateText="Update" HeaderText="Edit"></asp:EditCommandColumn>
            <asp:ButtonColumn CommandName="Delete" HeaderText="Delete" Text="Delete"></asp:ButtonColumn>
        </Columns>

        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" Mode="NumericPages" />
        <AlternatingItemStyle BackColor="White" />
        <ItemStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
    </asp:DataGrid>
    
    
</asp:Content>