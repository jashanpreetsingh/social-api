using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;

namespace Social.Models
{
    public class Test
    {
        public static void testfunction(string number)
        {
            SqlConnection objConnection;
            SqlCommand objCommand;
            User objUserResponse;
            try
            {
                objUserResponse = new User();
                objConnection = new SqlConnection();
                objCommand = new SqlCommand();
                objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["SocialDb"].ConnectionString;
                if (objConnection.State == System.Data.ConnectionState.Closed)
                {
                    objConnection.Open();
                }
                objCommand.Connection = objConnection;

                objCommand.CommandText = "SP_TEST_ENTRY";
                objCommand.Parameters.AddWithValue("@Test", number);
                objCommand.CommandType = System.Data.CommandType.StoredProcedure;

                objCommand.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw;
                //Debug.WriteLine(ex);
                //objConnection = null;
                //objCommand = null;
            }
        }
    }
}