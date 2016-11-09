package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.Set;
import util.DBHelper;
import entity.SaleBefore;

public class SaleBeforeDao {

	// 查找所有售前服务申请
	public List<SaleBefore> findSaleBefore() {
		List<SaleBefore> salebefores = new ArrayList<SaleBefore>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from salebefore ";
			stmt = conn.prepareStatement(sql.toString());
			rs = stmt.executeQuery();
			while (rs.next()) {
				SaleBefore salebefore = new SaleBefore();
				salebefore.setSalebefore_id(rs.getInt("salebefore_id"));
				salebefore.setUser_id(rs.getInt("user_id"));
				salebefore.setProduct_id(rs.getInt("product_id"));
				salebefore.setService_before(rs.getString("service_before"));
				salebefore.setSalebefore_is_handle(rs.getBoolean("salebefore_is_handle"));
				

				salebefores.add(salebefore);
			}
			return salebefores;

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

	// 通过用户id查找售前服务信息
	public SaleBefore getSaleBeforeByUserid(int user_id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from salebefore where user_id=?"; // SQL语句
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, user_id);
			rs = stmt.executeQuery();
			if (rs.next()) {
				SaleBefore salebefore = new SaleBefore();
				salebefore.setSalebefore_id(rs.getInt("salebefore_id"));
				salebefore.setUser_id(rs.getInt("user_id"));
				salebefore.setProduct_id(rs.getInt("product_id"));
				salebefore.setService_before(rs.getString("service_before"));
				salebefore.setSalebefore_is_handle(rs.getBoolean("salebefore_is_handle"));
				return salebefore;
			} else {
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

	// 通过商品id查找售前服务信息
	public SaleBefore getSaleBeforeByProductid(int product_id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from salebefore where product_id=?"; // SQL语句
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, product_id);
			rs = stmt.executeQuery();
			if (rs.next()) {
				SaleBefore salebefore = new SaleBefore();
				salebefore.setSalebefore_id(rs.getInt("salebefore_id"));
				salebefore.setUser_id(rs.getInt("user_id"));
				salebefore.setProduct_id(rs.getInt("product_id"));
				salebefore.setService_before(rs.getString("service_before"));
				salebefore.setSalebefore_is_handle(rs.getBoolean("salebefore_is_handle"));
				return salebefore;
			} else {
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

	// 通过售前服务内容查找售前服务信息
	public List<SaleBefore> getSaleBeforeByService(String select) {
		List<SaleBefore> salebefores = new ArrayList<SaleBefore>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();

			StringBuilder sql = new StringBuilder("select * from salebefore ");
			/*if (pro != null && pro.size() > 0) {
				sql.append(" where ");
				Set keys = pro.keySet();
				for (Object key : keys) {
					if (key.equals("service_before")) // 模糊搜索
						sql.append(key + " like '%"
								+ pro.getProperty((String) key) + "%' and ");
					else
						sql.append(key + "='" + pro.getProperty((String) key)
								+ "' and ");
				}
				sql.delete(sql.length() - 5, sql.length());
			}*/
			sql.append(" where service_before like '%");
			sql.append(select);
			sql.append("%'" );
			System.out.println("sql==>" + sql);
			stmt = conn.prepareStatement(sql.toString());
			rs = stmt.executeQuery();
			while (rs.next()) {
				SaleBefore salebefore = new SaleBefore();
				salebefore.setSalebefore_id(rs.getInt("salebefore_id"));
				salebefore.setUser_id(rs.getInt("user_id"));
				salebefore.setProduct_id(rs.getInt("product_id"));
				salebefore.setService_before(rs.getString("service_before"));
				salebefore.setSalebefore_is_handle(rs.getBoolean("salebefore_is_handle"));
				salebefores.add(salebefore);
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

		return salebefores;
	}

	// 删除售前服务信息
	public Boolean deleteSaleBefore(int salebefore_id) {
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			try {
				conn = DBHelper.getConnection();
				String sql = "delete from salebefore where salebefore_id=?"; // SQL语句
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, salebefore_id);
				stmt.execute();
				//stmt.executeUpdate();
				
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
	
		return true;
		}
	
	/*public static void main(String[] args) {

		SaleBeforeDao pp = new SaleBeforeDao();
		List<SaleBefore> p = new ArrayList<SaleBefore>();
		p = pp.findSaleBefore();
		for (SaleBefore obj : p) {
			System.out.println(obj.getService_before());
		}

		SaleBeforeDao pl = new SaleBeforeDao();
		SaleBefore l = new SaleBefore();
		l = pl.getSaleBeforeByUserid(1);
		System.out.println(l.getService_before());

		SaleBeforeDao pd = new SaleBeforeDao();
		SaleBefore d = new SaleBefore();
		d = pd.getSaleBeforeByProductid(1);
		System.out.println(d.getService_before());
		
		
		SaleBeforeDao pg = new SaleBeforeDao();
		List<SaleBefore> p = new ArrayList<SaleBefore>();
		Properties pro = new Properties();
		pro.setProperty("service_before", "retu");
		p = pg.getSaleBeforeByService(pro);
		for (SaleBefore obj : p) {
			System.out.println(obj.getService_before());
		}
		
	}*/
}
