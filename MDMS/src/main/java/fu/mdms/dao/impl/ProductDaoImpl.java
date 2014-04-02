package fu.mdms.dao.impl;

import java.util.List;

import fu.mdms.dao.ProductDao;
import fu.mdms.model.Dealer;
import fu.mdms.model.Product;
import fu.mdms.util.HibernateUtil;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class ProductDaoImpl implements ProductDao {

	public void createProduct(Product product) {
	}

	public void editProduct(Product product) {
	}

	public void deleteProductr(int ProductID) {
	}

	public Product getProduct(int ProductID) {
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		Product product = (Product) session.get(Product.class, ProductID);
		session.getTransaction().commit();
		session.close();
		return product;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Product> getAllProduct() {
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		List<Product> product = (List<Product>) session.createQuery(
				"FROM Product").list();
		session.getTransaction().commit();
		session.close();
		return product;
	}

	@SuppressWarnings("unchecked")
	public List<Product> searchProduct(String productCode, String productName,
			int categoryID) {
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		List<Product> product;
		if (categoryID == 0) {
			product = (List<Product>) session.createQuery(
					"FROM Product WHERE ProductCode LIKE '%" + productCode
							+ "%' AND ProductName LIKE '%" + productName
							+ "%'").list();

		} else {
			product = (List<Product>) session.createQuery(
					"FROM Product WHERE ProductCode LIKE '%" + productCode
							+ "%' AND ProductName LIKE '%" + productName
							+ "%' AND CategoryID=" + categoryID + "").list();
		}
		session.getTransaction().commit();
		session.close();
		return product;
	}

	@SuppressWarnings("unchecked")
	public List<Product> searchProduct1(String productCode) {
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		List<Product> product = (List<Product>) session.createQuery(
				"FROM Product WHERE ProductCode LIKE '%" + productCode + "%'")
				.list();
		session.getTransaction().commit();
		session.close();
		return product;
	}

}
