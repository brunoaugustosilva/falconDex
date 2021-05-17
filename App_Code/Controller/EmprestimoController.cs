using falconDex.Models;
using FATEC;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

public class EmprestimoController : ApiController
{
    // GET api/<controller>
    public IEnumerable<Emprestimo> Get()
    {
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;
        objConexao = Mapped.Connection();
        objCommand = Mapped.Command("SELECT equ_id, equ_nome, equi_patrimonio, e.tie_id TIPO, equ_status, STA_NOME, TIE_NOME FROM EQU_EQUIPAMENTOS e " +
            "INNER JOIN TIE_tipo_EQUIPAMENTOS tie ON tie.TIE_ID = e.tie_id " +
            "INNER JOIN sta_status status ON status.STA_ID = e.equ_status" , objConexao);
        objDataAdapter = Mapped.Adapter(objCommand);
        objDataAdapter.Fill(ds);
        dt = ds.Tables[0];

        List<Emprestimo> data = dt.AsEnumerable()
                      .Select(r => new Emprestimo
                      {
                          Id = r.Field<int>("emp_id"),
                          Usuario = new Usuario
                          {
                              Nome = r.Field<string>("usu_nome")
                          },
                          Nome = r.Field<string>("emp_nome"),
                          Patrimonio = r.Field<string>("equi_patrimonio"),
                          Tipo = new TipoEquipamento
                          {
                              ID = r.Field<Int32>("tie_id"),
                              Nome = r.Field<string>("tied_nome")
                          },
                          Data = r.Field<DateTime>("emp_date"),
                          Status = new Status
                          {
                              Id = r.Field<Int32>("emp_status"),
                              Nome = r.Field<string>("sta_nome")
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
    public void Post([FromBody] Emprestimo emprestimo)
     {
         Emprestimo emp = new Emprestimo
         {
             Nome = emprestimo.Nome,
             Data = emprestimo.Data,
             Usuario = emprestimo.Usuario
         };

         IDbConnection objConexao;
         IDbCommand objCommand;
         string sql = "CALL INSERE_EMPRESTIMO(?usuario, ?nome, ?data);";
         objConexao = Mapped.Connection();
         objCommand = Mapped.Command(sql, objConexao);
         objCommand.Parameters.Add(Mapped.Parameter("?usuario", emp.Usuario.Id));
         objCommand.Parameters.Add(Mapped.Parameter("?nome", emp.Nome));
         objCommand.Parameters.Add(Mapped.Parameter("?data", emp.Data));
         
         
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
