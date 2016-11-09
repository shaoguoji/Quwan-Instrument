package entity;

import java.sql.Date;

public class Vip_apply {
	private int user_id;
//	private int user_point_;
	private Date date;
	private boolean ishandle;
	
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public boolean isIshandle() {
		return ishandle;
	}
	public void setIshandle(boolean ishandle) {
		this.ishandle = ishandle;
	}
	
	
}
