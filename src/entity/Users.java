package entity;

public class Users {
	private int userId;//用户Id
	private String userAccount;//用户帐号
	private String userPassword;//用户密码
	private String userName;//用户姓名
	private String userImage;//用户头像
	private String userPhone;//用户手机
	private String userEmail;//用户邮箱
	private String userAddress;//用户地址
	private int userPoint;//用户积分
	private boolean userVip;//用户性别
	public Users(){
		
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserAccount() {
		return userAccount;
	}
	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserImage() {
		return userImage;
	}
	public void setUserImage(String userImage) {
		this.userImage = userImage;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public int getUserPoint() {
		return userPoint;
	}
	public void setUserPoint(int userPoint) {
		this.userPoint = userPoint;
	}
	public boolean isUserVip() {
		return userVip;
	}
	public void setUserVip(boolean userVip) {
		this.userVip = userVip;
	}
	
}
