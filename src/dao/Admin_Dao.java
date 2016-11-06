package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import util.DBHelper;

import entity.Admin;

public class Admin_Dao {
	public static List<Admin>  depts;
	public List<Admin> findDepts() throws SQLException {
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
	
	
}
