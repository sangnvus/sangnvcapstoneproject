package fu.mdms.dao;

import java.util.List;

import fu.mdms.model.ExportBill;
import fu.mdms.model.ExportBillDetail;
import fu.mdms.model.ImportBill;
import fu.mdms.model.ImportBillDetail;

public interface BillDao {
	public void createImportBill(ImportBill importBill);
	public void createImportBillDetail(ImportBillDetail importBillDetail);

	public void editImportBill(ImportBill importBill);

	public void deleteImportBill(int importBillID);

	public ImportBill getImportBillByID(int importBillID);

	public List<ImportBill> getAllImportBills();

	public List<ImportBill> searchImportBill(String supplier);

	public void createExportBill(ExportBill exportBill);
	
	public void createExportBillDetail(ExportBillDetail exportBillDetail);
	
	public ExportBill getExportBill(int exportBillID);
	
	public List<ExportBillDetail> getExBillDetailByExBillID(int exportBillID);
	
	public List<ExportBill> getExportBillsByOrderID(int orderID);
	
	public int getLastInsertEx();
	public int getLastInsertIm();

	//public List<ExportBill> getAllExportBills(); tren prototype chua co

	//public List<ExportBill> searchExportBill(String supplier); ??? chuc nang nay chua co tren prototype
}
