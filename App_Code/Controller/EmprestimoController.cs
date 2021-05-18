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
        objCommand = Mapped.Command("SELECT e.emp_id, e.equ_id, equ.equ_nome, solicitante.usu_nome, tecnico.usu_nome, e.emp_data FROM emp_emprestimos e " +
            " INNER JOIN equ_equipamentos equ ON equ.equ_id = e.equ_id " +
            " INNER JOIN usu_usuario solicitante ON solicitante.usu_id = e.usu_id " +
            " INNER JOIN usu_usuario tecnico ON tecnico.usu_id = e.usu_id_tecnico", objConexao);
        objDataAdapter = Mapped.Adapter(objCommand);
        objDataAdapter.Fill(ds);
        dt = ds.Tables[0];

        List<Emprestimo> data = dt.AsEnumerable()
                      .Select(r => new Emprestimo
                      {
                          Id = r.Field<int>("emp_id"),
                          Equipamento = new Equipamento
                          {
                              Id = r.Field<Int32>("e.equ_id"),
                              Nome = r.Field<String>("e.equ_nome")
                          },
                          Usuario = new Usuario
                          {
                              Nome = r.Field<string>("solicitante.usu_nome")
                          },
                          Tecnico = new Usuario
                          {
                              Nome = r.Field<string>("tecnico.usu_nome")
                          },
                          Data = r.Field<DateTime>("e.emp_data")  
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
             Equipamento = emprestimo.Equipamento,
             Data = new DateTime(),
             Usuario = emprestimo.Usuario,
             Tecnico = emprestimo.Tecnico
         };

         IDbConnection objConexao;
         IDbCommand objCommand;
         string sql = "INSERT INTO equ_equipamentos (emp_id, usu_id, emp_data, usu_id_tecnico) " +
            " VALUES (?emp_id, ?usu_id, ?emp_data, ?usu_tec) ";
         objConexao = Mapped.Connection();
         objCommand = Mapped.Command(sql, objConexao);
         objCommand.Parameters.Add(Mapped.Parameter("?emp_id", emp.Equipamento.Id));
         objCommand.Parameters.Add(Mapped.Parameter("?usu_id", emp.Usuario.Id));
         objCommand.Parameters.Add(Mapped.Parameter("?emp_data", emp.Data));
        objCommand.Parameters.Add(Mapped.Parameter("?usu_tec", emp.Tecnico.Id));


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
