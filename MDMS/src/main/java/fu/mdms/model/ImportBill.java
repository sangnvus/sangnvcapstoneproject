package fu.mdms.model;

import java.util.Date;
import java.util.Set;

public class ImportBill {
	private int importBillID;
	private Supplier supplier;
	private Set<ImportBillDetail> importBillDetail;
	private Date importDate;
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
	
}
