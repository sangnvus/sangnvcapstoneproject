package fu.mdms.model;

import java.math.BigDecimal;
import java.util.Date;

public class PriceHistory {
	private int priceHistoryID;
	private Product product;
	private Date date;
	private BigDecimal importPrice;
	public PriceHistory() {
		super();
	}
	public PriceHistory(Product product, Date date, BigDecimal importPrice) {
		super();
		this.product = product;
		this.date = date;
		this.importPrice = importPrice;
	}
	public int getPriceHistoryID() {
		return priceHistoryID;
	}
	public void setPriceHistoryID(int priceHistoryID) {
		this.priceHistoryID = priceHistoryID;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public BigDecimal getImportPrice() {
		return importPrice;
	}
	public void setImportPrice(BigDecimal importPrice) {
		this.importPrice = importPrice;
	}
	
}
