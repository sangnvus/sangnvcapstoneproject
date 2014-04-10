package fu.mdms.model;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Set;

public class ImportBill {
	private int importBillID;
	private Supplier supplier;
	private Set<ImportBillDetail> importBillDetail;
	private Date importDate;
	private int status;
	public ImportBill() {
		super();
	}
	public ImportBill(Supplier supplier,
			Set<ImportBillDetail> importBillDetail, Date importDate) {
		super();
		this.supplier = supplier;
		this.importBillDetail = importBillDetail;
		this.importDate = importDate;
	}
	public ImportBill(Supplier supplier, String importDate, int status) {
		super();
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date importDate1=null;
		try {
			importDate1 = (Date)formatter.parse(importDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		this.supplier = supplier;
		this.importDate = importDate1;
		this.status=status;
	}
	public int getImportBillID() {
		return importBillID;
	}
	public void setImportBillID(int importBillID) {
		this.importBillID = importBillID;
	}
	public Supplier getSupplier() {
		return supplier;
	}
	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}
	public Set<ImportBillDetail> getImportBillDetail() {
		return importBillDetail;
	}
	public void setImportBillDetail(Set<ImportBillDetail> importBillDetail) {
		this.importBillDetail = importBillDetail;
	}
	public Date getImportDate() {
		return importDate;
	}
	public void setImportDate(Date importDate) {
		this.importDate = importDate;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
}
