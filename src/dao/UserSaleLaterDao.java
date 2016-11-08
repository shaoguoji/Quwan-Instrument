package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import util.DBHelper;
import util.Constants;
import entity.SaleLater;


public class UserSaleLaterDao {

	public static void main(String[] args) {
		UserSaleLaterDao dao = new UserSaleLaterDao();
		int serverType = Constants.BACK_MONEY;
		// dao.BackServer(sale);
	}

	// 退货退款服务
	public Boolean BackServer(SaleLater sale, int serverType) {
		PreparedStatement stmt = null;
		Connection conn = null;
		String server_type;
		String sql = " insert into salelater (user_id,product_id,deal_id,service_type,service_later,salelater_is_handle)values(?,?,?,?,?,?)";
		try {
			conn = DBHelper.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, sale.getUser_id());
			stmt.setInt(2, sale.getProduct_id());
			stmt.setInt(3, sale.getDeal());
			if (serverType == Constants.BACK_MONEY)
				server_type = "return";
			else
				server_type = "exchange";
			stmt.setString(4, server_type);
			stmt.setString(5, sale.getServive_later());
			stmt.setBoolean(5, sale.isSalelater_is_handle());
			stmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
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
