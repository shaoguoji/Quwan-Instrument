package dao;

import java.sql.SQLException;

import entity.Admin;



public class Adminjudge {
	
	public static boolean judge_accountpassword(String username ,String password) throws SQLException {
		
		Admin_Dao connect = new Admin_Dao();
		connect.findDepts();
		for (Admin dept : connect.findDepts()) {
			if(dept.getAdminUsername().equals(username)&&dept.getAdminPassword().equals(password)){
				return true;
			}
		}	
		return false;
	}
}	
