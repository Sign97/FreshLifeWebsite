using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using 新鲜生活DAL;
namespace 新鲜生活BLL
{
   public  class ProductClass_B
    {
        ProductClass_D ProductClass_D = new ProductClass_D();
        public DataTable Select()
        {
            return ProductClass_D.Select();
        }
        public DataTable SelectClass()
        {
            return ProductClass_D.SelectClass();
        }
        public bool Add(string productName, string productPic, float productPrice, string productDesc, int classID, DateTime addTime, int isStop)
        {
            return ProductClass_D.Add(productName, productPic, productPrice, productDesc, classID, addTime, isStop);
        }

        public DataTable SelectProductClass()
        {
            return ProductClass_D.SelectProductClass();
        }
        public int SelectRowsCount()
        {
            return ProductClass_D.SelectRowsCount();
        }
        public DataTable SelProduct(int pageSize, int currentPage)
        {
            return ProductClass_D.SelProduct(pageSize, currentPage);
        }
        public bool Update(string productName, string productPic, float productPrice, string productDesc, int classID, DateTime addTime, int isStop, int productID)
        {
            return ProductClass_D.Update(productName, productPic, productPrice, productDesc, classID, addTime, isStop, productID);
        }
        public DataTable SelectProductID(int productID)
        {
            return ProductClass_D.SelectProductID(productID);
        }
        public bool UpdateStop(int productID)
        {
            return ProductClass_D.UpdateStop(productID);
        }
        public bool UpdateIS(int productID)
        {
            return ProductClass_D.UpdateIS(productID);
        }
        public bool DeleteID(int productID)
        {
            return ProductClass_D.DeleteID(productID);
        }
        public int ProductClassRowsCount()
        {
            return ProductClass_D.ProductClassRowsCount();
        }
        public DataTable SelProductClass(int pageSize, int currentPage)
        {
            return ProductClass_D.SelProductClass(pageSize, currentPage);
        }
        public bool DeleteProductClass(int classID)
        {
            return ProductClass_D.DeleteProductClass(classID);
        }
        public bool ProductClassAdd(string className)
        {
            return ProductClass_D.ProductClassAdd(className);
        }
        public bool ProductClassUpdate(string className, int classID)
        {
            return ProductClass_D.ProductClassUpdate(className, classID);
        }
        public DataTable SelectIDProductClass(int classID)
        {
            return ProductClass_D.SelectIDProductClass(classID);
        }
        public DataTable SelectFClass()
        {
            return ProductClass_D.SelectFClass();
        }
        public DataTable SelectZiClass(int orderClassID)
        {
            return ProductClass_D.SelectZiClass(orderClassID);
        }
        public DataTable SelectProductClassID(int classID)
        {
            return ProductClass_D.SelectProductClassID(classID);
        }
    }
}
