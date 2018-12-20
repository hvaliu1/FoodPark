package org.foodpark.spring.service;

import java.util.List;

import javax.transaction.Transactional;

import org.foodpark.spring.dao.CategoryDao;
import org.foodpark.spring.model.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {
	
	@Autowired
	private CategoryDao categoryDao;

	@Override
	public Category saveCategory(Category category) {
		return categoryDao.saveCategory(category);
	}

	@Override
	public Category updateCategory(Category category) {
		return categoryDao.updateCategory(category);
	}

	@Override
	public List<Category> getAllCategory() {
		return categoryDao.getAllCategory();
	}

	@Override
	public Category getCategoryById(Integer id) {
		return categoryDao.getCategoryById(id);
	}

	@Override
	public List<Category> getCategoryByName(String categoryName) {
		return categoryDao.getCategoryByName(categoryName);
	}

	@Override
	public List<Category> getCategoryBySearch(String categoryName, String subcategoryName) {
		return categoryDao.getCategoryBySearch(categoryName, subcategoryName);
	}

}
