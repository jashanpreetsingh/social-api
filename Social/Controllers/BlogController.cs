using Social.Models;
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
    public class BlogController : ApiController
    {
        [HttpGet]
        public IHttpActionResult GetBlogs(int ID)
        {
            try
            {
                Blog objBlog = new Blog();
                return Content(HttpStatusCode.OK, objBlog.GetBlogs(ID), new JsonMediaTypeFormatter(), new MediaTypeHeaderValue("application/json"));
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public IHttpActionResult CreateBlog([FromBody]Blog objBlog)
        {
            try
            {
                var response = objBlog.Create(objBlog);
                return Content(HttpStatusCode.OK, response, new JsonMediaTypeFormatter(), new MediaTypeHeaderValue("application/json"));
            }
            catch (Exception ex)
            {
                throw;
            }
        }

    }
}
