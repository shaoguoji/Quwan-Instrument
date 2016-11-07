package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import util.DBHelper;
import entity.SaleLater;
import entity.Users;

public class SaleLaterDao {
	
	// 查找所有售后服务申请
	public List<SaleLater> findSaleBefore() {
		List<SaleLater> salelaters = new ArrayList<SaleLater>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from salelaters";
			stmt = conn.prepareStatement(sql.toString());
			rs = stmt.executeQuery();
			while (rs.next()) {
				SaleLater salelater = new SaleLater();
				salelater.setSalelater_id(rs.getInt("salelater_id"));
				salelater.setUser_id(rs.getInt("user_id"));
				salelater.setProduct_id(rs.getInt("product_id"));
				salelater.setDeal(rs.getInt("deal"));
				salelater.setService_type(rs.getString("service_type"));
				salelater.setServive_later(rs.getString("servive_later"));
				salelater.setSalelater_is_handle(rs.getBoolean("salelater_is_handle"));
				
				salelaters.add(salelater);
			}
			return salelaters;

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

	// 删除售后服务信息
	public Boolean deleteSaleLater(int salelater_id) {
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			try {
					conn = DBHelper.getConnection();
					String sql = "delete from salelater where salelater_id=?"; // SQL语句
					stmt = conn.prepareStatement(sql);
					stmt.setInt(1, salelater_id);
					rs = stmt.executeQuery();
	

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

	//修改售后服务请求bit
	public Boolean changeSalerLaterBit(int salelater_id){
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			String sql = "update salebefore set salelater_is_handle = 1 where salelater_id=?" ;; // SQL语句
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, salelater_id);
			stmt.executeUpdate();
			
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
			return true;
	}
}

