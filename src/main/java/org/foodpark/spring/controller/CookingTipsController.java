package org.foodpark.spring.controller;

import java.util.List;

import org.foodpark.spring.model.CookingTips;
import org.foodpark.spring.service.CookingTipsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/cooking_tips")
public class CookingTipsController {

	@Autowired
	private CookingTipsService cookingTipsService;
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public CookingTips saveCookingTips(@RequestBody CookingTips cookingTips) {

        return cookingTipsService.saveCookingTips(cookingTips);
    }
	
	@RequestMapping(value = "/update", method = RequestMethod.PUT)
    @ResponseBody
    public CookingTips updateCookingTips(@RequestBody CookingTips cookingTips) {

        return cookingTipsService.updateCookingTips(cookingTips);
    }
	
	@RequestMapping(value = "/get", method = RequestMethod.GET)
    @ResponseBody
    public List<CookingTips> getAllCookingTips() {

        return cookingTipsService.getAllCookingTips();
    }
	
	@RequestMapping(value = "/get/{id}", method = RequestMethod.GET)
    @ResponseBody
    public CookingTips getCookingTipsById(@PathVariable Integer id) {

        return cookingTipsService.getCookingTipsById(id);
    }
	
	@RequestMapping(value = "/get/tips/{tips}", method = RequestMethod.GET)
    @ResponseBody
    public List<CookingTips> getCookingTipsByTips(@PathVariable String tips) {

        return cookingTipsService.getCookingTipsByTips(tips);
    }
	
	@RequestMapping(value = "/get/by/search", method = RequestMethod.GET)
    @ResponseBody
    public List<CookingTips> getCookingTipsBySearch(Integer safeMinimumTemperature, Integer restTime, String restTimeMetric) {

        return cookingTipsService.getCookingTipsBySearch(safeMinimumTemperature, restTime, restTimeMetric);
    }
}
