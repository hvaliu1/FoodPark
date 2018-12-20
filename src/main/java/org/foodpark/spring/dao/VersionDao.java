package org.foodpark.spring.dao;

import java.util.List;

import org.foodpark.spring.model.Version;

public interface VersionDao {

	public Version saveVersion(Version version);
	
	public Version updateVersion(Version version);
	
	public List<Version> getAllVersion();

	public Version getVersionById(Integer id);

	public List<Version> getVersionByCurrentVersion(String currentVersion);
	
	public List<Version> getVersionBySearch(String modifiedDate, String approvedDate);
}
