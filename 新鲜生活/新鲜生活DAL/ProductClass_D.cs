using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace 新鲜生活DAL
{
    public class ProductClass_D
    {

        public DataTable Select()
        {
            string sql = @"select *,(Case parentClassID 
                           when 0 then classID
                           else parentClassID end)orderID from ProductClass
                           order by orderID,classId";
            return SqlDBHelper.GetDataTable(sql);
        }

        public DataTable SelectClass()
        {
            string sql = @"select classid,(
                           case parentClassID when 0 then className else '>>'+className end
                           )className,parentClassID,
                           (Case parentClassID 
                           when 0 then classID
                           else parentClassID end)orderID from ProductClass
                           order by orderID,classId";
            return SqlDBHelper.GetDataTable(sql);
        }

        public bool Add(string productName, string productPic, float productPrice, string productDesc, int classID, DateTime addTime, int isStop)
        {
            string sql = "INSERT INTO Product(productName,productPic,productPrice,productDesc,classID,addTime,isStop)VALUES('" + productName + "','" + productPic + "'," + productPrice + ",'" + productDesc + "'," + classID + ",'" + addTime + "'," + isStop + ")";
            return SqlDBHelper.ExecuteNonQuery(sql);
        }

        public DataTable SelectProductClass()
        {
            string sql = "select productID,productName,productPrice,c.className,addTime,isStop,productPic from Product p,ProductClass c where p.classID=c.classID";
            return SqlDBHelper.GetDataTable(sql);
        }
        public int SelectRowsCount()
        {
            string sql = "select 1 from Product";
            return SqlDBHelper.GetDataTable(sql).Rows.Count;
        }

        public DataTable SelProduct(int pageSize, int currentPage)
        {
            string strSql = string.Format(@"select Top {0} productID,productName,productPrice,typep.className,addTime,isStop,productPic,RowNumber from (select *,( ROW_NUMBER() over (order by productID ASC) ) RowNumber from Product ) T,ProductClass typep where T.classID=typep.classID
and RowNumber>({1}-1)*{0}", pageSize, currentPage);
            return SqlDBHelper.GetDataTable(strSql);
        }

        public bool Update(string productName, string productPic, float productPrice, string productDesc, int classID, DateTime addTime, int isStop, int productID)
        {
            string sql = "UPDATE [dbo].[Product]SET [productName] = '" + productName + "',[productPic] = '" + productPic + "',[productPrice] = " + productPrice + ",[productDesc] = '" + productDesc + "',[classID] = " + classID + ",[addTime] = '" + addTime + "',[isStop] = " + isStop + " WHERE productID=" + productID + "";
            return SqlDBHelper.ExecuteNonQuery(sql);
        }

        public DataTable SelectProductID(int productID)
        {
            string sql = "select * from Product where productID=" + productID + "";
            return SqlDBHelper.GetDataTable(sql);
        }
        public bool UpdateStop(int productID)
        {
            string sql = "UPDATE [dbo].[Product] SET[isStop] = 0 WHERE productID=" + productID + "";
            return SqlDBHelper.ExecuteNonQuery(sql);
        }
        public bool UpdateIS(int productID)
        {
            string sql = "UPDATE [dbo].[Product] SET[isStop] = 1 WHERE productID=" + productID + "";
            return SqlDBHelper.ExecuteNonQuery(sql);
        }

        public bool DeleteID(int productID)
        {
            string sql = "DELETE FROM [dbo].[Product] WHERE productID=" + productID + "";
            return SqlDBHelper.ExecuteNonQuery(sql);
        }
        public int ProductClassRowsCount()
        {
            string sql = "select 1 from ProductClass";
            return SqlDBHelper.GetDataTable(sql).Rows.Count;
        }
        public DataTable SelProductClass(int pageSize, int currentPage)
        {
            string strSql = string.Format(@"select Top {0} * from (select  *,( ROW_NUMBER() over (order by classID ASC) ) RowNumber from ProductClass) T  where  RowNumber>({1}-1)*{0}", pageSize, currentPage);
            return SqlDBHelper.GetDataTable(strSql);
        }
        public bool DeleteProductClass(int classID)
        {
            string sql = "DELETE FROM [dbo].ProductClass WHERE classID=" + classID + "";
            return SqlDBHelper.ExecuteNonQuery(sql);
        }

        public bool ProductClassAdd(string className)
        {
            string sql = "INSERT INTO [dbo].[ProductClass]([className],[parentClassID])VALUES('" + className + "',0)";
            return SqlDBHelper.ExecuteNonQuery(sql);
        }

        public bool ProductClassUpdate(string className, int classID)
        {
            string sql = "UPDATE [dbo].[ProductClass] SET [className] = '" + className + "',[parentClassID] = 0 WHERE classID=" + classID + "";
            return SqlDBHelper.ExecuteNonQuery(sql);
        }
        public DataTable SelectIDProductClass(int classID)
        {
            string sql = "select * from [ProductClass] where classID=" + classID + "";
            return SqlDBHelper.GetDataTable(sql);
        }

        public DataTable SelectFClass()
        {
            string sql = @"select Top(7) * from (select *,(Case parentClassID 
                         when 0 then classID
                         else parentClassID end)orderID from ProductClass
                         ) T where parentClassID=0";
            return SqlDBHelper.GetDataTable(sql);
        }

        public DataTable SelectZiClass(int orderClassID)
        {
            string sql = @"select * from (select *,(Case parentClassID 
                         when 0 then classID
                         else parentClassID end)orderID from ProductClass
                         ) T
                         where orderID=" + orderClassID + " and parentClassID=" + orderClassID + "";
            return SqlDBHelper.GetDataTable(sql);
        }
        public DataTable SelectProductClassID(int classID)
        {
            string sql = "select Top(10) * from Product where classID=" + classID + "";
            return SqlDBHelper.GetDataTable(sql);
        
        }

    }
}
