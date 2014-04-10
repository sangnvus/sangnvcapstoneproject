package fu.mdms.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import fu.mdms.dao.CategoryDao;
import fu.mdms.model.Category;
import fu.mdms.model.UserRole;
import fu.mdms.util.HibernateUtil;

public class CategoryImpl implements CategoryDao {

	public void createCategory(Category category) {
	}

	public void editCategory(Category category) {
	}

	public void deleteCategory(int CategoryID) {
	}

	public Category getCategory(int CategoryID) {
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		Category category = (Category) session.get(Category.class, CategoryID);
		session.getTransaction().commit();
		session.close();
		return category;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Category> getAllCategory() {

		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		List<Category> category = (List<Category>) session.createQuery(
				"FROM Category").list();
		session.getTransaction().commit();
		session.close();
		return category;
	}
}
