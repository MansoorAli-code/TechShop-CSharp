using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TechShop.Model
{
    internal class Order
    {
        public int OrderID { get; set; }
        public int CustomerID { get; set; }
        public DateTime OrderDate { get; set; }
        public decimal TotalAmount { get; set; }

        public Order() { }

        public Order(int orderID, int customerID, DateTime orderDate, decimal totalAmount)
        {
            OrderID = orderID;
            CustomerID = customerID;
            OrderDate = DateTime.Now;
            TotalAmount = totalAmount;
        }

        public override string ToString()
        {
            return $"OrderID::{OrderID}\nCustomerID::{CustomerID}\nOrderDate::{OrderDate}\nTotalAmount::{TotalAmount}";
        }
    }
}
