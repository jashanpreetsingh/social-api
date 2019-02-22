using Social.Models;
using System;
using System.Net;
using System.Net.Http.Formatting;
using System.Net.Http.Headers;
using System.Web.Http;

namespace Social.Controllers
{
    public class CategoriesController : ApiController
    {
        [HttpGet]
        public IHttpActionResult GetCategories()
        {
            try
            {
                Categories objCategories = new Categories();
                return Content(HttpStatusCode.OK, objCategories.GetAllCategories(), new JsonMediaTypeFormatter(), new MediaTypeHeaderValue("application/json"));
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
