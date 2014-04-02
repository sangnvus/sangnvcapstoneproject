package fu.mdms.model;

import java.util.Date;
import java.util.Set;

public class User {
	private int userID;
	private District district;
	private Set<Dealer> dealer;
	private UserRole userRole;
	private Set<Order> order;
	private String userName;
	private String password;
	private String fullName;
	private String phone;
	private String email;
	private String address;
	private Date dateOfBirth;
	private boolean deleted;

	public User() {
		super();
	}

	public User(District district, Set<Dealer> dealer, UserRole userRole,
			Set<Order> order, String userName, String password,
			String fullName, String phone, String email, String address,
			Date dateOfBirth) {
		super();
		this.district = district;
		this.dealer = dealer;
		this.userRole = userRole;
		this.order = order;
		this.userName = userName;
		this.password = password;
		this.fullName = fullName;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.dateOfBirth = dateOfBirth;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public District getDistrict() {
		return district;
	}

	public void setDistrict(District district) {
		this.district = district;
	}

	public Set<Dealer> getDealer() {
		return dealer;
	}

	public void setDealer(Set<Dealer> dealer) {
		this.dealer = dealer;
	}

	public UserRole getUserRole() {
		return userRole;
	}

	public void setUserRole(UserRole userRole) {
		this.userRole = userRole;
	}

	public Set<Order> getOrder() {
		return order;
	}

	public void setOrder(Set<Order> order) {
		this.order = order;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public boolean isDeleted() {
		return deleted;
	}

	public void setDeleted(boolean deleted) {
		this.deleted = deleted;
	}

}
