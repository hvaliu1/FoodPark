package org.foodpark.spring.service;

import java.util.List;

import javax.transaction.Transactional;

import org.foodpark.spring.dao.DataDictionaryDao;
import org.foodpark.spring.model.DataDictionary;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class DataDictionaryServiceImpl implements DataDictionaryService {
	
	@Autowired
	private DataDictionaryDao dataDictionaryDao;
	
	
	@Override
	public DataDictionary saveDataDictionaryy(DataDictionary dataDictionary) {
		return dataDictionaryDao.saveDataDictionaryy(dataDictionary);
	}

	@Override
	public DataDictionary updateDataDictionary(DataDictionary dataDictionary) {
		return dataDictionaryDao.updateDataDictionary(dataDictionary);
	}

	@Override
	public List<DataDictionary> getAllDataDictionary() {
		return dataDictionaryDao.getAllDataDictionary();
	}

	@Override
	public DataDictionary getDataDictionaryById(Integer id) {
		return dataDictionaryDao.getDataDictionaryById(id);
	}

	@Override
	public List<DataDictionary> getDataDictionaryBySheet(String sheet) {
		return dataDictionaryDao.getDataDictionaryBySheet(sheet);
	}

	@Override
	public List<DataDictionary> getDataDictionaryBySearch(String columnName, String description) {
		return dataDictionaryDao.getDataDictionaryBySearch(columnName, description);
	}

}
