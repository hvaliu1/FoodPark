package org.foodpark.spring.controller;

import java.util.List;

import org.foodpark.spring.model.CookingMethods;
import org.foodpark.spring.service.CookingMethodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/cooking_methods")
public class CookingMethodsController {

	@Autowired
	private CookingMethodsService cookingMethodsService;
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public CookingMethods saveCookingMethods(@RequestBody CookingMethods cookingMethods) {

        return cookingMethodsService.saveCookingMethods(cookingMethods);
    }
	
	@RequestMapping(value = "/update", method = RequestMethod.PUT)
    @ResponseBody
    public CookingMethods updateCookingMethods(@RequestBody CookingMethods cookingMethods) {

        return cookingMethodsService.updateCookingMethods(cookingMethods);
    }
	
	@RequestMapping(value = "/get", method = RequestMethod.GET)
    @ResponseBody
    public List<CookingMethods> getAllCookingMethods() {

        return cookingMethodsService.getAllCookingMethods();
    }
	
	@RequestMapping(value = "/get/{id}", method = RequestMethod.GET)
    @ResponseBody
    public CookingMethods getCookingMethodsById(@PathVariable Integer id) {

        return cookingMethodsService.getCookingMethodsById(id);
    }
	
	@RequestMapping(value = "/get/sizeMetric/{sizeMetric}", method = RequestMethod.GET)
    @ResponseBody
    public List<CookingMethods> getCookingMethodsBySizeMetric(@PathVariable String sizeMetric) {

        return cookingMethodsService.getCookingMethodsBySizeMetric(sizeMetric);
    }
	
	@RequestMapping(value = "/get/by/search", method = RequestMethod.GET)
    @ResponseBody
    public List<CookingMethods> getCookingMethodsBySearch(Integer productId, String cookingMethod,  String cookingTemperature) {

        return cookingMethodsService.getCookingMethodsBySearch(productId, cookingMethod, cookingTemperature);
    }
}
