using System;

namespace API
{
    public class User
    {
        public string nome { get; set; }
        public int? cpf { get; set; }
        public string fone { get; set; }
        public int? cep { get; set; }
        public DateTime datadenascimento { get; set; }
        public string email { get; set; }
        public string endereco { get; set; }
        public string numero { get; set; }
        public string profissao { get; set; }
        public string sexo { get; set; }
        public int prioridade { get; set; }
    }
}
