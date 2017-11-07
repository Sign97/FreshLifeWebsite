using System.Configuration;//引用此命名空间才能访问App.Config配置文件
using System.Data;
using System.Data.SqlClient;

namespace 新鲜生活DAL
{
    class SqlDBHelper
    {
        /// <summary>
        /// 数据连接字符串（从App.Config配置文件中取出，方便程序发布后修改)
        /// </summary>
        private static string strCon = ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString;

        /// <summary>
        /// 执行查询SQL语句，返回查询结果(可以传递Sql参数：解决SQL注入式攻击）
        /// </summary>
        /// <param name="strSql">Sql语句</param>
        /// <param name="sqlParams">Sql参数（可选）</param>
        /// <returns>DataTable格式的查询结果</returns>
        public static DataTable GetDataTable(string strSql, params SqlParameter[] sqlParams)
        {
            //定义方法要返回的变量
            DataTable dt = new DataTable();

            //在方法内部实例化数据库连接对象（不允许定义为全局的静态变量：解决并发报错问题）
            SqlConnection con = new SqlConnection(strCon);
            con.Open();//打开连接对象
            //实例化命令对象
            SqlCommand cmd = new SqlCommand(strSql,con);
            //循环添加sql参数
            foreach (SqlParameter param in sqlParams)
            {
                cmd.Parameters.Add(param);
            }
            //实例化sql适配器
            SqlDataAdapter adp = new SqlDataAdapter(cmd);

            adp.Fill(dt);  //将数据填充到datatable
                     
            con.Close();//关闭连接

            return dt;//返回datatable对象
        }

        /// <summary>
        /// 执行增删改SQL语句(可以传递Sql参数：解决SQL注入式攻击）
        /// </summary>
        /// <param name="strSql">Sql语句</param>
        /// <param name="sqlParams">Sql参数（可选）</param>
        /// <returns>操作是否成功</returns>
        public static bool ExecuteNonQuery(string strSql, params SqlParameter[] sqlParams)
        {
            //在方法内部实例化数据库连接对象（不允许定义为全局的静态变量：解决并发报错问题）
            SqlConnection con = new SqlConnection(strCon);
            con.Open();//打开连接
            //实例化命令对象
            SqlCommand cmd = new SqlCommand(strSql, con);
            //循环添加传递的sql参数
            foreach (SqlParameter param in sqlParams)
            {
                cmd.Parameters.Add(param);
            }
            //执行命令
            int result =cmd.ExecuteNonQuery();
            con.Close();//关闭连接对象
            return result > 0;//返回是否执行成功
        }
    }
}
