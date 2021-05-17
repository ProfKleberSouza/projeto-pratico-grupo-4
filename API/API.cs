using System;
using System.IO;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using API.Business;

namespace API
{
    public class Prioridade
    {
        public int prioridade { get; set; }
    }
    public static class API
    {
        [FunctionName("User")]
        public static async Task<IActionResult> Run(
            [HttpTrigger(AuthorizationLevel.Anonymous, "post", "get", Route = null)] HttpRequest req,
            ILogger log)
        {
            log.LogInformation("C# HTTP trigger function processed a request.");
            User user = new User();
            user.profissao = req.Query["profissao"];
            string dateString = req.Query["datadenascimento"];
            user.datadenascimento = DateTime.ParseExact(dateString, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);
            UserBussiness.getUserPriorizationGroup(user);
            Prioridade data = new Prioridade {
                prioridade = user.prioridade
            };
            return new OkObjectResult(data);
        }
    }
}
