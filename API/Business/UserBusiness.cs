using System;

namespace API.Business
{
    public class UserBussiness
    {
        public static User getUserPriorizationGroup(User user)
        {
            try
            {
                int idade = getAge(user.datadenascimento);
                if (idade >= 80 || healthArea(user.profissao))
                    user.prioridade = 1;
                else if (idade >= 70)
                    user.prioridade = 2;
                else if (idade >= 50)
                    user.prioridade = 3;
                else if (idade >= 40)
                    user.prioridade = 4;
                else if (idade >= 20)
                    user.prioridade = 5;
                else
                    user.prioridade = 6;
                return user;

            }
            catch (Exception e)
            {
                Console.Error.WriteLine(e);
                return null;
            }

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