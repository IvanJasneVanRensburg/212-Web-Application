using System;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace Web_Project___Ivan_Jansen_van_Rensburg___31683320
{
    public partial class Default : System.Web.UI.Page
    {
        public SqlConnection conn;
        public SqlCommand cmd;
        public SqlDataAdapter adap;
        public DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            bool loginCheck = false;
            string Select_all_querry = "SELECT * FROM UserTable";

            try
            {
                string pass = txtPass.Text;
                MD5CryptoServiceProvider sh = new MD5CryptoServiceProvider();
                UTF32Encoding utf8 = new UTF32Encoding();
                string hash = BitConverter.ToString(sh.ComputeHash(utf8.GetBytes(pass)));

                try
                {
                    conn = new SqlConnection(Properties.Settings.Default.constr);
                    conn.Open();
                    cmd = new SqlCommand(Select_all_querry, conn);
                    ds = new DataSet();
                    SqlDataReader dataR = cmd.ExecuteReader();

                    while (dataR.Read())
                    {
                        if (txtEmail.Text == dataR.GetValue(0).ToString())
                        {
                            if (hash == dataR.GetValue(3).ToString())
                            {
                                loginCheck = true;
                            }
                        }
                    }
                    conn.Close();
                }
                catch (SqlException sqlerr)
                {
                    lblErr.Visible = true;
                    lblErr.Text = sqlerr.Message.ToString();
                }

                if (loginCheck == true)
                {
                    //Creating a Cookie Object
                    HttpCookie userInfoCookies = new HttpCookie("UserInfo");
                    //Adding Expire Time of cookies
                    userInfoCookies.Expires = DateTime.Now.AddDays(5);


                    try
                    {
                        string Select_all_for_cookie = "SELECT * FROM UserTable WHERE Email = '" + txtEmail.Text + "'";

                        conn = new SqlConnection(Properties.Settings.Default.constr);
                        conn.Open();
                        cmd = new SqlCommand(Select_all_for_cookie, conn);
                        ds = new DataSet();

                        SqlDataReader ReaderAlpha = cmd.ExecuteReader();

                        while (ReaderAlpha.Read())
                        {
                            //Setting values inside it
                            userInfoCookies["UserEmail"] = Convert.ToString(ReaderAlpha.GetValue(0));
                            userInfoCookies["UserFirstName"] = Convert.ToString(ReaderAlpha.GetValue(1));
                            userInfoCookies["UserLastName"] = Convert.ToString(ReaderAlpha.GetValue(2));
                        }
                        conn.Close();
                        //Adding cookies to current web response
                        Response.Cookies.Add(userInfoCookies);
                    }
                    catch (SqlException sqlerr)
                    {
                        lblErr.Visible = true;
                        lblErr.Text = sqlerr.Message.ToString();
                    }
                    Response.Redirect("Main.aspx");
                }
                else
                {
                    txtEmail.Text = "";
                    txtEmail.Focus();
                    txtPass.Text = "";
                    lblErr.Text = "Error: Invalid credentials";
                    lblErr.Visible = true;
                }
            }
            catch (Exception err)
            {
                lblErr.Visible = true;
                lblErr.Text = err.Message.ToString();
            }
        }
    }
}