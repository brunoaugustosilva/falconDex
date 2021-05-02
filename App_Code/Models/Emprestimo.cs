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
    public class Emprestimo
    {
        public int Id { get; set; }
        public string Nome { get; set; }
        public string Patrimonio { get; set; }
        public TipoEquipamento Tipo { get; set; }
        public Status Status { get; set; }
        public Local Local { get; set; }
        public Usuario Usuario { get; set; }
        public Emprestimo Date { get; set; }

        public Emprestimo()
        {
            //
            // TODO: Adicionar lógica do construtor aqui
            //
        }
    }
}