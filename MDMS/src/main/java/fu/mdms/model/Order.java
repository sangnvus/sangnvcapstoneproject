package fu.mdms.model;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Set;

public class Order {
	private int orderID;
	private User user;
	private Dealer dealer;
	private Set<OrderDetail> orderDetail;
	private Set<ExportBill> exportBill;
	private Date orderDate;
	private Date requiredDate;
	private int status;
	public Order() {
		super();
	}
	public Order(User user, Dealer dealer, Set<OrderDetail> orderDetail,
			Set<ExportBill> exportBill, Date orderDate, Date requiredDate,
			int status) {
		super();
		this.user = user;
		this.dealer = dealer;
		this.orderDetail = orderDetail;
		this.exportBill = exportBill;
		this.orderDate = orderDate;
		this.requiredDate = requiredDate;
		this.status = status;
	}
	
	public Order(User user, Dealer dealer, String orderDate, String requiredDate,
			int status) {
		super();
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date orderDate1=null;
		Date requiredDate1=null;
		try {
			orderDate1 = (Date)formatter.parse(orderDate);
			requiredDate1 = (Date)formatter.parse(requiredDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		this.user = user;
		this.dealer = dealer;
		this.orderDate = orderDate1;
		this.requiredDate = requiredDate1;
		this.status = status;
	}
	public int getOrderID() {
		return orderID;
	}
	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Dealer getDealer() {
		return dealer;
	}
	public void setDealer(Dealer dealer) {
		this.dealer = dealer;
	}
	public Set<OrderDetail> getOrderDetail() {
		return orderDetail;
	}
	public void setOrderDetail(Set<OrderDetail> orderDetail) {
		this.orderDetail = orderDetail;
	}
	public Set<ExportBill> getExportBill() {
		return exportBill;
	}
	public void setExportBill(Set<ExportBill> exportBill) {
		this.exportBill = exportBill;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public Date getRequiredDate() {
		return requiredDate;
	}
	public void setRequiredDate(Date requiredDate) {
		this.requiredDate = requiredDate;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getDisplayRequiredDate(){
		SimpleDateFormat format = new SimpleDateFormat("MM-dd-yyyy");
		System.out.println(format.format(requiredDate));
		return format.format(requiredDate);
	}
	public String getDisplayOrderDate(){
		SimpleDateFormat format = new SimpleDateFormat("MM-dd-yyyy");
		System.out.println(format.format(requiredDate));
		return format.format(orderDate);
	}
	
}
