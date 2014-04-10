package fu.mdms.dao;

import java.util.List;
import fu.mdms.model.Product;

public interface ProductDao {
	public void createProduct(Product product);

	public void editProduct(Product product);
	public void viewProduct(Product product);
	

	public void deleteProductr(int ProductID);

	public Product getProduct(int ProductID);
	

	public List<Product> searchProduct(String productCode, String productName, int categoryID);
	public List<Product> getAllProduct();
	public List<Product> searchProduct1(String productCode);
}
