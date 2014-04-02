package fu.mdms.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import fu.mdms.dao.BillDao;
import fu.mdms.model.ExportBill;
import fu.mdms.model.ImportBill;
import fu.mdms.util.HibernateUtil;

public class BillDaoImpl implements BillDao{

	public void createImportBill(ImportBill importBill){}

	public void editImportBill(ImportBill importBill){}

	public void deleteImportBill(int importBillID){}

	public ImportBill getImportBill(int importBillID){return null;}

	@SuppressWarnings("unchecked")
	public List<ImportBill> getAllImportBills(){
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		List<ImportBill> importBill = (List<ImportBill>) session.createQuery("FROM ImportBill").list();
		session.getTransaction().commit();
		session.close();
		return importBill;
		}

	public List<ImportBill> searchImportBill(String supplier){ return null;}

	public void createExportBill(ExportBill exportBill){}
	//public List<ExportBill> getAllExportBills(); tren prototype chua co

		//public List<ExportBill> searchExportBill(String supplier); ??? chuc nang nay chua co tren prototype

}
