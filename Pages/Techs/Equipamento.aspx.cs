using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Techs_Equipamento : System.Web.UI.Page
{
 
    public void Carregar()
    {
        EquipamentoController equipamentoController = new EquipamentoController();

        DataSet data = equipamentoController.selectAll();

        RepeaterEquipaments.DataSource = data.Tables[0].DefaultView;
        RepeaterEquipaments.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        Carregar();
    }
}