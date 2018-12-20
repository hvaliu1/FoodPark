package org.foodpark.spring.controller;

import java.util.List;

import org.foodpark.spring.model.DataDictionary;
import org.foodpark.spring.service.DataDictionaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/data_dictionary")
public class DataDictionaryController {

	@Autowired
	private DataDictionaryService dataDictionaryService;
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public DataDictionary saveDataDictionary(@RequestBody DataDictionary dataDictionary) {

        return dataDictionaryService.saveDataDictionaryy(dataDictionary);
    }
	
	@RequestMapping(value = "/update", method = RequestMethod.PUT)
    @ResponseBody
    public DataDictionary updateDataDictionary(@RequestBody DataDictionary dataDictionary) {

        return dataDictionaryService.updateDataDictionary(dataDictionary);
    }
	
	@RequestMapping(value = "/get", method = RequestMethod.GET)
    @ResponseBody
    public List<DataDictionary> getAllDataDictionary() {

        return dataDictionaryService.getAllDataDictionary();
    }
	
	@RequestMapping(value = "/get/{id}", method = RequestMethod.GET)
    @ResponseBody
    public DataDictionary getDataDictionaryById(@PathVariable Integer id) {

        return dataDictionaryService.getDataDictionaryById(id);
    }
	
	@RequestMapping(value = "/get/sheet/{sheet}", method = RequestMethod.GET)
    @ResponseBody
    public List<DataDictionary> getDataDictionaryBySheet(@PathVariable String sheet) {

        return dataDictionaryService.getDataDictionaryBySheet(sheet);
    }
	
	@RequestMapping(value = "/get/by/search", method = RequestMethod.GET)
    @ResponseBody
    public List<DataDictionary> getDataDictionaryBySearch(String columnName, String description) {

        return dataDictionaryService.getDataDictionaryBySearch(columnName, description);
    }
}
