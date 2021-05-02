using System;

namespace API.Business
{
    public class UserBussiness
    {
        public static User getUserPriorizationGroup(User user)
        {
            int idade = getAge(user.datadenascimento);
            if (idade >= 80 || healthArea(user.profissao))
            {
                user.prioridade = "Grupo 1";
            }
            else if (idade >= 70)
            {
                user.prioridade = "Grupo 2";
            }
            else if (idade >= 50)
            {
                user.prioridade = "Grupo 3";
            }
            else if (idade >= 40)
            {
                user.prioridade = "Grupo 4";
            }
            else if (idade >= 20)
            {
                user.prioridade = "Grupo 5";
            }
            else
            {
                user.prioridade = "Grupo 6";
            }
            return user;
        }
        private static int getAge(DateTime datadenascimento)
        {
            int idade = DateTime.Now.Year - datadenascimento.Year;
            if (DateTime.Now.DayOfYear < datadenascimento.DayOfYear)
            {
                idade--;
            }
            return idade;
        }
        private static bool healthArea(string profissao)
        {
            bool healthArea = false;
            if (profissao == "Médico" || profissao == "Médica" || profissao == "Enfermeiro" || profissao == "Enfermeira")
            {
                healthArea = true;
            }
            return healthArea;
        }
    }

}