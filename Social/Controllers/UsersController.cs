using Social.Models;
using System.Collections.Generic;
using System.Net;
using System.Net.Http.Formatting;
using System.Net.Http.Headers;
using System.Web.Http;

namespace Social.Controllers
{
    public class UsersController : ApiController
    {
        [HttpPost]
        public IHttpActionResult ValidateLogin([FromBody]User objUser)
        {
            var response = objUser.ValidateLogin(objUser);
            if (response.ID != 0)
            {
                return Content(HttpStatusCode.OK, response, new JsonMediaTypeFormatter(), new MediaTypeHeaderValue("application/json"));
            }
            else
            {
                return Content(HttpStatusCode.BadRequest, "No user found", new JsonMediaTypeFormatter(), new MediaTypeHeaderValue("application/json"));
            }
        }

        public IHttpActionResult Register([FromBody]User objAddUser)
        {

            var response = objAddUser.RegisterUser(objAddUser);
            if (response.ID == 0)
            {
                return Content(HttpStatusCode.BadRequest, "Username already exit", new JsonMediaTypeFormatter(), new MediaTypeHeaderValue("application/json"));
            }
            else
            {
                return Content(HttpStatusCode.OK, objAddUser, new JsonMediaTypeFormatter(), new MediaTypeHeaderValue("application/json"));
            }
        }


    }
}