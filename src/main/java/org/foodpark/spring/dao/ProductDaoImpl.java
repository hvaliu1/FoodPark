package org.foodpark.spring.dao;

import java.util.List;

import org.foodpark.spring.model.Product;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDaoImpl extends AbstractDao implements ProductDao {

	@Override
	public Product saveProduct(Product product) {
		getSession().saveOrUpdate(product);
		return product;
	}

	@Override
	public Product updateProduct(Product product) {
		getSession().update(product);
		return product;
	}

	@Override
	public List<Product> getAllProduct() {
		return getSession().createCriteria(Product.class).list();
	}

	@Override
	public Product getProductById(Integer id) {
		return (Product) getSession().get(Product.class, id);
	}

	@Override
	public List<Product> getProductByName(String name) {
		String hql = "FROM Product WHERE name like '%" + name + "%'";
		Query query = getSession().createQuery(hql);
		return query.list();
	}

	public List<Product> getProductBySearch(String nameSubtitle, String pantryMetric, String pantryTips) {
		StringBuffer sb = new StringBuffer();
		sb.append("FROM Product");
		if (nameSubtitle != null || pantryMetric != null || pantryTips != null) {
			sb.append(" WHERE");
		}
		if (nameSubtitle != null && !nameSubtitle.isEmpty()) {
			sb.append(" nameSubtitle like '%" + nameSubtitle + "%'");
		}
		if (pantryMetric != null && !pantryMetric.isEmpty()) {
			if (nameSubtitle != null && !nameSubtitle.isEmpty()) {
				sb.append(" and");
			}
			sb.append(" pantryMetric like '%" + pantryMetric + "%'");
		}
		if (pantryTips != null && !pantryTips.isEmpty()) {
			if (pantryMetric != null || nameSubtitle != null) {
				sb.append(" and");
			}
			sb.append(" pantryTips like '%" + pantryTips + "%'");
		}
		Query query = getSession().createQuery(sb.toString());
		return query.list();
	}

}
