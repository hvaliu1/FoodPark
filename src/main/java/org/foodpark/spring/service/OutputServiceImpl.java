package org.foodpark.spring.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.foodpark.spring.model.Category;
import org.foodpark.spring.model.CookingMethods;
import org.foodpark.spring.model.CookingTips;
import org.foodpark.spring.model.DataDictionary;
import org.foodpark.spring.model.Output;
import org.foodpark.spring.model.Product;
import org.foodpark.spring.model.Sheets;
import org.foodpark.spring.model.Version;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class OutputServiceImpl implements OutputService {

	@Autowired
	private VersionService versionService;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private ProductService productService;

	@Autowired
	private CookingTipsService cookingTipsService;

	@Autowired
	private CookingMethodsService cookingMethodsService;

	@Autowired
	private DataDictionaryService dataDictionaryService;

	@Override
	public Output getAllPackageList() {

		Output output = new Output();
		List<Sheets> list = new ArrayList<>();
		output.setFileName("FMA-Data-v128.xlsx");

		List<Version> versionList = versionService.getAllVersion();
		Sheets sheet = new Sheets();
		sheet.setName("Version");
		sheet.setData(versionList);
		sheet.setMaxCols(0);
		sheet.setMaxRows(versionList.size());
		list.add(sheet);
		output.setSheets(list);

		Sheets sheet1 = new Sheets();
		sheet1.setName("Category");
		List<Category> categoryList = categoryService.getAllCategory();
		sheet1.setData(categoryList);
		sheet1.setMaxCols(0);
		sheet1.setMaxRows(categoryList.size());
		list.add(sheet1);

		Sheets sheet2 = new Sheets();
		sheet2.setName("Product");
		List<Product> productList = productService.getAllProduct();
		sheet2.setData(productList);
		sheet2.setMaxCols(0);
		sheet2.setMaxRows(productList.size());
		list.add(sheet2);

		Sheets sheet3 = new Sheets();
		sheet3.setName("CookingTips");
		List<CookingTips> cookingTipsList = cookingTipsService.getAllCookingTips();
		sheet3.setData(cookingTipsList);
		sheet3.setMaxCols(0);
		sheet3.setMaxRows(cookingTipsList.size());
		list.add(sheet3);

		Sheets sheet4 = new Sheets();
		sheet4.setName("CookingMethods");
		List<CookingMethods> cookingMethodsList = cookingMethodsService.getAllCookingMethods();
		sheet4.setData(cookingMethodsList);
		sheet4.setMaxCols(0);
		sheet4.setMaxRows(cookingMethodsList.size());
		list.add(sheet4);

		Sheets sheet5 = new Sheets();
		sheet5.setName("DataDictionary");
		List<DataDictionary> dataDictionaryList = dataDictionaryService.getAllDataDictionary();
		sheet5.setData(dataDictionaryList);
		sheet5.setMaxCols(0);
		sheet5.setMaxRows(dataDictionaryList.size());
		list.add(sheet5);
		return output;
	}

}
