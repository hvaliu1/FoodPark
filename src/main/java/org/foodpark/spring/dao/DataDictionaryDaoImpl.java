package org.foodpark.spring.dao;

import java.util.List;

import org.foodpark.spring.model.DataDictionary;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

@Repository
public class DataDictionaryDaoImpl extends AbstractDao implements DataDictionaryDao {

	@Override
	public DataDictionary saveDataDictionaryy(DataDictionary dataDictionary) {
		getSession().saveOrUpdate(dataDictionary);
		return dataDictionary;
	}

	@Override
	public DataDictionary updateDataDictionary(DataDictionary dataDictionary) {
		getSession().update(dataDictionary);
		return dataDictionary;
	}

	@Override
	public List<DataDictionary> getAllDataDictionary() {
		return getSession().createCriteria(DataDictionary.class).list();
	}

	@Override
	public DataDictionary getDataDictionaryById(Integer id) {
		return (DataDictionary) getSession().get(DataDictionary.class, id);
	}

	@Override
	public List<DataDictionary> getDataDictionaryBySheet(String sheet) {
		String hql = "FROM DataDictionary WHERE sheet like '%" + sheet + "%'";
		Query query = getSession().createQuery(hql);
		return query.list();
	}

	public List<DataDictionary> getDataDictionaryBySearch(String columnName, String description) {
		StringBuffer sb = new StringBuffer();
		sb.append("FROM DataDictionary");
		if (columnName != null || description != null) {
			sb.append(" WHERE");
		}
		if (columnName != null && !columnName.isEmpty()) {
			sb.append(" columnName like '%" + columnName + "%'");
		}
		if (description != null && !description.isEmpty()) {
			if (columnName != null && !columnName.isEmpty()) {
				sb.append(" and");
			}
			sb.append(" description like '%" + description + "%'");
		}
		Query query = getSession().createQuery(sb.toString());
		return query.list();
	}

}
