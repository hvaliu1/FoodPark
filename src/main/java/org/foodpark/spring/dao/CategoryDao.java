package org.foodpark.spring.dao;

import java.util.List;
import org.foodpark.spring.model.Category;

public interface CategoryDao {

	public Category saveCategory(Category category);

	public Category updateCategory(Category category);

	public List<Category> getAllCategory();

	public Category getCategoryById(Integer id);

	public List<Category> getCategoryByName(String categoryName);
	
	public List<Category> getCategoryBySearch(String categoryName, String subcategoryName);
}
