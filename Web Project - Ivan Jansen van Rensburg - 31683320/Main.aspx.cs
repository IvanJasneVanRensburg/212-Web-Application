using System;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Web;


namespace Web_Project___Ivan_Jansen_van_Rensburg___31683320
{
    public partial class Main : System.Web.UI.Page
    {
        public SqlConnection conn;
        public SqlCommand cmd;
        public SqlDataAdapter adap;
        public DataSet ds;

        string name;
        string surname;
        string email;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                HttpCookie userInfoCookies = Request.Cookies["UserInfo"];
                if (userInfoCookies != null)
                {
                    email = userInfoCookies["UserEmail"];
                    name = userInfoCookies["UserFirstName"];
                    surname = userInfoCookies["UserLastName"];
                    lblWelcome.Text = "Welcome to Community Bookstore " +name+ " " +surname+"!";
                }
                string sql;
                conn = new SqlConnection(Properties.Settings.Default.constr);
                adap = new SqlDataAdapter();
                ds = new DataSet();

                conn.Open();
                sql = @"SELECT * FROM BookTable ORDER BY ID ASC";
                cmd = new SqlCommand(sql, conn);
                adap.SelectCommand = cmd;

                adap.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();

                conn.Close();
            }
            catch (SqlException sqlerr)
            {
                lblSqlError.Text = sqlerr.Message;
                lblSqlError.Visible = true;
            }
            catch (Exception err)
            {
                lblWelcome.Text = err.Message;
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                string searchby = DropDownListSearch.SelectedValue.ToString();
                string toMatch = txtSearchKey.Text.ToString();

                conn = new SqlConnection(Properties.Settings.Default.constr);
                adap = new SqlDataAdapter();
                ds = new DataSet();

                conn.Open();
                string sql_search = @"SELECT * FROM BookTable WHERE " + searchby + " LIKE '%" + toMatch + "%'";
                cmd = new SqlCommand(sql_search, conn);
                adap.SelectCommand = cmd;

                adap.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();

                conn.Close();
            }

            catch (SqlException sqlerr)
            {

                lblSqlError.Text = sqlerr.Message;
                lblSqlError.Visible = true;

            }

            catch (Exception err)
            {

                lblWelcome.Text = err.Message;
            }

        }

        protected void btnFacultySort_Click(object sender, EventArgs e)
        {
            try
            {
                string selectedFaculty = DropDownListFaculty.SelectedValue.ToString();

                conn = new SqlConnection(Properties.Settings.Default.constr);
                adap = new SqlDataAdapter();
                ds = new DataSet();
                if (selectedFaculty == "All")
                {
                    conn.Open();
                    string sql = @"SELECT * FROM BookTable";
                    cmd = new SqlCommand(sql, conn);
                    adap.SelectCommand = cmd;

                    adap.Fill(ds);
                    GridView1.DataSource = ds;
                    GridView1.DataBind();

                    conn.Close();
                }
                else
                {
                    conn.Open();

                    string sql_search_Fac = @"SELECT * FROM BookTable WHERE Faculty LIKE '%" + selectedFaculty + "%'";
                    cmd = new SqlCommand(sql_search_Fac, conn);
                    adap.SelectCommand = cmd;

                    adap.Fill(ds);
                    GridView1.DataSource = ds;
                    GridView1.DataBind();

                    conn.Close();
                }


            }

            catch (SqlException sqlerr)
            {

                lblSqlError.Text = sqlerr.Message;
                lblSqlError.Visible = true;

            }

            catch (Exception err)
            {

                lblWelcome.Text = err.Message;

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            try
            {
                bool valid_bookID = false;
                
                if(txtBookID.Text != "")
                {
                    string Select_all_querry = "SELECT * FROM BookTable";

                    conn = new SqlConnection(Properties.Settings.Default.constr);
                    conn.Open();
                    cmd = new SqlCommand(Select_all_querry, conn);
                    ds = new DataSet();
                    SqlDataReader dataReader = cmd.ExecuteReader();

                    while (dataReader.Read())
                    {
                        if (txtBookID.Text == dataReader.GetValue(0).ToString())
                        {
                            valid_bookID = true;
                        }
                       
                    }
                    conn.Close();
                    if(valid_bookID == true)
                    {
                        lblerr.Visible = false;

                        string selectedID = txtBookID.Text;

                        conn = new SqlConnection(Properties.Settings.Default.constr);
                        adap = new SqlDataAdapter();
                        ds = new DataSet();

                        string BookinfoSession = "SELECT * FROM BookTable WHERE ID = '" + selectedID + "'";

                        conn = new SqlConnection(Properties.Settings.Default.constr);
                        conn.Open();
                        cmd = new SqlCommand(BookinfoSession, conn);
                        ds = new DataSet();

                        SqlDataReader ReaderAlpha = cmd.ExecuteReader();

                        while (ReaderAlpha.Read())
                        {
                            Session["BookID"] = Convert.ToString(ReaderAlpha.GetValue(0));
                            Session["BookName"] = Convert.ToString(ReaderAlpha.GetValue(1));
                            Session["BookAuthor"] = Convert.ToString(ReaderAlpha.GetValue(2));
                            Session["BookYear"] = Convert.ToString(ReaderAlpha.GetValue(3));
                            Session["BookFaculty"] = Convert.ToString(ReaderAlpha.GetValue(4));
                            Session["BookPrice"] = Convert.ToString(ReaderAlpha.GetValue(5));

                        }
                        conn.Close();

                        Response.Redirect("Booking.aspx");
                    }
                    else
                    {
                        lblerr.Visible = true;
                        lblerr.Text = "Error: Book ID is not valid";
                        txtBookID.Text = "";
                        txtBookID.Focus();
                    }
                }
                else
                {
                    lblerr.Visible = true;
                    txtBookID.Focus();
                }
            }

            catch (SqlException sqlerr)
            {

                lblSqlError.Text = sqlerr.Message;
                lblSqlError.Visible = true;

            }

            catch (Exception err)
            {

                lblWelcome.Text = err.Message;

            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddBook.aspx");
        }
    }
}