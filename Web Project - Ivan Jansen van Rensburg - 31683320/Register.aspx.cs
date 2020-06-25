using System;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;

namespace Web_Project___Ivan_Jansen_van_Rensburg___31683320
{
    public partial class Register : System.Web.UI.Page
    {
        public SqlConnection conn;
        public SqlCommand cmd;
        public SqlDataAdapter adap;
        public DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            bool NewUser = true;
            string pass = txtPass.Text;
           
                try
                {
                    //Checks if the email adress already exits
                    try
                    {
                        string select_all = "SELECT * FROM UserTable";
                        conn = new SqlConnection(Properties.Settings.Default.constr);
                        conn.Open();
                        cmd = new SqlCommand(select_all, conn);
                        ds = new DataSet();
                        SqlDataReader dr = cmd.ExecuteReader();

                        while (dr.Read())
                        {
                            if (txtEmail.Text == dr.GetValue(0).ToString())
                            {
                                NewUser = false;
                            }
                        }
                        conn.Close();
                    }
                    catch (SqlException sqlerr1)
                    {
                        lblPassError.Visible = true;
                        lblPassError.Text = sqlerr1.Message.ToString();
                    }

                    //If the password does not exist adds it to the UserTable
                    try
                    {
                        if (NewUser == true)
                        {
                            //Hashes the password to insure data security
                            MD5CryptoServiceProvider sh = new MD5CryptoServiceProvider();
                            UTF32Encoding utf8 = new UTF32Encoding();
                            string hash = BitConverter.ToString(sh.ComputeHash(utf8.GetBytes(pass)));

                            string add_NewUser = "INSERT INTO UserTable VALUES(@Email, @FirstName, @LastName, @Password)";

                            conn = new SqlConnection(Properties.Settings.Default.constr);
                            conn.Open();
                            cmd = new SqlCommand(add_NewUser, conn);
                            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                            cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
                            cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
                            cmd.Parameters.AddWithValue("@Password", hash); //adds the hashed password into the database 
                            cmd.ExecuteNonQuery();
                            conn.Close();

                            //send an automated email 
                            try
                            {
                                Session["Email"] = txtEmail.Text;
                                Session["FullName"] = txtFirstName.Text + " " + txtLastName.Text;
                                MailMessage email = new MailMessage();
                                SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

                                email.From = new MailAddress("IvanJansenVanRensburg31683320@gmail.com");
                                email.To.Add(Session["Email"].ToString());
                                email.Subject = "Verfying Registration";
                                email.Body = "Thank you " + Session["FullName"] + " for registering at Community Bookstore, we hope you enjoy our Web Application";

                                SmtpServer.Port = 587;
                                SmtpServer.Credentials = new System.Net.NetworkCredential("IvanJansenVanRensburg31683320@gmail.com", "ItIsWhatItIs");
                                SmtpServer.EnableSsl = true;

                                SmtpServer.Send(email);

                            }
                            catch (Exception err)
                            {
                                lblPassError.Text = err.ToString();
                            }

                            Response.Redirect("Default.aspx");
                        }
                        else
                        {
                            lblPassError.Visible = true;
                            lblPassError.Text = "Error: That email adress is taken";
                        }
                    }
                    catch (SqlException sqlerr2)
                    {
                        lblPassError.Visible = true;
                        lblPassError.Text = sqlerr2.Message.ToString();
                    }
                }
                catch (Exception err)
                {
                    lblPassError.Visible = true;
                    lblPassError.Text = err.Message.ToString();
                }
            }
        }
    }