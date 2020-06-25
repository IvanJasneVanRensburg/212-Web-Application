using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;

namespace Web_Project___Ivan_Jansen_van_Rensburg___31683320
{

    public partial class AddBook : System.Web.UI.Page
    {
        public SqlConnection conn;
        public SqlCommand cmd;
        public SqlDataAdapter adap;
        public DataSet ds;
        //cookie variables   
        string email;

        bool isNewID = true;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                isNewID = true;

                HttpCookie userInfoCookies = Request.Cookies["UserInfo"];
                if (userInfoCookies != null)
                {
                    email = userInfoCookies["UserEmail"];
                }
                txtEmail.Text = email;
            }
            catch (Exception err)
            {
                lblError.Text = err.Message.ToString();
                lblError.Visible = true;
            }

        }

        protected void btnAddBook_Click(object sender, EventArgs e)
        {
            try
            {
                string select_all = "SELECT * FROM BookTable";
                conn = new SqlConnection(Properties.Settings.Default.constr);
                conn.Open();
                cmd = new SqlCommand(select_all, conn);
                ds = new DataSet();
                SqlDataReader dr = cmd.ExecuteReader();
                int id_entered = int.Parse(txtNewID.Text);
                while (dr.Read())
                {
                    if (id_entered == Convert.ToInt32(dr.GetValue(0)))
                    {
                        isNewID = false;
                    }
                }
                conn.Close();

                if (isNewID == true)
                {
                    string price = txtPrice.Text + ".00";
                    string add_NewUser = "INSERT INTO BookTable VALUES(@ID, @Name, @Author, @Year, @Faculty, @Price, @Advertiser)";

                    conn = new SqlConnection(Properties.Settings.Default.constr);
                    conn.Open();
                    cmd = new SqlCommand(add_NewUser, conn);
                    cmd.Parameters.AddWithValue("@ID", int.Parse(txtNewID.Text));
                    cmd.Parameters.AddWithValue("@Name", txtName.Text.ToString());
                    cmd.Parameters.AddWithValue("@Author", txtAuthor.Text.ToString());
                    cmd.Parameters.AddWithValue("@Year", txtYear.Text.ToString());
                    cmd.Parameters.AddWithValue("@Faculty", DropDownListFaculty.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@Price", price.ToString());
                    cmd.Parameters.AddWithValue("@Advertiser", txtEmail.Text.ToString());
                    cmd.ExecuteNonQuery();
                    conn.Close();

                    Response.Redirect("Main.aspx");
                }
                else
                {
                    lblError.Text = "Error: The ID you have entered is already taken";
                    lblError.Visible = true;
                    txtNewID.Text = "";
                    txtNewID.Focus();
                }

            }

            catch (SqlException sqlerr)
            {
                lblError.Text = sqlerr.Message.ToString();
                lblError.Visible = true;
            }

            catch (Exception err)
            {
                lblError.Text = err.Message.ToString();
                lblError.Visible = true;
            }
        }
    }
}