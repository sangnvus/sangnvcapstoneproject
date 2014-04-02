package fu.mdms.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import fu.mdms.dao.DealerDao;
import fu.mdms.model.Dealer;
import fu.mdms.model.Product;
import fu.mdms.model.User;
import fu.mdms.util.HibernateUtil;

public class DealerDaoImpl implements DealerDao {
	@Override
	public void createDealer(Dealer dealer) {
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		session.save(dealer);
		session.getTransaction().commit();
		session.close();
		// TODO Auto-generated method stub
		
	}

	@Override
	public void editDealer(Dealer dealer) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteDealer(int dealerID) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Dealer getDealer(int dealerID) {
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		Dealer dealer = (Dealer) session.get(Dealer.class, dealerID);
		session.getTransaction().commit();
		session.close();
		return dealer;
	}

	@Override
	public List<Dealer> getAllDealer() {
		// TODO Auto-generated method stub
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		List<Dealer> dealer = (List<Dealer>) session.createQuery("FROM Dealer").list();
		session.getTransaction().commit();
		session.close();
		return dealer;
	}
	public List<Dealer> searchDealer(String dealerName, String dealerStatus)
	{
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		List<Dealer> dealer = (List<Dealer>) session.createQuery("FROM Dealer WHERE DealerName LIKE '%"+dealerName+"%' AND Status ="+dealerStatus+"").list();
		session.getTransaction().commit();
		session.close();
		return dealer;
		
	}
}
