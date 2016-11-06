package entity;

public class Admin {
		private int adminId;
		private String adminUsername;
		private String adminPassword;
		private String adminDep;
		private int adminLevel;
		
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
