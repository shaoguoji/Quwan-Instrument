package entity;

//商品类
public class DealShopping {

	private int deal_shopping_id; // 订单ID
	private int user_id; // 用户ID
	private Deal deal; // 订单属性
	private int product_id; // 商品ID
	private int product_count; // 商品数量
	private String shopping_number ; // 订单号
	private float deal_price_; // 订单价格
	//private boolean shopping_isbuy; // 

	
	//保留此不带参数的构造方法
	public DealShopping()
	{
		
	}

	public DealShopping(int deal_shopping_id, int user_id, Deal deal,
			int product_id, int product_count, String shopping_number,
			float deal_price_) {
		super();
		this.deal_shopping_id = deal_shopping_id;
		this.user_id = user_id;
		this.deal = deal;
		this.product_id = product_id;
		this.product_count = product_count;
		this.shopping_number = shopping_number;
		this.deal_price_ = deal_price_;
	}



	/*@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return this.getProduct_id()+this.getProduct_name().hashCode();
	}*/

	/*@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		if(this==obj)
		{
			return true;
		}
		if(obj instanceof DealShopping)
		{
			DealShopping i = (DealShopping)obj;
			if(this.getProduct_id()==i.getProduct_id()&&this.getProduct_name().equals(i.getProduct_name()))
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		else
		{
			return false;
		}
	}*/

	/*public String toString()
	{
		return "商品编号："+this.getProduct_id()+",商品名称："+this.getProduct_name();
	}*/

	public int getDeal_shopping_id() {
		return deal_shopping_id;
	}

	public void setDeal_shopping_id(int deal_shopping_id) {
		this.deal_shopping_id = deal_shopping_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public Deal getDeal() {
		return deal;
	}

	public void setDeal(Deal deal) {
		this.deal = deal;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public int getProduct_count() {
		return product_count;
	}

	public void setProduct_count(int product_count) {
		this.product_count = product_count;
	}

	public String getShopping_number() {
		return shopping_number;
	}

	public void setShopping_number(String shopping_number) {
		this.shopping_number = shopping_number;
	}

	public float getDeal_price_() {
		return deal_price_;
	}

	public void setDeal_price_(float deal_price_) {
		this.deal_price_ = deal_price_;
	}
	

}
