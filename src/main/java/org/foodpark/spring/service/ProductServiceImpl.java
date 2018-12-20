package org.foodpark.spring.service;

import java.util.List;

import javax.transaction.Transactional;

import org.foodpark.spring.dao.ProductDao;
import org.foodpark.spring.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDao productDao;
	
	
	@Override
	public Product saveProduct(Product product) {
		return productDao.saveProduct(product);
	}

	@Override
	public Product updateProduct(Product product) {
		return productDao.updateProduct(product);
	}

	@Override
	public List<Product> getAllProduct() {
		return productDao.getAllProduct();
	}

	@Override
	public Product getProductById(Integer id) {
		return productDao.getProductById(id);
	}

	@Override
	public List<Product> getProductByName(String name) {
		return productDao.getProductByName(name);
	}

	@Override
	public List<Product> getProductBySearch(String nameSubtitle, String pantryMetric, String pantryTips) {
		return productDao.getProductBySearch(nameSubtitle, pantryMetric, pantryTips);
	}

}
