using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de Chamado
/// </summary>
/// 
namespace falconDex.Models
{
    public class Chamado
    {
        public String Nome { get; set; }
        public String Descricao { get; set; }
        public DateTime Data { get; set; }

        public Chamado()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }
    }

}