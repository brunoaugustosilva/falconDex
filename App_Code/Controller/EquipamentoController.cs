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
    public void Post([FromBody] string value)
    {
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
