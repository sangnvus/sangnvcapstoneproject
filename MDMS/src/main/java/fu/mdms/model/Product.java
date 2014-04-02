package fu.mdms.model;

import java.math.BigDecimal;
import java.util.Set;

public class Product {
	private int productID;
	private Producer producer;
	private Category category;
	private Supplier supplier;
	private Set<PriceHistory> priceHistory;
	private Set<OrderDetail> orderDetail;
	private Set<ExportBillDetail> exportBillDetail;
	private Set<ImportBillDetail> importBillDetail;
	private String productCode;
	private String productName;
	private String packagedType;
	private int unitsInStock;
	private int unitsOnOrders;
	private BigDecimal importPrice;
	private BigDecimal exportPrice;
	private String description;
	private boolean deleted;

	public Product() {
		super();
	}

	public Product(Producer producer, Category category, Supplier supplier,
			Set<PriceHistory> priceHistory, Set<OrderDetail> orderDetail,
			Set<ExportBillDetail> exportBillDetail,
			Set<ImportBillDetail> importBillDetail, String productCode,
			String productName, String packagedType, int unitsInStock,
			int unitsOnOrders, BigDecimal importPrice, BigDecimal exportPrice,
			String description) {
		super();
		this.producer = producer;
		this.category = category;
		this.supplier = supplier;
		this.priceHistory = priceHistory;
		this.orderDetail = orderDetail;
		this.exportBillDetail = exportBillDetail;
		this.importBillDetail = importBillDetail;
		this.productCode = productCode;
		this.productName = productName;
		this.packagedType = packagedType;
		this.unitsInStock = unitsInStock;
		this.unitsOnOrders = unitsOnOrders;
		this.importPrice = importPrice;
		this.exportPrice = exportPrice;
		this.description = description;
	}

	public int getProductID() {
		return productID;
	}

	public void setProductID(int productID) {
		this.productID = productID;
	}

	public Producer getProducer() {
		return producer;
	}

	public void setProducer(Producer producer) {
		this.producer = producer;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Supplier getSupplier() {
		return supplier;
	}

	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}

	public Set<PriceHistory> getPriceHistory() {
		return priceHistory;
	}

	public void setPriceHistory(Set<PriceHistory> priceHistory) {
		this.priceHistory = priceHistory;
	}

	public Set<OrderDetail> getOrderDetail() {
		return orderDetail;
	}

	public void setOrderDetail(Set<OrderDetail> orderDetail) {
		this.orderDetail = orderDetail;
	}

	public Set<ExportBillDetail> getExportBillDetail() {
		return exportBillDetail;
	}

	public void setExportBillDetail(Set<ExportBillDetail> exportBillDetail) {
		this.exportBillDetail = exportBillDetail;
	}

	public Set<ImportBillDetail> getImportBillDetail() {
		return importBillDetail;
	}

	public void setImportBillDetail(Set<ImportBillDetail> importBillDetail) {
		this.importBillDetail = importBillDetail;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getPackagedType() {
		return packagedType;
	}

	public void setPackagedType(String packagedType) {
		this.packagedType = packagedType;
	}

	public int getUnitsInStock() {
		return unitsInStock;
	}

	public void setUnitsInStock(int unitsInStock) {
		this.unitsInStock = unitsInStock;
	}

	public int getUnitsOnOrders() {
		return unitsOnOrders;
	}

	public void setUnitsOnOrders(int unitsOnOrders) {
		this.unitsOnOrders = unitsOnOrders;
	}

	public BigDecimal getImportPrice() {
		return importPrice;
	}

	public void setImportPrice(BigDecimal importPrice) {
		this.importPrice = importPrice;
	}

	public BigDecimal getExportPrice() {
		return exportPrice;
	}

	public void setExportPrice(BigDecimal exportPrice) {
		this.exportPrice = exportPrice;
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
