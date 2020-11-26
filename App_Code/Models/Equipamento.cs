using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de Equipamento
/// </summary>
/// 
namespace falconDex.Models
{
    public class Equipamento
    {
        public int Id { get; set; }
        public string Nome { get; set; }
        public string Patrimonio { get; set; }
        public int Tipo { get; set; }
        public Boolean Status { get; set; }

        public Equipamento()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }
    }
}