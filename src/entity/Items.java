package entity;

//商品类
public class Items {

	private int product_id; // 商品编号
	private String property_id; // 商品属性名称
	private String product_name; // 商品名称
	private int product_image; // 图片
	private int product_introdution; // 介绍
	private String product_infomation; // 信息
	private boolean product_is_sale; // 上架
	private boolean product_show_date; // 上架日期
	
	
	//保留此不带参数的构造方法
	public Items()
	{
		
	}
	
	public Items(int product_id, String property_id, String product_name,
			int product_image, int product_introdution,
			String product_infomation, boolean product_is_sale,
			boolean product_show_date) {
		super();
		this.product_id = product_id;
		this.property_id = property_id;
		this.product_name = product_name;
		this.product_image = product_image;
		this.product_introdution = product_introdution;
		this.product_infomation = product_infomation;
		this.product_is_sale = product_is_sale;
		this.product_show_date = product_show_date;
	}

	



	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public String getProperty_id() {
		return property_id;
	}

	public void setProperty_id(String property_id) {
		this.property_id = property_id;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getProduct_image() {
		return product_image;
	}

	public void setProduct_image(int product_image) {
		this.product_image = product_image;
	}

	public int getProduct_introdution() {
		return product_introdution;
	}

	public void setProduct_introdution(int product_introdution) {
		this.product_introdution = product_introdution;
	}

	public String getProduct_infomation() {
		return product_infomation;
	}

	public void setProduct_infomation(String product_infomation) {
		this.product_infomation = product_infomation;
	}

	public boolean isProduct_is_sale() {
		return product_is_sale;
	}

	public void setProduct_is_sale(boolean product_is_sale) {
		this.product_is_sale = product_is_sale;
	}

	public boolean isProduct_show_date() {
		return product_show_date;
	}

	public void setProduct_show_date(boolean product_show_date) {
		this.product_show_date = product_show_date;
	}

	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return this.getProduct_id()+this.getProduct_name().hashCode();
	}

	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		if(this==obj)
		{
			return true;
		}
		if(obj instanceof Items)
		{
			Items i = (Items)obj;
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
	}

	public String toString()
	{
		return "商品编号："+this.getProduct_id()+",商品名称："+this.getProduct_name();
	}

}
