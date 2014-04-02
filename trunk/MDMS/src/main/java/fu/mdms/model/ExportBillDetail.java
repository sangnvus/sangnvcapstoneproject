package fu.mdms.model;

import java.math.BigDecimal;

public class ExportBillDetail {
	private int exportBillDetailID;
	private ExportBill exportBill;
	private Product product;
	private BigDecimal exportPrice;
	private int quantity;
	private double discount;
	public ExportBillDetail() {
		super();
	}
	public ExportBillDetail(ExportBill exportBill, Product product,
			BigDecimal exportPrice, int quantity, double discount) {
		super();
		this.exportBill = exportBill;
		this.product = product;
		this.exportPrice = exportPrice;
		this.quantity = quantity;
		this.discount = discount;
	}
	
	public int getExportBillDetailID() {
		return exportBillDetailID;
	}
	public void setExportBillDetailID(int exportBillDetailID) {
		this.exportBillDetailID = exportBillDetailID;
	}
	public ExportBill getExportBill() {
		return exportBill;
	}
	public void setExportBill(ExportBill exportBill) {
		this.exportBill = exportBill;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public BigDecimal getExportPrice() {
		return exportPrice;
	}
	public void setExportPrice(BigDecimal exportPrice) {
		this.exportPrice = exportPrice;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getDiscount() {
		return discount;
	}
	public void setDiscount(double discount) {
		this.discount = discount;
	}
	
}
