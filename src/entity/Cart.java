package entity;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import dao.ProductDao;

// 购物车类
public class Cart {
	// 商品集合
	private HashMap<Product, Integer> products;
	
	// 商品总价
	private double totalPrice;

	DecimalFormat formater = new DecimalFormat("#0.##");
	
	// 构造方法
	public Cart()
	{
		 products = new HashMap<Product, Integer>();
		 totalPrice = 0.0;
	}
	
	// 添加商品进购物车
	public boolean addProductInCart(Product product, Integer number, Users user)
	{
		if (products.containsKey(product))
		{
			products.put(product, products.get(product) + number);
		}
		else
		{
			products.put(product, number);
		}
		
		calToalPrice(user); // 重新计算购物车总金额
		return true;
	}
	
	// 从购物车删除商品
	public boolean removeProductFromCart(Product product, Users user)
	{
		products.remove(product);
		calToalPrice(user); // 重新计算购物车总金额
		return true;
	}
	
	// 统计购物车的总金额
	public double calToalPrice(Users user)
	{
		double totalPrice = 0.0;
		Set<Product> ps = products.keySet();
		Iterator<Product> it = ps.iterator();
		
		while(it.hasNext())
		{
			Product p = it.next();
			if (user != null)
			{
				if (user.isUserVip())
				{
					totalPrice += Float.parseFloat(formater.format(p.getProduct_price() * 0.95))*products.get(p);
				}
				else
				{
					totalPrice += p.getProduct_price() * products.get(p);
				}
			}
			else
			{
				totalPrice += p.getProduct_price() * products.get(p);
			}
				
		}
		
		this.setTotalPrice(totalPrice);
		return this.getTotalPrice();
	}
	
	// 更新商品数量
	public boolean updateCart(int num, String id, Users user)
	{
		ProductDao pd = new ProductDao();
		Product p = pd.findProductById(id);
		addProductInCart(p, num-products.get(p), user);
		return true;
	}
	
	// set/get方法
	public HashMap<Product, Integer> getProducts() {
		return products;
	}

	public void setProducts(HashMap<Product, Integer> products) {
		this.products = products;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	
//	public static void main(String[] args) {
//		Product i1 = new Product();
//		Product i2 = new Product();
//		
//		Product i3 = new Product();
//		
//		i1.setProduct_id(9);
//		i1.setProduct_name("product1");
//		i1.setProduct_price(200);
//		
//		i2.setProduct_id(3);
//		i2.setProduct_name("product2");
//		i2.setProduct_price(400);
//		
//		Cart c = new Cart();
//		c.addGoodInCart(i1, 1);
//		c.addGoodInCart(i2, 2);
//		
//		//c.addGoodInCart(i3, 3);
//		
//		Set<Map.Entry<Product, Integer>> product = c.getProducts().entrySet();
//		for (Map.Entry<Product, Integer> obj : product)
//		{
//			System.out.println(obj);
//		}
//		
//		System.out.println("购物车的总金额：" + c.getTotalPrice());
//	}
	
}
