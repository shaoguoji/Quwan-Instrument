package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

import util.DBHelper;
import entity.Comment;
import entity.Deal;
import entity.DealShopping;

public class DealshoppingDao {

	public static void main(String[] args) {
		/*
		 * String shopping_number = "44152219960108"; DealShoppingDao dao = new
		 * DealShoppingDao(); ArrayList<ArrayList<DealShopping>> lists = dao
		 * .getDealsByUsername("钟志坚"); if (lists != null && lists.size() > 0) {
		 * for (ArrayList<DealShopping> list : lists) { if (list != null &&
		 * list.size() > 0) { for (DealShopping deal : list) {
		 * System.out.println(deal.getDeal_price_()); } } } }
		 * ArrayList<DealShopping> list2 =
		 * dao.getDealsByUsernameAndShopnum("钟志坚", shopping_number); if (list2
		 * != null && list2.size() > 0) { System.out.println("list2.size=" +
		 * list2.size()); for (DealShopping deal : list2) {
		 * System.out.println(deal.getDeal_price_());
		 * System.out.println(deal.getProduct_count());
		 * 
		 * } } Comment comment = new Comment();
		 * comment.setComment_content("666"); comment.setComment_degree("5");
		 * Date date = new Date(); comment.setComment_date(date);
		 */
		// dao.DealComment("钟志坚", "TAKAMINE D5D 单板民谣吉他", comment);
		DealshoppingDao dao = new DealshoppingDao();
		ArrayList<DealShopping> list3 = new ArrayList<DealShopping>();
		DealShopping deal = new DealShopping();
		deal.setDeal_price_(100);
		deal.setUser_id(3);
		deal.setProduct_id(2);
		deal.setProduct_count(2);
		list3.add(deal);
		DealShopping deal2 = new DealShopping();
		deal2.setDeal_price_(1650);
		deal2.setUser_id(3);
		deal2.setProduct_id(3);
		deal2.setProduct_count(5);
		list3.add(deal2);
		/*
		 * DealShopping deal3 = new DealShopping(); deal3.setDeal_price_(550);
		 * deal3.setUser_id(3); deal3.setProduct_id(3);
		 * deal3.setProduct_count(1); list3.add(deal3);
		 */
		dao.AddDeal(list3);

		// dao.DeleteDeal(8);
	}

	// 添加订单
	public boolean AddDeal(ArrayList<DealShopping> list) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int key = 0;
		try {
			conn = DBHelper.getConnection();
			String sql = "insert into deal ( deal_state, deal_create_date,deal_isdelete) VALUES ('paied',?,0);"; // SQL语句
			stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			stmt.setDate(1, new java.sql.Date(new Date().getTime()));
			stmt.executeUpdate();
			rs = stmt.getGeneratedKeys();
			if (rs.next()) {
				key = rs.getInt(1);
				System.out.println("数据主键：" + key);
			}
			int shoppingNum = 19960101 + key;
			for (DealShopping deal : list) {
				String sql2 = "insert into deal_shopping ( user_id, deal_id,deal_price,product_id,product_count,shopping_number) VALUES (?,?,?,?,?,?);"; // SQL语句
				stmt = conn.prepareStatement(sql2);
				stmt.setInt(1, deal.getUser_id());
				stmt.setInt(2, key);
				stmt.setFloat(3, deal.getDeal_price_());
				stmt.setInt(4, deal.getProduct_id());
				stmt.setInt(5, deal.getProduct_count());
				stmt.setString(6, "441522" + String.valueOf(shoppingNum));
				stmt.executeUpdate();
			}
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
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

	// 删除订单
	public boolean DeleteDeal(int dealId) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			String sql = "update deal set deal_isdelete=1 where deal_id=?;"; // SQL语句
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, dealId);
			stmt.executeUpdate();
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
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

