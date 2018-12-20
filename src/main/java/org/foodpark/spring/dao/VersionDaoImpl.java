package org.foodpark.spring.dao;

import java.util.List;

import org.foodpark.spring.model.Version;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

@Repository
public class VersionDaoImpl extends AbstractDao implements VersionDao {

	@Override
	public Version saveVersion(Version version) {
		getSession().saveOrUpdate(version);
		return version;
	}

	@Override
	public Version updateVersion(Version version) {
		getSession().update(version);
		return version;
	}

	@Override
	public List<Version> getAllVersion() {
		return getSession().createCriteria(Version.class).list();
	}

	@Override
	public Version getVersionById(Integer id) {
		return (Version) getSession().get(Version.class, id);
	}

	@Override
	public List<Version> getVersionByCurrentVersion(String currentVersion) {
		String hql = "FROM Version WHERE currentVersion like '%" + currentVersion + "%'";
		Query query = getSession().createQuery(hql);
		return query.list();
	}

	public List<Version> getVersionBySearch(String modifiedDate, String approvedDate) {

		StringBuffer sb = new StringBuffer();
		sb.append("FROM Version");
		if (modifiedDate != null || approvedDate != null) {
			sb.append(" WHERE");
		}
		if (modifiedDate != null && !modifiedDate.isEmpty()) {
			sb.append(" modifiedDate like '%" + modifiedDate + "%'");
		}
		if (approvedDate != null && !approvedDate.isEmpty()) {
			if (modifiedDate != null || modifiedDate != null) {
				sb.append(" and");
			}
			sb.append(" approvedDate like '%" + approvedDate + "%'");
		}
		Query query = getSession().createQuery(sb.toString());
		return query.list();
	}

}
