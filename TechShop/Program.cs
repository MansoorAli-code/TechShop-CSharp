
using TechShop.Model;
using TechShop.Service;

namespace TechShop
{
    internal class Program
    {
        static void Main(string[] args)
        {
            /*Task 1: Classes and Their Attributes:
            Task 2: Class Creation:
            Task 3: Encapsulation:
            Task 4: Composition:
            These four tasks have been implemented in the models folder*/
            ICustomerService customerService = new CustomerService();
            IProductService productService = new ProductService();
            IOrderService orderService = new OrderService();
            IOrderDetailService orderDetailService = new OrderDetailService();
            IInventoryService inventoryService = new InventoryService();

            /*Task 5: Exceptions handling 
            Created all the exception classes in the exception folder
            */

            /*
             Task 6: Collections 
            created lists of each class in the repository class
             */

            /*
             Task 7: Database Connectivity
            Connected to database in the utility folder
             */

            Customer customer = new Customer()
            {
                CustomerID = 6,
                FirstName = "David",
                LastName = "Lynch",
                Address = "Near Fight club",
                Email = "davidlynch@email.com",
                Phone = "7893748315"
            };
            customerService.CustomerRegistration(customer);

            
            customerService.CalculateTotalOrders(4);
            customerService.GetCustomerDetails(1);
            customerService.UpdateCustomerInfo(12, "eww@gmail.com");

            
            productService.GetProductDetails(1);
            productService.UpdateProductInfo(2);
            productService.IsProductInStock(2);

            
            orderService.CalculateTotalAmount(3);
            orderService.GetOrderDetails(1);
            orderService.UpdateOrderStatus(3, "shipped");

            
            orderDetailService.GetOrderDetailsById(2);
            orderDetailService.CalculateSubtotal(2);
            orderDetailService.UpdateQuantity(3, 45);
            orderDetailService.AddDiscount(8, 19);

            
            inventoryService.GetProduct(2);
            inventoryService.GetQuantityInStock(3);
            inventoryService.AddToInventory(3, 20);
            inventoryService.RemoveFromInventory(3, 20);
            inventoryService.UpdateStockQuantity(8, 10);
            inventoryService.IsProductAvailable(4, 2);
            inventoryService.GetInventoryValue(5);
            inventoryService.ListLowStockProducts(55);
            inventoryService.ListOutOfStockProducts();
            inventoryService.ListAllProducts();
        }

        
    }
    
}
