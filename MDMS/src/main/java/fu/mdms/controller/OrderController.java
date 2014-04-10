package fu.mdms.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fu.mdms.dao.BillDao;
import fu.mdms.dao.DealerDao;
import fu.mdms.dao.OrderDao;
import fu.mdms.dao.ProductDao;
import fu.mdms.dao.UserDao;
import fu.mdms.dao.impl.BillDaoImpl;
import fu.mdms.dao.impl.DealerDaoImpl;
import fu.mdms.dao.impl.OrderDaoImpl;
import fu.mdms.dao.impl.ProductDaoImpl;
import fu.mdms.dao.impl.UserDaoImpl;
import fu.mdms.model.Dealer;
import fu.mdms.model.ExportBill;
import fu.mdms.model.ExportBillDetail;
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
	@RequestMapping(value = "/sale_createOrder", method = RequestMethod.GET)
	public String createOrder(Locale locale, Model model) {		
		ProductDao productDao = new ProductDaoImpl();
		List<Product> productList = productDao.getAllProduct();
		model.addAttribute("productList", productList);
		DealerDao dealerDao = new DealerDaoImpl();
		List<Dealer> dealerList = dealerDao.getAllDealer();
		model.addAttribute("dealerList", dealerList);
		return "sale/sale_createOrder";
	}

	@RequestMapping(value = "/store_saveExportBill", method = RequestMethod.POST)
	public String store_saveExportBill(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		String dealerID = request.getParameter("dealerID");
		String createdDate = request.getParameter("createdDate");
		String exportDate = request.getParameter("exportDate");
		DealerDao dealerDao = new DealerDaoImpl();
		Dealer dealer = dealerDao.getDealer(Integer.parseInt(dealerID));
		String orderID = request.getParameter("orderID");
		Order order = orderDao.getOrder(Integer.parseInt(orderID));
		ExportBill exportBill = new ExportBill(dealer, order, createdDate,
				exportDate);
		BillDao billDao = new BillDaoImpl();
		billDao.createExportBill(exportBill);
		double discount = Double.parseDouble(request.getParameter("discount"));
		int row = Integer.parseInt(request.getParameter("row"));
		for (int i = 1; i <= row; i++) {
			String productID = request.getParameter("productID" + i);
			int quantity = Integer.parseInt(request
					.getParameter("quantity" + i));
			ProductDao productDao = new ProductDaoImpl();
			Product product = productDao
					.getProduct(Integer.parseInt(productID));
			exportBill = billDao.getExportBill(billDao.getLastInsertEx());
			ExportBillDetail exportBillDetail = new ExportBillDetail(
					exportBill, product, product.getExportPrice(), quantity,
					discount);
			billDao.createExportBillDetail(exportBillDetail);
		}
		List<Order> orderList = orderDao.searchOrder("", "1");
		model.addAttribute("orderList", orderList);
		return "store/store_listOrder";
	}

	@RequestMapping(value = "/saveOrder", method = RequestMethod.POST)
	public String saveOrder(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		String userID = request.getParameter("userID");
		String dealerID = request.getParameter("dealerID");
		String createdDate = request.getParameter("createdDate");
		String requiredDate = request.getParameter("requiredDate");
		DealerDao dealerDao = new DealerDaoImpl();
		Dealer dealer = dealerDao.getDealer(Integer.parseInt(dealerID));
		UserDao userDao = new UserDaoImpl();
		User user = userDao.getUser(Integer.parseInt(userID));
		Order order = new Order(user, dealer, createdDate, requiredDate, 1);
		orderDao.createOrder(order);
		int row = Integer.parseInt(request.getParameter("row"));
		for (int i = 1; i <= row; i++) {
			String productID = request.getParameter("productID" + i);
			int quantity = Integer.parseInt(request
					.getParameter("quantity" + i));
			ProductDao productDao = new ProductDaoImpl();
			Product product = productDao
					.getProduct(Integer.parseInt(productID));
			order = orderDao.getOrder(orderDao.getLastInsertID());
			OrderDetail orderDetail = new OrderDetail(order, product, quantity,
					product.getExportPrice());
			orderDao.addOrderDetail(orderDetail);
		}
		List<Order> orderList = orderDao.searchOrder("", "1");
		model.addAttribute("orderList", orderList);
		return "sale/sale_listOrder";
	}

	@RequestMapping(value = "/sale_searchOrder", method = RequestMethod.POST)
	public String sale_searchOrder(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		String dealerName = request.getParameter("search_dealerName");
		String status = request.getParameter("status");
		if(dealerName==null){
			dealerName="";
		}
		List<Order> orderList = orderDao.searchOrder(dealerName, status);
		model.addAttribute("orderList", orderList);
		return "sale/sale_listOrder";
	}
	@RequestMapping(value = "/store_searchOrder", method = RequestMethod.POST)
	public String store_searchOrder(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		String dealerName = request.getParameter("search_dealerName");
		if(dealerName==null){
			dealerName="";
		}
		
		String status = request.getParameter("status");
		List<Order> orderList = orderDao.searchOrder(dealerName, status);
		model.addAttribute("orderList", orderList);
		return "store/store_listOrder";
	}

	@RequestMapping(value = "/store_viewOrder", method = RequestMethod.GET)
	public String store_viewOrder(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		String orderID = request.getParameter("orderID");
		Order order = orderDao.getOrder(Integer.parseInt(orderID));
		List<OrderDetail> orderDetailList = orderDao.getOrderDetails(Integer
				.parseInt(orderID));
		model.addAttribute("order", order);
		model.addAttribute("orderDetailList", orderDetailList);
		// System.out.println("San pham:"+orderDetailList.get(0).getProduct().getProductName()+"So luong:"+orderDetailList.get(0).getQuantity());
		return "store/store_viewOrder";
	}

	@RequestMapping(value = "/store_listOrder", method = RequestMethod.GET)
	public String store_listOrder(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		List<Order> orderList = orderDao.searchOrder("", "1");
		model.addAttribute("orderList", orderList);
		return "store/store_listOrder";
	}
	@RequestMapping(value = "/sale_listOrder", method = RequestMethod.GET)
	public String sale_listOrder(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		List<Order> orderList = orderDao.searchOrder("", "1");
		model.addAttribute("orderList", orderList);
		return "sale/sale_listOrder";
	}
	@RequestMapping(value = "/store_cancelOrder", method = RequestMethod.GET)
	public String cancelOrder(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		String orderID = request.getParameter("orderID");
		Order order = orderDao.getOrder(Integer.parseInt(orderID));
		order.setStatus(4);
		orderDao.editOrder(order);
		List<Order> orderList = orderDao.searchOrder("", "1");
		model.addAttribute("orderList", orderList);
		return "store/store_listOrder";
	}

	@RequestMapping(value = "/store_createExportBill", method = RequestMethod.GET)
	public String store_createExportBill(HttpServletRequest request,
			HttpServletResponse response, Locale locale, Model model) {
		BillDao billDao = new BillDaoImpl();
		String orderID = request.getParameter("orderID");
		Order order = orderDao.getOrder(Integer.parseInt(orderID));
		model.addAttribute(order);
		List<OrderDetail> orderDetailList = orderDao.getOrderDetails(Integer
				.parseInt(orderID));
		model.addAttribute("orderDetailList", orderDetailList);
		List<ExportBill> exportBillList = billDao.getExportBillsByOrderID(order.getOrderID());
		List<ExportBillDetail> exDetailList = new ArrayList<ExportBillDetail>();
		List<Integer> quantityOfExport = new ArrayList<Integer>();
		for(int i=0;i<exportBillList.size();i++){
			exDetailList = billDao.getExBillDetailByExBillID(exportBillList.get(i).getExportBillID());
			for (int j = 0; j < exDetailList.size(); j++) {
				if(quantityOfExport.size()==j){
					quantityOfExport.add(j, exDetailList.get(j).getQuantity());
				}
				else {
					quantityOfExport.set(j, quantityOfExport.get(j)
							+ exDetailList.get(j).getQuantity());
				}
			}
		}
		model.addAttribute("quantityOfExport", quantityOfExport);
		return "store/store_createExportBill";
	}
}
