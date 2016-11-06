package entity;

public class Admin {
		private int adminId; //管理员id
		private String adminUsername;//管理员名字
		private String adminPassword;//管理员密码
		private String adminDep;//管理员部门
		private int adminLevel;//管理员的级别
		
		public Admin(){
			
		}
		
		public int getAdminId() {
			return adminId;
		}
		public void setAdminId(int adminId) {
			this.adminId = adminId;
		}
		public String getAdminUsername() {
			return adminUsername;
		}
		public void setAdminUsername(String adminUsername) {
			this.adminUsername = adminUsername;
		}
		public String getAdminPassword() {
			return adminPassword;
		}
		public void setAdminPassword(String adminPassword) {
			this.adminPassword = adminPassword;
		}
		public String getAdminDep() {
			return adminDep;
		}
		public void setAdminDep(String adminDep) {
			this.adminDep = adminDep;
		}
		public int getAdminLevel() {
			return adminLevel;
		}
		public void setAdminLevel(int adminLevel) {
			this.adminLevel = adminLevel;
		}
		
}
