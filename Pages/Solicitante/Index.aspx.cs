using falconDex.Controller;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Solicitante_Index : System.Web.UI.Page
{
    private void Carrega()
    {
        ChamadoController chamadoController = new ChamadoController();
        DataSet dataSet = chamadoController.selectAll();

        RepeaterChamados.DataSource = dataSet.Tables[0].DefaultView;
        RepeaterChamados.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        Carrega();
    }
}