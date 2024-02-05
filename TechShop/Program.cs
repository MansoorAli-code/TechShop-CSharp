
using TechShop.Service;

namespace TechShop
{
    internal class Program
    {
        static void Main(string[] args)
        {
            IInventoryService inventoryService = new InventoryService();
            //inventoryService.GetProduct(1);
            //inventoryService.AddToInventory(1, 10);
            //inventoryService.GetQuantityInStock(1);
            //inventoryService.RemoveFromInventory(1, 10);
            //inventoryService.GetQuantityInStock(1);
            //inventoryService.ListAllProducts();
            //inventoryService.UpdateStockQuantity(1, 5);
            //inventoryService.IsProductAvailable(1, 1);
            IProductService productService = new ProductService();
            productService.IsProductInStock(1);
        }

        
    }
    
}
