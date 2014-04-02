package fu.mdms.dao;

import java.util.List;

import fu.mdms.model.Category;


public interface CategoryDao {
	public void createCategory(Category category);

	public void editCategory(Category category);

	public void deleteCategory(int CategoryID);

	public Category getCategory(int CategoryID);

	public List<Category> getAllCategory();

	//public List<Category> searchCategory(String dealerName, String dealerStatus);
}
