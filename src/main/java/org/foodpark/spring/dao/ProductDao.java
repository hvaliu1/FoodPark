package org.foodpark.spring.dao;

import java.util.List;
import org.foodpark.spring.model.Product;

public interface ProductDao {

	public Product saveProduct(Product product);

	public Product updateProduct(Product product);

	public List<Product> getAllProduct();

	public Product getProductById(Integer id);

	public List<Product> getProductByName(String name);
	
	public List<Product> getProductBySearch(String nameSubtitle, String pantryMetric, String pantryTips);
}
