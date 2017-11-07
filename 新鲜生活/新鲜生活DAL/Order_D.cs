using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace 新鲜生活DAL
{
   public  class Order_D
    {
        public bool Add(int UserID, DateTime OrderTime,float OrderMoney,  string DeliverAddress)
        {
            string sql = "INSERT INTO [dbo].[Order]([UserID],[OrderTime],[OrderMoney],[DeliverAddress],[IsPay],[IsDeliver],[IsReceive])VALUES(" + UserID + ",'" + OrderTime + "'," + OrderMoney + ",'" + DeliverAddress + "',0,0,0)";
            return SqlDBHelper.ExecuteNonQuery(sql);
        }
        public DataTable Select()
        {
            string sql = "select * from [Order] where IsReceive=0";
            return SqlDBHelper.GetDataTable(sql);
        }
        public DataTable SelectUserID(int UserID)
        {
            string sql = "select * from [Order] where UserID=" + UserID + "  and IsReceive=0";
            return SqlDBHelper.GetDataTable(sql);
        }
        public bool UpdatePay(int OrderID)
        {
            string sql = "UPDATE [dbo].[Order] SET [IsPay] = 1 WHERE OrderID=" + OrderID + "";
            return SqlDBHelper.ExecuteNonQuery(sql);
        }
        public bool UpdateIsDeliver(int OrderID)
        {
            string sql = "UPDATE [dbo].[Order] SET [IsDeliver] = 1 WHERE OrderID=" + OrderID + "";
            return SqlDBHelper.ExecuteNonQuery(sql);
        }

        public bool UpdateIsReceive(int OrderID)
        {
            string sql = "UPDATE [dbo].[Order] SET [IsReceive] = 1 WHERE OrderID=" + OrderID + "";
            return SqlDBHelper.ExecuteNonQuery(sql);
        }



    }
}
