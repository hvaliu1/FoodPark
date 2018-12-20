package org.foodpark.spring.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "version")
public class Version {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "data_version_number")
	private Integer dataVersionNumber;

	@Column(name = "current_version")
	private String currentVersion;

	@Column(name = "modified_date")
	private String modifiedDate;

	@Column(name = "fsis_approved_flag")
	private Boolean fsisApprovedFlag;

	@Column(name = "approved_date")
	private String approvedDate;

	@Column(name = "notes")
	private String notes;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getDataVersionNumber() {
		return dataVersionNumber;
	}

	public void setDataVersionNumber(Integer dataVersionNumber) {
		this.dataVersionNumber = dataVersionNumber;
	}

	public String getCurrentVersion() {
		return currentVersion;
	}

	public void setCurrentVersion(String currentVersion) {
		this.currentVersion = currentVersion;
	}

	public String getModifiedDate() {
		return modifiedDate;
	}

	public void setModifiedDate(String modifiedDate) {
		this.modifiedDate = modifiedDate;
	}

	public Boolean getFsisApprovedFlag() {
		return fsisApprovedFlag;
	}

	public void setFsisApprovedFlag(Boolean fsisApprovedFlag) {
		this.fsisApprovedFlag = fsisApprovedFlag;
	}

	public String getApprovedDate() {
		return approvedDate;
	}

	public void setApprovedDate(String approvedDate) {
		this.approvedDate = approvedDate;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

}