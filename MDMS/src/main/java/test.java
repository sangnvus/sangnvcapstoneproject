import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import fu.mdms.dao.OrderDao;
import fu.mdms.dao.ProductDao;
import fu.mdms.dao.impl.OrderDaoImpl;
import fu.mdms.dao.impl.ProductDaoImpl;
import fu.mdms.model.Order;
import fu.mdms.model.Product;


public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
/*		ProductDao productDao = new ProductDaoImpl();
		List<Product> productList = productDao.getAllProduct();
		for(int i=0;i<productList.size();i++){
			Product pro = productList.get(i);
			System.out.println(pro.getSupplier().getSupplierName());
		}*/
		OrderDao orderDao = new OrderDaoImpl();
		int i = orderDao.getLastInsertID();
		System.out.println(i);
		Order order = orderDao.getOrder(i);
		System.out.println("ID:" + order.getOrderID());
		
	}

}
