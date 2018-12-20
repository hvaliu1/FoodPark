package org.foodpark.spring.service;

import java.util.List;

import org.foodpark.spring.model.CookingMethods;

public interface CookingMethodsService {

	public CookingMethods saveCookingMethods(CookingMethods cookingMethods);

	public CookingMethods updateCookingMethods(CookingMethods cookingMethods);

	public List<CookingMethods> getAllCookingMethods();

	public CookingMethods getCookingMethodsById(Integer id);

	public List<CookingMethods> getCookingMethodsBySizeMetric(String sizeMetric);

	public List<CookingMethods> getCookingMethodsBySearch(Integer productId, String cookingMethod,
			String cookingTemperature);

}
