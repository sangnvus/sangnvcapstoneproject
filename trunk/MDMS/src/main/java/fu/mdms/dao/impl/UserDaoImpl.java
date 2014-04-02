package fu.mdms.dao.impl;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import fu.mdms.dao.UserDao;
import fu.mdms.model.User;
import fu.mdms.model.UserRole;
import fu.mdms.util.HibernateUtil;

public class UserDaoImpl implements UserDao {
	@Override
	public void addUser(User user) {
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		session.save(user);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public void editUser(User user) {
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		session.update(user);
		session.getTransaction().commit();
		session.close();

	}

	@Override
	public void deleteUser(int userID) {
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		User user = (User) session.get(User.class, userID);
		session.delete(user);
		session.getTransaction().commit();
		session.close();

	}

	@Override
	public User getUser(int userID) {
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		User user = (User) session.get(User.class, userID);
		session.getTransaction().commit();
		session.close();
		return user;
	}

	@SuppressWarnings("unchecked")
	public List<User> getUser(int roleID, String userName, String status) {
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		List<User> users = null;
		// session.createQuery("FROM User").list();

		if (roleID == 0) {
			if (status.equalsIgnoreCase("-1")) {
				users = (List<User>) session.createQuery(
						"FROM User WHERE FullName LIKE '%" + userName + "%' ")
						.list();
			} else {
				users = (List<User>) session.createQuery(
						"FROM User WHERE FullName LIKE '%" + userName
								+ "%' AND Deleted =" + status + " ").list();
			}

		} else {
			if (status.equalsIgnoreCase("-1")) {
				users = (List<User>) session.createQuery(
						"FROM User WHERE RoleID =" + roleID
								+ " AND FullName LIKE '%" + userName + "%' ")
						.list();
			} else {
				users = (List<User>) session.createQuery(
						"FROM User WHERE RoleID =" + roleID
								+ " AND FullName LIKE '%" + userName
								+ "%' AND Deleted =" + status + "").list();
			}
		}
		session.getTransaction().commit();
		session.close();
		return users;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getAllUser() {
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		List<User> users = (List<User>) session.createQuery("FROM User").list();
		session.getTransaction().commit();
		session.close();
		return users;
	}

	@SuppressWarnings("unchecked")
	@Override
	public User login(String userName, String password) {
		System.out.println("login");
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		Query query = session.createQuery("from User where userName='"
				+ userName + "' and password='" + password + "'");
		List<User> userList = query.list();

		User user = new User();
		if (userList.isEmpty()) {
			UserRole userRole = new UserRole();
			userRole.setRoleID(0);
			userRole.setRoleName("");
			user.setUserID(0);
			user.setUserRole(userRole);
		} else {
			for (Iterator<User> iterator = userList.iterator(); iterator
					.hasNext();) {
				user = (User) iterator.next();
			}
		}

		return user;
	}

	@Override
	public List<User> getUserByRole(int role) {
		// TODO Auto-generated method stub
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		List<User> user = (List<User>) session.createQuery(
				"FROM User WHERE RoleID=" + role + "").list();
		session.getTransaction().commit();
		session.close();
		return user;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<UserRole> getUserRole() {
		// TODO Auto-generated method stub
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		List<UserRole> userRoleList = (List<UserRole>) session.createQuery(
				"FROM UserRole").list();

		session.getTransaction().commit();
		session.close();
		return userRoleList;
	}

	@Override
	public UserRole getUserRoleByID(int userRoleID) {
		// TODO Auto-generated method stub
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		UserRole userRole = (UserRole) session.get(UserRole.class, userRoleID);
		session.getTransaction().commit();
		session.close();
		return userRole;
	}

	@Override
	public void Logout() {
		// TODO Auto-generated method stub

	}
}
