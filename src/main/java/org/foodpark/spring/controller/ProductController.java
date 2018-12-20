package org.foodpark.spring.controller;

import java.util.List;

import org.foodpark.spring.model.Product;
import org.foodpark.spring.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Product saveProduct(@RequestBody Product product) {

        return productService.saveProduct(product);
    }
	
	@RequestMapping(value = "/update", method = RequestMethod.PUT)
    @ResponseBody
    public Product updateProduct(@RequestBody Product product) {

        return productService.updateProduct(product);
    }
	
	@RequestMapping(value = "/get", method = RequestMethod.GET)
    @ResponseBody
    public List<Product> getAllProduct() {

        return productService.getAllProduct();
    }
	
	@RequestMapping(value = "/get/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Product getProductById(@PathVariable Integer id) {

        return productService.getProductById(id);
    }
	
	@RequestMapping(value = "/get/name/{name}", method = RequestMethod.GET)
    @ResponseBody
    public List<Product> getProductByName(@PathVariable String name) {

        return productService.getProductByName(name);
    }
	
	@RequestMapping(value = "/get/by/search", method = RequestMethod.GET)
    @ResponseBody
    public List<Product> getProductBySearch(String nameSubtitle, String pantryMetric, String pantryTips) {

        return productService.getProductBySearch(nameSubtitle, pantryMetric, pantryTips);
    }
}
