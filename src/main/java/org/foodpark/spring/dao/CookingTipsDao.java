package org.foodpark.spring.dao;

import java.util.List;
import org.foodpark.spring.model.CookingTips;

public interface CookingTipsDao {

	public CookingTips saveCookingTips(CookingTips cookingTips);

	public CookingTips updateCookingTips(CookingTips cookingTips);

	public List<CookingTips> getAllCookingTips();

	public CookingTips getCookingTipsById(Integer id);

	public List<CookingTips> getCookingTipsByTips(String tips);
	
	public List<CookingTips> getCookingTipsBySearch(Integer safeMinimumTemperature, Integer restTime,
			String restTimeMetric);
}
