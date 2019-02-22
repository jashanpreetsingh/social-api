using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Social.Models
{
    public class Blog
    {
        public int ID { get; set; }
        public string Title { get; set; }
        public string Descr { get; set; }
        public int UserId { get; set; }
        public int CategoryId { get; set; }
        public bool EnableComment { get; set; }
        public DateTime CreatedDate { get; set; }

        public String CategoryName { get; set; }


        public List<Blog> Create(Blog objBlog)
        {
            SqlConnection objConnection;
            SqlCommand objCommand;
            List<Blog> objBlogCollection;
            try
            {
                objBlogCollection = new List<Blog>();
                objCommand = new SqlCommand();
                objConnection = new SqlConnection();
                objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["SocialDb"].ConnectionString;
                objCommand.Connection = objConnection;
                objCommand.CommandText = "SP_CREATE_BLOG";
                objCommand.CommandType = System.Data.CommandType.StoredProcedure;
                objCommand.Parameters.AddWithValue("@Title", objBlog.Title);
                objCommand.Parameters.AddWithValue("@Descr", objBlog.Descr);
                objCommand.Parameters.AddWithValue("@UserId", objBlog.UserId);
                objCommand.Parameters.AddWithValue("@CategoryId", objBlog.CategoryId);
                objCommand.Parameters.AddWithValue("@EnableComment", objBlog.EnableComment);

                if (objConnection.State == System.Data.ConnectionState.Closed)
                {
                    objConnection.Open();
                }

                var reader = objCommand.ExecuteReader();
                BlogReaderCollection(objBlogCollection, reader);

                return objBlogCollection;
            }
            catch (Exception ex)
            {

                throw;
            }

        }

        public List<Blog> GetBlogs(int UserId)
        {
            SqlConnection objConnection;
            SqlCommand objCommand;
            List<Blog> objBlogCollection;
            try
            {
                objBlogCollection = new List<Blog>();
                objCommand = new SqlCommand();
                objConnection = new SqlConnection();
                objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["SocialDb"].ConnectionString;
                objCommand.Connection = objConnection;
                objCommand.Parameters.AddWithValue("@UserId", UserId);
                objCommand.CommandText = "SP_GET_BLOG";
                objCommand.CommandType = System.Data.CommandType.StoredProcedure;
                if (objConnection.State == System.Data.ConnectionState.Closed)
                {
                    objConnection.Open();
                }

                var reader = objCommand.ExecuteReader();
                BlogReaderCollection(objBlogCollection, reader);

                return objBlogCollection;
            }
            catch (Exception ex)
            {

                throw;
            }

        }

        private static void BlogReaderCollection(List<Blog> objBlogCollection, SqlDataReader reader)
        {
            while (reader.Read())
            {
                var blog = new Blog();
                blog.CategoryId = Convert.ToInt32(reader["CategoryId"]);
                blog.ID = Convert.ToInt32(reader["ID"]);
                blog.Title = Convert.ToString(reader["Title"]);
                blog.Descr = Convert.ToString(reader["Descr"]);
                blog.UserId = Convert.ToInt32(reader["UserId"]);
                blog.EnableComment = Convert.ToBoolean(reader["EnableComment"]);
                blog.CreatedDate = Convert.ToDateTime(reader["CreatedDate"]);
                blog.CategoryName = Convert.ToString(reader["Name"]);
                objBlogCollection.Add(blog);
            }
        }
    }
}