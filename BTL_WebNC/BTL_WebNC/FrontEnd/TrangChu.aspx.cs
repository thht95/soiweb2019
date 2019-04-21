using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL_WebNC.FrontEnd
{
    public partial class TrangChu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string connectionString = ConfigurationManager.ConnectionStrings["BDT"].ConnectionString;
                using (SqlConnection cnn = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("select_Baibao_daduyet", cnn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            adapter.Fill(dt);
                            rptNewsTop5.DataSource = dt;
                            rptNewsTop5.DataBind();
                            int icount = rptNewsTop5.Items.Count;
                            if (icount > 5)
                            {
                                for (int i = 5; i < icount; i++)
                                {
                                    rptNewsTop5.Items[i].Visible = false;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}