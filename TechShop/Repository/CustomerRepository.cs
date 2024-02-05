using System;
using System.ComponentModel.DataAnnotations;
using System.Data.SqlClient;
using TechShop.Model;
using TechShop.Utility;

namespace TechShop.Repository
{
    internal class CustomerRepository : ICustomerRepository
    {
        public string connectionString;
        SqlConnection sqlConnection = null;
        SqlCommand cmd = null;
        public CustomerRepository()
        {
            connectionString = DBConnectionUtility.GetConnectedString();
            cmd = new SqlCommand();
        }


        // 7.1 Ensure proper data validation and error handling for duplicate email addresses.
        public bool AddCustomer(Customer customer)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    cmd.CommandText = "Select count(*) from customers where email=@email";
                    cmd.Parameters.AddWithValue("@email", customer.Email);
                    cmd.Connection = conn;
                    int count = (int)cmd.ExecuteScalar();
                    if (count > 0)
                    {
                        throw new InvalidDataException("Email address already exists. Please use a different email.");
                        return false;
                    }
                    cmd.Parameters.Clear();
                    cmd.CommandText = "INSERT INTO Customers (FirstName, LastName, Email, Phone,Address) VALUES (@FirstName, @LastName, @Email, @phone, @address)";  
                    cmd.Parameters.AddWithValue("@FirstName", customer.FirstName);
                    cmd.Parameters.AddWithValue("@LastName", customer.LastName);
                    cmd.Parameters.AddWithValue("@Email", customer.Email);
                    cmd.Parameters.AddWithValue("@phone", customer.Phone);
                    cmd.Parameters.AddWithValue("@address", customer.Address);
                    int rowsEffected = cmd.ExecuteNonQuery();
                    return rowsEffected > 0;
                }
            }
            catch(SqlException se)
            {
                Console.WriteLine(se.Message);
            }
            return false;
        }

        public int CalculateTotalOrders(int id)
        {
            int count = 0;
            try
            {
                using (SqlConnection sqlConnection = new SqlConnection(connectionString))
                {
                    sqlConnection.Open();
                    cmd.CommandText = "select count(CustomerID) from orders where CustomerID = @id";
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.Connection = sqlConnection;
                    count =(int) cmd.ExecuteScalar();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return count;
        }

        public List<Customer> GetAllCustomers()
        {
            List<Customer> customerList = new List<Customer>();
            try
            {
                using (SqlConnection sqlConnection = new SqlConnection(connectionString))
                {
                    cmd.CommandText = "select * from customers";
                    cmd.Connection = sqlConnection;
                    sqlConnection.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        Customer customer = new Customer();
                        customer.CustomerID = (int)reader["CustomerID"];
                        customer.FirstName = (string)reader["FirstName"];
                        customer.LastName = (string)reader["LastName"];
                        customer.Email = (string)reader["Email"];
                        customer.Address = (string)reader["Address"];
                        customerList.Add(customer);
                    }
                    reader.Close();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return customerList;
        }

        public string GetCustomerDetails(int id)
        {
            try
            {
                
                using (SqlConnection sqlConnection = new SqlConnection(connectionString))
                {
                    sqlConnection.Open();
                    cmd.CommandText = "select * from customers where CustomerID = @id";
                    cmd.Connection = sqlConnection;
                    cmd.Parameters.AddWithValue("@id", id);
                    SqlDataReader reader = cmd.ExecuteReader();
                    while(reader.Read())
                    {
                        Customer customer = new Customer();
                        customer.CustomerID = (int)reader["CustomerID"];
                        customer.FirstName = (string)reader["FirstName"];
                        customer.LastName = (string)reader["LastName"];
                        customer.Phone = (string)reader["Phone"];
                        customer.Email = (string)reader["Email"];
                        customer.Address = (string)reader["Address"];
                        return customer.ToString();
                    }
                }
            }
            catch (Exception ex) {
                Console.WriteLine(ex.Message);
            }
            return "Customer not found";
        }

        public bool UpdateCustomerInfo(int id, string email)
        {
            try
            {
                using (SqlConnection sqlConnection = new SqlConnection(connectionString))
                {
                    sqlConnection.Open();
                    cmd.CommandText = "update customers set Email=@Email where CustomerID=@Id";
                    cmd.Connection = sqlConnection;
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@ID", id);
                    int rowsAffected = cmd.ExecuteNonQuery();
                    return rowsAffected > 0;
                }
            }
            catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
                return false;
            }
        }
    }
}
