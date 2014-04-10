package fu.mdms.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import fu.mdms.dao.SupplierDao;
import fu.mdms.model.Dealer;
import fu.mdms.model.Supplier;
import fu.mdms.util.HibernateUtil;

public class SupplierDaoImpl implements SupplierDao {
	public void createSupplier(Supplier supplier) {
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		session.save(supplier);
		session.getTransaction().commit();
		session.close();
	}

	public void editSupplier(Supplier supplier) {
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		session.update(supplier);
		session.getTransaction().commit();
		session.close();

	}

	public void deleteSupplier(int supplierID) {

		return;
	}

	public Supplier getSupplier(int supplierID) {
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		Supplier supplier = (Supplier) session.get(Supplier.class, supplierID);
		session.getTransaction().commit();
		session.close();
		return supplier;
	}

	public List<Supplier> getAllSupplier() {
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		List<Supplier> supplier = (List<Supplier>) session.createQuery(
				"FROM Supplier Where Deleted='0'").list();
		session.getTransaction().commit();
		session.close();
		return supplier;
	}

	public List<Supplier> searchSupplier(String supplierName) {
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		List<Supplier> supplier = null;
		if (supplierName.equalsIgnoreCase("")) {
			supplier = (List<Supplier>) session.createQuery(
					"FROM Supplier ").list();

		} else {
			supplier = (List<Supplier>) session.createQuery(
					"FROM Supplier  Where SupplierName LIKE '%"+supplierName+"%'").list();
		}
		session.getTransaction().commit();
		session.close();
		return supplier;

	}

}
