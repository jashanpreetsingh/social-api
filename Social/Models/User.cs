using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Social.Models
{
    public class User
    {
        public int ID { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Name { get; set; }


        public User ValidateLogin(User objUser)
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
                objCommand.Connection = objConnection;
                objCommand.CommandText = "SP_VALIDATE_USER";
                objCommand.CommandType = System.Data.CommandType.StoredProcedure;
                objCommand.Parameters.AddWithValue("@Username", objUser.Username);
                objCommand.Parameters.AddWithValue("@Password", objUser.Password);

                if (objConnection.State == System.Data.ConnectionState.Closed)
                {
                    objConnection.Open();
                }

                SqlDataReader objReader = objCommand.ExecuteReader();
                while(objReader.Read())
                {
                    objUserResponse.ID = Convert.ToInt32(objReader["ID"]);
                    objUserResponse.Name = objReader["Name"].ToString();
                    objUserResponse.Username = objReader["Username"].ToString();
                }
                return objUserResponse;

            }
            catch (Exception ex)
            {
                throw;
                //objConnection = null;
                //objCommand = null;
                //return objUserResponse = new User();
            }

        }

        public User RegisterUser(User objUser)
        {
            SqlConnection objConnection;
            SqlCommand objCommand;
            try
            {
                objCommand = new SqlCommand();
                objConnection = new SqlConnection();
                objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["SocialDb"].ConnectionString;
                objCommand.Connection = objConnection;
                objCommand.CommandText = "SP_CREATE_USER";
                objCommand.CommandType = System.Data.CommandType.StoredProcedure;
                objCommand.Parameters.AddWithValue("@Username", objUser.Username);
                objCommand.Parameters.AddWithValue("@Password", objUser.Password);
                objCommand.Parameters.AddWithValue("@Name", objUser.Name);
                SqlParameter objOutParam = new SqlParameter("@ID", System.Data.SqlDbType.Int);
                objOutParam.Direction = System.Data.ParameterDirection.Output;
                objCommand.Parameters.Add(objOutParam);

                if (objConnection.State == System.Data.ConnectionState.Closed)
                {
                    objConnection.Open();
                }

                objCommand.ExecuteNonQuery();
                objUser.ID = Convert.ToInt32(objOutParam.Value);
                return objUser;
            }
            catch (Exception ex)
            {

                throw;
            }
        }
    }
}