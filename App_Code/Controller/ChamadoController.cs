using falconDex.Models;
using FATEC;
using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Http;

/// <summary>
/// Descrição resumida de ChamadoController
/// </summary>
/// 

namespace falconDex.Controller
{
    public class ChamadoController : ApiController
    {
        public DataSet SelectAll()
        {
            DataSet ds = new DataSet();
            IDbConnection objConexao;
            IDbCommand objCommand;
            IDataAdapter objDataAdapter;
            objConexao = Mapped.Connection();
            objCommand = Mapped.Command("SELECT * FROM cha_chamado", objConexao);
            objDataAdapter = Mapped.Adapter(objCommand);
            objDataAdapter.Fill(ds);
            objConexao.Close();
            objCommand.Dispose();
            objConexao.Dispose();
            return ds;
        }

        public Chamado Select(int id)
        {
            Chamado Chamado = null;
            System.Data.IDbConnection objConexao;
            System.Data.IDbCommand objCommand;
            System.Data.IDataReader objDataReader;
            objConexao = Mapped.Connection();
            objCommand = Mapped.Command(
                "SELECT * FROM CHA_CHAMADO WHERE CHA_ID = ?id", objConexao);

            objCommand.Parameters.Add(Mapped.Parameter("?id", id));
            objDataReader = objCommand.ExecuteReader();
            while (objDataReader.Read())
            {
                Chamado = new Chamado();
                Chamado.Nome = Convert.ToString(objDataReader["cha_nome"]);
                Chamado.Descricao = Convert.ToString(objDataReader["cha_descricao"]);
                Chamado.abridor.Id = Convert.ToInt32(objDataReader["usu_id"]);
                Chamado.equipamento.ID = Convert.ToInt32(objDataReader["equ_id"]);
                Chamado.Local.Id = Convert.ToInt32(objDataReader["loc_id"]);
                Chamado.Responsavel.Id = Convert.ToInt32(objDataReader["usu_resp"]);
                Chamado.prioridade.Id = Convert.ToInt32(objDataReader["pri_id"]);
                Chamado.Data = Convert.ToDateTime(objDataReader["cha_criacao"]);
                Chamado.status.Id = Convert.ToInt32(objDataReader["cha_status"]);
                Chamado.Feed = Convert.ToInt32(objDataReader["cha_feed"] == null ? 0 : objDataReader["cha_feed"]);

            }
            objDataReader.Close();
            objConexao.Close();
            objCommand.Dispose();
            objConexao.Dispose();
            objDataReader.Dispose();
            return Chamado;
        }

        public HttpStatusCode Insert(Chamado chamado)
        {
            IDbConnection objConexao;
            IDbCommand objCommand;
            string sql = "INSERT INTO cha_chamado" +
                "(cha_name, cha_descricao, usu_id, equ_id, loc_id, usu_resp, pri_id, cha_criacao) " +
                "VALUES (?name, ?descricao, ?abridor, ?equipamento, ?local, ?responsavel, ?prioridade, ?criacao)";
            objConexao = Mapped.Connection();
            objCommand = Mapped.Command(sql, objConexao);
            objCommand.Parameters.Add(Mapped.Parameter("?name", chamado.Nome));
            objCommand.Parameters.Add(Mapped.Parameter("?descricao", chamado.Descricao));
            objCommand.Parameters.Add(Mapped.Parameter("?abridor", "1"));
            objCommand.Parameters.Add(Mapped.Parameter("?equipamento", chamado.equipamento.ID));
            objCommand.Parameters.Add(Mapped.Parameter("?local", chamado.Local.Id));
            objCommand.Parameters.Add(Mapped.Parameter("?responsavel", chamado.Responsavel.Id));
            objCommand.Parameters.Add(Mapped.Parameter("?prioridade", chamado.prioridade.Id));
            objCommand.Parameters.Add(Mapped.Parameter("?criacao", chamado.Data));

            int i = objCommand.ExecuteNonQuery();
            objConexao.Close();

            objCommand.Dispose();
            objConexao.Dispose();

            return i > 0 ? HttpStatusCode.OK : HttpStatusCode.InternalServerError;
        }
    }
}