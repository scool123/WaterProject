<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ViewData.aspx.cs" Inherits="Full_Website.ViewData" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <h1>Quick Stats</h1>
     <p>
    <a href="Querytop.aspx"><img src="Pictures/quickstats.png" style="height: 100px; float: left; width: 120px" /></a>
    Query basic statistics such as Min, Max and Average based on your selection.<br />
    Required to choose by Project, Monitoring Location and Parameter.<br />
    Optional: Refine by date
         <br /><br /><br />
    </p>

    <hr />

    <h1>View Charts</h1>
    <p>
    <a href="ViewChart.aspx"><img src="Pictures/Graph.png" style="height: 100px; width: 120px; float: left;" /></a>
    View line plots based on your selection to view trends in data.<br />
    Required to choose by Project, Monitoring Location and Parameter.<br />
    Optional: Refine by date
    <br /><br /><br />
    </p>
    
</asp:Content>
