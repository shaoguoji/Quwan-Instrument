package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import util.DBHelper;

import entity.Admin;
import entity.Users;

public class Admin_Dao {
	public static List<Admin>  depts;
	public List<Admin> findDepts() throws SQLException  {
		// TODO Auto-generated method stub
		PreparedStatement ps = null;
		Connection con = null;
		ResultSet rs = null;
		depts = new ArrayList<Admin>();
		
			con = DBHelper.getConnection();
			String sql = "select * from admin";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery(); 
			while(rs.next()){
				Admin dept = new Admin(rs.getInt("admin_id"),rs.getString("admin_username"),rs.getString("admin_password"),rs.getString("admin_dep"),rs.getInt("admin_level"));
				depts.add(dept); 
			}
		return depts;
	}
	
	public Admin getItemsByAdminUsername(String admin_username) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from admin where admin_username=?"; // SQL语句
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, admin_username);
			rs = stmt.executeQuery();
			if (rs.next()) {
				Admin dept = new Admin(rs.getInt("admin_id"),rs.getString("admin_username"),rs.getString("admin_password"),rs.getString("admin_dep"),rs.getInt("admin_level"));
				return dept;
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
	
	
}
