package fu.mdms.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import fu.mdms.dao.OrderDao;
import fu.mdms.model.Dealer;
import fu.mdms.model.Order;
import fu.mdms.model.OrderDetail;
import fu.mdms.util.HibernateUtil;

public class OrderDaoImpl implements OrderDao {

	@Override
	public void createOrder(Order order) {
		// TODO Auto-generated method stub
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		session.save(order);
		session.getTransaction().commit();
		session.close();

	}

	@Override
	public void editOrder(Order order) {
		// TODO Auto-generated method stub
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		session.update(order);
		session.getTransaction().commit();
		session.close();

	}

	@Override
	public void deleteOrder(int orderID) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Order getOrder(int orderID) {
		// TODO Auto-generated method stub
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		Order order = (Order) session.get(Order.class, orderID);
		session.getTransaction().commit();
		session.close();
		return order;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Order> getAllOrder() {
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		List<Order> orderList = (List<Order>) session.createQuery("FROM Order").list();
		session.getTransaction().commit();
		session.close();
		return orderList;
	}
	@SuppressWarnings("unchecked")
	public List<Order> searchOrder(String dealerName, String orderStatus)
	{
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		List<Order> order = null;
		if (orderStatus.equalsIgnoreCase("0")) {
			if (dealerName.equalsIgnoreCase("")) {
				order = (List<Order>) session.createQuery("FROM Order ")
						.list();
			} else {
				order = (List<Order>) session.createQuery(
						"FROM Order WHERE DealerID IN (SELECT dealerID FROM Dealer where dealerName LIKE '%"+dealerName+"%')").list();
			}
		} else {
			order = (List<Order>) session.createQuery(
					"FROM Order WHERE DealerID IN (SELECT dealerID FROM Dealer where dealerName LIKE '%"+dealerName+"%') AND status="+orderStatus+"").list();
		}
		session.getTransaction().commit();
		session.close();
		return order;
	}

	@Override
	public int getLastInsertID() {
		// TODO Auto-generated method stub
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		Query query = session.createSQLQuery("SELECT Max(OrderID) FROM orders");
		return (Integer)query.list().get(0);
	}

	@Override
	public void addOrderDetail(OrderDetail orderDetail) {
		// TODO Auto-generated method stub
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		session.save(orderDetail);
		session.getTransaction().commit();
		session.close();
	}
	@Override
	public List<OrderDetail> getOrderDetails(int orderID) {
		// TODO Auto-generated method stub
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		@SuppressWarnings("unchecked")
		List<OrderDetail> orderDetailList = (List<OrderDetail>) session.createQuery("FROM OrderDetail WHERE OrderID='"+orderID+"'").list();
		session.getTransaction().commit();
		session.close();
		return orderDetailList;
	}

}
