package org.foodpark.spring.service;

import java.util.List;

import org.foodpark.spring.model.DataDictionary;

public interface DataDictionaryService {

	public DataDictionary saveDataDictionaryy(DataDictionary dataDictionary);

	public DataDictionary updateDataDictionary(DataDictionary dataDictionary);

	public List<DataDictionary> getAllDataDictionary();

	public DataDictionary getDataDictionaryById(Integer id);

	public List<DataDictionary> getDataDictionaryBySheet(String sheet);

	public List<DataDictionary> getDataDictionaryBySearch(String columnName, String description);

}
