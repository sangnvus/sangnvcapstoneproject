package fu.mdms.model;

import java.util.Set;

public class District {
	private String districtID;
	private Province province;
	private String districtName;
	private String districtType;
	private String location;
	private Set<Supplier> supplier;
	private Set<Dealer> dealer;
	private Set<User> user;
	public District() {
		super();
	}
	public District(Province province, String districtName,
			String districtType, String location, Set<Supplier> supplier,
			Set<Dealer> dealer, Set<User> user) {
		super();
		this.province = province;
		this.districtName = districtName;
		this.districtType = districtType;
		this.location = location;
		this.supplier = supplier;
		this.dealer = dealer;
		this.user = user;
	}
	public String getDistrictID() {
		return districtID;
	}
	public void setDistrictID(String districtID) {
		this.districtID = districtID;
	}
	public Province getProvince() {
		return province;
	}
	public void setProvince(Province province) {
		this.province = province;
	}
	public String getDistrictName() {
		return districtName;
	}
	public void setDistrictName(String districtName) {
		this.districtName = districtName;
	}
	public String getDistrictType() {
		return districtType;
	}
	public void setDistrictType(String districtType) {
		this.districtType = districtType;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public Set<Supplier> getSupplier() {
		return supplier;
	}
	public void setSupplier(Set<Supplier> supplier) {
		this.supplier = supplier;
	}
	public Set<Dealer> getDealer() {
		return dealer;
	}
	public void setDealer(Set<Dealer> dealer) {
		this.dealer = dealer;
	}
	public Set<User> getUser() {
		return user;
	}
	public void setUser(Set<User> user) {
		this.user = user;
	}
	
}
