package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.Set;

import util.DBHelper;
import util.Constants;

import entity.Product;

public class ProductDao {
	
	// 根据id查找商品
	public Product findProductById(String id)
	{		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			
			StringBuilder sql = new StringBuilder("select * from product where product_id=?");		
			stmt = conn.prepareStatement(sql.toString());
			stmt.setInt(1, Integer.parseInt(id));
			rs = stmt.executeQuery();
			if (rs.next()) {
				Product product = new Product();
					
				product.setProduct_id(rs.getInt("product_id"));
				product.setProduct_name(rs.getString("product_name"));
				product.setProduct_price(rs.getFloat("product_price"));
				product.setProduct_color(rs.getString("product_color"));
				product.setProduct_size(rs.getString("product_size"));
				product.setProduct_type(rs.getString("product_type"));
				product.setProduct_level(rs.getString("product_level"));
				product.setProduct_sale_count(rs.getInt("product_sale_count"));
				product.setProduct_image(rs.getString("product_image"));
				product.setProduct_introdution(rs.getString("produxt_introdution"));
				product.setProduct_infomation(rs.getString("product_infomation"));
				product.setProduct_is_sale(rs.getBoolean("product_is_sale"));
				product.setProduct_show_date(rs.getDate("product_show_date"));
				
				return product;
			}
			else
			{
				return null;
			}

		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} finally {
			// 释放数据集对象
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			// 释放语句对象
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}

		}
	}
	
	// 查找商品
	public List<Product> findProduct(Properties pro) {
		List<Product> products = new ArrayList<Product>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			
			StringBuilder sql = new StringBuilder("select * from product ");
			if (pro != null && pro.size() > 0) {
				sql.append(" where ");
				Set keys = pro.keySet();
				for (Object key : keys)
				{
					//if (key.equals("product_name")) // 模糊搜索				
						sql.append(key + " like '%" + pro.getProperty((String) key) + "%' and ");
					//else
					//	sql.append(key + "='" + pro.getProperty((String) key) + "' and ");
				}
				sql.delete(sql.length() - 5, sql.length());
			}
			System.out.println("sql==>" + sql);
			
			stmt = conn.prepareStatement(sql.toString());
			rs = stmt.executeQuery();
			while (rs.next()) {
				Product product = new Product();
					
				product.setProduct_id(rs.getInt("product_id"));
				product.setProduct_name(rs.getString("product_name"));
				product.setProduct_price(rs.getFloat("product_price"));
				product.setProduct_color(rs.getString("product_color"));
				product.setProduct_size(rs.getString("product_size"));
				product.setProduct_type(rs.getString("product_type"));
				product.setProduct_level(rs.getString("product_level"));
				product.setProduct_sale_count(rs.getInt("product_sale_count"));
				product.setProduct_image(rs.getString("product_image"));
				product.setProduct_introdution(rs.getString("produxt_introdution"));
				product.setProduct_infomation(rs.getString("product_infomation"));
				product.setProduct_is_sale(rs.getBoolean("product_is_sale"));
				product.setProduct_show_date(rs.getDate("product_show_date"));
				
				products.add(product);		
			}

		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} finally {
			// 释放数据集对象
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			// 释放语句对象
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}

		}
		
		return products;
	}
	
	// 增加、修改商品
	public void saveProduct(Product product, short sht)
	{
		Connection conn = null;
		PreparedStatement stmt = null;
		if(sht == Constants.ADD_ADMIN)
		{
			try {				
				conn = DBHelper.getConnection();
				String sql = "insert into product (product_name,product_price,product_color,product_size,product_type,product_level,product_sale_count,product_image,produxt_introdution, product_infomation, product_is_sale, product_show_date) values (?,?,?,?,?,?,?,?,?,?,?,?)";
				stmt = conn.prepareStatement(sql);
				
				stmt.setString(1, product.getProduct_name());
				stmt.setFloat(2, product.getProduct_price());
				stmt.setString(3, product.getProduct_color());
				stmt.setString(4, product.getProduct_size());
				stmt.setString(5, product.getProduct_type());
				stmt.setString(6, product.getProduct_level());
				stmt.setInt(7, product.getProduct_sale_count());
				stmt.setString(8, product.getProduct_image());
				stmt.setString(9, product.getProduct_introdution());
				stmt.setString(10, product.getProduct_infomation());
				stmt.setBoolean(11, product.isProduct_is_sale());
				stmt.setDate(12, product.getProduct_show_date());	
				stmt.executeUpdate();
				System.out.println("成功添加商品");
			}catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				// 释放语句对象
				if (stmt != null) {
					try {
						stmt.close();
						stmt = null;
					} catch (Exception ex) {
						ex.printStackTrace();
					}
				}
			}
		}
		
		if(sht==Constants.CHANGE_ADMIN)
		{
			Connection conn2 = null;
			PreparedStatement stmt2 = null;
		
			try {				
				conn2 = DBHelper.getConnection();
				String sql = "update product set product_name=?,product_price=?,product_color=?,product_size=?,product_type=?,product_level=?,product_sale_count=?,product_image=?,produxt_introdution=?,product_infomation=?,product_is_sale=?,product_show_date=? where product_id=?";
				stmt2 = conn2.prepareStatement(sql);
				
				stmt2.setString(1, product.getProduct_name());
				stmt2.setFloat(2, product.getProduct_price());
				stmt2.setString(3, product.getProduct_color());
				stmt2.setString(4, product.getProduct_size());
				stmt2.setString(5, product.getProduct_type());
				stmt2.setString(6, product.getProduct_level());
				stmt2.setInt(7, product.getProduct_sale_count());
				stmt2.setString(8, product.getProduct_image());
				stmt2.setString(9, product.getProduct_introdution());
				stmt2.setString(10, product.getProduct_infomation());
				stmt2.setBoolean(11, product.isProduct_is_sale());
				stmt2.setDate(12, product.getProduct_show_date());
				stmt2.setInt(13, product.getProduct_id());
				
				stmt2.executeUpdate();
			}catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				// 释放语句对象
				if (stmt != null) {
					try {
						stmt.close();
						stmt = null;
					} catch (Exception ex) {
						ex.printStackTrace();
					}
				}
			}
		}
	}
	
	// 删除商品
	public Boolean deleteProductById(int[] ids)
	{
		Connection conn = null;
		PreparedStatement stmt = null;
		int[] result = null;
		
		try {
			conn = DBHelper.getConnection();
			String sql = "delete from product where product_id=?"; // SQL语句
			stmt = conn.prepareStatement(sql);

			for (int id : ids) {
				stmt.setInt(1, id);
				stmt.addBatch();
			}
			result = stmt.executeBatch();
			
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} finally {
			// 释放语句对象
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}

		if (result.length == ids.length)
			return true;
		else
			return false;
	}
	//上架商品
		public Boolean upProductById(int[] ids)
		{
			Connection conn = null;
			PreparedStatement stmt = null;
			int[] result = null;
			
			try {
				conn = DBHelper.getConnection();
				String sql = "update  product set product_is_sale=1 where product_id=?"; // SQL语句
				stmt = conn.prepareStatement(sql);

				for (int id : ids) {
					stmt.setInt(1, id);
					stmt.addBatch();
				}
				result = stmt.executeBatch();
				
			} catch (Exception ex) {
				ex.printStackTrace();
				return null;
			} finally {
				// 释放语句对象
				if (stmt != null) {
					try {
						stmt.close();
						stmt = null;
					} catch (Exception ex) {
						ex.printStackTrace();
					}
				}
			}

			if (result.length == ids.length)
				return true;
			else
				return false;
		}
	// 获取所有商品
	public List<Product> findAllProduct()
	{
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<Product> list = new ArrayList<Product>(); // 商品集合
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from product;"; // SQL语句
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				
				product.setProduct_id(rs.getInt("product_id"));
				product.setProduct_name(rs.getString("product_name"));
				product.setProduct_price(rs.getFloat("product_price"));
				product.setProduct_color(rs.getString("product_color"));
				product.setProduct_size(rs.getString("product_size"));
				product.setProduct_type(rs.getString("product_type"));
				product.setProduct_level(rs.getString("product_level"));
				product.setProduct_sale_count(rs.getInt("product_sale_count"));
				product.setProduct_image(rs.getString("product_image"));
				product.setProduct_introdution(rs.getString("produxt_introdution"));
				product.setProduct_infomation(rs.getString("product_infomation"));
				product.setProduct_is_sale(rs.getBoolean("product_is_sale"));
				product.setProduct_show_date(rs.getDate("product_show_date"));

				list.add(product);// 把一个商品加入集合
			}
			return list; // 返回集合。
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} finally {
			// 释放数据集对象
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			// 释放语句对象
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}

	}
	
	
//	 测试用main方法
//	public static void main(String[] args) {
//		ProductDao pd = new ProductDao();
//		List<Product> p = new ArrayList<Product>();
//		
//		Properties pro = new Properties();
//		pro.setProperty("product_name", "雅马哈");
//		pro.setProperty("product_color", "原木色");
//		p = pd.findProduct(pro);
//		//pd.saveProduct(test, Constants.CHANGE_PRODUCT);
//		
////		int [] ids = {5};
////		pd.deleteProductById(ids);
////		
////		p = pd.findAllProduct();
//		for (Product obj : p)
//		{
//			System.out.println(obj);
//		}
//		
//		Product pId = pd.findProductById("3");
//		System.out.println("PId test:" + pId);
//		
//	}

}
