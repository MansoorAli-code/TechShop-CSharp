using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TechShop.Model
{
    internal class OrderDetails
    {
        public int OrderDetailID { get; set; }
        public int OrderID { get; set; }
        public int ProductID { get; set; }
        public int Quantity { get; set; }
        public decimal TotalAmount { get; set; }

        public OrderDetails()
        {
            
        }

        public OrderDetails(int orderDetailID,int orderID, int productID, int quantity, decimal totalAmount)
        {
            OrderDetailID = orderDetailID;
            OrderID = orderID;
            ProductID = productID;
            Quantity = quantity;
            TotalAmount = totalAmount;  
        }

        public override string ToString()
        {
            return $"OrderDetailID::{OrderDetailID}\nOrderID::{OrderID}\nProductID::{ProductID}\nQuantity::{Quantity}\nTotalAmount::{TotalAmount}";
        }
    }
}
