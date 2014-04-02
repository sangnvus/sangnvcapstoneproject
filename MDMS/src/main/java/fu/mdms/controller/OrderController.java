package fu.mdms.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fu.mdms.dao.DealerDao;
import fu.mdms.dao.OrderDao;
import fu.mdms.dao.ProductDao;
import fu.mdms.dao.UserDao;
import fu.mdms.dao.impl.DealerDaoImpl;
import fu.mdms.dao.impl.OrderDaoImpl;
import fu.mdms.dao.impl.ProductDaoImpl;
import fu.mdms.dao.impl.UserDaoImpl;
import fu.mdms.model.Dealer;
import fu.mdms.model.Order;
import fu.mdms.model.OrderDetail;
import fu.mdms.model.Product;
import fu.mdms.model.User;

@Controller
public class OrderController {
	OrderDao orderDao = new OrderDaoImpl();

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/createOrder", method = RequestMethod.GET)
	public String createOrder(Locale locale, Model model) {
		ProductDao productDao = new ProductDaoImpl();
		List<Product> productList = productDao.getAllProduct();
		model.addAttribute("productList", productList);
		DealerDao dealerDao = new DealerDaoImpl();
		List<Dealer> dealerList = dealerDao.getAllDealer();
		model.addAttribute("dealerList", dealerList);
		return "sale/createOrder";
	}

	@RequestMapping(value = "/saveOrder", method = RequestMethod.POST)
	public String saveOrder(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {

		String userID = request.getParameter("userID");
		String dealerID = request.getParameter("dealerID");
		String createdDate = request.getParameter("createdDate");
		String requiredDate = request.getParameter("requiredDate");
		System.out.println(createdDate);
		DealerDao dealerDao = new DealerDaoImpl();
		Dealer dealer = dealerDao.getDealer(Integer.parseInt(dealerID));
		System.out.println(dealer.getDealerName());
		UserDao userDao = new UserDaoImpl();
		User user = userDao.getUser(Integer.parseInt(userID));
		Order order = new Order(user, dealer, createdDate, requiredDate, 1);
		orderDao.createOrder(order);
		int row = Integer.parseInt(request.getParameter("row"));
		for (int i = 1; i <= row; i++) {
			String productID = request.getParameter("productID" + i);
			int quantity = Integer.parseInt(request
					.getParameter("quantity" + i));
			String price = request.getParameter("price" + i);
			System.out.println(price);
			ProductDao productDao = new ProductDaoImpl();
			Product product = productDao
					.getProduct(Integer.parseInt(productID));
			order = orderDao.getOrder(orderDao.getLastInsertID());
			System.out.println(order.getOrderID());
			OrderDetail orderDetail = new OrderDetail(order, product, quantity,
					product.getExportPrice());
			orderDao.addOrderDetail(orderDetail);
		}
		List<Order> orderList = orderDao.getAllOrder();
		model.addAttribute("orderList", orderList);
		return "result";
	}

	@RequestMapping(value = "/store_orderSearch", method = RequestMethod.POST)
	public String store_orderSearch(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		return "store/store_listOrder";
	}
	@RequestMapping(value = "/store_viewOrder", method = RequestMethod.GET)
	public String store_viewOrder(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		String orderID = request.getParameter("orderID");
		Order order = orderDao.getOrder(Integer.parseInt(orderID));
		List<OrderDetail> orderDetailList = orderDao.getOrderDetails(Integer.parseInt(orderID));
		model.addAttribute("order", order);
		model.addAttribute("orderDetailList", orderDetailList);
		//System.out.println("San pham:"+orderDetailList.get(0).getProduct().getProductName()+"So luong:"+orderDetailList.get(0).getQuantity());
		return "store/store_viewOrder";
	}
	
	@RequestMapping(value = "/store_listOrder", method = RequestMethod.GET)
	public String store_listOrder(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		List <Order> orderList = orderDao.getAllOrder();
		model.addAttribute("orderList", orderList);
		return "store/store_listOrder";
	}
	@RequestMapping(value = "/store_cancelOrder", method = RequestMethod.GET)
	public String cancelOrder(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		String orderID= request.getParameter("orderID");
		Order order = orderDao.getOrder(Integer.parseInt(orderID));
		order.setStatus(4);
		orderDao.editOrder(order);
		List <Order> orderList = orderDao.getAllOrder();
		model.addAttribute("orderList", orderList);
		return "store/store_listOrder";
	}
	@RequestMapping(value = "/store_createExportBill", method = RequestMethod.GET)
	public String store_createExportBill(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		String orderID = request.getParameter("orderID");
		Order order =  orderDao.getOrder(Integer.parseInt(orderID));
		model.addAttribute(order);
		List<OrderDetail> orderDetailList = orderDao.getOrderDetails(Integer.parseInt(orderID));
		model.addAttribute("orderDetailList", orderDetailList);
		return "store/store_createExportBill";
	}
}

