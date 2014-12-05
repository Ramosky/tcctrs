using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
 

namespace tcctrs.Pages
{
    public partial class Members : System.Web.UI.Page
    {

        SqlDataAdapter da;
        DataSet ds = new DataSet();
        SqlCommand cmd = new SqlCommand();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["TCCTRSConnection"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindData();
            }
        }

        public void BindData()
        {         
            cmd.CommandText = "Select * from Users";
            cmd.Connection = con;
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            con.Open();
            cmd.ExecuteNonQuery();
            Grid.DataSource = ds;
            Grid.DataBind();
            con.Close();
        }

        protected void Grid_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            Grid.CurrentPageIndex = e.NewPageIndex;
            BindData();
        }

        protected void Grid_EditCommand(object source, DataGridCommandEventArgs e)
        {
            Grid.EditItemIndex = e.Item.ItemIndex;
            BindData();
        }

        protected void Grid_CancelCommand(object source, DataGridCommandEventArgs e)
        {
            Grid.EditItemIndex = -1;
            BindData();
        }

        protected void Grid_DeleteCommand(object source, DataGridCommandEventArgs e)
        {  
            cmd.Connection = con;
            string userId =  Grid.DataKeys[e.Item.ItemIndex].ToString();
            cmd.CommandText = "Delete from Users where UserId='" + userId +"'";
            cmd.Connection.Open();
            cmd.ExecuteNonQuery();
            cmd.Connection.Close();
            Grid.EditItemIndex = -1;
            BindData();
        }


        protected void Grid_UpdateCommand(object source, DataGridCommandEventArgs e)
        {
            cmd.Parameters.Add("@userId", SqlDbType.Char).Value = ((TextBox)e.Item.Cells[0].Controls[0]).Text;
            cmd.Parameters.Add("@firstName", SqlDbType.Char).Value = ((TextBox)e.Item.Cells[1].Controls[0]).Text;
            cmd.Parameters.Add("@lastName", SqlDbType.Char).Value = ((TextBox)e.Item.Cells[2].Controls[0]).Text;
            cmd.CommandText = "Update Users set firstName=@firstName,lastName=@lastName where UserId=@userId";
            cmd.Connection = con;
            cmd.Connection.Open();
            cmd.ExecuteNonQuery();
            cmd.Connection.Close();
            Grid.EditItemIndex = -1;
            BindData();
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            
        }


        protected void btnReset_Click(object sender, EventArgs e)
        {
        
        }



    }
}