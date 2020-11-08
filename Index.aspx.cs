using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
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
            emailTip.Text = "Digite um E-mail";
            senhaTip.Text = "Digite uma senha";
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

            if (status == true)
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

        protected void txtEmail_TextChanged(object sender, EventArgs e)
        {
            //validar e-mail
            String pattern = "^([0-9a-zA-Z]([-\\.\\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\\w]*[0-9a-zA-Z]\\.)+[a-zA-Z]{2,9})$";

            if (txtEmail.Text.Length == 0 || !Regex.IsMatch(txtEmail.Text, pattern))
            {
                emailTip.Text = "Digite um E-mail válido";
            }
            else
            {
                emailTip.Text = "Digite um E-mail";
            }
        }

        protected void txtSenha_TextChanged(object sender, EventArgs e)
        {

            if (txtSenha.Text.Length < 8 || txtSenha.Text.Length > 32)
            {
                senhaTip.Text = "Minimo de 8 caracteres e máximo de 32 caracteres";
            }
            else
            {
                senhaTip.Text = "Digite uma senha";
            }
        }
    }
}