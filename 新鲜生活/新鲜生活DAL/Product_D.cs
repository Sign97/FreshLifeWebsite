using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using 新鲜生活Model;

namespace 新鲜生活DAL
{
    public class Product_D
    {
        public DataTable SelectID(int ProductID)
        {
            string sql = "select * from Product where ProductID=" + ProductID + "";
            return SqlDBHelper.GetDataTable(sql);
        }

        public DataTable SelectAddress(int UserID)
        {
            string sql = "select * from UserInfo where UserID=" + UserID + "";
            return SqlDBHelper.GetDataTable(sql);
        }

        public bool AddOrder(int UserID, DateTime OrderTime, float OrderMoney, string DeliverAddress)
        {
            string sql = @"INSERT INTO [dbo].[Order]([UserID],[OrderTime],[OrderMoney],[DeliverAddress],[IsPay],[IsDeliver],[IsReceive])VALUES(" + UserID + ",'" + OrderTime + "'," + OrderMoney + ",'" + DeliverAddress + "',0,0,0)";
            return SqlDBHelper.ExecuteNonQuery(sql);
        }


        public DataTable SelectOrderID(int ProductID)
        {
            string sql = "select * from OrderItem where ProductID=" + ProductID + "";
            return SqlDBHelper.GetDataTable(sql);

        }
        /// <summary>
        /// 根据ID 查询商品
        /// </summary>
        /// <returns></returns>
        public Product setIDGoods(string id)
        {
            Product pro = new Product();
            string sqlstr = "select * from Product";
            if (id != "" && id != null)
                sqlstr += " where ProductID='" + id + "'";
            else
                return null;
            DataRow row = SqlDBHelper.GetDataTable(sqlstr).Rows[0];
            pro.ProductID = Convert.ToInt32(row["ProductID"]);
            pro.ProductName = (row["ProductName"]).ToString();
            pro.ProductPic = (row["ProductPic"]).ToString();
            pro.ProductPrice = Convert.ToSingle(row["ProductPrice"]);
            pro.ProductDesc = (row["ProductDesc"]).ToString();
            pro.ClassID = Convert.ToInt32(row["ClassID"]);
            pro.AddTime = Convert.ToDateTime(row["AddTime"]);
            pro.IsStop = Convert.ToInt32(row["isStop"]);
            return pro;
        }
    }
}
