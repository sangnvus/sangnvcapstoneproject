package fu.mdms.model;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Set;

public class ExportBill {
	private int exportBillID;
	private Dealer dealer;
	private Order order;
	private Set<ExportBillDetail> exportBillDetail;
	private Date createDate;
	private Date exportDate;
	private boolean status;
	public ExportBill() {
		super();
	}
	public ExportBill(Dealer dealer, Order order,
			Set<ExportBillDetail> exportBillDetail, Date createDate,
			Date exportDate, boolean status) {
		super();
		this.dealer = dealer;
		this.order = order;
		this.exportBillDetail = exportBillDetail;
		this.createDate = createDate;
		this.exportDate = exportDate;
		this.status = status;
	}
	
	public ExportBill(Dealer dealer, Order order, String createDate,
			String exportDate) {
		super();
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date createDate1=null;
		Date exportDate1=null;
		try {
			createDate1 = (Date)formatter.parse(createDate);
			exportDate1 = (Date)formatter.parse(exportDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		this.dealer = dealer;
		this.order = order;
		this.createDate = createDate1;
		this.exportDate = exportDate1;
	}
	public int getExportBillID() {
		return exportBillID;
	}
	public void setExportBillID(int exportBillID) {
		this.exportBillID = exportBillID;
	}
	public Dealer getDealer() {
		return dealer;
	}
	public void setDealer(Dealer dealer) {
		this.dealer = dealer;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public Set<ExportBillDetail> getExportBillDetail() {
		return exportBillDetail;
	}
	public void setExportBillDetail(Set<ExportBillDetail> exportBillDetail) {
		this.exportBillDetail = exportBillDetail;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getExportDate() {
		return exportDate;
	}
	public void setExportDate(Date exportDate) {
		this.exportDate = exportDate;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	
}
