package org.foodpark.spring.dao;

import java.util.List;

import org.foodpark.spring.model.CookingMethods;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

@Repository
public class CookingMethodsDaoImpl extends AbstractDao implements CookingMethodsDao {

	@Override
	public CookingMethods saveCookingMethods(CookingMethods cookingMethods) {
		getSession().saveOrUpdate(cookingMethods);
		return cookingMethods;
	}

	@Override
	public CookingMethods updateCookingMethods(CookingMethods cookingMethods) {
		getSession().update(cookingMethods);
		return cookingMethods;
	}

	@Override
	public List<CookingMethods> getAllCookingMethods() {
		return getSession().createCriteria(CookingMethods.class).list();
	}

	@Override
	public CookingMethods getCookingMethodsById(Integer id) {
		return (CookingMethods) getSession().get(CookingMethods.class, id);
	}

	@Override
	public List<CookingMethods> getCookingMethodsBySizeMetric(String sizeMetric) {
		String hql = "FROM CookingMethods WHERE sizeMetric like '%" + sizeMetric + "%'";
		Query query = getSession().createQuery(hql);
		return query.list();
	}

	public List<CookingMethods> getCookingMethodsBySearch(Integer productId, String cookingMethod, String cookingTemperature) {
		StringBuffer sb = new StringBuffer();
		sb.append("FROM CookingMethods");
		if (productId != null || cookingMethod != null || cookingTemperature != null) {
			sb.append(" WHERE");
		}
		if (productId != null) {
			sb.append(" product =" + productId);
		}
		if (cookingMethod != null && !cookingMethod.isEmpty()) {
			if (productId != null) {
				sb.append(" and");
			}
			sb.append(" cookingMethod like '%" + cookingMethod + "%'");
		}
		if (cookingTemperature != null && !cookingTemperature.isEmpty()) {
			if (productId != null || cookingMethod != null) {
				sb.append(" and");
			}
			sb.append(" cookingTemperature like '%" + cookingTemperature + "%'");
		}
		Query query = getSession().createQuery(sb.toString());
		return query.list();
	}

}
