package org.foodpark.spring.controller;

import java.util.List;

import org.foodpark.spring.model.Category;
import org.foodpark.spring.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/category")
public class CategoryController {

	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Category saveCategory(@RequestBody Category category) {

        return categoryService.saveCategory(category);
    }
	
	@RequestMapping(value = "/update", method = RequestMethod.PUT)
    @ResponseBody
    public Category updateCategory(@RequestBody Category category) {

        return categoryService.updateCategory(category);
    }
	
	@RequestMapping(value = "/get", method = RequestMethod.GET)
    @ResponseBody
    public List<Category> getAllCategory() {

        return categoryService.getAllCategory();
    }
	
	@RequestMapping(value = "/get/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Category getCategoryById(@PathVariable Integer id) {

        return categoryService.getCategoryById(id);
    }
	
	@RequestMapping(value = "/get/categoryName/{categoryName}", method = RequestMethod.GET)
    @ResponseBody
    public List<Category> getCategoryByName(@PathVariable String categoryName) {

        return categoryService.getCategoryByName(categoryName);
    }
	
	@RequestMapping(value = "/get/by/search", method = RequestMethod.GET)
    @ResponseBody
    public List<Category> getCategoryBySearch(String categoryName, String subcategoryName) {

		return categoryService.getCategoryBySearch(categoryName, subcategoryName);
    }
}
