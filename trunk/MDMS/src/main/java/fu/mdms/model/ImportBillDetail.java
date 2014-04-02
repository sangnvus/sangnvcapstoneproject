package fu.mdms.model;

import java.math.BigDecimal;

public class ImportBillDetail {
	private int importBillDetailID;
	private ImportBill importBill;
	private Product product;
	private BigDecimal importPrice;
	private int quantity;
	public ImportBillDetail() {
		super();
	}
	public ImportBillDetail(ImportBill importBill, Product product,
			BigDecimal importPrice, int quantity) {
		super();
		this.importBill = importBill;
		this.product = product;
		this.importPrice = importPrice;
		this.quantity = quantity;
	}
	
	public int getImportBillDetailID() {
		return importBillDetailID;
	}
	public void setImportBillDetailID(int importBillDetailID) {
		this.importBillDetailID = importBillDetailID;
	}
	public ImportBill getImportBill() {
		return importBill;
	}
	public void setImportBill(ImportBill importBill) {
		this.importBill = importBill;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public BigDecimal getImportPrice() {
		return importPrice;
	}
	public void setImportPrice(BigDecimal importPrice) {
		this.importPrice = importPrice;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
}
