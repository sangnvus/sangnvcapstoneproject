package fu.mdms.model;

import java.util.Set;

public class Supplier {
	private int supplierID;
	private District district;
	private Set<Product> product;
	private Set<ImportBill> importBill;
	private String supplierName;
	private String tax;
	private String businessLicenseCode;
	private String phone;
	private String fax;
	private String email;
	private String address;
	private String description;
	private boolean deleted;
	public Supplier() {
		super();
	}
	public Supplier(District district, Set<Product> product,
			Set<ImportBill> importBill, String supplierName, String tax,
			String businessLicenseCode, String phone, String fax, String email,
			String address, String description) {
		super();
		this.district = district;
		this.product = product;
		this.importBill = importBill;
		this.supplierName = supplierName;
		this.tax = tax;
		this.businessLicenseCode = businessLicenseCode;
		this.phone = phone;
		this.fax = fax;
		this.email = email;
		this.address = address;
		this.description = description;
	}
	public int getSupplierID() {
		return supplierID;
	}
	public void setSupplierID(int supplierID) {
		this.supplierID = supplierID;
	}
	public District getDistrict() {
		return district;
	}
	public void setDistrict(District district) {
		this.district = district;
	}
	public Set<Product> getProduct() {
		return product;
	}
	public void setProduct(Set<Product> product) {
		this.product = product;
	}
	public Set<ImportBill> getImportBill() {
		return importBill;
	}
	public void setImportBill(Set<ImportBill> importBill) {
		this.importBill = importBill;
	}
	public String getSupplierName() {
		return supplierName;
	}
	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
	public String getTax() {
		return tax;
	}
	public void setTax(String tax) {
		this.tax = tax;
	}
	public String getBusinessLicenseCode() {
		return businessLicenseCode;
	}
	public void setBusinessLicenseCode(String businessLicenseCode) {
		this.businessLicenseCode = businessLicenseCode;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
