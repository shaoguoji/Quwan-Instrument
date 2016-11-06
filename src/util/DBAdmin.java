package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBAdmin {
		private static final String driver="com.mysql.jdbc.Driver";
		private static final String url="jdbc:mysql://localhost:3306/instrument?useUnicode=true&characterEncoding=UTF-8";
		private static final String username="root";
		private static final String password="123456";
		private static Connection conn=null;
		//静态代码块负责加载驱动
		static{
				try {
					Class.forName(driver);
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		//单例模式创建Connection对象
		public static Connection getConnection(){
			 if(conn==null){
					try {
						conn =DriverManager.getConnection(url, username, password);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			 }
			 return conn;
		}
//		public static void main(String[] args) {
//			try {
//				Connection conn = DBHelper.getConnection();
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//			 if(conn!=null){
//				 System.out.println("数据库连接正常");
//			 }else{
//				 System.out.println("数据库连接异常");
//			 }
//		}
}