	// 通过用户名和类型查询订单
	public ArrayList<ArrayList<DealShopping>> getDealsByUsernameAndType(String userName,String type) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<DealShopping> list = new ArrayList<DealShopping>(); // 订单集合
		ArrayList<ArrayList<DealShopping>> lists = new ArrayList<ArrayList<DealShopping>>(); // 所有订单集合
		int user_id, deal_id = 0;
		try {
			conn = DBHelper.getConnection();
			String sql = "select user_id from user where user_name=?;"; // SQL语句
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, userName);
			rs = stmt.executeQuery();
			if (rs.next()) {
				user_id = rs.getInt("user_id");
				String sql2 = "select * from deal_shopping where user_id=?;"; // SQL语句
				stmt = conn.prepareStatement(sql2);
				stmt.setInt(1, user_id);
				rs = stmt.executeQuery();
				while (rs.next()) {
					DealShopping deal = new DealShopping();
					deal.setDeal_shopping_id(rs.getInt("deal_shopping_id"));
					deal.setUser_id(user_id);
					deal.setProduct_id(rs.getInt("product_id"));
					deal.setDeal_price_(rs.getFloat("deal_price"));
					deal.setProduct_count(rs.getInt("product_count"));
					deal.setShopping_number(rs.getString("shopping_number"));
					Deal d = getDealsByDealID(rs.getInt("deal_id"));
					deal.setDeal(d);
					if ((deal_id == 0) && ((d.getDeal_state()).equals(type))) {
						deal_id = d.getDeal_id();
						list.add(deal);// 加入订单集合
					} else if ((deal_id == d.getDeal_id())&&((d.getDeal_state()).equals(type))) {
						list.add(deal);// 加入订单集合
					} else if((d.getDeal_state()).equals(type)){
						lists.add(list);// 加入全部订单集合
						list = new ArrayList<DealShopping>();
						deal_id = d.getDeal_id();
						list.add(deal);// 加入订单集合
					}
				}
				if (!list.isEmpty()) {
					lists.add(list);// 加入全部订单集合
				}
				return lists; // 返回全部订单集合。

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

	// 通过用户名查询订单
	public ArrayList<ArrayList<DealShopping>> getDealsByUsername(
			String userName) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<DealShopping> list = new ArrayList<DealShopping>(); // 订单集合
		ArrayList<ArrayList<DealShopping>> lists = new ArrayList<ArrayList<DealShopping>>(); // 所有订单集合
		int user_id, deal_id = 0;
		try {
			conn = DBHelper.getConnection();
			String sql = "select user_id from user where user_name=?;"; // SQL语句
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, userName);
			rs = stmt.executeQuery();
			if (rs.next()) {
				user_id = rs.getInt("user_id");
				String sql2 = "select * from deal_shopping where user_id=? ;"; // SQL语句
				stmt = conn.prepareStatement(sql2);
				stmt.setInt(1, user_id);
				rs = stmt.executeQuery();
				while (rs.next()) {
					DealShopping deal = new DealShopping();
					deal.setDeal_shopping_id(rs.getInt("deal_shopping_id"));
					deal.setUser_id(user_id);
					deal.setProduct_id(rs.getInt("product_id"));
					deal.setDeal_price_(rs.getFloat("deal_price"));
					deal.setProduct_count(rs.getInt("product_count"));
					deal.setShopping_number(rs.getString("shopping_number"));
					Deal d = getDealsByDealID(rs.getInt("deal_id"));
					deal.setDeal(d);
					if (deal_id == 0) {
						deal_id = d.getDeal_id();
						list.add(deal);// 加入订单集合
					} else if (deal_id == d.getDeal_id()) {
						list.add(deal);// 加入订单集合
					} else {
						lists.add(list);// 加入全部订单集合
						list = new ArrayList<DealShopping>();
						deal_id = d.getDeal_id();
						list.add(deal);// 加入订单集合
					}
				}
				if (!list.isEmpty()) {
					lists.add(list);// 加入全部订单集合
				}
				return lists; // 返回全部订单集合。

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

	// 通过用户名和订单号查询订单
	public ArrayList<ArrayList<DealShopping>> getDealsByUsernameAndShopnum(
			String userName, String shopping_number) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<ArrayList<DealShopping>> lists = new ArrayList<ArrayList<DealShopping>>();
		ArrayList<DealShopping> list = new ArrayList<DealShopping>();
		int user_id,deal_id=0;
		try {
			conn = DBHelper.getConnection();
			String sql = "select user_id from user where user_name=?;"; // SQL语句
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, userName);
			rs = stmt.executeQuery();
			if (rs.next()) {
				
				user_id = rs.getInt("user_id");
				String sql2 = "select * from deal_shopping where user_id=? and shopping_number=?;"; // SQL语句
				stmt = conn.prepareStatement(sql2);
				stmt.setInt(1, user_id);
				stmt.setString(2, shopping_number);
				rs = stmt.executeQuery();
				System.out.println(user_id);
				System.out.println(shopping_number);
				while (rs.next()) {
					DealShopping deal = new DealShopping();
					deal.setDeal_shopping_id(rs.getInt("deal_shopping_id"));
					deal.setUser_id(user_id);
					deal.setProduct_id(rs.getInt("product_id"));
					deal.setDeal_price_(rs.getInt("deal_price"));
					deal.setProduct_count(rs.getInt("product_count"));
					deal.setShopping_number(rs.getString("shopping_number"));
					Deal d = getDealsByDealID(rs.getInt("deal_id"));
					deal.setDeal(d);
					if (deal_id == 0) {
						deal_id = d.getDeal_id();
						list.add(deal);// 加入订单集合
					} else if (deal_id == d.getDeal_id()) {
						list.add(deal);// 加入订单集合
					} else {
						lists.add(list);// 加入全部订单集合
						list = new ArrayList<DealShopping>();
						deal_id = d.getDeal_id();
						list.add(deal);// 加入订单集合
					}
				}
				if (!list.isEmpty()) {
					lists.add(list);// 加入全部订单集合
				}
				System.out.println(lists.size());
				return lists; // 返回全部订单集合。
			

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

	// 通过Id查询订单属性对象
	public Deal getDealsByDealID(int dealId) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		short isDelete = 0;
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from deal where deal_id=?;"; // SQL语句
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, dealId);
			rs = stmt.executeQuery();
			if (rs.next()) {
				Deal deal = new Deal();
				deal.setDeal_id(rs.getInt("deal_id"));
				deal.setDeal_state(rs.getString("deal_state"));
				deal.setDeal_create_date(rs.getDate("deal_create_date"));
				deal.setDeal_send_date(rs.getDate("deal_send_date"));
				deal.setDeal_recieve_date(rs.getDate("deal_receive_date"));
				if (rs.getBoolean("deal_isdelete"))
					isDelete = 1;
				deal.setIs_delete(isDelete);
				return deal; // 返回订单属性对象。

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

	// 用户进行评论
	public Boolean DealComment(String userName, String productName,
			Comment comment) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int user_id, product_id = 0;
		try {
			conn = DBHelper.getConnection();
			String sql = "select user_id from user where user_name=?;"; // SQL语句
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, userName);
			rs = stmt.executeQuery();
			if (rs.next()) {
				user_id = rs.getInt("user_id");
				String sql2 = "select product_id from product where product_name=?;"; // SQL语句
				stmt = conn.prepareStatement(sql2);
				stmt.setString(1, productName);
				rs = stmt.executeQuery();
				if (rs.next()) {
					product_id = rs.getInt("product_id");
					String sql3 = "insert into comment ( product_id, user_id , comment_degree,comment_content,comment_date) VALUES (?,?,?,?,?);"; // SQL语句
					stmt = conn.prepareStatement(sql3);
					stmt.setInt(1, product_id);
					stmt.setInt(2, user_id);
					stmt.setString(3, comment.getComment_degree());
					stmt.setString(4, comment.getComment_content());
					stmt.setDate(5, new java.sql.Date(comment.getComment_date()
							.getTime()));
					stmt.executeUpdate();
					return true;
				}
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
		return false;
	}

	// 确认收货
	public boolean SureRecieveProduct(int dealId) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		System.out.println("?????????????????????????");
		try {
			conn = DBHelper.getConnection();
			String sql = "update deal set deal_state='recievednotcomment' where deal_id=?;"; // SQL语句
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, dealId);
			stmt.executeUpdate();
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
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

	// 评论
	public boolean CommentProduct(int dealId) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			String sql = "update deal set deal_state='recieved' where deal_id=?;"; // SQL语句
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, dealId);
			stmt.executeUpdate();
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
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