package org.foodpark.spring.service;

import java.util.List;

import javax.transaction.Transactional;

import org.foodpark.spring.dao.VersionDao;
import org.foodpark.spring.model.Version;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class VersionServiceImpl implements VersionService {

	@Autowired
	private VersionDao versionDao;
	
	
	@Override
	public Version saveVersion(Version version) {
		return versionDao.saveVersion(version);
	}

	@Override
	public Version updateVersion(Version version) {
		return versionDao.updateVersion(version);
	}

	@Override
	public List<Version> getAllVersion() {
		return versionDao.getAllVersion();
	}

	@Override
	public Version getVersionById(Integer id) {
		return versionDao.getVersionById(id);
	}

	@Override
	public List<Version> getVersionByCurrentVersion(String currentVersion) {
		return versionDao.getVersionByCurrentVersion(currentVersion);
	}

	@Override
	public List<Version> getVersionBySearch(String modifiedDate, String approvedDate) {
		return versionDao.getVersionBySearch(modifiedDate, approvedDate);
	}

}
