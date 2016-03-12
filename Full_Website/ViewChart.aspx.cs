using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace Full_Website
{
    public partial class ViewChart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            ListBox2.Enabled = true;
            ListBox2.DataBind();
        }

        protected void ListBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            ListBox3.Enabled = true;
            ListBox3.DataBind();
        }

        protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            Session["PRJ_ID"] = ListBox1.SelectedValue;
        }

        protected void SqlDataSource3_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            Session["MLOC_ID"] = ListBox2.SelectedValue;
        }

        protected void Build_Click(object sender, EventArgs e)
        {
            GetUnit();
            Chart1.DataBind();
            Chart1.Titles["Title1"].Text = ListBox2.SelectedItem.ToString();
            Chart1.ChartAreas["ChartArea1"].AxisX.Title = "Dates (mm/dd/yyyy)";
            Chart1.ChartAreas["ChartArea1"].AxisY.Title = ListBox3.SelectedItem.ToString() + " (" + Label4.Text + ")";
        }
        //need using system.Data above for this string to work. It takes the first value in Sql Datasource5 which is the Unit value
        private void GetUnit()
        {
            DataView dv = (DataView)SqlDataSource5.Select(DataSourceSelectArguments.Empty);
            DataRowView drv = dv[0];

            Label4.Text = drv["UNIT"].ToString();
        }

        protected void SqlDataSource4_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            Session["PRJ_ID"] = ListBox1.SelectedValue;
            Session["MLOC_ID"] = ListBox2.SelectedValue;
            Session["Param_ID"] = ListBox3.SelectedValue;
            Session["SRESDATE"] = TextBox1.Text;
            Session["ERESDATE"] = TextBox2.Text;
        }

        protected void Chart1_Load(object sender, EventArgs e)
        {
            
        }

        protected void SqlDataSource5_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            Session["PARAM_ID"] = ListBox3.SelectedValue;
        }
    }
}