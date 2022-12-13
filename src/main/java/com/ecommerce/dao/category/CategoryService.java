package com.ecommerce.dao.category;

import java.util.List;

import com.ecommerce.entities.Category;

public interface CategoryService {
	int add(Category category);
	List<Category> allCategories();
}
