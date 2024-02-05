using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TechShop.Service
{
    internal interface ICustomerService
    {
        void GetAllCustomers();
        void UpdateCustomerInfo(int id, string email);

        void GetCustomerDetails(int id);

        void CalculateTotalOrders(int id);
    }
}
