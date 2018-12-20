package org.foodpark.spring.model;

import java.util.List;

public class Output {

	private String fileName;
	
	private List<Sheets> sheets;

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public List<Sheets> getSheets() {
		return sheets;
	}

	public void setSheets(List<Sheets> sheets) {
		this.sheets = sheets;
	}

}
