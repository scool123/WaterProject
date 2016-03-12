<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Results1.aspx.cs" Inherits="Full_Website.Results1" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WQ_FOURConnectionString %>" SelectCommand="SPGetByMlocParam" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="PRJ_ID" SessionField="PRJ_ID" Type="Int32" />
                <asp:SessionParameter Name="MLOC_ID" SessionField="MLOC_ID" Type="Int32" />
                <asp:SessionParameter Name="PARAM_ID" SessionField="Param_ID" Type="Int32" />
                <asp:SessionParameter DbType="Date" Name="SRESDATE" SessionField="SRESDATE" />
                <asp:SessionParameter DbType="Date" DefaultValue="" Name="ERESDATE" SessionField="ERESDATE" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />

        <asp:Button ID="Export" runat="server" Text="Export to Excel" OnClick="Export_Click" />
        <br />
        <br />
        <br />
        <asp:UpdateProgress ID="UpdateProgress1" runat="server"><ProgressTemplate>
            <img src=".gif/ajax-loader.gif" /></ProgressTemplate></asp:UpdateProgress>
       
        <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" OnDataBinding="Page_Load" runat="server">
            <ContentTemplate>
                <div id="GridView">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="RES_MEASURE" HeaderText="RES_MEASURE" SortExpression="RES_MEASURE" />
                    <asp:BoundField DataField="UNIT" HeaderText="UNIT" SortExpression="UNIT" />
                    <asp:BoundField DataField="PARAM_NAME" HeaderText="PARAM_NAME" SortExpression="PARAM_NAME" />
                    <asp:BoundField DataField="RES_DATE_TIME" HeaderText="RES_DATE_TIME" SortExpression="RES_DATE_TIME" />
                    <asp:BoundField DataField="MLOC_NAME" HeaderText="MLOC_NAME" SortExpression="MLOC_NAME" />
                    <asp:BoundField DataField="PRJ_NAME" HeaderText="PRJ_NAME" SortExpression="PRJ_NAME" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Content>

