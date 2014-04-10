package fu.mdms.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import fu.mdms.dao.BillDao;
import fu.mdms.model.ExportBill;
import fu.mdms.model.ExportBillDetail;
import fu.mdms.model.ImportBill;
import fu.mdms.model.ImportBillDetail;
import fu.mdms.util.HibernateUtil;

public class BillDaoImpl implements BillDao {

	public void createImportBill(ImportBill importBill) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		session.save(importBill);
		session.getTransaction().commit();
		session.close();
	}

	public void editImportBill(ImportBill importBill) {
	}

	public void deleteImportBill(int importBillID) {
	}

	public ImportBill getImportBillByID(int importBillID) {
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		ImportBill importBill = (ImportBill) session.get(ImportBill.class, importBillID);
		session.getTransaction().commit();
		session.close();
		return importBill;
	}

	@SuppressWarnings("unchecked")
	public List<ImportBill> getAllImportBills() {
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		List<ImportBill> importBill = (List<ImportBill>) session.createQuery(
				"FROM ImportBill").list();
		session.getTransaction().commit();
		session.close();
		return importBill;
	}

	public List<ImportBill> searchImportBill(String supplier) {
		return null;
	}

	public void createExportBill(ExportBill exportBill) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		session.save(exportBill);
		session.getTransaction().commit();
		session.close();

	}
	public ExportBill getExportBill(int exportBillID) {
		// TODO Auto-generated method stub
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		ExportBill exportBill = (ExportBill) session.get(ExportBill.class, exportBillID);
		session.getTransaction().commit();
		session.close();
		return exportBill;
	}

	public int getLastInsertEx() {
		// TODO Auto-generated method stub
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		Query query = session.createSQLQuery("SELECT Max(ExportBillID) FROM exportbills");
		return (Integer)query.list().get(0);
	}
	public int getLastInsertIm() {
		// TODO Auto-generated method stub
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		Query query = session.createSQLQuery("SELECT Max(ImportBillID) FROM importbills");
		return (Integer)query.list().get(0);
	}
	// public List<ExportBill> getAllExportBills(); tren prototype chua co

	@Override
	public void createExportBillDetail(ExportBillDetail exportBillDetail) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		session.save(exportBillDetail);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public List<ExportBillDetail> getExBillDetailByExBillID(int exportBillID) {
		// TODO Auto-generated method stub
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		Query query = session.createQuery("from ExportBillDetail where exportBillID = :exportBillID ");
		query.setParameter("exportBillID", exportBillID);
		@SuppressWarnings("unchecked")
		List<ExportBillDetail> exportBillDetailList = (List<ExportBillDetail>)query.list();
		return exportBillDetailList;
	}

	@Override
	public List<ExportBill> getExportBillsByOrderID(int orderID) {
		// TODO Auto-generated method stub
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		@SuppressWarnings("unchecked")
		List<ExportBill> exportBillList = (List<ExportBill>) session.createQuery("FROM ExportBill WHERE OrderID="+orderID).list();
		session.getTransaction().commit();
		session.close();
		return exportBillList;
	}

	@Override
	public void createImportBillDetail(ImportBillDetail importBillDetail) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		session.save(importBillDetail);
		session.getTransaction().commit();
		session.close();
	}

	// public List<ExportBill> searchExportBill(String supplier); ??? chuc nang
	// nay chua co tren prototype

}
