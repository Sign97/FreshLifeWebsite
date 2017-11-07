using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using 新鲜生活DAL;
using 新鲜生活Model;
namespace 新鲜生活BLL
{
    public class Product_B
    {
        Product_D Product_D = new Product_D();
        public DataTable SelectID(int ProductID)
        {
            return Product_D.SelectID(ProductID);
        }
        public DataTable SelectAddress(int UserID)
        {
            return Product_D.SelectAddress(UserID);
        }

        public bool AddOrder(int UserID, DateTime OrderTime, float OrderMoney, string DeliverAddress)
        {
            return Product_D.AddOrder(UserID,OrderTime, OrderMoney, DeliverAddress);
        }

        public DataTable SelectOrderID(int ProductID)
        {
            return Product_D.SelectOrderID(ProductID);
        }
        /// <summary>
        /// 根据ID 查询商品
        /// </summary>
        /// <returns></returns>
        public Product setIDGoods(string id)
        {
            return new Product_D().setIDGoods(id);
        }
    }
}
