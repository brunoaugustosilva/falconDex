using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;

using falconDex.Controller;
using falconDex.Models;
using Microsoft.Net.Http.Headers;

namespace falconDex
{
    public partial class Index : System.Web.UI.Page
    {
        //Request.Headers.GetCookies("session-id").FirstOrDefault();

        protected void Page_Load(object sender, EventArgs e)
        {
            //var cookieHeader = Request.Headers.GetCookies("session-id").FirstOrDefault();
            string cookie = string.Empty;

            try
            {
                cookie = "3333x";
            }
            catch(Exception)
            {
                Response.Write("Erro no cookie: " + cookie);
            }

            if (cookie != null)
            {
                int permissao = Int32.Parse(cookie.Substring(cookie.Length - 2, 1));

                if (permissao == 3 || permissao == 2)
                {
                    Response.Redirect("/inicio");
                }
                else
                {
                    Response.Redirect("/chamados");
                }

            }

        }

        protected void btnEntrar_Click(object sender, EventArgs e)
        {
            LoginController loginController = new LoginController();
            Login login = new Login
            {
                Email = txtEmail.Text,
                Senha = txtSenha.Text
            };


            DateTime dateValue = DateTime.Now;
            login.Date = dateValue;

            login.Ip = GetUserIP();

            //int status = 0;
            Boolean status = loginController.login(login);

            if (status == true)
            {
                int permissao = loginController.getPermissao(login).First();

                if(permissao == 3 || permissao == 2)
                {
                    Response.Redirect("/inicio");
                }
                else
                {
                    Response.Redirect("/chamados");
                }

                //var resp = new HttpResponseMessage();

                //var cookie = new CookieHeaderValue("session-id", DateTime.Now.ToString() + permissao);
                //cookie. = DateTimeOffset.Now.AddDays(1);
                //cookie.Domain = Request.RawUrl;
                //cookie.Path = "/";

                //resp.Headers.Add(new CookieHeaderValue[] { cookie });
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