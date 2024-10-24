package com.otz.bean;

public class Admin {

	
		private int  adminId;
		private String adminName;
		private String adminEmail;
		private String adminPassword;
		private String adminPhoto;
		private String adminPNum;
		
		//Setter & Getter 
		
		public int getAdminId() {
			return adminId;
		}
		public void setAdminId(int adminId) {
			this.adminId = adminId;
		}
		public String getAdminName() {
			return adminName;
		}
		public void setAdminName(String adminName) {
			this.adminName = adminName;
		}
		public String getAdminEmail() {
			return adminEmail;
		}
		public void setAdminEmail(String adminEmail) {
			this.adminEmail = adminEmail;
		}
		public String getAdminPassword() {
			return adminPassword;
		}
		public void setAdminPassword(String adminPassword) {
			this.adminPassword = adminPassword;
		}
		public String getAdminPhoto() {
			return adminPhoto;
		}
		public void setAdminPhoto(String adminPhoto) {
			this.adminPhoto = adminPhoto;
		}
		public String getAdminPNum() {
			return adminPNum;
		}
		public void setAdminPNum(String adminPNum) {
			this.adminPNum = adminPNum;
		}
		
		@Override
		public String toString() {
			return "admin [adminId=" + adminId + ", adminName=" + adminName + ", adminEmail=" + adminEmail
					+ ", adminPassword=" + adminPassword + ", adminPhoto=" + adminPhoto + ", adminPNum=" + adminPNum + "]";
		}
		
		
		
	}


