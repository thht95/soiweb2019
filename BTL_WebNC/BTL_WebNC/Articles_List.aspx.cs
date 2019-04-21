using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL_WebNC
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Hien_Baiviet();
            if (Convert.ToInt32(Session["NhomQuyen"]) == 3)
            {
                gv_Baiviet.Columns[gv_Baiviet.Columns.Count - 1].Visible = false;
                gv_Baiviet.Columns[gv_Baiviet.Columns.Count - 2].Visible = false;
            }
        }

        private void Hien_Baiviet()
        {
            using (DataTable dt = get_Baiviet())
            {
                gv_Baiviet.DataSource = dt;
                gv_Baiviet.DataBind();
            }
        }


        private DataTable get_Baiviet()
        {

            string connectionString = ConfigurationManager.ConnectionStrings["BDT"].ConnectionString;
            using (SqlConnection cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("select_Baibao_by_user", cnn))
                {
                    int id = 0;
                    if (Convert.ToInt32(Session["NhomQuyen"]) != 1 && Convert.ToInt32(Session["NhomQuyen"]) !=2)
                    {
                        id = Convert.ToInt32(Session["PK_iUserID"]);
                    }
                        cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ma", id);
                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);
                        return dt;
                    }
                }
            }
        }

        protected void gv_Baiviet_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.ToLower().Equals("delete"))
            {
                int ID = Convert.ToInt32(e.CommandArgument);
                string connectionString = ConfigurationManager.ConnectionStrings["BDT"].ConnectionString;
                using (SqlConnection cnn = new SqlConnection(connectionString))
                {
                    cnn.Open();
                    using (SqlCommand cmd = new SqlCommand("delete_Baibao", cnn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ma", ID);
                        cmd.ExecuteNonQuery();
                        Hien_Baiviet();
                    }
                    cnn.Close();
                }

            }
        }
    }
}