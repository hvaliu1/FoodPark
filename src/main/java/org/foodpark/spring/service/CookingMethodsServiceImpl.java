package org.foodpark.spring.service;

import java.util.List;

import javax.transaction.Transactional;

import org.foodpark.spring.dao.CookingMethodsDao;
import org.foodpark.spring.model.CookingMethods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class CookingMethodsServiceImpl implements CookingMethodsService {
	
	@Autowired
	private CookingMethodsDao cookingMethodsDao;

	@Override
	public CookingMethods saveCookingMethods(CookingMethods cookingMethods) {
		return cookingMethodsDao.saveCookingMethods(cookingMethods);
	}

	@Override
	public CookingMethods updateCookingMethods(CookingMethods cookingMethods) {
		return cookingMethodsDao.updateCookingMethods(cookingMethods);
	}

	@Override
	public List<CookingMethods> getAllCookingMethods() {
		return cookingMethodsDao.getAllCookingMethods();
	}

	@Override
	public CookingMethods getCookingMethodsById(Integer id) {
		return cookingMethodsDao.getCookingMethodsById(id);
	}

	@Override
	public List<CookingMethods> getCookingMethodsBySizeMetric(String sizeMetric) {
		return cookingMethodsDao.getCookingMethodsBySizeMetric(sizeMetric);
	}

	@Override
	public List<CookingMethods> getCookingMethodsBySearch(Integer productId, String cookingMethod,
			String cookingTemperature) {
		return cookingMethodsDao.getCookingMethodsBySearch(productId, cookingMethod, cookingTemperature);
	}

}
