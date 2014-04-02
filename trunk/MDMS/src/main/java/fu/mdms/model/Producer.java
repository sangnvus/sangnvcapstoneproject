package fu.mdms.model;

import java.util.Set;

public class Producer {
	private int producerID;
	private Set<Product> product;
	private String producerName;
	private String phone;
	private String email;
	private String webSite;
	private String description;
	private boolean deleted;
	public Producer() {
		super();
	}
	public Producer(Set<Product> product, String producerName, String phone,
			String email, String webSite, String description) {
		super();
		this.product = product;
		this.producerName = producerName;
		this.phone = phone;
		this.email = email;
		this.webSite = webSite;
		this.description = description;
	}
	public int getProducerID() {
		return producerID;
	}
	public void setProducerID(int producerID) {
		this.producerID = producerID;
	}
	public Set<Product> getProduct() {
		return product;
	}
	public void setProduct(Set<Product> product) {
		this.product = product;
	}
	public String getProducerName() {
		return producerName;
	}
	public void setProducerName(String producerName) {
		this.producerName = producerName;
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
	public String getWebSite() {
		return webSite;
	}
	public void setWebSite(String webSite) {
		this.webSite = webSite;
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
