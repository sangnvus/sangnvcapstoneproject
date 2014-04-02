package fu.mdms.dao;

import java.util.List;

import fu.mdms.model.Order;
import fu.mdms.model.OrderDetail;

public interface OrderDao {
	public void createOrder(Order order);
	public void editOrder(Order order);
	public void deleteOrder(int orderID);
	public Order getOrder(int orderID);
	public List<Order> getAllOrder();
	public List<Order> searchOrder(String dealerName, String orderStatus);
	public int getLastInsertID();
	public void addOrderDetail(OrderDetail orderDetail);
	List<OrderDetail> getOrderDetails(int orderID);

}
