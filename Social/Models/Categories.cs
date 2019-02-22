using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Social.Models
{
    public class Categories
    {
        public int ID { get; set; }
        public string Name { get; set; }

        public List<Categories> GetAllCategories()
        {
            SqlConnection objSqlConnection;
            SqlCommand objSqlCommand;
            List<Categories> objCategoriesCollection;
            try
            {
                objCategoriesCollection = new List<Categories>();
                objSqlConnection = new SqlConnection();
                objSqlCommand = new SqlCommand();
                objSqlConnection.ConnectionString = ConfigurationManager.ConnectionStrings["SocialDb"].ConnectionString;
                objSqlCommand.Connection = objSqlConnection;
                objSqlCommand.CommandText = "SP_GET_CATEGORIES";
                objSqlCommand.CommandType = System.Data.CommandType.StoredProcedure;

                if (objSqlConnection.State == System.Data.ConnectionState.Closed)
                {
                    objSqlConnection.Open();
                }
                SqlDataReader objReader = objSqlCommand.ExecuteReader();
                while (objReader.Read())
                {
                    var category = new Categories();
                    category.Name = objReader["Name"].ToString();
                    category.ID = Convert.ToInt32(objReader["ID"]);
                    objCategoriesCollection.Add(category);
                }
                return objCategoriesCollection;

            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
    }
}