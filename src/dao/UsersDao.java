package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import java.util.Set;

import util.DBHelper;
import entity.Users;

public class UsersDao {
	//通过用户账号查找用户信息
	public Users getUserById(String id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from user where user_id=?"; // SQL语句
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			if (rs.next()) {
				Users user = new Users();
				user.setUserId(rs.getInt("user_id"));
				user.setUserAccount(rs.getString("user_account"));
				user.setUserPassword(rs.getString("user_password"));
				user.setUserName(rs.getString("user_name"));
				user.setUserImage(rs.getString("user_image"));
				user.setUserPhone(rs.getString("user_phone"));
				user.setUserEmail(rs.getString("user_email"));
				user.setUserAddress("user_address");
				user.setUserPoint(rs.getInt("user_point"));
				user.setUserVip(rs.getBoolean("user_vip"));
				return user;
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
	//通过用户账号查找用户信息
		public Users getItemsByUsersAccount(String user_account) {
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			try {
				conn = DBHelper.getConnection();
				String sql = "select * from user where user_account=?"; // SQL语句
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, user_account);
				rs = stmt.executeQuery();
				if (rs.next()) {
					Users user = new Users();
					user.setUserId(rs.getInt("user_id"));
					user.setUserAccount(rs.getString("user_account"));
					user.setUserPassword(rs.getString("user_password"));
					user.setUserName(rs.getString("user_name"));
					user.setUserImage(rs.getString("user_image"));
					user.setUserPhone(rs.getString("user_phone"));
					user.setUserEmail(rs.getString("user_email"));
					user.setUserAddress(rs.getString("user_address"));
					user.setUserPoint(rs.getInt("user_point"));
					user.setUserVip(rs.getBoolean("user_vip"));
					return user;
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
		//添加用户
		public void addUser(Users user){
				PreparedStatement stmt = null;
				Connection conn = null;
				String sql = "insert into user(user_account,user_password,user_name,user_image,user_phone,user_email,user_address,user_point,user_vip) values(?,?,?,?,?,?,?,?,?)";
				try {
					conn = DBHelper.getConnection();
					stmt = conn.prepareStatement(sql);
					stmt.setString(1, user.getUserAccount());
					stmt.setString(2, user.getUserPassword());
					stmt.setString(3, user.getUserName());
					stmt.setString(4, user.getUserImage());
					stmt.setString(5, user.getUserPhone());
					stmt.setString(6, user.getUserEmail());
					stmt.setString(7, user.getUserAddress());
					stmt.setInt(8, user.getUserPoint());
					stmt.setBoolean(9, user.isUserVip());
					stmt.executeUpdate();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally{
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
		//修改用户信息
		public void updateUser(Properties pro,Properties pros){
			// TODO Auto-generated method stub
			StringBuilder sql = new StringBuilder("update user set ");
			Statement stmt = null;
			Connection con = null;
			if (pros.size() > 0) {

				Set keys = pros.keySet();
				for (Object key : keys) {
					sql.append(key + "='" + pros.getProperty((String) key) + "',");
				}

				sql.setCharAt(sql.lastIndexOf(","), ' ');

				sql.append(" where ");
				Set keys1 = pro.keySet();
				for (Object key : keys1) {
					sql.append(key + "='" + pro.getProperty((String) key)
							+ "' and ");
				}
				sql.delete(sql.lastIndexOf("and"), sql.length() - 1);
			}
			try {
				con = DBHelper.getConnection();
				stmt = con.createStatement();
				stmt.executeUpdate(sql.toString());
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
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
