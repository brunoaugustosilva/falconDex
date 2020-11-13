using falconDex.Models;
using FATEC;
using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

public class TestController : ApiController
{
    // GET api/<controller>
    [HttpGet]
    public IEnumerable<Chamado> Get()
    {
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;
        objConexao = Mapped.Connection();
        objCommand = Mapped.Command("SELECT * FROM cha_chamado", objConexao);
        objDataAdapter = Mapped.Adapter(objCommand);
        objDataAdapter.Fill(ds);
        dt = ds.Tables[0];

        List<Chamado> data = dt.AsEnumerable()
                      .Select(r => new Chamado {
                          Id = r.Field<int>("cha_id"),
                          Nome = r.Field<string>("cha_name"),
                          Descricao = r.Field<string>("cha_descricao"),
                          Data = r.Field<DateTime>("cha_criacao"),
                          abridor = new Usuario{ 
                               Id = r.Field<Int32>("USU_ID") 
                          },
                          equipamento = new TipoEquipamento {
                              ID = r.Field<Int32>("EQU_ID")
                          },
                          Local = new Local {
                              Id = r.Field<Int32>("LOC_ID")
                          },
                          Responsavel = new Usuario {
                              Id = r.Field<Int32>("USU_RESP")
                          },
                          prioridade = new Prioridade
                          {
                              Id = r.Field<Int32>("PRI_ID")
                          },
                          status = new Status {
                              Id = r.Field<Int32>("CHA_STATUS")
                          }
                      })
                      .ToList();

        return data;
    }

    // GET api/<controller>/5
    [HttpGet]
    public string Get(int id)
    {
        return "value: " + id;
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
