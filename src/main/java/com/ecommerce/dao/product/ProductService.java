package com.ecommerce.dao.product;

import java.util.List;

import com.ecommerce.entities.Product;

public interface ProductService {
	int save(Product product);
	List<Product> allProducts();
	Product getProduct(int id);
	List<Product> getAllProductsByCategory(int cid);
}
