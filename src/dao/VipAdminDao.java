package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import util.DBHelper;
import entity.Vip_apply;

public class VipAdminDao {
	
	//同意成为会员
	public boolean VipAgree(int user_id){
	
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		conn = DBHelper.getConnection();
		try {
				conn = DBHelper.getConnection();
				String sql = "update user set user_vip = 1 where user_id=?" ; // SQL语句
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, user_id);
				//rs = stmt.executeQuery();
				stmt.executeUpdate();
				sql = "update vipapply set ishandle = 0 where user_id=?" ; // SQL语句
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, user_id);
				//rs = stmt.executeQuery();
				stmt.executeUpdate();
			} catch (Exception ex) {
				ex.printStackTrace();
				
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
	
	//会员申请拒绝
	public boolean VipRefuse(int user_id){
	
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		conn = DBHelper.getConnection();
		try {
				conn = DBHelper.getConnection();
				String sql = "update vipapply set ishandle = 0 where user_id=?" ; // SQL语句
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, user_id);
				//rs = stmt.executeQuery();
				stmt.executeUpdate();
			} catch (Exception ex) {
				ex.printStackTrace();
				
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
	
	//获取所有会员申请
	public List<Vip_apply> findAllVip_Apply(){
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<Vip_apply> list = new ArrayList<Vip_apply>(); // 会员申请集合
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from vipapply;"; // SQL语句
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Vip_apply vip_apply = new Vip_apply();
				
				vip_apply.setUser_id(rs.getInt("user_id"));
				vip_apply.setIshandle(rs.getBoolean("ishandle"));
				vip_apply.setDate(rs.getDate("date"));

				list.add(vip_apply);//把所有vip_apply加入集合
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
	
	//删除会员申请
	public boolean VipDelete(int user_id){
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			String sql = "delete from vipapply where user_id=?"; // SQL语句
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, user_id);
			rs = stmt.executeQuery();
			} catch (Exception ex) {
				ex.printStackTrace();
				
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

	/*public static void main(String[] args) {
	UserVipJudge vipjudge =new UserVipJudge();
	UsersDao usersdao =new UsersDao();
	Users users =new Users();
	users =usersdao.getItemsByUsersAccount("shaoguoji");
	vipjudge.User_pointJudge(users.getUserAccount());
	}*/
}