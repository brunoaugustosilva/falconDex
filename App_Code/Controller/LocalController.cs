using falconDex.Models;
using System.Data;
using MySql.Data;
using MySql.Data.MySqlClient;
using FATEC;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace falconDex.Controller
{
    public class LocalController : ApiController
    {
        // GET api/<controller>
        [HttpGet]
        public IEnumerable<Local> Get()
        {
        
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;
        objConexao = Mapped.Connection();
        objCommand = Mapped.Command("SELECT * FROM loc_local", objConexao);
        objDataAdapter = Mapped.Adapter(objCommand);
        objDataAdapter.Fill(ds);
        dt = ds.Tables[0];

        List<Local> data = dt.AsEnumerable()
                      .Select(r => new Local
                      {
                          Id = r.Field<int>("loc_id"),
                          Nome = r.Field<string>("loc_nome"),
                          status = new Status
                          {
                              Id = r.Field<Int32>("LOC_STATUS")
                          }
                      })
                      .ToList();

        return data;
    }

    // POST api/<controller>
    public void Post([FromBody] Local value)
    {
        var response = value;

        Local local = new Local
        {
            Nome = response.Nome
        };

        IDbConnection objConexao;
        IDbCommand objCommand;
        string sql = "INSERT INTO loc_local" +
                     "(loc_nome, loc_id) " +
                     "VALUES (?nome)";
        objConexao = Mapped.Connection();
        objCommand = Mapped.Command(sql, objConexao);
        objCommand.Parameters.Add(Mapped.Parameter("?nome", local.Nome));

        int i = objCommand.ExecuteNonQuery();
        objConexao.Close();

        objCommand.Dispose();
        objConexao.Dispose();
    }

        // PUT api/<controller>/5
        public void Put(int id, [FromBody] Local local)
        {
            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            string sql = "UPDATE loc_local SET " +
                         "loc_nome = ?nome," +
                         "WHERE loc_id =? codigo";
            objConexao = Mapped.Connection();
            objCommand = Mapped.Command(sql, objConexao);
            objCommand.Parameters.Add(Mapped.Parameter("?nome", local.Nome));
            objCommand.Parameters.Add(Mapped.Parameter("?codigo", local.Id));
            objCommand.ExecuteNonQuery();
            objConexao.Close();
            objCommand.Dispose();
            objConexao.Dispose();
        }

        // DELETE api/<controller>/5
        public void Delete(int id)
        {
        }
    }
}
