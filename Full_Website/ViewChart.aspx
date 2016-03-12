<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ViewChart.aspx.cs" Inherits="Full_Website.ViewChart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdateProgress ID="UpdateProgress1" runat="server"></asp:UpdateProgress>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Label ID="Label1" runat="server" Text="Projects" Style="z-index: 1; left: 74px; top: 190px; position: absolute; height: 30px; width: 250px;" Font-Bold="True" Font-Names="Calibri" Font-Size="Large"></asp:Label>
            <asp:Label ID="Label2" runat="server" Text="Monitoring Locations" Style="z-index: 1; left: 375px; top: 190px; position: absolute; height: 30px; width: 250px;" Font-Bold="True" Font-Names="Calibri" Font-Size="Large"></asp:Label>
            <asp:Label ID="Label3" runat="server" Text="Parameters" Style="z-index: 1; left: 675px; top: 190px; position: absolute; height: 30px; width: 250px;" Font-Bold="True" Font-Names="Calibri" Font-Size="Large"></asp:Label>


            <p id="ListBoxes">
                <asp:ListBox ID="ListBox1" runat="server" Style="z-index: 1; left: 75px; top: 220px; position: absolute; height: 200px; width: 250px;" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="PRJ_NAME" DataValueField="PRJ_ID" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged"></asp:ListBox>
                <asp:ListBox ID="ListBox2" runat="server" Style="z-index: 1; left: 375px; top: 220px; position: absolute; height: 200px; width: 250px;" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="MLOC_NAME" DataValueField="MLOC_ID" Enabled="False" OnSelectedIndexChanged="ListBox2_SelectedIndexChanged"></asp:ListBox>
                <asp:ListBox ID="ListBox3" runat="server" Style="z-index: 1; left: 675px; top: 220px; position: absolute; height: 200px; width: 250px;" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="PARAM_NAME" DataValueField="PARAM_ID" Enabled="False"></asp:ListBox>
            </p>
        </ContentTemplate>
    </asp:UpdatePanel>

    <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
    <br /><br /><br /><br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WQ_FOURConnectionString %>" SelectCommand="SELECT [PRJ_ID], [PRJ_NAME] FROM [PROJECT]"></asp:SqlDataSource>    
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WQ_FOURConnectionString %>" OnSelecting="SqlDataSource2_Selecting" SelectCommand="spMlocDropDownFromProj" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="PRJ_ID" SessionField="PRJ_ID" Type="Int32" />
        </SelectParameters>
        </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:WQ_FOURConnectionString %>" OnSelecting="SqlDataSource3_Selecting" SelectCommand="spParamDropDownFromMloc" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="MLOC_ID" SessionField="MLOC_ID" Type="Int32" />
        </SelectParameters>
        </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:WQ_FOURConnectionString %>" OnSelecting="SqlDataSource4_Selecting" SelectCommand="SPGetByMlocParam" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="PRJ_ID" SessionField="PRJ_ID" Type="Int32" />
            <asp:SessionParameter Name="MLOC_ID" SessionField="MLOC_ID" Type="Int32" />
            <asp:SessionParameter Name="PARAM_ID" SessionField="Param_ID" Type="Int32" />
            <asp:SessionParameter DbType="Date" Name="SRESDATE" SessionField="SRESDATE" />
            <asp:SessionParameter DbType="Date" Name="ERESDATE" SessionField="ERESDATE" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:WQ_FOURConnectionString %>" OnSelecting="SqlDataSource5_Selecting" SelectCommand="spNeedUnit" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="PARAM_ID" SessionField="PARAM_ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <div style="position:absolute; height:32px; width:530px; top:500px; left:250px;">
        <asp:Button ID="Build" runat="server" Text="Build Chart" Height="27px" Width="154px" OnClick="Build_Click" />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    </div>
    <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource4" Width="1000px" OnLoad="Chart1_Load" Height="400px">
        <Series>
            <asp:Series ChartType="Line" Name="Series1" XValueMember="RES_DATE_TIME" YValueMembers="RES_MEASURE" Font="Calibri, 19.8000011pt">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1" BorderColor="White">
                <AxisX LineColor="Black" TitleFont="Calibri, 13.8pt">
                    <MajorGrid LineColor="LightGray" />
                </AxisX>
                <AxisY LineColor="Black" TitleFont="Calibri, 13.8pt">
                    <MajorGrid LineColor="LightGray" />
                </AxisY>
            </asp:ChartArea>
        </ChartAreas>
        <Titles>
            <asp:Title Alignment="MiddleLeft" Font="Calibri, 25.8000011pt" Name="Title1">
            </asp:Title>
        </Titles>
        <BorderSkin BackColor="WhiteSmoke" BorderColor="WhiteSmoke" />
    </asp:Chart>
</asp:Content>
