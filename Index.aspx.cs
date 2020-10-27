using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;

using falconDex.Controller;
using falconDex.Models;

namespace falconDex
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEntrar_Click(object sender, EventArgs e)
        {
            LoginController loginController = new LoginController();
            Login login = new Login();
            login.Email = txtEmail.Text;
            login.Senha = txtSenha.Text;


            DateTime dateValue = DateTime.Now;
            login.Date = dateValue;

            login.Ip = GetUserIP();

            //int status = 0;
            Boolean status = loginController.login(login);

            if(status == true)
            {
                Response.Redirect("/chamados");   
            }
            else
            {
                lblMessage.Text = "Dados incorretos";
            }
        }

        private string GetUserIP()
        {
            string ipList = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

            if (!string.IsNullOrEmpty(ipList))
            {
                return ipList.Split(',')[0];
            }

            return Request.ServerVariables["REMOTE_ADDR"];
        }
    }
}