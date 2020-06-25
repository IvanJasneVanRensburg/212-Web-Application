using System;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Web;

namespace Web_Project___Ivan_Jansen_van_Rensburg___31683320
{
    public partial class Booking : System.Web.UI.Page
    {
        public SqlConnection conn;
        public SqlCommand cmd;
        public SqlDataAdapter adap;
        public DataSet ds;

        string name;
        string surname;
        string email;
        DateTime deliverydate;


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
                }
                DateTime myDate = new DateTime(DateTime.Today.Year, DateTime.Today.Month, DateTime.Today.Day);
                if (myDate.DayOfWeek.ToString() == "Friday" || myDate.DayOfWeek.ToString() == "Saterday" || myDate.DayOfWeek.ToString() == "Sunday")
                {
                    deliverydate = myDate.AddDays(3);
                    lblDelivery.Text = "Dear " + name + " " +surname +" your order " + Session["BookName"].ToString() + " by " + Session["BookAuthor"]+ " will be delivered on "+ deliverydate.ToLongDateString() + ".";
                    Calendar1.SelectedDate = deliverydate;
                }
                else
                {
                    deliverydate = myDate.AddDays(2);
                    lblDelivery.Text = "Dear " +name + " " +surname +" your order "+ Session["BookName"].ToString()+ " by "+ Session["BookAuthor"]+ " will be delivered on "+ deliverydate.ToLongDateString() + ".";
                    Calendar1.SelectedDate = deliverydate;
                }
            }

            catch (Exception err)
            {
                lblHeader.Text = err.Message.ToString();
            }
        }

        protected void btnOrder_Click(object sender, EventArgs e)
        {
            try
            {
                string delete_query = "DELETE FROM BookTable WHERE ID = '" + Session["BookID"] + "'";
                conn = new SqlConnection(Properties.Settings.Default.constr);
                conn.Open();
                cmd = new SqlCommand(delete_query, conn);
                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Redirect("Main.aspx");

                //sending an email for order confermation


                MailMessage email = new MailMessage();
                SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

                email.From = new MailAddress("IvanJansenVanRensburg31683320@gmail.com");
                email.To.Add(email.ToString());
                email.Subject = "Confirming purchase";
                email.Body = name + surname + " your copy of " + Session["BookName"] + " will be delivered " + deliverydate.ToLongDateString() + ". Thank you for your support.";

                SmtpServer.Port = 587;
                SmtpServer.Credentials = new System.Net.NetworkCredential("IvanJansenVanRensburg31683320@gmail.com", "ItIsWhatItIs");
                SmtpServer.EnableSsl = true;

                SmtpServer.Send(email);
            }
            catch (SqlException sqlErr)
            {
                lblHeader.Text = sqlErr.Message.ToString();
            }
            catch (Exception err)
            {
                lblHeader.Text = err.Message.ToString();
            }
        }
    }
}