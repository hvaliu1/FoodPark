package org.foodpark.spring.service;

import java.util.List;

import javax.transaction.Transactional;

import org.foodpark.spring.dao.CookingTipsDao;
import org.foodpark.spring.model.CookingTips;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class CookingTipsServiceImpl implements CookingTipsService {
	
	@Autowired
	private CookingTipsDao cookingTipsDao;

	@Override
	public CookingTips saveCookingTips(CookingTips cookingTips) {
		return cookingTipsDao.saveCookingTips(cookingTips);
	}

	@Override
	public CookingTips updateCookingTips(CookingTips cookingTips) {
		return cookingTipsDao.updateCookingTips(cookingTips);
	}

	@Override
	public List<CookingTips> getAllCookingTips() {
		return cookingTipsDao.getAllCookingTips();
	}

	@Override
	public CookingTips getCookingTipsById(Integer id) {
		return cookingTipsDao.getCookingTipsById(id);
	}

	@Override
	public List<CookingTips> getCookingTipsByTips(String tips) {
		return cookingTipsDao.getCookingTipsByTips(tips);
	}

	@Override
	public List<CookingTips> getCookingTipsBySearch(Integer safeMinimumTemperature, Integer restTime,
			String restTimeMetric) {
		return cookingTipsDao.getCookingTipsBySearch(safeMinimumTemperature, restTime, restTimeMetric);
	}

}
