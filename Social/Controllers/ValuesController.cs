using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Formatting;
using System.Net.Http.Headers;
using System.Web.Http;

namespace Social.Controllers
{
    public class ValuesController : ApiController
    {
        public int ID { get; set; }
        public string Name { get; set; }

        // GET api/values
        public IHttpActionResult Get()
        {
            List<ValuesController> objValues = new List<ValuesController>();
            objValues.Add(new ValuesController { ID=1, Name="Test 1" });
            objValues.Add(new ValuesController { ID = 2, Name = "Test 2" });
            
            return Content(HttpStatusCode.OK, objValues, new JsonMediaTypeFormatter(), new MediaTypeHeaderValue("application/json"));
        }

        // GET api/values/5
        public string Get(int id)
        {
            return "value";
        }

        // POST api/values
        public void Post([FromBody]string value)
        {
        }

        // PUT api/values/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/values/5
        public void Delete(int id)
        {
        }
    }
}
