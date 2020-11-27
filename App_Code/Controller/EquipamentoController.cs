using falconDex.Models;
using FATEC;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

public class EquipamentoController : ApiController
{
    // GET api/<controller>
    public IEnumerable<Equipamento> Get()
    {
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;
        objConexao = Mapped.Connection();
        objCommand = Mapped.Command("SELECT * FROM EQU_EQUIPAMENTOS", objConexao);
        objDataAdapter = Mapped.Adapter(objCommand);
        objDataAdapter.Fill(ds);
        dt = ds.Tables[0];

        List<Equipamento> data = dt.AsEnumerable()
                      .Select(r => new Equipamento
                      {
                          Id = r.Field<int>("equ_id"),
                          Nome = r.Field<string>("equ_nome"),
                          Patrimonio = r.Field<string>("equi_patrimonio"),
                          Tipo = new TipoEquipamento
                          {
                              ID = r.Field<Int32>("tie_id")
                          },
                          Status = new Status
                          {
                              Id = r.Field<Int32>("equ_status")
                          }
                      })
                      .ToList();

        return data;
    }

    // GET api/<controller>/5
    public string Get(int id)
    {
        return "value";
    }

    // POST api/<controller>
    public void Post([FromBody] Equipamento equipamento)
    {

        Equipamento equ = new Equipamento
        {
            Nome = equipamento.Nome,
            Patrimonio = equipamento.Patrimonio,
            Local = new Local { Id = equipamento.Local.Id },
            Tipo = new TipoEquipamento { ID = equipamento.Tipo.ID },
            Usuario = new Usuario { Id = equipamento.Usuario.Id }
        };

        IDbConnection objConexao;
        IDbCommand objCommand;
        string sql = "CALL INSERE_EQUIPAMENTO(?nome, ?patrimonio, ?local, ?tipo, ?usuario);";
        objConexao = Mapped.Connection();
        objCommand = Mapped.Command(sql, objConexao);
        objCommand.Parameters.Add(Mapped.Parameter("?nome", equ.Nome));
        objCommand.Parameters.Add(Mapped.Parameter("?patrimonio", equ.Patrimonio));
        objCommand.Parameters.Add(Mapped.Parameter("?local", equ.Local.Id));
        objCommand.Parameters.Add(Mapped.Parameter("?tipo", equ.Tipo.ID));
        objCommand.Parameters.Add(Mapped.Parameter("?usuario", equ.Usuario.Id));

        int i = objCommand.ExecuteNonQuery();
        objConexao.Close();

        objCommand.Dispose();
        objConexao.Dispose();
    }

    // PUT api/<controller>/5
    public void Put(int id, [FromBody] string value)
    {
    }

    // DELETE api/<controller>/5
    public void Delete(int id)
    {
    }
}
