using System;

namespace TechShop.Model
{
    internal class Customer
    {
        public int CustomerID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }


        public Customer() { }

        public Customer(int customerID, string firstName, string lastName, string email, string phone, string address)
        {
            CustomerID = customerID;
            FirstName = firstName;
            LastName = lastName;
            Email = email;
            Phone = phone;
            Address = address;
        }

        public override string ToString()
        {
            return $"CustomerID:: {CustomerID}\n" +
                   $"FirstName::{FirstName}\n" +
                   $"LastName::{LastName}\n" +
                   $"Email::{Email}\n" +
                   $"Phone::{Phone}\n+" +
                   $"Address::{Address}";
        }
    }
}
