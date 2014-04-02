package fu.mdms.model;

import java.util.Set;

public class Category {
	private int categoryID;
	private Set<Product> product;
	private String categoryName;
	private String description;
	private boolean deleted;
	
	public Category() {
		super();
	}
	
	public Category(Set<Product> product, String categoryName,
			String description) {
		super();
		this.product = product;
		this.categoryName = categoryName;
		this.description = description;
	}

	public int getCategoryID() {
		return categoryID;
	}
	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}
	public Set<Product> getProduct() {
		return product;
	}
	public void setProduct(Set<Product> product) {
		this.product = product;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
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
