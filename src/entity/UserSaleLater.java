package entity;

public class UserSaleLater {

	private int salelater_id; 
	private int user_id;
	private int product_id;
	private int deal_id;
	private String service_type;
	private String service_later;
	
	public UserSaleLater() {
	}
	public UserSaleLater(int user_id, int product_id,
			int deal_id,  String service_later) {
		super();
		this.user_id = user_id;
		this.product_id = product_id;
		this.deal_id = deal_id;
		this.service_later = service_later;
	}
	public UserSaleLater(int user_id, int product_id,
			int deal_id, String service_type, String service_later) {
		super();
		this.user_id = user_id;
		this.product_id = product_id;
		this.deal_id = deal_id;
		this.service_type = service_type;
		this.service_later = service_later;
	}

	public UserSaleLater(int salelater_id, int user_id, int product_id,
			int deal_id, String service_type, String service_later) {
		super();
		this.salelater_id = salelater_id;
		this.user_id = user_id;
		this.product_id = product_id;
		this.deal_id = deal_id;
		this.service_type = service_type;
		this.service_later = service_later;
	}





	public String getService_later() {
		return service_later;
	}


	public void setService_later(String service_later) {
		this.service_later = service_later;
	}


	public int getSalelater_id() {
		return salelater_id;
	}


	public void setSalelater_id(int salelater_id) {
		this.salelater_id = salelater_id;
	}


	public int getUser_id() {
		return user_id;
	}


	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}


	public int getProduct_id() {
		return product_id;
	}


	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}


	public int getDeal_id() {
		return deal_id;
	}


	public void setDeal_id(int deal_id) {
		this.deal_id = deal_id;
	}


	public String getService_type() {
		return service_type;
	}


	public void setService_type(String service_type) {
		this.service_type = service_type;
	}
	
	
	
}
