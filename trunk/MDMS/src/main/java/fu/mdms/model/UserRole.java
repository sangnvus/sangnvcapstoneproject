package fu.mdms.model;

import java.util.Set;

public class UserRole {
	private int roleID;
	private String roleName;
	private Set<User> user;
	
	public UserRole() {
		super();
	}

	public UserRole(String roleName, Set<User> user) {
		super();
		this.roleName = roleName;
		this.user = user;
	}

	public int getRoleID() {
		return roleID;
	}

	public void setRoleID(int roleID) {
		this.roleID = roleID;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public Set<User> getUser() {
		return user;
	}

	public void setUser(Set<User> user) {
		this.user = user;
	}
	
}
