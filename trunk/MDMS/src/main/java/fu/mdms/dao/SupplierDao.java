package fu.mdms.dao;

import java.util.List;

import fu.mdms.model.Supplier;


public interface SupplierDao {
	public void createSupplier(Supplier supplier);

	public void editSupplier(Supplier supplier);

	public void deleteSupplier(int supplierID);

	public Supplier getSupplier(int supplierID);

	public List<Supplier> getAllSupplier();

	public List<Supplier> searchSupplier(String supplierName);
}
