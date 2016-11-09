package entity;

//处理售后服务类
public class SaleLater {
	private int salelater_id;	//售后服务id
	private int user_id;		//售后服务用户id
	private int product_id;		//售后服务商品id
	private int deal_id;			//售后服务订单ip
	private String service_type;	//售后服务类型
	private String service_later;	//售后服务内容
	private boolean salelater_is_handle;//售后服务是否处理
	
	public SaleLater(){}
	
	
	
	public SaleLater(int salelater_id, int user_id, int product_id, int deal_id,
			String service_type, String servive_later,
			boolean salelater_is_handle) {
		this.salelater_id = salelater_id;
		this.user_id = user_id;
		this.product_id = product_id;
		this.deal_id = deal_id;
		this.service_type = service_type;
		this.service_later = servive_later;
		this.salelater_is_handle = salelater_is_handle;
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



	public String getService_later() {
		return service_later;
	}

	public void setService_later(String service_later) {
		this.service_later = service_later;
	}


	public String getService_type() {
		return service_type;
	}
	public void setService_type(String service_type) {
		this.service_type = service_type;
	}
	
	public boolean isSalelater_is_handle() {
		return salelater_is_handle;
	}
	public void setSalelater_is_handle(boolean salelater_is_handle) {
		this.salelater_is_handle = salelater_is_handle;
	}
}
