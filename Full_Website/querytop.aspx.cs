using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Full_Website
{
    public partial class Querytop : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            Session["PRJ_ID"] = ListBoxTop1.SelectedValue;
        }

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            ListBoxTop2.Enabled = true;
            ListBoxTop2.DataBind();
            GridView1.Visible = false;
            GridView2.Visible = false;
            GridView3.Visible = false;

        }

        protected void SqlDataSource3_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            Session["MLOC_ID"] = ListBoxTop2.SelectedValue;
        }

        protected void ListBoxTop2_SelectedIndexChanged(object sender, EventArgs e)
        {
            ListBoxTop3.Enabled = true;
            ListBoxTop3.DataBind();
            GridView1.Visible = false;
            GridView2.Visible = false;
            GridView3.Visible = false;
        }

        protected void GetTopTen_Click(object sender, EventArgs e)
        {
            GridView1.Visible = true;
            GridView1.DataBind();
        }

        protected void GetLowTen_Click(object sender, EventArgs e)
        {
            GridView2.Visible = true;
            GridView2.DataBind();
        }

        protected void ListBoxTop3_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.Visible= false;
            GridView2.Visible = false;
            GridView3.Visible = false;
        }

        protected void SqlDataSource4_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            Session["PRJ_ID"] = ListBoxTop1.SelectedValue;
            Session["MLOC_ID"] = ListBoxTop2.SelectedValue;
            Session["PARAM_ID"] = ListBoxTop3.SelectedValue;
        }

        protected void SqlDataSource5_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            Session["PRJ_ID"] = ListBoxTop1.SelectedValue;
            Session["MLOC_ID"] = ListBoxTop2.SelectedValue;
            Session["PARAM_ID"] = ListBoxTop3.SelectedValue;
        }

        protected void Dates_Click(object sender, EventArgs e)
        {
            Label1.Visible = true;
            Label2.Visible = true;
            TextBox1.Visible = true;
            TextBox2.Visible = true;
            Dates.Visible = false;
            GridView3.DataSourceID = SqlDataSource7.ID;
            GridView1.DataSourceID = SqlDataSource8.ID;
            GridView2.DataSourceID = SqlDataSource9.ID;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            GridView3.Visible = true;
            GridView3.DataBind();
        }

        protected void SqlDataSource6_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            Session["PRJ_ID"] = ListBoxTop1.SelectedValue;
            Session["MLOC_ID"] = ListBoxTop2.SelectedValue;
            Session["PARAM_ID"] = ListBoxTop3.SelectedValue;
        }

        protected void SqlDataSource7_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            Session["PRJ_ID"] = ListBoxTop1.SelectedValue;
            Session["MLOC_ID"] = ListBoxTop2.SelectedValue;
            Session["PARAM_ID"] = ListBoxTop3.SelectedValue;
            Session["SRESDATE"] = TextBox1.Text;
            Session["ERESDATE"] = TextBox2.Text;
        }
        protected void SqlDataSource8_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            Session["PRJ_ID"] = ListBoxTop1.SelectedValue;
            Session["MLOC_ID"] = ListBoxTop2.SelectedValue;
            Session["PARAM_ID"] = ListBoxTop3.SelectedValue;
            Session["SRESDATE"] = TextBox1.Text;
            Session["ERESDATE"] = TextBox2.Text;
        }
        protected void SqlDataSource9_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            Session["PRJ_ID"] = ListBoxTop1.SelectedValue;
            Session["MLOC_ID"] = ListBoxTop2.SelectedValue;
            Session["PARAM_ID"] = ListBoxTop3.SelectedValue;
            Session["SRESDATE"] = TextBox1.Text;
            Session["ERESDATE"] = TextBox2.Text;
        }
    }
}