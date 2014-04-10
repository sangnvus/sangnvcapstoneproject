package fu.mdms.dao;

import java.util.List;

import fu.mdms.model.User;
import fu.mdms.model.UserRole;

public interface UserDao {
	public void create(User user);
	public void editUser(User user);
	public void deleteUser(int userID);
	public User getUser(int userID);
	public List<User> getAllUser();
	public List<User> getUser(int roleID, String userName, String status);
	public User login(String userName, String password);
	public List<User> getUserByRole(int role);
	public void Logout();
	public List<UserRole> getUserRole();
	public UserRole getUserRoleByID(int userRoleID);
}
