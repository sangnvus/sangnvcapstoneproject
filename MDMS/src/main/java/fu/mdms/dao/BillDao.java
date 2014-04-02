package fu.mdms.dao;

import java.util.List;

import fu.mdms.model.ExportBill;
import fu.mdms.model.ImportBill;

public interface BillDao {
	public void createImportBill(ImportBill importBill);

	public void editImportBill(ImportBill importBill);

	public void deleteImportBill(int importBillID);

	public ImportBill getImportBill(int importBillID);

	public List<ImportBill> getAllImportBills();

	public List<ImportBill> searchImportBill(String supplier);

	public void createExportBill(ExportBill exportBill);

	//public List<ExportBill> getAllExportBills(); tren prototype chua co

	//public List<ExportBill> searchExportBill(String supplier); ??? chuc nang nay chua co tren prototype
}
