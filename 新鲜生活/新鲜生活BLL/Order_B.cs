using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using 新鲜生活DAL;
namespace 新鲜生活BLL
{
   public  class Order_B
    {
       Order_D Order_D = new Order_D();
       public bool Add(int UserID, DateTime OrderTime, float OrderMoney, string DeliverAddress)
       {
           return Order_D.Add(UserID, OrderTime, OrderMoney, DeliverAddress);
       }
       public DataTable Select()
       {
           return Order_D.Select();
       }
       public DataTable SelectUserID(int UserID)
       {
           return Order_D.SelectUserID(UserID);
       }
       public bool UpdatePay(int OrderID)
       {
           return Order_D.UpdatePay(OrderID);
       }
       public bool UpdateIsDeliver(int OrderID)
       {
           return Order_D.UpdateIsDeliver(OrderID);
       }
       public bool UpdateIsReceive(int OrderID)
       {
           return Order_D.UpdateIsReceive(OrderID);
       }

    }
}
