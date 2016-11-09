package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import util.Constants;
import util.DBHelper;
import entity.Admin;


public class SuperAdminDao {

	// 获取所有管理员
	public List<Admin> findAllAdmin() {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<Admin> list = new ArrayList<Admin>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from admin;"; // SQL语句
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Admin admin = new Admin();
				admin.setAdminId(rs.getInt("admin_id"));
				admin.setAdminUsername(rs.getString("admin_username"));
				admin.setAdminPassword(rs.getString("admin_password"));
				admin.setAdminDep(rs.getString("admin_dep"));
				admin.setAdminLevel(rs.getInt("admin_level"));
				list.add(admin);// 把一个商品加入集合
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

	// 删除管理员
	public Boolean deleteAdminById(int admin_id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
			conn = DBHelper.getConnection();
			String sql = "delete from admin where admin_id=?"; // SQL语句
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, admin_id);
			stmt.execute();

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

	// 增加、修改管理员
	public void saveAdmin(Admin admin, short sht){
		Connection conn = null;
		PreparedStatement stmt = null;
		if(sht == Constants.ADD_ADMIN)
		{
			try {				
					conn = DBHelper.getConnection();
					String sql = "insert into admin (admin_username,admin_password,admin_dep,admin_level) values (?,?,?,?)";
					stmt = conn.prepareStatement(sql);
					
					stmt.setString(1, admin.getAdminUsername());
					stmt.setString(2, admin.getAdminPassword());
					stmt.setString(3, admin.getAdminDep());
					stmt.setInt(4, admin.getAdminLevel());
				
					
					stmt.executeUpdate();
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
	public int changeAdminDepOrLevel(String admin_dep,int admin_level,String admin_id){
			Connection conn2 = null;
			PreparedStatement stmt2 = null;
			
			try {				
					conn2 = DBHelper.getConnection();
					String sql = "update admin set  admin_dep=?,admin_level=? where admin_id=?";
					stmt2 = conn2.prepareStatement(sql);
					
					stmt2.setString(1, admin_dep);
					stmt2.setInt(2, admin_level);
					stmt2.setString(3, admin_id);
					
					int data = stmt2.executeUpdate();
					return data;
				}catch (Exception ex) {
					ex.printStackTrace();
					return 0;
				} finally {
					// 释放语句对象
					if (stmt2 != null) {
						try {
							stmt2.close();
							stmt2 = null;
						} catch (Exception ex) {
							ex.printStackTrace();
						}
					}
				}
	}
	public int changeAdminPassword(String admin_password,String admin_id){
		
			Connection conn3 = null;
			PreparedStatement stmt3 = null;
			
			
			try {				
					conn3 = DBHelper.getConnection();
					String sql = "update admin set admin_password=? where admin_id=?";
					stmt3 = conn3.prepareStatement(sql);
					
					stmt3.setString(1,admin_password);
					stmt3.setString(2,admin_id);
					
					int data = stmt3.executeUpdate();
					return data;
				}catch (Exception ex) {
					ex.printStackTrace();
					return 0;
				} finally {
					// 释放语句对象
					if (stmt3 != null) {
						try {
							stmt3.close();
							stmt3 = null;
						} catch (Exception ex) {
							ex.printStackTrace();
						}
					}
		}
	}
	
	public static void main(String[] args) {

		
		 /*SuperAdminDao superadmin =new SuperAdminDao(); 
		 List<Admin> admin =new ArrayList<Admin>(); 
		 admin =superadmin.findAllAdmin(); 
		 for (Admin obj : admin) { 
			 System.out.println(obj); 
			 }*/
		
		
		/*SuperAdminDao superadmin =new SuperAdminDao(); 
		int id [] ={6};		 
		superadmin.deleteAdminById(id);*/
		 
		
		
		
		
	}
}
