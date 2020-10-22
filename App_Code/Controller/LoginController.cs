using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using MySql.Data.MySqlClient;
/// <summary>
/// Descrição resumida de Class1
/// </summary>
public class LoginController
{
    public void insert(Login login)
    {
        /*IDbConnection objConexao;
        IDbCommand objCommand;
        string sql = "INSERT INTO log_login(log_email, MD5(log_senha), log_ip, log_date) " +
            "VALUES (?email, ?senha, ?ip, ?date)";
        objConexao = objConexao.Connection();
        objCommand = Command(sql, objConexao);
        objCommand.Parameters.Add(Mapped.Parameter("?email", login.Email));
        objCommand.Parameters.Add(Mapped.Parameter("?senha", login.Senha));
        objCommand.Parameters.Add(Mapped.Parameter("?ip", login.Ip));
        objCommand.Parameters.Add(Mapped.Parameter("?date", login.Date));
        objCommand.ExecuteNonQuery();
        objConexao.Close();
        objCommand.Dispose();
        objConexao.Dispose();*/
    }
}