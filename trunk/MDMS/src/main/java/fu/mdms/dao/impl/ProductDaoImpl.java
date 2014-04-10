package fu.mdms.dao.impl;

import java.util.List;

import fu.mdms.dao.ProductDao;
import fu.mdms.model.Dealer;
import fu.mdms.model.Product;
import fu.mdms.model.User;
import fu.mdms.util.HibernateUtil;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class ProductDaoImpl implements ProductDao {

	public void createProduct(Product product) {
		// System.out.println(product.getProductID());
		// System.out.println(product.getProductName());
		// System.out.println(product.getProductCode());
		// System.out.println(product.getPackagedType());
		// System.out.println(product.getUnitsInStock());
		// System.out.println(product.getUnitsOnOrders());
		// System.out.println(product.getDescription());
		// System.out.println(product.getCategory().getCategoryName());
		// System.out.println(product.getExportPrice());
		// System.out.println(product.getImportPrice());
		// System.out.println(product.getProducer().getProducerName());
		// System.out.println(product.getSupplier().getSupplierName());
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		session.save(product);
		session.getTransaction().commit();
		session.close();
	}

	public void editProduct(Product product) {

		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		session.update(product);
		session.getTransaction().commit();
		session.close();

	}

	public void viewProduct(Product product) {

		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		session.update(product);
		session.getTransaction().commit();
		session.close();

	}

	@Override
	public Product getProduct(int productID) {
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		Product product = (Product) session.get(Product.class, productID);
		session.getTransaction().commit();
		session.close();
		return product;
	}

	public void deleteProductr(int ProductID) {

		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		Product product = (Product) session.get(Product.class, ProductID);
		session.delete(product);
		session.getTransaction().commit();
		session.close();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Product> getAllProduct() {
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		List<Product> product = (List<Product>) session.createQuery(
				"FROM Product WHERE deleted = 0 ORDER BY ProductName").list();
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
			product = (List<Product>) session
					.createQuery(
							"FROM Product WHERE Deleted = 0 and ProductCode LIKE '%"
									+ productCode
									+ "%' AND ProductName LIKE '%"
									+ productName + "%'").list();

		} else {
			product = (List<Product>) session.createQuery(
					"FROM Product WHERE Deleted = 0 and ProductCode LIKE '%" + productCode
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
