package org.foodpark.spring.dao;

import java.util.List;

import org.foodpark.spring.model.CookingTips;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

@Repository
public class CookingTipsDaoImpl extends AbstractDao implements CookingTipsDao {

	@Override
	public CookingTips saveCookingTips(CookingTips cookingTips) {
		getSession().saveOrUpdate(cookingTips);
		return cookingTips;
	}

	@Override
	public CookingTips updateCookingTips(CookingTips cookingTips) {
		getSession().update(cookingTips);
		return cookingTips;
	}

	@Override
	public List<CookingTips> getAllCookingTips() {
		return getSession().createCriteria(CookingTips.class).list();
	}

	@Override
	public CookingTips getCookingTipsById(Integer id) {
		return (CookingTips) getSession().get(CookingTips.class, id);
	}

	@Override
	public List<CookingTips> getCookingTipsByTips(String tips) {
		String hql = "FROM CookingTips WHERE tips like '%" + tips + "%'";
		Query query = getSession().createQuery(hql);
		return query.list();
	}

	public List<CookingTips> getCookingTipsBySearch(Integer safeMinimumTemperature, Integer restTime,
			String restTimeMetric) {
		StringBuffer sb = new StringBuffer();
		sb.append("FROM CookingTips");
		if (safeMinimumTemperature != null || restTime != null || restTimeMetric != null) {
			sb.append(" WHERE");
		}
		if (safeMinimumTemperature != null) {
			sb.append(" safeMinimumTemperature =" + safeMinimumTemperature);
		}
		if (restTime != null) {
			if (safeMinimumTemperature != null) {
				sb.append(" and");
			}
			sb.append(" restTime =" + restTime);
		}
		if (restTimeMetric != null && !restTimeMetric.isEmpty()) {
			if (restTime != null || safeMinimumTemperature != null) {
				sb.append(" and");
			}
			sb.append(" restTimeMetric like '%" + restTimeMetric + "%'");
		}
		Query query = getSession().createQuery(sb.toString());
		return query.list();
	}

}
