using knowledgeBase.DataContract;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace knowledgeBase.Controllers
{
    public class KnowledgeBaseController : ApiController
    {
        // GET api/<controller>
        public IEnumerable<KnowledgeTypeContract> Get()
        {
            using (Model1Container db = new Model1Container())
            {
                return db.KnowledgeTypes.Select(k => new KnowledgeTypeContract(k)).ToList();
            }
        }

        // GET api/<controller>/5
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<controller>
        public void Post([FromBody] string value)
        {
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
}