using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using falconDex.Controller;


namespace falconDex
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEntrar_Click(object sender, EventArgs e)
        {
            //loginAlert;
            //loginAlert.style.opacity = 1;
            UsuarioController usuario = new UsuarioController();

            

        }
    }
}