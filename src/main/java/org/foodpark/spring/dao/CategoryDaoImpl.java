package org.foodpark.spring.dao;

import java.util.List;

import org.foodpark.spring.model.Category;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryDaoImpl extends AbstractDao implements CategoryDao {

	@Override
	public Category saveCategory(Category category) {
		getSession().saveOrUpdate(category);
		return category;
	}

	@Override
	public Category updateCategory(Category category) {
		getSession().update(category);
		return category;
	}

	@Override
	public List<Category> getAllCategory() {
		return getSession().createCriteria(Category.class).list();
	}

	@Override
	public Category getCategoryById(Integer id) {
		return (Category) getSession().get(Category.class, id);
	}

	@Override
	public List<Category> getCategoryByName(String categoryName) {
		String hql = "FROM Category WHERE categoryName like '%" + categoryName + "%'";
		Query query = getSession().createQuery(hql);
		return query.list();
	}

	@Override
	public List<Category> getCategoryBySearch(String categoryName, String subcategoryName) {
		StringBuffer sb = new StringBuffer();
		sb.append("FROM Category");
		if (categoryName != null || subcategoryName != null) {
			sb.append(" WHERE");
		}
		if (categoryName != null && !categoryName.isEmpty()) {
			sb.append(" categoryName like '%" + categoryName + "%'");
		}
		if (subcategoryName != null && !subcategoryName.isEmpty()) {
			if (categoryName != null && !categoryName.isEmpty()) {
				sb.append(" and");
			}
			sb.append(" subcategoryName like '%" + subcategoryName + "%'");
		}
		Query query = getSession().createQuery(sb.toString());
		return query.list();
	}

}
