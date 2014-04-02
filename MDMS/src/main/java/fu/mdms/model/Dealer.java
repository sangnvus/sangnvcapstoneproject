package fu.mdms.model;

import java.util.Set;

public class Dealer {
	private int dealerID;
	private District district;
	private User user;
	private Set<Order> order;
	private Set<ExportBill> exportBill;
	private String dealerName;
	private String viceGerent;
	private String address;
	private String phone;
	private String mobilePhone;
	private String fax;
	private String email;
	private String taxCode;
	private String businessLicenseCode;
	private int dealerRank;
	private boolean status;
	private String description;
	private boolean deleted;
	public Dealer() {
		super();
	}

	public Dealer(District district, User user, Set<Order> order,
			Set<ExportBill> exportBill, String dealerName, String viceGerent,
			String address, String phone, String mobilePhone, String fax,
			String email, String taxCode, String businessLicenseCode,
			int dealerRank, boolean status, String description) {
		super();
		this.district = district;
		this.user = user;
		this.order = order;
		this.exportBill = exportBill;
		this.dealerName = dealerName;
		this.viceGerent = viceGerent;
		this.address = address;
		this.phone = phone;
		this.mobilePhone = mobilePhone;
		this.fax = fax;
		this.email = email;
		this.taxCode = taxCode;
		this.businessLicenseCode = businessLicenseCode;
		this.dealerRank = dealerRank;
		this.status = status;
		this.description = description;
	}

	public int getDealerID() {
		return dealerID;
	}

	public void setDealerID(int dealerID) {
		this.dealerID = dealerID;
	}

	public District getDistrict() {
		return district;
	}

	public void setDistrict(District district) {
		this.district = district;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Set<Order> getOrder() {
		return order;
	}

	public void setOrder(Set<Order> order) {
		this.order = order;
	}

	public Set<ExportBill> getExportBill() {
		return exportBill;
	}

	public void setExportBill(Set<ExportBill> exportBill) {
		this.exportBill = exportBill;
	}

	public String getDealerName() {
		return dealerName;
	}

	public void setDealerName(String dealerName) {
		this.dealerName = dealerName;
	}

	public String getViceGerent() {
		return viceGerent;
	}

	public void setViceGerent(String viceGerent) {
		this.viceGerent = viceGerent;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMobilePhone() {
		return mobilePhone;
	}

	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTaxCode() {
		return taxCode;
	}

	public void setTaxCode(String taxCode) {
		this.taxCode = taxCode;
	}

	public String getBusinessLicenseCode() {
		return businessLicenseCode;
	}

	public void setBusinessLicenseCode(String businessLicenseCode) {
		this.businessLicenseCode = businessLicenseCode;
	}

	public int getDealerRank() {
		return dealerRank;
	}

	public void setDealerRank(int dealerRank) {
		this.dealerRank = dealerRank;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public boolean isDeleted() {
		return deleted;
	}

	public void setDeleted(boolean deleted) {
		this.deleted = deleted;
	}
	
}
