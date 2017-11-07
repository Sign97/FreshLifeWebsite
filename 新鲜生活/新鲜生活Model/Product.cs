using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace 新鲜生活Model
{
    public class Product
    {

        private int productID;
        /// <summary>
        /// 商品ID
        /// </summary>
        public int ProductID
        {
            get { return productID; }
            set { productID = value; }
        }
        private string productName;
        /// <summary>
        /// 商品名
        /// </summary>
        public string ProductName
        {
            get { return productName; }
            set { productName = value; }
        }
        private string productPic;
        /// <summary>
        /// 图片
        /// </summary>
        public string ProductPic
        {
            get { return productPic; }
            set { productPic = value; }
        }
        private float productPrice;
        /// <summary>
        /// 价格
        /// </summary>
        public float ProductPrice
        {
            get { return productPrice; }
            set { productPrice = value; }
        }
        private string productDesc;
        /// <summary>
        /// 描述
        /// </summary>
        public string ProductDesc
        {
            get { return productDesc; }
            set { productDesc = value; }
        }
        private int classID;
        /// <summary>
        /// 分类ID
        /// </summary>
        public int ClassID
        {
            get { return classID; }
            set { classID = value; }
        }
        private DateTime addTime;
        /// <summary>
        /// 上架日期
        /// </summary>
        public DateTime AddTime
        {
            get { return addTime; }
            set { addTime = value; }
        }

        private int isStop;
        /// <summary>
        ///是否下架（1：未下架 0：已下架）
        /// </summary>
        public int IsStop
        {
            get { return isStop; }
            set { isStop = value; }
        }

        /// <summary>
        /// 商品数量
        /// </summary>
        public int proNumber { get; set; }

        /// <summary>
        /// 商品小计
        /// </summary>
        public float proPrice { get; set; }

    }
}
